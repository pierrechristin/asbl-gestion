<?php
//script vérifiant le validité d'une session

session_start();

if ( !isset( $_SESSION['mail']) ) {
//ajout de la variable de construction de l'url 
	header('location: http://'.$_SERVER['HTTP_HOST'].'/tfe/auth.html');
	exit();
}

?>
