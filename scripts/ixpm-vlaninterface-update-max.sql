SET SQL_SAFE_UPDATES = 0;
UPDATE `ixpmanager`.`vlaninterface`
JOIN `ixpmanager`.`virtualinterface`
ON  `virtualinterface`.`id` =`vlaninterface`.`virtualinterfaceid`
JOIN  `ixpmanager`.`cust`
ON `cust`.`id` = `virtualinterface`.`custid`
SET `vlaninterface`.`maxbgpprefix` = `cust`.`maxprefixes`
WHERE `cust`.`maxprefixes` >`vlaninterface`.`maxbgpprefix`;
SET SQL_SAFE_UPDATES = 1;
