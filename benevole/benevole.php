<?php

include_once("../index.php");

//initialisation de certaines variables

$base=ouvrebase();
$module=0;$reference=0;$depart=0;$nomc='';$prenomc='';

//laisser les valeurs dans le champs une fois la page reload
if (isset($_GET['module'])) {$module=$_GET['module'];}
if (isset($_GET['reference'])) {$reference=$_GET['reference'];}
if (isset($_GET['nomc'])) {$nomc=$_GET['nomc'];}
if (isset($_GET['prenomc'])) {$prenomc=$_GET['prenomc'];}

// critères de recherches
?>
<!-- Ceci est un commentaire pur HTML, tout comme le code ci-dessous. -->
<!-- Recherche -->
<div class='bloclarge'>
	<form name='recherche' method='GET' action='benevole.php'>

		<table>
			<tr>
				
				<td>
					<label>Prénom : </label>
					<input type='text' name='prenomc' value='<?php echo "$prenomc"?>'/>
					<label>Nom : </label>
					<input type='text' name='nomc' value='<?php echo "$nomc"?>'/>
				</td>

				<input type='hidden' name='module' value=0/>
				
				<input type='hidden' name='reference' value=0/>

				<td>
					<input type='submit' value='Recherche'/>
				</td>
			</tr>
		</table>
		
	</form>
</div>

<div>
	<!-- afficher le tableau -->
	<div class='blocgauche'>
	<div align='center'>
		Ajouter un benevole :
		<a href='benevole.php?module=2'>
			<img src='../images/inserer.jpg' width=20 height=20 title='Inserer une fiche benevole'/>
		</a>
	</div>
		<table border=1 align='center' style='font-size:1.2em;'>
			<tr>
				<th>Prénom</th>
				<th>Nom</th>
				<th>Téléphone</th>
				<th>Adresse</th>
				<th>Secteur</th>
				<th colspan=2>Actions</th>
			</tr>

<?php

$sql="select * from benevoles";

//classement et nombre dans la requête sql
If ($nomc<>"")
{
	$sql=$sql." where benevoles.nom like \"".$nomc."%\"" ;
}

If ($prenomc<>"")
{
	If (stristr($sql, 'where') == false){
		$sql=$sql." where "; 
	}
	else {
		$sql=$sql." and ";
	}
	$sql=$sql."benevoles.prenom like  \"".$prenomc."%\"" ;
}
$sql=$sql." order by nom asc limit 20 offset ".$depart;
$resultat=$base->query($sql);

// affichage ligne par ligne



while ($chaine=$resultat->fetch())
	
	{
?>
			
			<tr <?php if ($chaine['ref']==$reference) {echo 'bgcolor="#78A9D4"';}?> >
				<td><?php echo $chaine['prenom'];?></td>
				<td><?php echo $chaine['nom'];?></td>
				<td><?php echo $chaine['tel'];?></td>
				<td><?php echo $chaine['adresse'];?></td>
				<td><?php 
					switch ($chaine['secteur']) {
						case 1:
							echo "President";
							break;
						case 2:
							echo "Distribution";
							break;
						case 3:
							echo "Caisse";
							break;
						case 4:
							echo "Magasin";
							break;
						default:
							echo "?";
					}?></td>
				<td>
					<a href='benevole.php?module=1&reference=<?php echo $chaine['ref'];?>'>
						<img src='../images/editer.jpg' width=20 height=20 title='Modifier la fiche benevoles'/>
					</a>
				</td>
				<td>
					<a href='benevole.php?module=3&reference=<?php echo $chaine['ref'];?>'>
						<img src='../images/supprimer.jpg' width=20 height=20 title='Supprimer la fiche benevoles'/>
					</a>
				</td>
			</tr>
<?php
	}
?>
		</table>
	</div>


<?php
$nom='';$prenom='';$tel='';$adresse='';$secteur='';$mail='';$mdp='';

	//si modifier ou supprimer fiche récupérer les valeurs
	
	if(($module==1 or $module==3) and $reference<>0)	
		{
			
		$sql2="select * from benevoles where ref=".$reference;
		$resultat2=$base->query($sql2);
		$chaine2=$resultat2->fetch();
		$nom=$chaine2['nom'];
		$prenom=$chaine2['prenom'];
		$tel=$chaine2['tel'];
		$adresse=$chaine2['adresse'];
		$secteur=$chaine2['secteur'];
		$mail=$chaine2['mail'];
		}

if ($module<>0){
?>

<!-- afficher le formulaire -->
	<div class='blocdroite'>
		<form name='fiche' action='enregistrer.php' enctype='multipart/form-data' method='POST'>
			<table>
				<tr>
					<td>Prénom : </td>
					<td>
						<input type='text' name='prenom' value='<?php echo $prenom;?>' />
					</td>
					<td>Nom : </td>
					<td>
						<input type='text' name='nom' value='<?php echo $nom;?>' required />
					</td>
				</tr>
				<tr>
					<td>Adresse</td>
					<td colspan=4>
						<input type='text' size=53 name='adresse' value='<?php echo $adresse;?>'/>
					</td>
				</tr>
				<tr>
					<td>Téléphone</td>
					<td>
						<input type='text'  name='tel' value='<?php echo $tel;?>'/>
					</td>
					<td>Secteur</td>
					<td>
						<SELECT name="secteur" size="1">
							<OPTION value="1" <?php if($secteur==1){ echo "selected";} ?>> President
							<OPTION value="2" <?php if($secteur==2){ echo "selected";} ?>> Distribution 
							<OPTION value="3" <?php if($secteur==3){ echo "selected";} ?>> Caisse
							<OPTION value="4" <?php if($secteur==4){ echo "selected";} ?>> Magasin
						</SELECT>
					</td>			
				</tr>
				<tr>
					<td>E-Mail</td>
					<td>
						<input type='text' name='mail' value='<?php echo $mail;?>' required />
					</td>
				</tr>
				<tr>
					<td>Mot de passe</td>
					<td>
						<input type='password' name='mdp' value='<?php echo $mdp;?>' <?php if ($module==2) {echo "required";} ?>/>
					</td>
				</tr>
				<tr>
					<td>
						<input type='hidden' name='module' value='<?php echo $module;?>'/>
					</td>
				</tr>
				<tr>
					<td>
						<input type='hidden' name='reference' value='<?php echo $reference;?>'/>
					</td>
				</tr>
<?php
// je change la valeur du submit en fonction de la variable module
if ($module==1){echo "<tr><td colspan=3><input type='submit' value='Enregistrer les modification'></td></tr>";}	
if ($module==2){echo "<tr><td colspan=3><input type='submit' value='Ajouter la fiche'></td></tr>";}	
if ($module==3){echo "<tr><td colspan=3><input type='submit' value='Confirmer la suppression de la fiche'></td></tr>";}	
?>

			</table>
		</form>
		
	</div>
</div>

<?php
} 


?>