<?php

$banco='hackthon';
$usuario='root';
$senhabanco='lw1026';
$host='localhost';

$conn=mysqli_connect($host,$usuario,$senhabanco) or die ("erro na rotina de coneção".mysql_error());
$con = mysqli_select_db($conn,$banco)  or die ("erro na rotina de conexão com o banco de dados".mysql());
mysqli_query($conn,"SET NAMES 'utf8'");
mysqli_query($conn,'SET character_set_connection=utf8');
mysqli_query($conn,'SET character_set_client=utf8');
mysqli_query($conn,'SET character_set_results=utf8');

$GLOBALS['conn'] = $conn;


?>
