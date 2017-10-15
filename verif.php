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
		return TRUE;
	}
	else 
	{
		return FALSE;
	}
	
}

$_SESSION['dsn1']="mysql:host=localhost;dbname=asbl";
$_SESSION['loginbdd']="root";
$_SESSION['pwdbdd']="";



if ( isset( $_POST['mail'] ) ) 
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
		//$_SESSION['groupe']=$groupe;
	}
	else 
	{
		//traitement de l'utilisateur non autorisé
		//ici redirection vers la page autehntification
		header('location: auth.html');
	}

}
 else 
 {

 	//traitement du cas ou il n'y a pas eu saisie du login et du password (acces direct à la page verif.php)
	//ici redirection vers la page d'autehntification
	header('location: auth.html');
	
}

header ('location: index.php');
?>
