require('dotenv').config();
var mysql = require('mysql');
const fastcsv = require("fast-csv");
const fs = require("fs");
// output CSVs  nothing is being written 
const ws = fs.createWriteStream("output/pdb-organization.csv");

// create a connection variable with the required details
var mysqlcon = mysql.createConnection({
  host:         process.env.MYSQLHOST,
  user:         process.env.MYSQLUSER,
  password:     process.env.MYSQLPASS
});
// make sure we are connected
//

// let's try to update something

mysqlcon.connect(function(err) {
// peeringdb organization
  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `address2` = LTRIM(`address2`) WHERE `address2` LIKE ' %'";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated ORG Address 2");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `address1` = LTRIM(`address1`) WHERE `address1` LIKE ' %'";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated ORG Address 1");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `name` = replace(`name`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated ORG name");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `name_long` = replace(`name_long`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `aka` = replace(`aka`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `city` = replace(`city`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `address1` = replace(`address1`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `address2` = replace(`address2`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `latitude` = replace(`latitude`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `longitude` = replace(`longitude`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_organization` SET `notes` = replace(`notes`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated ORG Notes");
  });
//
//   PeeringDB Network
//
  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_network` SET `notes` = replace(`notes`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated NETWORK Notes");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_network` SET `aka` = replace(`aka`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated NETWORK AKA");
  });
// modified for java script with a slash g
  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_network` SET `name` = replace(`name`,'\\/g','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated NETWORK name with a backslash ");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_network` SET `name` = replace(`name`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated NETWORK name with quotes");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_network` SET `name_long` = replace(`name_long`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated name_long with quotes");
  });
//
//     PeeringDB Facilities
//
  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `address1` = LTRIM(`address1`) WHERE `address1` LIKE ' %'";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated FAC TRIM address 1");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `address2` = LTRIM(`address2`) WHERE `address2` LIKE ' %'";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated FAC TRIM address 2");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `name` = replace(`name`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated FAC name with quotes");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `name_long` = replace(`name_long`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated nme long with quotes");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `aka` = replace(`aka`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated aka FAC with quotes");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `address1` = replace(`address1`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `address2` = replace(`address2`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `latitude` = replace(`latitude`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `longitude` = replace(`longitude`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `city` = replace(`city`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

  if (err) throw err;
  var sql = "UPDATE `peeringdb`.`peeringdb_facility` SET `notes` = replace(`notes`,'\"','')";
  mysqlcon.query(sql, function (err, result) {
    if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });

//* Cleaned for use by tools and export */
//
    mysqlcon.end()
});
