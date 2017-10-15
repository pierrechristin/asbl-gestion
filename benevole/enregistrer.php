<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$module=$_POST['module'];

//modification de la fiche module 1

if ($module==1 and $_POST['reference']<>0)
{ 
	$sql="update benevoles set nom=\"".$_POST['nom']."\",prenom=\"".$_POST['prenom']."\",tel=\"".$_POST['tel']."\",adresse=\"" .$_POST['adresse']."\",secteur=\"".$_POST['secteur']."\",mail=\"".$_POST['mail']."\" where ref=".$_POST['reference'].";";
	$base->exec($sql);
	if ($_POST['mdp'] <>"")
	{
		$sql2="update benevoles set mdp=\"".password_hash($_POST['mdp'], PASSWORD_DEFAULT)."\" where ref=".$_POST['reference'];
		$base->exec($sql2);
	}	
}

//ajout de la fiche module 2

if ($module==2 and $_POST['reference']==0)
{ 
	$sql="insert into benevoles (nom,prenom,tel,adresse,secteur,mail,mdp)";
	$sql=$sql." values (\"".$_POST['nom']."\",\"".$_POST['prenom']."\",\"".$_POST['tel']."\",\"".$_POST['adresse']."\",\"".$_POST['secteur']."\",\"".$_POST['mail']."\",\"".password_hash($_POST['mdp'], PASSWORD_DEFAULT)."\")";
	$base->exec($sql);
}

//suppression de la fiche module 3

if ($module==3 and $_POST['reference']<>0)
{ 
	$sql="delete from benevoles where ref=".$_POST['reference'];
	$base->exec($sql);
}

//on retourne a la page benevoles
$page="Location: ./benevole.php";
//echo $sql;
header($page);
?>