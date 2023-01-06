# IXP-Manager-PeeringDB-updater
- Updating certain IXP-Manager fields from PeeringDB with a self hosted replica.
- Very down and dirty via CSV files and Scripts

## Reduce our workload due to 2 very common issues
- update max prefixes allowed
- update as-sets since we have another script that updated our ARIN Registry
## And some minor admin items
- update Network Names
- update the corporate website
## And prepare to add 'Never via Route Server' to our features
- we are currently doing this but want to loop in Inex / IXP-Manager

# Warnings
 - We have made assumptions based on our own use.   Feel free to make modifications based on your own desires.
 - PeeringDB dataset isn't very clean so be aware

# Overview
- We use a seperate MySQL server for our IXP-Manager installation
- We have installed peeringdb.py on the MySQL server in their own database.  We also use this to update our CRM and other tools
- We have added a table called pdb_networks to IXP-Manager.   This is not supported by IXP-Manager
- We run three scripts after doing an hourly sync on PeeringDB.  By using the peeringdb.py module it only does a few api calls and only requests updated data.
## Our Production Scripts
### pdb-clean.sql ( we do some things to fields not relavent to IXP-Manager since we use this repo elsewhere.
- clean the orginization, network and facilty tables
- remove blank spaces, double quotes, slashes, back slashes and things that break imports other places when using CSVs
### pdb-export.sql (Limited export items relavent to IXP Manager)
- this is a csv of all of the networks in PeeringDB
- assume to the writing location is limited to that of a standard MySQL installation
- includes flag for 'Never-via-Route-Server'
### load-ixmp-pdb.sql
- we created a new table but we truncated it before update
- we apply our own internal rules and modify the data before proceding
-- For maximum prefixes we set it to 150% of the PeeringDB value with a minimum of 100
-- We make an attempt to cleanup the IRR value from PEERING DB
--- Set everything to upper case
--- Make sure it starts with AS (ARIN only allows use to use AS-Sets and AUTNUM - no RS is allowed)
--- If it looks like there are two values the first is assumed to be IPv4 then the second is IPv6
--- We also remove anything before a :: and a mainstream IRR Provider Name
- We then push the updates out
-- We join the cust table based on the ASN
--- update the IPv4 AS-Set
--- Update the IPv6 AS-Set
--- Update the Corporate www address
--- Update the Name to the Network Name
--- update the maxbgpprefixes only if the PeeringDB number is larger  ( We do have the v4 and v6 values but IXP Manager doesn't store that here.)
-- We Update the Registration Name in company_registration_detail
-- In the vlaninterface
--- update the maxbgpprexies if it is NULL or larger than the current value

# Suggestions
- have IXP-Manager add a flag field do dissalow updates for any potential corner cases
- ahve IXP-Mnanger add a flag field showing if the network has selected "Never-Via-A-Route-Server" in PeeringDB


# That's it for now
