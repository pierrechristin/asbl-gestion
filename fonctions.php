<?php
function ouvrebase()
{
$user='root';
$pass='';
$dsn="mysql:host=localhost;dbname=asbl";
$base=new pdo($dsn,$user,$pass);
return $base;
}
?>
