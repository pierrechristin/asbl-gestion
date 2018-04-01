<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$reference=$_POST['reference'];
if (isset($_POST['jourSelectionne'])) {
	$jourSelectionne=$_POST['jourSelectionne'];
}

//insertion signalement présence
if ($reference <> 0)
{ 
	$sql="insert into signalement_presence (refbeneficiaire,datesignalement)";
	$sql=$sql." values (".$reference.",\"".date('Y-m-d H:i:s')."\")";
	$base->exec($sql);
}

// TODO : Vérifier que la requête se soit bien executée.

//on retourne a la page districoli2 ou signalement selon que jourSelectionne soit présent ou non
if (isset($jourSelectionne)) {
	$page='Location: ../districoli2/districoli2.php?signalementOK&jourSelectionne='.$jourSelectionne;
}
else {
	$page='Location: ../signalement/signalement.php?signalementOK';
}
//echo $sql;
header($page);
?>

<?php
include_once("../footer.php");
?>