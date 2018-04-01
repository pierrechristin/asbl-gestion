<?php

session_start();

function ouvrebase()
{
	$base=new pdo($_SESSION['dsn1'],$_SESSION['loginbdd'],$_SESSION['pwdbdd']);
	return $base;
}

function autorisation( $mail, $mdp) 
{
	
  	$base=ouvrebase();
	
	
	$requete="select * from benevoles where mail='".$mail."' ";
	
	$exec=$base->query($requete);
	$result=$exec->fetch();
	
	if (isset($result) && password_verify($mdp, $result['mdp']))
	{
		$_SESSION['idUtilisateur']=$result['ref'];
		$_SESSION['secteur']=$result['secteur'];
		$_SESSION['nom']=$result['nom'];
		$_SESSION['prenom']=$result['prenom'];
		return TRUE;
	}
	else 
	{
		return FALSE;
	}
	
}

$_SESSION['dsn1']="mysql:host=localhost;dbname=asbl";
$_SESSION['loginbdd']="cmsuser";
$_SESSION['pwdbdd']="ensemble1";


// Mode visiteur
if ($_POST['action'] == 'Visiteur') {
	$_SESSION['mail'] = 'Visiteur';
	$_SESSION['idUtilisateur']=-1;
	$_SESSION['secteur']=-1;
	$_SESSION['nom']='Visiteur';
	$_SESSION['prenom']='Visiteur';
}
// Mode normal
else if ( isset( $_POST['mail'] ) ) 
{
   	$mail=$_POST['mail'];
	$mdp=$_POST['mdp'];
  	
	if ( autorisation( $mail, $mdp) ) 
	{

		echo "Bonjour ".$mail." , votre identité est vérifiée </br>";
		//regénération d'un nouvel identifiant de session
		session_regenerate_id();
		//association du login avec la session
		$_SESSION['mail'] = $mail;
	}
	else 
	{
		//traitement de l'utilisateur non autorisé
		//ici redirection vers la page autehntification
		header('location: auth.php');
	}

}
 else 
 {

 	//traitement du cas ou il n'y a pas eu saisie du login et du password (acces direct à la page verif.php)
	//ici redirection vers la page d'autehntification
	header('location: auth.php');
	
}

header ('location: index.php');
?>
