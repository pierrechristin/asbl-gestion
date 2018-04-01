<?php
//date de l'année actuelle
$jourSelectionne=date("z")+1;

//initialisation de certaines variables
if (isset($_GET['jourSelectionne'])) {$jourSelectionne=$_GET['jourSelectionne'];}

//numero de la semaine actuelle
$w = date("W", mktime(0,0,0,1,$jourSelectionne));
?>

	<div class='bloclarge menuhorizontal' align='center'>
		<div> 
			<a href='<?php echo $nomPage ?>.php?jourSelectionne=<?php echo $jourSelectionne-7 ?>'>
				<== Semaine précédente
			</a>
		</div>
			
<?php
//recherche de la semaine actuel
for($i = 1; $i <= 365; $i++) {
	$week = date("W", mktime(0, 0, 0, 1, $i));
	if($week == $w) { 
		//semaine trouvée
		for($d = 0; $d < 7; $d++) {
			if ($d==5) { // Pour dire que c'est uniquement le Vendredi
 ?>
		<div>
			<a href='<?php echo $nomPage ?>.php?jourSelectionne=<?php echo ($i + $d-1);?>'<?php if ($i+$d-1==$jourSelectionne){echo("class='selectionne'");}?>>
				<?php echo (date("d/m/Y",mktime (0,0,0,1,$i + $d-1)))?>
			</a>
		</div>
 <?php
	  }
    }
	break;
  }
}
?>
		<div> 
			<a href='<?php echo $nomPage ?>.php?jourSelectionne=<?php echo $jourSelectionne+7 ?>'>
				Semaine suivante ==>
			</a>
		</div>
	</div>