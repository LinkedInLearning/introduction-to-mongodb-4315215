/* This .mongoshrc.js file was created to clean up unnessicary warnings, etc.
 when connecting to MongoDB. Feel free to customize this file but note it
 can break the shell if there is anything invalid.
 */

const connectionString = db.getMongo();

console.clear();

print("🔥 Welcome to Introduction to MongoDB! 🔥");
print("");
print("🔍 See README.md files in the /lessons/ folders.")
print("");
console.log("Connecting to:   ", connectionString);
print(`Using MongoDB:    ${db.version()}`);
print("");
print("📝 Switched to the `cooker` database");
print("");

db = db.getSiblingDB('cooker');
