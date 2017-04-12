<?php
    //Information to connect to the db
    $username='root';
    $password='';
    $database="datab";

    //Getting the data
    $first=$_POST['first'];
    $last=$_POST['last'];
    $phone=$_POST['phone'];
    $mobile=$_POST['mobile'];
    $fax=$_POST['fax'];
    $email=$_POST['email'];
    $web=$_POST['web'];

    //actual connexion to the db
    mysql_connect('localhost',$username,$password);
    @mysql_select_db($database) or die( "Unable to select database");

    //Query to enter the data in the SQL database
    $query = "INSERT INTO contacts VALUES ('','$first','$last','$phone','$mobile','$fax','$email','$web')";
    
    //Run the query
    mysql_query($query);

    //Close the database connexion
    mysql_close();
?>
