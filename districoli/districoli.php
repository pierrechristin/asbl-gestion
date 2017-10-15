<?php

include_once("../index.php");
$base=ouvrebase();
$module=0;
$montantPaye=0;
$nbracharge=0;
$sem1=0;
$sem2=0;
$sem3=0;
$sem4=0;
$solde=0;
$reference=0;
$referenceColis=0;
$commentaire=0;

if (isset($_GET['module'])) {$module=$_GET['module'];}
if (isset($_GET['nbracharge'])) {$nbracharge=$_GET['nbracharge'];}
if (isset($_GET['sem1'])) {$sem1=$_GET['sem1'];}
if (isset($_GET['sem2'])) {$sem2=$_GET['sem2'];}
if (isset($_GET['sem3'])) {$sem3=$_GET['sem3'];}
if (isset($_GET['sem4'])) {$sem4=$_GET['sem4'];}
if (isset($_GET['solde'])) {$solde=$_GET['solde'];}
if (isset($_GET['reference'])) {$reference=$_GET['reference'];}
if (isset($_GET['referenceColis'])) {$referenceColis=$_GET['referenceColis'];}
if (isset($_GET['commentaire'])) {$commentaire=$_GET['commentaire'];}

$nomPage = 'districoli';

include_once("../menuJour.php");
?>

<?php
	if($module<>0)
	{
?>
	<div class='bloclarge' >
		<form name='fiche' action='enregistrer.php' enctype='multipart/form-data' method='POST'>

			<table align='center' >
				<tr>
<?php
				if($module==1 || $module==3)
				{
?>
				<td>
					<label>Montant payé</label>
					<input type='number' name='montantpaye' value='<?php echo $montantPaye?>'/>
				</td>
				
				<td>Heure passage</td>
					<td>
						<SELECT name="heureDistribution" size="1">
							<?php for ($heure=0 ; $heure < 24 ; $heure = $heure + 1) { ?>
								<OPTION  <?php if($heure==date("H")){ echo "selected";} ?>> <?php echo $heure; ?>
							<?php } ?>
						</SELECT>
						H
						<SELECT name="minuteDistribution" size="1">
							<?php for ($minute=0 ; $minute < 60 ; $minute = $minute + 1) { ?>
							<OPTION  <?php if($minute==date("i")){ echo "selected";} ?>> <?php echo $minute; ?>
							<?php } ?>
						</SELECT>
						M
					</td>
<?php
				} else if ($module==4)
				{
?>
				<textarea cols="80" class="ckeditor" id="commentaire" name="commentaire" rows="10"> </textarea>
				<script>
							// Replace the <textarea id="topic"> with a CKEditor
							// instance, using default configuration.
							CKEDITOR.replace( 'commentaire' );

							CKEDITOR.instances.commentaire.setData( '<p><?php echo $commentaire;?></p>',    function()
				{
				this.checkDirty();  // true
				});
				</script>
<?php
				}
?>
<?php
					// je change la valeur du submit en fonction de la variable module
					if ($module==1){echo "<td><input type='submit' value='Créer colis'></td>";}
					if ($module==2){echo "<td><input type='submit' value='Supprimer colis'></td>";}
					if ($module==3){echo "<td><input type='submit' value='Modifier colis'></td>";}
					if ($module==4){echo "<td><input type='submit' value='Commentaire'></td>";}
?>
				</tr>
			</table>
			<input type='hidden' name='module' value='<?php echo $module;?>'/>
			<input type='hidden' name='jourDistribution' value='<?php echo $jourSelectionne;?>'/>
			<input type='hidden' name='nbracharge' value='<?php echo $nbracharge;?>'/>
			<input type='hidden' name='refbeneficiaire' value='<?php echo $reference;?>'/>
			<input type='hidden' name='sem1' value='<?php echo $sem1;?>'/>
			<input type='hidden' name='sem2' value='<?php echo $sem2;?>'/>
			<input type='hidden' name='sem3' value='<?php echo $sem3;?>'/>
			<input type='hidden' name='sem4' value='<?php echo $sem4;?>'/>
			<input type='hidden' name='solde' value='<?php echo ($solde - 4);?>'/>
			<input type='hidden' name='referenceColis' value='<?php echo $referenceColis;?>'/>
		</form>
	</div>
<?php
	}
?>

	<div class='bloclarge'>
		<table border=1 align='center' style='font-size:1.2em;'>
			<tr>
				<th>Heure</th>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Nombre/personne</th>
				<th colspan=4> Semaine de présence</th>
				<th>Paiement du jour </th>
				<th>Solde</th>
				<th colspan=4>Actions</th>
			</tr>

<?php
$sql="select * from"; 
$sql=$sql."(select districolis.identifiant, beneficiaires.ref, DATE(districolis.datedistri) as jourpassage, TIME(districolis.datedistri) as heurepassage, beneficiaires.nom, beneficiaires.prenom, districolis.nbracharge, districolis.sem1, districolis.sem2, districolis.sem3, districolis.sem4, districolis.montantpaye, districolis.solde, districolis.commentaire from beneficiaires inner join districolis on beneficiaires.ref = districolis.refbeneficiaire where DATE(districolis.datedistri)='".date("Y-m-d", mktime(0, 0, 0, 1, $jourSelectionne))."'" ;
//tri par heure de passage dans la requête sql
//$sql=$sql." order by beneficiaires.heurepassage asc ";
$sql=$sql." union ";
$sql=$sql."select 0, ref, jourpassage, heurepassage, nom, prenom, nbracharge, sem1, sem2, sem3, sem4, null, solde, null from beneficiaires where jourpassage=";
//on n'affiche que les personnes qui doivent passer le jour de la semaine sélectionné
$sql=$sql.date("N", mktime(0, 0, 0, 1, $jourSelectionne)).")";
$sql=$sql."as colisjour group by nom, prenom";

//$sql=$sql." order by TIME(districolis.datedistri) asc ";
// echo $sql;
$resultat=$base->query($sql);

// affichage ligne par ligne
while ($chaine=$resultat->fetch())
	
	{
		//echo print_r($chaine);
?>
			
			<tr>
				<td><?php echo $chaine['heurepassage'];?></td>
				<td><?php echo $chaine['nom'];?></td>
				<td><?php echo $chaine['prenom'];?></td>
				<td><?php echo $chaine['nbracharge'];?></td>
				<td><?php echo $chaine['sem1'];?></td>
				<td><?php echo $chaine['sem2'];?></td>
				<td><?php echo $chaine['sem3'];?></td>
				<td><?php echo $chaine['sem4'];?></td>
				<td>
					<?php
						if (isset($chaine['montantpaye']))
						{
							echo $chaine['montantpaye'];
						}
						else
						{
							echo "Pas de colis distribué";
						}
					?>
				</td>
				<td><?php echo $chaine['solde'];?></td>
				<td width=20>
<?php
				if( isset($chaine['montantpaye']) == false)
				{
?>
					<a href='districoli.php?module=1<?php echo ('&reference=' . $chaine['ref'] . '&nbracharge=' . $chaine['nbracharge'] . '&sem1=' . $chaine['sem1'] . '&sem2=' . $chaine['sem2'] . '&sem3=' . $chaine['sem3'] . '&sem4=' . $chaine['sem4'] . '&solde=' . $chaine['solde'] . '&jourSelectionne=' . $jourSelectionne);?>'>
						<img src='../images/inserer.jpg' width=20 height=20 title='Créer colis'/>
					</a>
<?php
				} 
?>
				</td>

				
				<td width=20>
				
<?php				
				if (isset($chaine['montantpaye']) ==true)
				{
?>
					<a href='districoli.php?module=2&referenceColis=<?php echo ($chaine['identifiant'] . '&jourSelectionne=' . $jourSelectionne);?>'>
						<img src='../images/supprimer.jpg' width=20 height=20 title='Supprimer colis'/>
					</a>
<?php		} ?>
				</td>
				
				
				<td width=20>
<?php				
				if (isset($chaine['montantpaye']) ==true)
				{
?>
					<a href='districoli.php?module=3&referenceColis=<?php echo ($chaine['identifiant'] . '&jourSelectionne=' . $jourSelectionne);?>'>
						<img src='../images/editer.jpg' width=20 height=20 title='Modifier colis'/>
					</a>
<?php		} ?>
				</td>
				
				
				<td width=20>
<?php				
				if (isset($chaine['montantpaye']) ==true)
				{
?>
					<a href='districoli.php?module=4&referenceColis=<?php echo $chaine['identifiant'];?>&commentaire=<?php echo ($chaine['commentaire'] . '&jourSelectionne=' . $jourSelectionne);?>'>
						<img src='../images/mail.png' width=20 height=20 title='Commentaire colis'/>
					</a>
<?php		} ?>
				</td>
			</tr>
<?php
	}
?>
		</table>
	</div>