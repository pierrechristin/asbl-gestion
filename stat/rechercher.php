<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$module=$_POST['module'];

$page="Location: ./stat.php";

//modification de la fiche module 1

if ($module==1)
{ 
$sql="SELECT sum(montantpaye) sommeColisVendus, count(*) nbColisVendus FROM districolis where datedistri BETWEEN \"" . $_POST['dateDebut']  . "\" AND \"" . $_POST['dateFin'] . "\";";
$resultat=$base->query($sql);
$chaine=$resultat->fetch();
$page = $page.'?module=' . 1;
$page = $page.'&sommeColisVendus=' . $chaine['sommeColisVendus'];
$page = $page.'&nbColisVendus=' . $chaine['nbColisVendus'];
$page = $page.'&prixMoyenColisVendu=' . ($chaine['sommeColisVendus'] / $chaine['nbColisVendus']);
}


//echo $sql;
//on retourne a la page stat
header($page);
?>