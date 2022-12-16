SET SQL_SAFE_UPDATES = 0;
UPDATE `ixpmanager`.`vlaninterface`
JOIN `ixpmanager`.`virtualinterface`
ON  `virtualinterface`.`id` =`vlaninterface`.`virtualinterfaceid`
JOIN  `ixpmanager`.`cust`
ON `cust`.`id` = `virtualinterface`.`custid`
SET `vlaninterface`.`maxbgpprefix` = `cust`.`maxprefixes`
WHERE `cust`.`maxprefixes` >`vlaninterface`.`maxbgpprefix`;
SET SQL_SAFE_UPDATES = 1;
root@ix-mysql:/usr/local/etc#   more ixpm-customer-updates.sql
SET SQL_SAFE_UPDATES = 0;
UPDATE `ixpmanager`.`cust`
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`
SET `peeringmacro` = `pdb_networks`.`as-set`
WHERE `pdb_networks`.`as-set` <> '';
UPDATE `ixpmanager`.`cust`
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`
SET `pdb_networks`.`name` = `pdb_networks`.`name`;
UPDATE `ixpmanager`.`cust`
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`
SET `maxprefixes` = `pdb_networks`.`info_prefixes4`
WHERE `pdb_networks`.`info_prefixes4` IS NOT NULL and `maxprefixes` < `pdb_networks`.`info_prefixes4`;
SET SQL_SAFE_UPDATES = 1;
