SELECT `asn`,`name`,`info_never_via_route_servers`,`irr_as_set`,`info_prefixes4`,`info_prefixes6`,`status`,`updated` ,`website`,`policy_general`
FROM `peeringdb`.`peeringdb_network`
ORDER BY `asn`
INTO OUTFILE '/var/lib/mysql-files/ixpm-pdb-network-1.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
