const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

const uri = 'mongodb://localhost:27017';
const db = 'cooker';

console.log("Setting up mongo client");

(async function () {
  const client = new MongoClient(uri, { useUnifiedTopology: true });

  try {
    console.log("Connecting to database ...")

    await client.connect();

    console.log("Connected Successfully!");

    const database = client.db(db);

    console.log("The database name is: " + database.databaseName);

  } catch (err) {
    console.log(err.stack);
  }

  await client.close();
})();