# IXP-Manager-PeeringDB-updater
- Updating certain IXP-Manager fields from PeeringDB with a self hosted replica.
- Very down and dirty via CSV files and Scripts

## Reduces our workload due to 2 very common issues
- Update max prefixes allowed
- Update as-sets since we have another script that updates our ARIN IRR Sets
## And some minor admin items
- Update the network names
- Update the corporate website
## And prepare to add "Never via Route Server" to our features
We are currently doing this but want to loop in INEX / IXP-Manager

# Warnings
 - We have made assumptions based on our own use.   Feel free to make modifications based on your own desires.
 - PeeringDB dataset isn't very clean so be aware if what you are changing
 - We have added a table in IXP-Manager that is not supported by INEX / IXP-Manager

# Overview
- We use a seperate MySQL server for our IXP-Manager installation
- We have installed peeringdb.py on the same MySQL server in their own database.  We also use this to update our CRM and other tools,
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
- We created a new table but we truncated it before update
#### We apply our own internal rules and modify the data before proceding
Set Maximum Prexies 
- 150% of the PeeringDB value 
- Minimum of 100
We make an attempt to cleanup the IRR value from PEERING DB
- Set everything to upper case
- Make sure it starts with AS (ARIN only allows use to use AS-Sets and AUTNUM - no RS is allowed)
- If it looks like there are two values the first is assumed to be IPv4 AS-Set then the second is IPv6 Set (an Example of where this is wrong is Flexential)
- Remove anything before a :: and a mainstream IRR Provider Name
#### We then push the updates out
##### Join the cust table based on the ASN
- Update the IPv4 AS-Set
- Update the IPv6 AS-Set
- Update the Corporate www address
- Update the Name to the Network Name
- Update the maxbgpprefixes only if the PeeringDB number is larger  ( We do have the v4 and v6 values but IXP Manager doesn't store that here.)
##### We Update the Registration Name in company_registration_detail
##### In the vlaninterface update the maxbgpprefixes if it is NULL or larger than the current value

# Suggestions
- ASk IXP-Manager to add an editable flag field to dissalow updates for any potential corner cases (we already allow max prefix overrive on the port)
- Ask IXP-Mnanger to add a flag field showing if the network has selected "Never-Via-A-Route-Server" in PeeringDB
- Ask IXP-Manager to seperate maxbgpprefixes for both IPv4 and IPv6


# That's it for now
