/* Updated as of 2022-12-18 */
SET SQL_SAFE_UPDATES = 0;
UPDATE `peeringdb`.`peeringdb_organization`
SET `address2` = LTRIM(`address2`)
WHERE `address2` LIKE ' %';
UPDATE `peeringdb`.`peeringdb_organization`
SET `address1` = LTRIM(`address1`)
WHERE `address1` LIKE ' %';
UPDATE `peeringdb`.`peeringdb_organization`
SET `name` = replace(`name`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `name_long` = replace(`name_long`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `aka` = replace(`aka`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `city` = replace(`city`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `address1` = replace(`address1`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `address2` = replace(`address2`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `latitude` = replace(`latitude`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `longitude` = replace(`longitude`,'\"','');
UPDATE `peeringdb`.`peeringdb_organization`
SET `notes` = replace(`notes`,'\"','');
UPDATE `peeringdb`.`peeringdb_network`
SET `notes` = replace(`notes`,'\"','');
UPDATE `peeringdb`.`peeringdb_network`
SET `aka` = replace(`aka`,'\"','');
UPDATE `peeringdb`.`peeringdb_network`
SET `name` = replace(`name`,'\\','');
UPDATE `peeringdb`.`peeringdb_network`
SET `name` = replace(`name`,'\"','');
UPDATE `peeringdb`.`peeringdb_network`
SET `name_long` = replace(`name_long`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `address1` = LTRIM(`address1`)
WHERE `address1` LIKE ' %';
UPDATE `peeringdb`.`peeringdb_facility`
SET `address2` = LTRIM(`address2`)
WHERE `address2` LIKE ' %';
UPDATE `peeringdb`.`peeringdb_facility`
SET `name` = replace(`name`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `name_long` = replace(`name_long`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `aka` = replace(`aka`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `address1` = replace(`address1`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `address2` = replace(`address2`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `latitude` = replace(`latitude`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `longitude` = replace(`longitude`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `city` = replace(`city`,'\"','');
UPDATE `peeringdb`.`peeringdb_facility`
SET `notes` = replace(`notes`,'\"','');
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM peeringdb.peeringdb_organization;
