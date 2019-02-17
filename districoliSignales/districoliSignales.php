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
if (isset($_GET['dettesMagasinActuelles'])) {$dettesMagasinActuelles=$_GET['dettesMagasinActuelles'];}
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
		$colis2=$resultat2->fetch();
		
		$commentaire=$colis2['commentaire'];
		$heureDistribution=date('H',strtotime($colis2['datedistri']));
		$minuteDistribution=date('i',strtotime($colis2['datedistri']));
		$montantColis=$colis2['montantcolis'];
		$montantPaye=$colis2['montantpaye'];
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
	<form name='fiche' action='enregistrer.php' enctype='multipart/form-data' method='POST' align='center'>
<?php
	if($module==1)
	{
?>
		<div class='blocgauche' style="height: 110px">
<?php
	}
	if($module==5)
	{
?>
			<h3>
				Signalement
			</h3>
<?php
	}
	else
	{	
?>
			<h3>
				Colis
			</h3>
<?php		
	}	
?>
			
<?php
	if($module==1 || $module==3)
	{
?>
			<div>
				<label>Montant colis : </label>
				<input type='number' step="0.01" name='montantcolis' value='<?php echo $montantColis?>' tabindex=1 style="width: 50px; margin-right: 10px;"/>

				<label>Montant payé : </label>
				<input type='number' step="0.01" name='montantpaye' value='<?php echo $montantPaye?>' tabindex=2 style="width: 50px"/>
			</div>


			<div>
				<label>Heure passage : </label>
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
			</div>
<?php
	} else if ($module==4)
	{
?>
			<div>
				<textarea id="commentaire" name="commentaire" tabindex=1 class="ckeditor" cols="80" rows="10">
					<?php echo $commentaire;?>
				</textarea>
				<script>
						// Replace the <textarea id="topic"> with a CKEditor
						// instance, using default configuration.
						CKEDITOR.replace( 'commentaire' );
				</script>
			</div>
<?php
	}
	if($module==1)
	{
?>
		</div>
		
		<div class='blocdroite' style="height: 110px">
			<h3>
				Magasin
			</h3>
			<div>
				<label>Dettes actuelles : </label>
				<input type='number' step="0.01" name='dettesMagasinActuelles' value='<?php echo $dettesMagasinActuelles ?>' tabindex=5 style="width: 50px;" disabled/>
			</div>
			<div>
				<label>Nouvelles dettes : </label>
				<input type='number' step="0.01" name='nouvellesDettesMagasin' value='<?php echo $dettesMagasinActuelles ?>' tabindex=6 style="width: 50px;"/>
			</div>
		</div>
<?php
	}
		// je change la valeur du submit en fonction de la variable module
		if ($module==1){echo "<input type='submit' style='margin-top: 16px' value='Créer colis' tabindex=7>";}
		if ($module==2){echo "<input type='submit' style='margin-top: 16px' value='Supprimer colis' tabindex=1>";}
		if ($module==3){echo "<input type='submit' style='margin-top: 16px' value='Modifier colis' tabindex=5>";}
		if ($module==4){echo "<input type='submit' style='margin-top: 16px' value='Commentaire' tabindex=2>";}
		if ($module==5){echo "<input type='submit' style='margin-top: 16px' value='Supprimer signalement' tabindex=1>";}
?>

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
		<thead>
			<tr>
				<th>Heure</th>
				<th>Prénom</th>
				<th>Nom</th>
				<th>Nb. pers</th>
				<th colspan=4> Semaine de présence</th>
				<th>Paiement du jour </th>
				<th>Solde colis</th>
<?php if ($jourSelectionne==date("z")+1) { ?>
				<th>Doit en magasin</th>
<?php } ?>
				<th colspan=4>Actions</th>
			</tr>
		</thead>
<?php
//strtotime
//date
$sqlNouveauxColis= "select 0 as identifiant,
					ref,
					null as datepassage,
					datesignalement as datesignalement,
					nom,
					prenom,
					nbracharge,
					sem1,
					sem2,
					sem3,
					sem4,
					aide_familiale,
					null as montantcolis,
					null as montantpaye,
					solde_colis,
					dette_magasin,
					null as commentaire,
					true as nouveauColis
				from beneficiaires
				join signalement_presence on signalement_presence.refbeneficiaire = beneficiaires.ref
				where DATE(signalement_presence.datesignalement)='";
$sqlNouveauxColis=$sqlNouveauxColis.date("Y-m-d", mktime(0, 0, 0, 1, $jourSelectionne))."'";
$sqlNouveauxColis=$sqlNouveauxColis." and ref not in (select refbeneficiaire from districolis where DATE(datedistri)='";
$sqlNouveauxColis=$sqlNouveauxColis.date("Y-m-d", mktime(0, 0, 0, 1, $jourSelectionne))."'";
$sqlNouveauxColis=$sqlNouveauxColis.")";
$sqlNouveauxColis=$sqlNouveauxColis." group by nom, prenom";
$sqlNouveauxColis=$sqlNouveauxColis." order by aide_familiale desc, datesignalement asc ";
$resultatNouveauxColis=$base->query($sqlNouveauxColis);

$sqlColisDistribues = "select districolis.identifiant,
					beneficiaires.ref,
					datedistri as datepassage,
					datesignalement as datesignalement,
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
					beneficiaires.dette_magasin,
					districolis.commentaire,
					false as nouveauColis
				from beneficiaires inner join districolis on beneficiaires.ref = districolis.refbeneficiaire
				join signalement_presence on signalement_presence.refbeneficiaire = beneficiaires.ref
				where DATE(districolis.datedistri)='".date("Y-m-d", mktime(0, 0, 0, 1, $jourSelectionne))."'
				and DATE(signalement_presence.datesignalement)='";
$sqlColisDistribues=$sqlColisDistribues.date("Y-m-d", mktime(0, 0, 0, 1, $jourSelectionne))."'";
$sqlColisDistribues=$sqlColisDistribues." group by nom, prenom";
$sqlColisDistribues=$sqlColisDistribues." order by datesignalement asc ";
$resultatColisDistribues=$base->query($sqlColisDistribues);

$nouveauxColis = $resultatNouveauxColis->fetchAll();
$colisDistribues = $resultatColisDistribues->fetchAll();
$colisRassembles = array_merge($nouveauxColis, $colisDistribues);

// Données statistiques
$attenteMoyenne = 0;
$nbColisDistribues = 0;
$nbPersonnesServices = 0;
$montantRecuColis = 0;
$balanceColis = 0;
$creanceMagasin = 0;

// affichage ligne par ligne
while ($colis=array_shift($colisRassembles))
	{
		//echo print_r($colis);
		
		// On détermine, ligne par ligne, quelle sera la couleur de fond.
		if ($colis['identifiant']==$referenceColis && $colis['ref']==$reference)
		{
			// Colis affiché dans le formulaire
			$bgcolor = '#78A9D4'; // bleu
		}
		else if ($colis['nouveauColis'] == true)
		{
			// Colis à créer
			if ($colis['aide_familiale'] == true)
			{
				// Pour un bénéficiaire qui dispose d'une aide familiale : colis à distribuer en priorité.
				$bgcolor = '#ffcc99'; // orange
			}
			else
			{
				// Pour un bénéficiaire qui dispose pas d'aide familiale : pas priorisation particulière.
				$bgcolor = '#ccffcc'; // vert
			}
		}
?>
		<tr <?php if (isset($bgcolor)) {echo 'bgcolor="'.$bgcolor.'"';}?>>
			<td align=center>
					<?php
						if ($colis['nouveauColis'] == true)
						{
							echo (date('G:i', strtotime($colis['datesignalement'])));
						}
						else
						{
							echo (date('G:i', strtotime($colis['datepassage'])));
						}
					?>
			</td>
			<td><?php echo $colis['prenom'];?></td>
			<td><?php echo $colis['nom'];?></td>
			<td><?php echo $colis['nbracharge'];?></td>
			<td width=20><?php echo $colis['sem1'];?></td>
			<td width=20><?php echo $colis['sem2'];?></td>
			<td width=20><?php echo $colis['sem3'];?></td>
			<td width=20><?php echo $colis['sem4'];?></td>
			<td>
					<?php
						if ($colis['nouveauColis'] == true)
						{
							echo "Pas de colis distribué";
						}
						else
						{
							echo($colis['montantpaye'] . ' €');
						}
					?>
			</td>
			<td <?php if ($colis['solde_colis']<0) { echo 'class="alerteMontant"'; } ?>>
				<?php echo $colis['solde_colis'];?> €
			</td>
<?php if ($jourSelectionne==date("z")+1) { ?>
			<td <?php if ($colis['dette_magasin']>0) { echo 'class="alerteMontant"'; } ?>>
				<?php echo $colis['dette_magasin'];?> €
			</td>
<?php } ?>
			<td width=20>
<?php
				if($colis['nouveauColis'] == true)
				{
?>
				<a href='districoliSignales.php?module=1<?php echo ('&reference=' . $colis['ref'] . '&nbracharge=' . $colis['nbracharge'] . '&sem1=' . $colis['sem1'] . '&sem2=' . $colis['sem2'] . '&sem3=' . $colis['sem3'] . '&sem4=' . $colis['sem4'] . '&solde_colis=' . $colis['solde_colis'] . '&jourSelectionne=' . $jourSelectionne . '&montantColis=' . $montantColis . '&dettesMagasinActuelles=' . $colis['dette_magasin']);?>'>
					<img src='../images/inserer.jpg' width=20 height=20 title='Créer colis'/>
				</a>
<?php
				} 
?>
			</td>

				
			<td width=20>
<?php				
				if ($colis['nouveauColis'] == true)
				{
					$moduleSuppression = 5;
					$titreSuppression = 'Supprimer signalement';
				}
				else
				{
					$moduleSuppression = 2;
					$titreSuppression = 'Supprimer colis';
				}
?>
				<a href='districoliSignales.php?module=<?php echo ($moduleSuppression . '&referenceColis=' . $colis['identifiant'] . '&jourSelectionne=' . $jourSelectionne . '&reference=' . $colis['ref']);?>'>
					<img src='../images/supprimer.jpg' width=20 height=20 title='<?php echo ($titreSuppression)?>'/>
				</a>
			</td>
				
				
			<td width=20>
<?php				
				if ($colis['nouveauColis'] == false)
				{
?>
				<a href='districoliSignales.php?module=3&referenceColis=<?php echo ($colis['identifiant'] . '&jourSelectionne=' . $jourSelectionne . '&reference=' . $colis['ref']);?>'>
					<img src='../images/editer.jpg' width=20 height=20 title='Modifier colis'/>
				</a>
<?php			} ?>
			</td>
			
			
			<td width=20>
<?php				
				if ($colis['nouveauColis'] == false)
				{
?>
				<a href='districoliSignales.php?module=4&referenceColis=<?php echo $colis['identifiant'];?>&jourSelectionne=<?php echo ($jourSelectionne . '&reference=' . $colis['ref']);?>'>
					<img src='../images/mail.png' width=20 height=20 title='Commentaire colis'/>
				</a>
<?php		} ?>
			</td>
		</tr>
<?php
		unset($bgcolor);
		// Aggregation de données pour affichage de statistiques
		if ($colis['nouveauColis'] == false)
		{
			// Enregistrer également les secondes du passage de la personne
			$dateSignalement = strtotime($colis['datesignalement']);
			$dateSignalementSansSeconde = $dateSignalement - $dateSignalement % 60;
			$attenteMoyenne = abs(strtotime($colis['datepassage']) - $dateSignalementSansSeconde);
			$nbColisDistribues += 1;
			$nbPersonnesServices += $colis['nbracharge'];
			$montantRecuColis += $colis['montantpaye'];
			$balanceColis += $colis['solde_colis'];
		}
		$creanceMagasin += $colis['dette_magasin'];
	}
?>
		<tfoot>
			<tr>
				<th>Attente<br/>moyenne</th>
				<th></th>
				<th>Nb. colis<br/>distribués</th>
				<th>Nb. personnes<br/>servies</th>
				<th colspan=4></th>
				<th>Montant reçu<br/>colis</th>
				<th>Balance colis</th>
<?php if ($jourSelectionne==date("z")+1) { ?>
				<th>Créance magasin</th>
<?php } ?>
				<th colspan=4></th>
			</tr>
			<tr>
				<th>
					<?php if ($nbColisDistribues <> 0) {
						echo date('i\m s\s', $attenteMoyenne/$nbColisDistribues);
					} else {
						echo 0;
					}
					?>
				</th>
				<th></th>
				<th><?php echo $nbColisDistribues; ?></th>
				<th><?php echo $nbPersonnesServices; ?></th>
				<th colspan=4></th>
				<th><?php echo $montantRecuColis; ?> €</th>
				<th><?php echo $balanceColis; ?> €</th>
<?php if ($jourSelectionne==date("z")+1) { ?>
				<th><?php echo $creanceMagasin; ?> €</th>
<?php } ?>
				<th colspan=4></th>
			</tr>
		</tfoot>
	</table>
</div>

<?php
include_once("../footer.php");
?>