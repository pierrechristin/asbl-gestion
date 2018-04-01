<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$module=$_POST['module'];

//modification de la fiche - module 1
if ($module==1 and $_POST['reference']<>0 and isset($_SESSION['idUtilisateur']))
{
	$sql="update benevoles set nom=\"".$_POST['nom']."\",prenom=\"".$_POST['prenom']."\",tel=\"".$_POST['tel']."\",adresse=\"" .$_POST['adresse']."\",secteur=\"".$_POST['secteur']."\",mail=\"".$_POST['mail']."\",id_utilisateur_modification=".$_SESSION['idUtilisateur']." where ref=".$_POST['reference'].";";
	$base->exec($sql);
	if ($_POST['mdp'] <>"")
	{
		$sql2="update benevoles set mdp=\"".password_hash($_POST['mdp'], PASSWORD_DEFAULT)."\",id_utilisateur_modification=".$_SESSION['idUtilisateur']." where ref=".$_POST['reference'];
		$base->exec($sql2);
	}	
}

//ajout de la fiche - module 2
if ($module==2 and $_POST['reference']==0 and isset($_SESSION['idUtilisateur']))
{
	$sql="insert into benevoles (nom,prenom,tel,adresse,secteur,mail,mdp,id_utilisateur_creation)";
	$sql=$sql." values (\"".$_POST['nom']."\",\"".$_POST['prenom']."\",\"".$_POST['tel']."\",\"".$_POST['adresse']."\",\"".$_POST['secteur']."\",\"".$_POST['mail']."\",\"".password_hash($_POST['mdp'], PASSWORD_DEFAULT)."\",".$_SESSION['idUtilisateur'].")";
	$base->exec($sql);
}

//suppression de la fiche - module 3

if ($module==3 and $_POST['reference']<>0 and isset($_SESSION['idUtilisateur']))
{ 
	$sql="delete from benevoles where ref=".$_POST['reference'];
	$base->exec($sql);
	
	// On indique quel utilisateur a supprimé ce bénévole
	$sql2="update benevoles_historique set id_utilisateur_histo=".$_SESSION['idUtilisateur']." where ref=".$_POST['reference']." ORDER BY date_histo DESC LIMIT 1";
	$base->exec($sql2);
}

//on retourne a la page benevoles
$page="Location: ./benevole.php";
//echo $sql;
header($page);
?>