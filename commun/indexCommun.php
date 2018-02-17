<?php
include('../validation.php');

$_SESSION['dsn1']="mysql:host=localhost;dbname=asbl";
$_SESSION['loginbdd']="cmsuser";
$_SESSION['pwdbdd']="ensemble1";

function ouvrebase()
{
$base=new pdo($_SESSION['dsn1'],$_SESSION['loginbdd'],$_SESSION['pwdbdd']);
return $base;
}
?>

<html>

<head>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<script src="../ckeditor/ckeditor.js"></script>
    <title>Aide alimentaire</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
	 <link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/css/stylelavande.css" />
	 <link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/agenda/style.css" type="text/css" />
	
</head>
	<body>