<?php
//events.php
include ('codebase/connector/db_sqlite3.php');
include ('codebase/connector/gantt_connector.php');
 
// SQLite
$dbtype = "SQLite3";
$res = new SQLite3(dirname(__FILE__)."/samples.sqlite");
 
// Mysql
// $dbtype = "MySQL";
// $res=mysql_connect("192.168.1.251", "gantt", "gantt");
// mysql_select_db("gantttest");
 
$gantt = new JSONGanttConnector($res, $dbtype);
 
$gantt->mix("open", 1);
//$gantt->enable_order("sortorder");
 
$gantt->render_links("gantt_links", "id", "source,target,type");
$gantt->render_table("gantt_tasks","id",
    "start_date,duration,text,progress,sortorder,parent","");



//tuto version
//include ('codebase/connector/gantt_connector.php');
 
//$res=mysql_connect("localhost","root","");
//mysql_select_db("gantt");
 
//$gantt = new JSONGanttConnector($res);
//$gantt->render_links("gantt_links","id","source,target,type");
//$gantt->render_table(
//    "gantt_tasks",
//    "id",
//    "start_date,duration,text,progress,sortorder,parent"
//);
 
?>