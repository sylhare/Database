# Database 
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/affcc041625a4f1f8a90ef3384fa5135)](https://www.codacy.com/app/Sylhare/Database?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Sylhare/Database&amp;utm_campaign=Badge_Grade)


## SQL

SQL (Structured Query Language) is a standard language for accessing and manipulating databases.

The query language works with key words. Here an example to select every elements `*` of the `Customers` table.

```sql
SELECT * FROM Customers;
```

### MySQL

![](https://upload.wikimedia.org/wikipedia/en/thumb/6/62/MySQL.svg/489px-MySQL.svg.png)

MySQL is an open source database system that uses the SQL standard. It runs on a server and is very popular on the web (with PHP for example).

The data in a MySQL database are stored in tables. A table is a collection of related data, and it consists of columns and rows.

## NoSQL Database

### Types

There are multiple types of NoSQL database:

- **Document databases** pair each key with a complex data structure known as a document. Documents can contain many different key-value pairs, or key-array pairs, or even nested documents.

- **Graph stores** are used to store information about networks of data, such as social connections. Graph stores include Neo4J and Giraph.

- **Key-value stores** are the simplest NoSQL databases. Every single item in the database is stored as an attribute name, a *key* with its value. Examples are Riak and Berkeley DB, Redis.

- **Wide-column** stores such as Cassandra and HBase are optimized for queries over large datasets, and store columns of data together, instead of rows.

### MongoDB

![mongo logo](https://docs.mongodb.com/images/mongodb-logo.svg)

MongoDB is a Document Oriented Database, a type of **NoSQL** database. It is open source and available at [mongodb.com](https://www.mongodb.com).

MongoDB stores data in flexible, **JSON-like documents** called **collection**. Each element of the database is stored as a separate JSON. Mongo can generate a database out of this file from nothing.

```js
db.inventory.insertMany([
   // MongoDB adds the _id field with an ObjectId if _id is not present
   { item: "journal", qty: 25, status: "A" },
   { item: "notebook", qty: 50, status: "A" },
   { item: "paper", qty: 100, status: "D" },
   { item: "planner", qty: 75, status: "D" },
]);
```
Then you can look into the database using simple queries :

```js
db.inventory.find( {} )               // Will return all document in the collection
db.inventory.find( { status: "D" } )  // Searching filtering by a value
```

The mongoDB can be deployed in different configuration:

- **Stand alone** is a simple instance of the mongo DB, just the database.
- **Replica Set** is a set of three database with one primary and two secondary. If one is down then one of the two secondary gets elected to primary automatically. All db have the same data in it.
- **Shard Cluster** is composed of multiple replica set that shares the data of a collection (according to set rules). The applications connect to the Database through a Mongo S application which will direct the request to the right replica set using a config replica set that knows where the information is stored.

## Web servers

Web server are there to host web app. Traditionnal webservers are made of an Apache2 server that runs the PHP coupled with a database server (usually mySQL). Alongside, using PHPMyAdmin will help you manage your databases easily.

On Windows there is [Wamp](http://www.wampserver.com/en/) (or the equivalent [Lamp](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) for linux) that works quite well if you want to try out this technlogies. Everything is pre-conifgured and you don't need to have a dedicated server to run your application.

On my side [Xampp](https://www.apachefriends.org/index.html) proved to be the more reliable and easy to use for local hosting projects.

## Gantt Chart with dhtmlxGantt

The [dhtmlxGantt](https://dhtmlx.com/docs/products/dhtmlxGantt/) is an open source Gantt chart that gave a nice visual with it.

It is written in PHP and uses a mySQL database. I have stored here my tries on it, it is very customizable and there are template already available.

## Wiki server

Using a mySQL and an Apache webserver, you can create and host locally or remotely your own wiki.

- [bookstack](https://www.bookstackapp.com/): A cool one
- [tiddly wiki](https://tiddlywiki.com/): A simple one
- [Advanced open source one](http://www.xwiki.org/xwiki/bin/view/Main/WebHome)
- [media wiki](https://www.mediawiki.org/wiki/MediaWiki): the wikipedia one
- [Confluence](https://www.atlassian.com/software/confluence): paid one, from the atlassian suite
