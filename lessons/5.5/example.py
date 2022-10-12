#! /usr/bin/python

import pymongo
import gridfs

client = pymongo.MongoClient("localhost", 27017)

db = client.files
fs = gridfs.GridFS(db)

file_id = fs.put(b"TEST! TEST! 123 ...", filename="test.txt");

print(fs.list())
print(fs.get(file_id).read())
