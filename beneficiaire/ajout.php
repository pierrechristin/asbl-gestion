<?php
session_start();
$_SESSION['dsn1']="mysql:host=localhost;dbname=asbl";
$_SESSION['login']="root";
$_SESSION['pwd']="";

$base=new pdo($_SESSION['dsn1'],$_SESSION['login'],$_SESSION['pwd']);
//boucle pour ajouter des personnes
for ($x=1;$x<200;$x++)
{
$nom="Nom".$x;
$prenom="Prenom".$x;
$tel="Tel".$x;
$adresse="adresse".$x;
$nbracharge="Personne a charge".$x;
$credit="Credit".$x;
$sql="insert into clients (nom,prenom,tel,adresse,nbracharge,credit)  values (\"".$nom."\",\"".$prenom."\",\"".$tel."\",\"".$adresse."\",\"".$nbracharge."\",\"".$credit."\")";
echo $sql;
$base->exec($sql);
}

?>