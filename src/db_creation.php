<?php
    //To test if it's launched and I love saying hello to the world
    echo "Hello World";

    //Connect to the database
    $user='username';
    $password='password';
    $database='datab';

    //mysql_connect(localhost,$username,$password);
    mysql_connect('localhost','root','');
    @mysql_select_db($database) or die( "Unable to select database"); //or die add an error control

    //Query to do in the database, it will create the database
    $query="
    CREATE TABLE `contacts` (
        `id` int(6) NOT NULL auto_increment,
        `first` varchar(15) NOT NULL,
        `last` varchar(15) NOT NULL,
        `phone` varchar(20) NOT NULL,
        `mobile` varchar(20) NOT NULL,
        `fax` varchar(20) NOT NULL,
        `email` varchar(30) NOT NULL,
        `web` varchar(30) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE id (id),
        KEY id_2 (id)
    )";

    mysql_query($query); //execute the query
    mysql_close(); //Close the database connection to the server
?>