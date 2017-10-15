<?php

include_once("../index.php");

$base=ouvrebase();

$nomPage = 'magasin';

include_once("../menuJour.php");
?>

<div class="bloclarge">

Menu action : 
	<ul>
		<li>
			ajout vente au panier
		</li>
		<li>
			saisie entrée d'argent (generique)
		</li>
		<li>
			saisie sortie d'argent
		</li>
	</ul>

</div>

<div class="bloclarge">

Liste des E/S caisse du jour selectionné 

</div>

<div class="bloclarge">

Affichage des totaux du jour

</div>