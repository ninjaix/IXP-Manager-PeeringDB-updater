/*  the last 3 fields should really just be palce holders for the csv import- they are not actually used in IXP-Manager*/
SELECT `asn`,`peeringdb_network`.`name`,`info_never_via_route_servers`,`irr_as_set`,`info_prefixes4`,`info_prefixes6`,
`peeringdb_network`.`status`,`peeringdb_network`.`updated` ,`peeringdb_network`.`website`,
`peeringdb_network`.`version`,`rir_status`,`policy_ratio`,`peeringdb_organization`.`name`
FROM `peeringdb`.`peeringdb_network`
JOIN `peeringdb`.`peeringdb_organization`
ON `peeringdb_organization`.`id` = `peeringdb_network`.`org_id`
ORDER BY `asn`
INTO OUTFILE '/var/lib/mysql-files/ixpm-pdb-network.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
