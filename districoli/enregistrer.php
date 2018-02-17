<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$module=$_POST['module'];

//création colis puis mise à jour du solde du bénéficiaire

if ($module==1 and $_POST['referenceColis']==0)
{ 
$sql="insert into districolis (datedistri,
		montantcolis,
		montantpaye,
		nbracharge,
		refbeneficiaire,
		sem1,
		sem2,
		sem3,
		sem4,
		solde)";
$sql=$sql." values (\"".
		date('Y-m-d H:i:s',mktime($_POST['heureDistribution'],$_POST['minuteDistribution'],0, 1, $_POST['jourDistribution']))."\",
		\"".$_POST['montantcolis']."\",
		\"".$_POST['montantpaye']."\",
		\"".$_POST['nbracharge']."\",
		\"".$_POST['refbeneficiaire']."\",
		\"".$_POST['sem1']."\",
		\"".$_POST['sem2']."\",
		\"".$_POST['sem3']."\",
		\"".$_POST['sem4']."\",
		".$_POST['solde'] ." + ". $_POST['montantpaye'].
		")";
$base->exec($sql);
$sql="update beneficiaires set solde=".$_POST['solde'] ." + ". $_POST['montantpaye']." where ref=".$_POST['refbeneficiaire'].";";
$base->exec($sql);
}



//suppression colis
//TODO: Recréditer le montant du colis au bénéficiare ?

if ($module==2 and $_POST['referenceColis']<>0)
{ 
$sql="delete from districolis where identifiant=".$_POST['referenceColis'];
$base->exec($sql);
}

//modification colis

if ($module==3 and $_POST['referenceColis']<>0)
{ 
$sql="update districolis set montantcolis=".$_POST['montantcolis'].",
							montantpaye=".$_POST['montantpaye'].",
							datedistri=\"".date('Y-m-d H:i:s',mktime($_POST['heureDistribution'],$_POST['minuteDistribution'],0, 1, $_POST['jourDistribution']))."\"
		where identifiant=".$_POST['referenceColis'].";";
$base->exec($sql);
}

//modification commentaire

if ($module==4 and $_POST['referenceColis']<>0)
{ 
$sql="update districolis set commentaire=\"".$_POST['commentaire']."\" WHERE identifiant=\"".$_POST['referenceColis']."\";";
$base->exec($sql);
}

//on retourne a la page benevoles
$page="Location: ./districoli.php";
//echo $sql;
header($page);
?>
<?php
include_once("../footer.php");
?>