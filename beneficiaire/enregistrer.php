<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

$module=$_POST['module'];

//modification de la fiche module 1

if ($module==1 and $_POST['reference']<>0)
{ 
$sql="update beneficiaires set nom=\"".$_POST['nom']."\",prenom=\"".$_POST['prenom']."\",tel=\"".$_POST['tel']."\",adresse=\"" .$_POST['adresse']."\",nbracharge=\"".$_POST['nbracharge']."\",solde=\"".$_POST['solde']."\",sem1=\"".isset($_POST['sem1'])."\",sem2=\"".isset($_POST['sem2'])."\",sem3=\"".isset($_POST['sem3'])."\",sem4=\"".isset($_POST['sem4'])."\",jourpassage=\"".$_POST['jourPassage']."\",heurepassage=\"".date('H:i:s',mktime($_POST['heurePassage'],$_POST['minutePassage'],0))."\" where ref=".$_POST['reference'].";";
$base->exec($sql);

}

//ajout de la fiche module 2

if ($module==2 and $_POST['reference']==0)
{ 
$sql="insert into beneficiaires (nom,prenom,tel,adresse,nbracharge,solde,sem1,sem2,sem3,sem4,jourpassage,heurepassage)";
$sql=$sql." values (\"".$_POST['nom']."\",\"".$_POST['prenom']."\",\"".$_POST['tel']."\",\"".$_POST['adresse']."\",\"".$_POST['nbracharge']."\",\"".$_POST['solde']."\",\"".isset($_POST['sem1'])."\",\"".isset($_POST['sem2'])."\",\"".isset($_POST['sem3'])."\",\"".isset($_POST['sem4'])."\",\"".$_POST['jourPassage']."\",\"".date('H:i:s',mktime($_POST['heurePassage'],$_POST['minutePassage'],0))."\")";
$base->exec($sql);
}

//suppression de la fiche module 3

if ($module==3 and $_POST['reference']<>0)
{ 
$sql="delete from beneficiaires where ref=".$_POST['reference'];
$base->exec($sql);
}

//on retourne a la page beneficiaires
$page="Location: ./beneficiaires.php";
//echo $sql;
header($page);
?>
<?php
include_once("../footer.php");
?>