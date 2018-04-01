<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$module=$_POST['module'];

//création colis

if ($module==1 and $_POST['referenceColis']==0 and isset($_SESSION['idUtilisateur']))
{ 
$sql="insert into districolis (datedistri,montantcolis,montantpaye,nbracharge,refbeneficiaire,sem1,sem2,sem3,sem4,solde_colis,id_utilisateur_creation)";
$sql=$sql." values (\"".date('Y-m-d H:i:s',mktime($_POST['heureDistribution'],$_POST['minuteDistribution'],0, 1, $_POST['jourDistribution']))."\",\"".$_POST['montantcolis']."\",\"".$_POST['montantpaye']."\",\"".$_POST['nbracharge']."\",\"".$_POST['refbeneficiaire']."\",\"".$_POST['sem1']."\",\"".$_POST['sem2']."\",\"".$_POST['sem3']."\",\"".$_POST['sem4']."\", ".$_POST['solde_colis'] ." - ". $_POST['montantcolis']." + ". $_POST['montantpaye'].", ".$_SESSION['idUtilisateur'].")";
$base->exec($sql);
$sql="update beneficiaires set solde_colis=".$_POST['solde_colis'] ." - ". $_POST['montantcolis']." + ". $_POST['montantpaye'].",id_utilisateur_modification=".$_SESSION['idUtilisateur']." where ref=".$_POST['refbeneficiaire'].";";
$base->exec($sql);
}



//suppression colis
//TODO: Recréditer le montant du colis au bénéficiare ?

if ($module==2 and $_POST['referenceColis']<>0 and isset($_SESSION['idUtilisateur']))
{ 
$sql="delete from districolis where identifiant=".$_POST['referenceColis'];
$base->exec($sql);

// On indique quel utilisateur a supprimé ce colis
$sql2="update districolis_historique set id_utilisateur_histo=".$_SESSION['idUtilisateur']." where identifiant=".$_POST['referenceColis']." ORDER BY date_histo DESC LIMIT 1";
$base->exec($sql2);
}

//modification montant payé

if ($module==3 and $_POST['referenceColis']<>0 and isset($_SESSION['idUtilisateur']))
{ 
$sql="update districolis set montantcolis=".$_POST['montantcolis'].",montantpaye=\"".$_POST['montantpaye']."\", montantcolis=\"".$_POST['montantcolis']."\", datedistri=\"".date('Y-m-d H:i:s',mktime($_POST['heureDistribution'],$_POST['minuteDistribution'],0, 1, $_POST['jourDistribution']))."\",id_utilisateur_modification=".$_SESSION['idUtilisateur']." where identifiant=".$_POST['referenceColis'].";";
$base->exec($sql);
}

//modification commentaire

if ($module==4 and $_POST['referenceColis']<>0 and isset($_SESSION['idUtilisateur']))
{ 
$sql="update districolis set commentaire=\"".$_POST['commentaire']."\",id_utilisateur_modification=".$_SESSION['idUtilisateur']." WHERE identifiant=\"".$_POST['referenceColis']."\";";
$base->exec($sql);
}

//on retourne a la page benevoles
$page="Location: ./districoli2.php";
//echo $sql;
header($page);
?>
<?php
include_once("../footer.php");
?>