USE ixpmanager;
SET SQL_SAFE_UPDATES = 0;
/* work the new table*/
delete from pdb_networks;
LOAD DATA INFILE '/var/lib/mysql-files/ixpm-pdb-network.csv'
INTO TABLE pdb_networks
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
/* Fix UP  Values
do max prefixes first */
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
/*  Fix up IRR
*/
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = NULL
WHERE `pdb_networks`.`irr` < "A";
UPDATE ixpmanager.pdb_networks
SET  `pdb_networks`.`ipv6-as-set` = NULL
WHERE `pdb_networks`.`ipv6-as-set`<'zzzzz';
UPDATE ixpmanager.pdb_networks
SET  `pdb_networks`.`as-set` = NULL
WHERE `pdb_networks`.`as-set` ='';
UPDATE ixpmanager.pdb_networks
SET  `pdb_networks`.`as-set` = UPPER(`pdb_networks`.`as-set`);
/* MOVE THE IRR PREFIXES OFF */
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'RIPE'
WHERE INSTR(`pdb_networks`.`as-set`, 'RIPE::') >0 AND `pdb_networks`.`irr` IS NULL;  
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'RIPE::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'ARIN'
WHERE INSTR(`pdb_networks`.`as-set`, 'ARIN::') >0 AND `pdb_networks`.`irr` IS NULL;    
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'ARIN::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'RADB'
WHERE INSTR(`pdb_networks`.`as-set`, 'RADB::') >0 AND `pdb_networks`.`irr` IS NULL;  
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'RADB::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'APNIC'
WHERE INSTR(`pdb_networks`.`as-set`, 'APNIC::') >0 AND `pdb_networks`.`irr` IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'APNIC::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'ALTDB'
WHERE INSTR(`pdb_networks`.`as-set`, 'ALTDB::') >0  AND `pdb_networks`.`irr` IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'ALTDB::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'JPIRR'
WHERE INSTR(`pdb_networks`.`as-set`, 'JPIRR::') >0 AND `pdb_networks`.`irr`IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'JPIRR::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'NTTCOM'
WHERE INSTR(`pdb_networks`.`as-set`, 'NTTCOM::') >0 AND `pdb_networks`.`irr` IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'NTTCOM::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'AFRINIC'
WHERE INSTR(`pdb_networks`.`as-set`, 'AFRINIC::') >0  AND `pdb_networks`.`irr` IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'AFRINIC::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'TC'
WHERE INSTR(`pdb_networks`.`as-set`, 'TC::') >0  AND `pdb_networks`.`irr`IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'TC::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'BBOI'
WHERE INSTR(`pdb_networks`.`as-set`, 'BBOI::') >0 AND `pdb_networks`.`irr` IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'BBOI::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'LEVEL3'
WHERE INSTR(`pdb_networks`.`as-set`, 'LEVEL3::') >0  AND `pdb_networks`.`irr` IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'LEVEL3::','');
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`irr` = 'LACNIC'
WHERE INSTR(`pdb_networks`.`as-set`, 'LACNIC::') >0  AND `pdb_networks`.`irr` IS NULL; 
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`as-set` = REPLACE(`pdb_networks`.`as-set`, 'LACNIC::','');
/* 
split up if two entries - unfOrtunately we assume the second is an IPV4 */
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`ipv4-as-set` =  SUBSTRING_INDEX(`pdb_networks`.`as-set`, ' ', 1);
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`ipv6-as-set` =  SUBSTRING_INDEX(`pdb_networks`.`as-set`, ' ', -1)
WHERE INSTR(`pdb_networks`.`as-set`, ' ') >0; 
/* clean up anything with commas */
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`ipv4-as-set` =  SUBSTRING_INDEX(`pdb_networks`.`ipv4-as-set`, ',', 1 );
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`ipv6-as-set` =  SUBSTRING_INDEX(`pdb_networks`.`ipv6-as-set`, ',', 1 );
/* Make sure NULL and not blank */
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`ipv4-as-set` =  NULL
WHERE `pdb_networks`.`ipv4-as-set` ='';
UPDATE ixpmanager.pdb_networks
SET `pdb_networks`.`ipv6-as-set` =  NULL
WHERE `pdb_networks`.`ipv6-as-set` ='';
/*   Push changes to customer (cust table)
*/
UPDATE `ixpmanager`.`cust`
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`
SET `peeringmacro` = `pdb_networks`.`ipv4-as-set`
WHERE `pdb_networks`.`ipv4-as-set` IS NOT NULL;
UPDATE `ixpmanager`.`cust`
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`
SET `peeringmacrov6` = `pdb_networks`.`ipv6-as-set`
WHERE `pdb_networks`.`ipv6-as-set` IS NOT NULL;
UPDATE `ixpmanager`.`cust`
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`
SET `pdb_networks`.`name` = `pdb_networks`.`name`;
UPDATE `ixpmanager`.`cust`
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`
SET `maxprefixes` = `pdb_networks`.`info_prefixes4`
WHERE `pdb_networks`.`info_prefixes4` IS NOT NULL and `maxprefixes` < `pdb_networks`.`info_prefixes4`;
UPDATE `ixpmanager`.`cust`
SET `cust`.`nocemail` =''
WHERE `cust`.`nocemail` IS NULL;
UPDATE `ixpmanager`.`cust`
SET `cust`.`peeringemail` =''
WHERE `cust`.`peeringemail` IS NULL;
/*  Push changes to vlaninterface
*/
UPDATE `ixpmanager`.`vlaninterface`
JOIN `ixpmanager`.`virtualinterface`
ON  `virtualinterface`.`id` =`vlaninterface`.`virtualinterfaceid`
JOIN  `ixpmanager`.`cust`
ON `cust`.`id` = `virtualinterface`.`custid`
SET `vlaninterface`.`maxbgpprefix` = `cust`.`maxprefixes`
WHERE `vlaninterface`.`maxbgpprefix`IS NUll;
UPDATE `ixpmanager`.`vlaninterface`
JOIN `ixpmanager`.`virtualinterface`
ON  `virtualinterface`.`id` =`vlaninterface`.`virtualinterfaceid`
JOIN  `ixpmanager`.`cust`
ON `cust`.`id` = `virtualinterface`.`custid`
SET `vlaninterface`.`maxbgpprefix` = `cust`.`maxprefixes`
WHERE `cust`.`maxprefixes` >`vlaninterface`.`maxbgpprefix`;
/*   ALL DONE  */
SET SQL_SAFE_UPDATES = 1;
