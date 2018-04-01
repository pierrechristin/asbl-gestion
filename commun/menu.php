<div class='bloclarge menuhorizontal' align='center'>
	
	<div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/signalement/signalement.php' <?php if(basename($_SERVER['PHP_SELF']) == 'signalement.php'){echo("class='selectionne'");}?>>Signalement Client</a></div>
	
	<?php if ($_SESSION['secteur'] == 1 or $_SESSION['secteur'] == 2 or$_SESSION['secteur'] == 3 or $_SESSION['secteur'] == 4) { ?>
	<!-- <div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/districoli/districoli.php' <?php if(basename($_SERVER['PHP_SELF']) == 'districoli.php'){echo("class='selectionne'");}?>>Distribution colis sans signalement</a></div> -->
	<div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/districoliSignales/districoliSignales.php' <?php if(basename($_SERVER['PHP_SELF']) == 'districoliSignales.php'){echo("class='selectionne'");}?>>Distribution colis</a></div>
	<!-- <div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/districoli2/districoli2.php' <?php if(basename($_SERVER['PHP_SELF']) == 'districoli2.php'){echo("class='selectionne'");}?>>Distribution colis + Signalement Client</a></div> -->
	<div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/beneficiaire/beneficiaires.php' <?php if(basename($_SERVER['PHP_SELF']) == 'beneficiaires.php'){echo("class='selectionne'");}?>>Beneficiaire</a></div>
	<div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/benevole/benevole.php' <?php if(basename($_SERVER['PHP_SELF']) == 'benevole.php'){echo("class='selectionne'");}?>>Benevole</a></div>
	<div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/stat/stat.php' <?php if(basename($_SERVER['PHP_SELF']) == 'stat.php'){echo("class='selectionne'");}?>>Statistiques</a></div>
	<!-- <div><a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/agenda/agenda.php' <?php if(basename($_SERVER['PHP_SELF']) == 'agenda.php'){echo("class='selectionne'");}?>>Agenda</a></div> -->
	<?php } ?>
	
	<div>
		<?php if (isset($_SESSION['prenom'])) { ?>
		<span class='bonjour'><?php echo ('Bonjour ' . $_SESSION['prenom']);?></span><br/>
		<?php } ?>
		<a href='http://<?php echo $_SERVER['HTTP_HOST'] ?>/asbl-gestion/deco.php'>Deconnexion</a>
	</div>
	
</div>