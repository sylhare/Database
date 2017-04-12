<?php
    //to print
    echo "Hello World";
    
    //Credentials that can be leverage
    $user='username';
    $password='password';
    $database='datab';

    //Connexion to the db
    mysql_connect('localhost','root','');
    @mysql_select_db($database) or die( "Unable to select database");
    
    //Query creation
    $query = "
    INSERT INTO contacts VALUES ('','John','Smith','01234 567890','00112 334455','01234 567891','johnsmith@gowansnet.com','http://www.gowansnet.com')";
    
    //Query to run
    mysql_query($query);
    
    //End of connexion
    mysql_close();
?>