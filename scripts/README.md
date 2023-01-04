SCRIPTS for Use

These are what runs in a cronjob after the peeringDB database is synced to the source:
1) Clean up PeeringDB              - pdb-clean.sql
2) Export from PeeringDB for IXPM  - pdb-export.sql
3) Import to IXPM from PeeringDB   - load-ixpm-pdb.sql

The other scripts are for verification testing and other things we tried along the way.
