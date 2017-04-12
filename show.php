<table border="0" cellspacing="2" cellpadding="2">
    <tr>
        <th><font face="Arial, Helvetica, sans-serif">Name</font></th>
        <th><font face="Arial, Helvetica, sans-serif">Phone</font></th>
        <th><font face="Arial, Helvetica, sans-serif">Mobile</font></th>
        <th><font face="Arial, Helvetica, sans-serif">Fax</font></th>
        <th><font face="Arial, Helvetica, sans-serif">E-mail</font></th>
        <th><font face="Arial, Helvetica, sans-serif">Website</font></th>
    </tr>

<?php
    $id=$_GET['id'];
    //include("dbinfo.inc.php"); //Where you put username, password, datab
    $username='username';
    $password='password';
    $database='datab';

    mysql_connect('localhost',$username,$password);
    @mysql_select_db($database) or die( "Unable to select database");
    $query="SELECT * FROM contacts WHERE id='$id' ORDER BY last ASC"; //Show everything in the contact form in the table
    $result=mysql_query($query); //Assigned to a var because there will be results to that query

    $num=mysql_numrows($result); // Count the number of row to go through the data later

    mysql_close();

    echo "<b><center>Database Output</center></b><br><br>";

    //If statement for control analysis    
    if ($num==0) { 
        echo "The database contains no contacts yet";
    } else {
        //Loop to go through all the data
        $i=0;
        while ($i < $num) {

            //Assign the data found on the SQL to a var
            $first=mysql_result($result,$i,"first");
            $last=mysql_result($result,$i,"last");
            $phone=mysql_result($result,$i,"phone");
            $mobile=mysql_result($result,$i,"mobile");
            $fax=mysql_result($result,$i,"fax");
            $email=mysql_result($result,$i,"email");
            $web=mysql_result($result,$i,"web");

            echo "<b>$first $last</b><br>
                    Phone: $phone<br>
                    Mobile: $mobile<br>
                    Fax: $fax<br>
                    E-mail: $email<br>
                    Web: $web<br><hr><br>";
            
            //Not protected against SQL injections
            <form action="updated.php" method="post">
            <input type="hidden" name="ud_id" value="<? echo $id; ?>"> First Name:
            <input type="text" name="ud_first" value="<? echo $first; ?>">
            <br> Last Name:
            <input type="text" name="ud_last" value="<? echo $last; ?>">
            <br> Phone Number:
            <input type="text" name="ud_phone" value="<? echo $phone; ?>">
            <br> Mobile Number:
            <input type="text" name="ud_mobile" value="<? echo $mobile; ?>">
            <br> Fax Number:
            <input type="text" name="ud_fax" value="<? echo $fax; ?>">
            <br> E-mail Address:
            <input type="text" name="ud_email" value="<? echo $email; ?>">
            <br> Web Address:
            <input type="text" name="ud_web" value="<? echo $web; ?>">
            <br>
            <input type="Submit" value="Update">
            </form>

        ++$i;
        } 
    ?>

    <tr>
        <td><font face="Arial, Helvetica, sans-serif"><? echo $first." ".$last; ?></font></td>
        <td><font face="Arial, Helvetica, sans-serif"><? echo $phone; ?></font></td>
        <td><font face="Arial, Helvetica, sans-serif"><? echo $mobile; ?></font></td>
        <td><font face="Arial, Helvetica, sans-serif"><? echo $fax; ?></font></td>
        <td><font face="Arial, Helvetica, sans-serif"><a href="mailto:<? echo $email; ?>">E-mail</a></font></td>
        <td><font face="Arial, Helvetica, sans-serif"><a href="<? echo $web; ?>">Website</a></font></td>
    </tr>



    <?php
        echo "</table>";
    ?>
