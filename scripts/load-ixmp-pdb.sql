USE ixpmanager;
SET SQL_SAFE_UPDATES = 0;
delete from pdb_networks;
LOAD DATA INFILE '/var/lib/mysql-files/ixpm-pdb-network.csv'
INTO TABLE pdb_networks
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
update pdb_networks
set info_prefixes4 = info_prefixes4*1.5
where info_prefixes4 > 1;
update pdb_networks
set info_prefixes6 = info_prefixes6*1.5
where info_prefixes6 > 1;
update pdb_networks
set info_prefixes4 = NULL
where info_prefixes4 =0;
update pdb_networks
set info_prefixes6 = NULL
where info_prefixes6 =0;
update pdb_networks
set info_prefixes4 = 100
where info_prefixes4 < 99;
update pdb_networks
set info_prefixes6 = 100
where info_prefixes6 < 99;
SET SQL_SAFE_UPDATES = 1;
