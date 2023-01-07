require('dotenv').config();
var mysql = require('mysql');
const fastcsv = require("fast-csv");
const fs = require("fs");
// output CSVs
const ws = fs.createWriteStream("output/pdb-ixpm-1111.csv");

// create a connection variable with the required details
var mysqlcon = mysql.createConnection({
  host:         process.env.MYSQLHOST,
  user:         process.env.MYSQLUSER,
  password:     process.env.MYSQLPASS
});
// make sure we are connected
//

// let's try to update something

mysqlcon.connect((err) => {
  if (!err) {
    console.log("Connected");
  } else {
    console.log("Connection Failed");
  }
});

// PDB ORG
mysqlcon.query("SELECT `asn`,`peeringdb_network`.`name`,`info_never_via_route_servers`,`irr_as_set`,`info_prefixes4`,`info_prefixes6`, `peeringdb_network`.`status`,`peeringdb_network`.`updated` ,`peeringdb_network`.`website`,`peeringdb_network`.`version`,`rir_status`,`policy_ratio`,`peeringdb_organization`.`name` AS legalname FROM `peeringdb`.`peeringdb_network` JOIN `peeringdb`.`peeringdb_organization` ON `peeringdb_organization`.`id` = `peeringdb_network`.`org_id` ORDER BY `asn`", function (err, data, fields) {
    // if any error while executing above query, throw error
    if (err) throw err;
    // if there is no error, you have the result
//    console.log(result);

    const jsonData = JSON.parse(JSON.stringify(data));
//    console.log("jsonData", jsonData);

    fastcsv
      .write(jsonData, { headers: false })
      .on("finish", function() {
        console.log("Write to pdb-ixpm-1111.csv successfully!");
      })
      .pipe(ws);
});


mysqlcon.end();
