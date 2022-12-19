SELECT `cust`.`name`, `maxprefixes`,`peeringmacro`,`autsys`,`pdb_networks`.`as-set`,`pdb_networks`.`info_prefixes4`
FROM `cust` 
JOIN`ixpmanager`.`pdb_networks`
ON `pdb_networks`.`asn` = `cust`.`autsys`;
