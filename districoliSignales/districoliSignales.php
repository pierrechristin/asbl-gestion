<!-- Partie commune aux deux écrans -->
<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

//initialisation de certaines variables
$module=0;
$jourSelectionne=date("z")+1;
$montantColis=0;
$montantPaye=0;
$nbracharge=0;
$sem1=0;
$sem2=0;
$sem3=0;
$sem4=0;
$solde_colis=0;
$reference=0;
$referenceColis=0;
$commentaire=0;

if (isset($_GET['module'])) {$module=$_GET['module'];}
if (isset($_GET['jourSelectionne'])) {$jourSelectionne=$_GET['jourSelectionne'];}
if (isset($_GET['nbracharge'])) {$nbracharge=$_GET['nbracharge'];}
if (isset($_GET['sem1'])) {$sem1=$_GET['sem1'];}
if (isset($_GET['sem2'])) {$sem2=$_GET['sem2'];}
if (isset($_GET['sem3'])) {$sem3=$_GET['sem3'];}
if (isset($_GET['sem4'])) {$sem4=$_GET['sem4'];}
if (isset($_GET['solde_colis'])) {$solde_colis=$_GET['solde_colis'];}
if (isset($_GET['reference'])) {$reference=$_GET['reference'];}
if (isset($_GET['referenceColis'])) {$referenceColis=$_GET['referenceColis'];}
if (isset($_GET['commentaire'])) {$commentaire=$_GET['commentaire'];}

$nomPage = 'districoliSignales';

include_once("../menuJour.php");
?>

<!-- *********************************************** -->
<!-- Ecran de droite, qui sera destiné aux bénévoles -->
<!-- *********************************************** -->

<?php

// Formulaire colis
if($module<>0)
{
	if ($referenceColis<>0) {
		// Le colis existe déjà, on charge ses informations.
		$sql2="select * from districolis where identifiant=".$referenceColis;
		$resultat2=$base->query($sql2);
		$chaine2=$resultat2->fetch();
		
		$commentaire=$chaine2['commentaire'];
		$heureDistribution=date('H',strtotime($chaine2['datedistri']));
		$minuteDistribution=date('i',strtotime($chaine2['datedistri']));
		$montantColis=$chaine2['montantcolis'];
		$montantPaye=$chaine2['montantpaye'];
	}
	else {
		// Le colis n'existe pas encore, on charge les informations par défaut.
		$commentaire="";
		$heureDistribution=date('H');
		$minuteDistribution=date('i');
		
		// Chargement montant colis par défaut
		$sqlMontantColis = "SELECT valeur FROM parametres WHERE cle = 'MONTANT_COLIS_PAR_DEFAUT'";
		$resultatMontantColis=$base->query($sqlMontantColis);
		$chaineMontantColis=$resultatMontantColis->fetch();
		$montantColis=$chaineMontantColis['valeur'];
	}
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
					<div>
						<label>Montant colis</label>
						<input type='number' step="0.01" name='montantcolis' value='<?php echo $montantColis?>' tabindex=1 style="width: 50px"/>
					</div>
				</td>
				
				<td>
					<div>
						<label>Montant payé</label>
						<input type='number' step="0.01" name='montantpaye' value='<?php echo $montantPaye?>' tabindex=2 style="width: 50px"/>
					</div>
				</td>
				
				<td>Heure passage</td>
				<td>
					<SELECT name="heureDistribution" size="1" tabindex=3 >
						<?php for ($heure=0 ; $heure < 24 ; $heure = $heure + 1) { ?>
							<OPTION  <?php if($heure==$heureDistribution){ echo "selected";} ?>> <?php echo $heure; ?>
						<?php } ?>
					</SELECT>
					H
					<SELECT name="minuteDistribution" size="1" tabindex=4 >
						<?php for ($minute=0 ; $minute < 60 ; $minute = $minute + 1) { ?>
						<OPTION  <?php if($minute==$minuteDistribution){ echo "selected";} ?>> <?php echo $minute; ?>
						<?php } ?>
					</SELECT>
					M
				</td>
<?php
				} else if ($module==4)
				{
?>
				<td colspan=4 align=center>
					<textarea id="commentaire" name="commentaire" class="ckeditor" cols="80" rows="10">
						<?php echo $commentaire;?>
					</textarea>
					<script>
							// Replace the <textarea id="topic"> with a CKEditor
							// instance, using default configuration.
							CKEDITOR.replace( 'commentaire' );
					</script>
				</td>
<?php
				}
?>
			</tr>
			<tr>
				<td colspan=4 align=center>
<?php
				// je change la valeur du submit en fonction de la variable module
				if ($module==1){echo "<input type='submit' value='Créer colis' tabindex=5>";}
				if ($module==2){echo "<input type='submit' value='Supprimer colis' tabindex=5>";}
				if ($module==3){echo "<input type='submit' value='Modifier colis' tabindex=5>";}
				if ($module==4){echo "<input type='submit' value='Commentaire' tabindex=5>";}
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
		<input type='hidden' name='solde_colis' value='<?php echo ($solde_colis);?>'/>
		<input type='hidden' name='referenceColis' value='<?php echo $referenceColis;?>'/>
	</form>
</div>
<?php
}
?>
	
	
<!-- Liste des colis du jour. -->
<div class='bloclarge'>
	<table border=1 align='center' style='font-size:1.2em;'>
		<tr>
			<th>Heure</th>
			<th>Prénom</th>
			<th>Nom</th>
			<th>Nb. pers</th>
			<th colspan=4> Semaine de présence</th>
			<th>Paiement du jour </th>
			<th>Solde colis</th>
			<th colspan=4>Actions</th>
		</tr>

<?php
$sql="select * from"; 
$sql=$sql."(select districolis.identifiant,
					beneficiaires.ref,
					DATE(districolis.datedistri) as jourpassage,
					TIME(districolis.datedistri) as heurepassage,
					beneficiaires.nom,
					beneficiaires.prenom,
					districolis.nbracharge,
					districolis.sem1,
					districolis.sem2,
					districolis.sem3,
					districolis.sem4,
					beneficiaires.aide_familiale,
					districolis.montantcolis,
					districolis.montantpaye,
					districolis.solde_colis,
					districolis.commentaire,
					false as nouveauColis
				from beneficiaires inner join districolis on beneficiaires.ref = districolis.refbeneficiaire
				where DATE(districolis.datedistri)='".date("Y-m-d", mktime(0, 0, 0, 1, $jourSelectionne))."'" ;
//tri par heure de passage dans la requête sql
//$sql=$sql." order by beneficiaires.heurepassage asc ";
$sql=$sql." union ";
$sql=$sql."select 0,
					ref,
					DATE(datesignalement) as jourpassage,
					TIME(datesignalement) as heurepassage,
					nom,
					prenom,
					nbracharge,
					sem1,
					sem2,
					sem3,
					sem4,
					aide_familiale,
					null,
					null,
					solde_colis,
					null,
					true as nouveauColis
				from beneficiaires
				join signalement_presence on signalement_presence.refbeneficiaire = beneficiaires.ref
				where DATE(signalement_presence.datesignalement)='";
//on n'affiche que les personnes qui doivent passer le jour de la semaine sélectionné
$sql=$sql.date("Y-m-d", mktime(0, 0, 0, 1, $jourSelectionne))."'";
$sql=$sql.")as colisjour group by nom, prenom";
//$sql=$sql." order by TIME(districolis.datedistri) asc ";
// echo $sql;
$resultat=$base->query($sql);

// affichage ligne par ligne
while ($chaine=$resultat->fetch())
	{
		//echo print_r($chaine);
		
		// On détermine, ligne par ligne, quelle sera la couleur de fond.
		if ($chaine['identifiant']==$referenceColis && $chaine['ref']==$reference)
		{
			// Colis affiché dans le formulaire
			$bgcolor = '#78A9D4'; // bleu
		}
		else if ($chaine['nouveauColis'])
		{
			// Colis à créer
				// Pour un bénéficiaire qui dispose pas d'aide familiale : pas priorisation particulière.
				$bgcolor = '#ccffcc'; // vert
		}
?>
		<tr <?php if (isset($bgcolor)) {echo 'bgcolor="'.$bgcolor.'"';}?>>
			<td><?php echo $chaine['heurepassage'];?></td>
			<td><?php echo $chaine['prenom'];?></td>
			<td><?php echo $chaine['nom'];?></td>
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
			<td><?php echo $chaine['solde_colis'];?></td>
			<td width=20>
<?php
				if( isset($chaine['montantpaye']) == false)
				{
?>
				<a href='districoliSignales.php?module=1<?php echo ('&reference=' . $chaine['ref'] . '&nbracharge=' . $chaine['nbracharge'] . '&sem1=' . $chaine['sem1'] . '&sem2=' . $chaine['sem2'] . '&sem3=' . $chaine['sem3'] . '&sem4=' . $chaine['sem4'] . '&solde_colis=' . $chaine['solde_colis'] . '&jourSelectionne=' . $jourSelectionne . '&montantColis=' . $montantColis);?>'>
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
				<a href='districoliSignales.php?module=2&referenceColis=<?php echo ($chaine['identifiant'] . '&jourSelectionne=' . $jourSelectionne . '&reference=' . $chaine['ref']);?>'>
					<img src='../images/supprimer.jpg' width=20 height=20 title='Supprimer colis'/>
				</a>
<?php		} ?>
			</td>
				
				
			<td width=20>
<?php				
				if (isset($chaine['montantpaye']) ==true)
				{
?>
				<a href='districoliSignales.php?module=3&referenceColis=<?php echo ($chaine['identifiant'] . '&jourSelectionne=' . $jourSelectionne . '&reference=' . $chaine['ref']);?>'>
					<img src='../images/editer.jpg' width=20 height=20 title='Modifier colis'/>
				</a>
<?php		} ?>
			</td>
			
			
			<td width=20>
<?php				
				if (isset($chaine['montantpaye']) ==true)
				{
?>
				<a href='districoliSignales.php?module=4&referenceColis=<?php echo $chaine['identifiant'];?>&jourSelectionne=<?php echo ($jourSelectionne . '&reference=' . $chaine['ref']);?>'>
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

<?php
include_once("../footer.php");
?>