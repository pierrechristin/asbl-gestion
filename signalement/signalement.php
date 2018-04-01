<!-- Partie commune aux deux écrans -->
<?php
//j'ouvre la base de donnees
include_once("../index.php");
$base=ouvrebase();

//initialisation de certaines variables
$nomc='';
$prenomc='';
$signalementOK=false;

if (isset($_GET['nomc'])) {$nomc=$_GET['nomc'];}
if (isset($_GET['prenomc'])) {$prenomc=$_GET['prenomc'];}
if (isset($_GET['signalementOK'])) {$signalementOK=true;}
?>


<!-- *************************************************** -->
<!-- Ecran de gauche, qui sera destiné aux bénéficiaires -->
<!-- *************************************************** -->

<div class='bloclarge'>
	<!-- Formulaire de recherche de bénéficiaires -->
	<form name='recherche' method='GET' action='signalement.php'>
		<table>
			<tr>
				<td>
					<div style="float: left;">
						<label>Prénom : </label>
						<input type='text' name='prenomc' value='<?php echo "$prenomc"?>' style="width: 100px"/>
					</div>
					<div style="float: left; margin-left: 15px;">
						<label>Nom : </label>
						<input type='text' name='nomc' value='<?php echo "$nomc"?>' style="width: 100px"/>
					</div>
				</td>
				<td style="float: left; margin-left: 15px;">
					<input type='submit' value='Recherche'/>
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- afficher la liste des bénéficiares -->
<div class='bloclarge'>
	<table border=1 align='center' style='font-size:1.2em;'>
		<tr>
			<th>Prénom</th>
			<th>Nom</th>
			<th>Signaler présence</th>
		</tr>
<?php


//chargement des bénéficiaires
//UNIQUEMENT si une recherche a été faite
if ($nomc<>"" || $prenomc<>"") {
$sql="select * from beneficiaires";

If ($nomc<>"")
{
	$sql=$sql." where beneficiaires.nom like \"".$nomc."%\"" ;
}

If ($prenomc<>"")
{
	If (stristr($sql, 'where') == false){
		$sql=$sql." where "; 
	}
	else {
		$sql=$sql." and ";
	}
	$sql=$sql."beneficiaires.prenom like  \"".$prenomc."%\"" ;
}
$sql=$sql." order by nom asc";
$resultat=$base->query($sql);


// affichage ligne par ligne des bénéficiares récupérés
while ($chaine=$resultat->fetch())
	
	{
?>
		<tr>
			<td><?php echo $chaine['prenom'];?></td>
			<td><?php echo $chaine['nom'];?></td>
			<td align="center">
				<form name='fiche' action='../commun/signalerPresence.php' enctype='multipart/form-data' method='POST'>
					<input type='hidden' name='reference' value='<?php echo $chaine['ref'];?>'/>
					<input class="boutonSignalementPresence" type='submit' value=''/>
				</form>
			</td>
		</tr>
<?php
	}
}

// Si on revient sur l'écran suite au signalement d'un bénéficiaire au sujet de sa présence.
else if ($signalementOK){
?>
		<tr>
			<td colspan=3>
				<p style="text-align: center;">
					Votre présence a bien été signalée.<br/>
					Veuillez patientez, vous allez être appelé(e).
				</p>
			</td>
		</tr>
<?php
}
// S'il n'y a pas eu de recherche de faite, on invite l'utilisateur à en faire une.
else {
?>
		<tr>
			<td colspan=3>
				<p style="text-align: center;">
					Veuillez signaler votre présence<br/>
					en effectuant une recherche par votre nom et/ou prénom<br/>
					puis en cliquant sur la cloche qui apparaîtra ici, face à votre nom.
				</p>
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