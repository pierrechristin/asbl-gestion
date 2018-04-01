<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$module=$_POST['module'];

//modification de la fiche - module 1

if ($module==1 and $_POST['reference']<>0 and isset($_SESSION['idUtilisateur']))
{ 
$sql='update beneficiaires'.' '
		.'set nom="'.$_POST['nom'].'",'
			.'prenom="'.$_POST['prenom'].'",'
			.'tel="'.$_POST['tel'].'",'
			.'adresse="'.$_POST['adresse'].'",'
			.'nbracharge="'.$_POST['nbracharge'].'",'
			.'solde_colis="'.$_POST['solde_colis'].'",'
			.'solde_magasin="'.$_POST['solde_magasin'].'",'
			.'sem1="'.isset($_POST['sem1']).'",'
			.'sem2="'.isset($_POST['sem2']).'",'
			.'sem3="'.isset($_POST['sem3']).'",'
			.'sem4="'.isset($_POST['sem4']).'",'
			.'aide_familiale="'.isset($_POST['aide_familiale']).'",'
			.'jourpassage="'.$_POST['jourPassage'].'",'
			.'heurepassage="'.date('H:i:s',mktime($_POST['heurePassage'],$_POST['minutePassage'],0)).'",'
			.'id_utilisateur_modification='.$_SESSION['idUtilisateur'].' '
		.'where ref='.$_POST['reference'].';';
$base->exec($sql);

}

//ajout de la fiche - module 2

if ($module==2 and $_POST['reference']==0 and isset($_SESSION['idUtilisateur']))
{ 
$sql='insert into beneficiaires ('
			.'nom,'
			.'prenom,'
			.'tel,'
			.'adresse,'
			.'nbracharge,'
			.'solde_colis,'
			.'solde_magasin,'
			.'sem1,'
			.'sem2,'
			.'sem3,'
			.'sem4,'
			.'aide_familiale,'
			.'jourpassage,'
			.'heurepassage,'
			.'id_utilisateur_creation'
		.') values ('
		.'"'.$_POST['nom'].'",'
		.'"'.$_POST['prenom'].'",'
		.'"'.$_POST['tel'].'",'
		.'"'.$_POST['adresse'].'",'
		.'"'.$_POST['nbracharge'].'",'
		.'"'.$_POST['solde_colis'].'",'
		.'"'.$_POST['solde_magasin'].'",'
		.'"'.isset($_POST['sem1']).'",'
		.'"'.isset($_POST['sem2']).'",'
		.'"'.isset($_POST['sem3']).'",'
		.'"'.isset($_POST['sem4']).'",'
		.'"'.isset($_POST['aide_familiale']).'",'
		.'"'.$_POST['jourPassage'].'",'
		.'"'.date('H:i:s',mktime($_POST['heurePassage'],$_POST['minutePassage'],0)).'",'
		.$_SESSION['idUtilisateur'].')';
$base->exec($sql);
}

//suppression de la fiche - module 3

if ($module==3 and $_POST['reference']<>0 and isset($_SESSION['idUtilisateur']))
{ 
$sql='delete from beneficiaires'.' '
		.'where ref='.$_POST['reference'];
$base->exec($sql);
	
// On indique quel utilisateur a supprimé ce beneficiare
$sql2='update beneficiaires_historique'.' '
		.'set id_utilisateur_histo='.$_SESSION['idUtilisateur'].' '
		.'where ref='.$_POST['reference'].' '
		.'ORDER BY date_histo DESC'.' '
		.'LIMIT 1';
$base->exec($sql2);
}

//on retourne a la page beneficiaires
$page="Location: ./beneficiaires.php";
//echo $sql;
header($page);
?>
<?php
include_once("../footer.php");
?>