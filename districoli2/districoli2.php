<!-- Partie commune aux deux écrans -->
<?php
include_once("../commun/indexCommun.php");
$base=ouvrebase();
?>


<!-- *************************************************** -->
<!-- Ecran de gauche, qui sera destiné aux bénéficiaires -->
<!-- *************************************************** -->

<div class='blocgauche' style="overflow-y: auto; height:95%; margin-left : -5%;">
	<?php include('../commun/entete.php'); ?>
	
	<?php include('../commun/mentionsLegales.php'); ?>
</div>


<!-- *********************************************** -->
<!-- Ecran de droite, qui sera destiné aux bénévoles -->
<!-- *********************************************** -->

<div class='blocdroite' style="overflow-y: auto; height:95%; margin-right : -5%;">
	<?php include('../commun/entete.php'); ?>
	<?php include('../commun/menu.php'); ?>
	
	<?php include('../commun/mentionsLegales.php'); ?>
</div>


<!-- Partie commune aux deux écrans -->
<?php include_once('../commun/footerCommun.php'); ?>