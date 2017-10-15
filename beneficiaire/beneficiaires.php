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
	<form name='recherche' method='GET' action='beneficiaires.php'>

		<table>
			<tr>
				
				<td>
					<label>nom</label>
					<input type='text' name='nomc' value='<?php echo "$nomc"?>'/>
					<label>prenom</label>
					<input type='text' name='prenomc' value='<?php echo "$prenomc"?>'/>
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
		Ajouter un beneficiaire :
		<a href='beneficiaires.php?module=2'>
			<img src='../images/inserer.jpg' width=20 height=20 title='Inserer une fiche beneficiaire'/>
		</a>
	</div>
		<table border=1 align='center' style='font-size:1.2em;'>
			<tr>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Téléphone</th>
				<th>Adresse</th>
				<th>Personne a charge</th>
				<th colspan=2>Actions</th>
			</tr>

<?php

$sql="select * from beneficiaires";

//classement et nombre dans la requête sql
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
$sql=$sql." order by nom asc limit 20 offset ".$depart;
$resultat=$base->query($sql);

// affichage ligne par ligne



while ($chaine=$resultat->fetch())
	
	{
?>
			
			<tr>
				<td><?php echo $chaine['nom'];?></td>
				<td><?php echo $chaine['prenom'];?></td>
				<td><?php echo $chaine['tel'];?></td>
				<td><?php echo $chaine['adresse'];?></td>
				<td><?php echo $chaine['nbracharge'];?></td>
				<td>
					<a href='beneficiaires.php?module=1&reference=<?php echo $chaine['ref'];?>'>
						<img src='../images/editer.jpg' width=20 height=20 title='Modifier la fiche beneficiaires'/>
					</a>
				</td>
				<td>
					<a href='beneficiaires.php?module=3&reference=<?php echo $chaine['ref'];?>'>
						<img src='../images/supprimer.jpg' width=20 height=20 title='Supprimer la fiche beneficiaires'/>
					</a>
				</td>
			</tr>
<?php
	}
?>
		</table>
	</div>


<?php
$nom='';$prenom='';$tel='';$adresse='';$nbracharge='';$solde='';$sem1='';$sem2='';$sem3='';$sem4='';$jourPassage='';$heurePassage='';$minutePassage='';

	//si modifier ou supprimer fiche récupérer les valeurs
	
	if(($module==1 or $module==3) and $reference<>0)	
		{
			
		$sql2="select * from beneficiaires where ref=".$reference;
		$resultat2=$base->query($sql2);
		$chaine2=$resultat2->fetch();
		$nom=$chaine2['nom'];
		$prenom=$chaine2['prenom'];
		$tel=$chaine2['tel'];
		$adresse=$chaine2['adresse'];
		$nbracharge=$chaine2['nbracharge'];
		$solde=$chaine2['solde'];
		$sem1=$chaine2['sem1'];
		$sem2=$chaine2['sem2'];
		$sem3=$chaine2['sem3'];
		$sem4=$chaine2['sem4'];
		$jourPassage=$chaine2['jourpassage'];
		$heurePassage=date('H',strtotime($chaine2['heurepassage']));
		$minutePassage=date('i',strtotime($chaine2['heurepassage']));
		}

if ($module<>0){
?>

<!-- afficher le formulaire -->
	<div class='blocdroite'>
		<form name='fiche' action='enregistrer.php' enctype='multipart/form-data' method='POST'>
			<table>
				<tr>
					<td>Nom</td>
					<td>
						<input type='text' name='nom' value='<?php echo $nom;?>' required />
					</td>
					<td>Prénom</td>
					<td>
						<input type='text' name='prenom' value='<?php echo $prenom;?>' />
					</td>
					<td rowspan=6 colspan=3></td>
					<tr>
						<td>Adresse</td>
						<td colspan=4>
							<input type='text' size=60 name='adresse' value='<?php echo $adresse;?>'/>
						</td>
					</tr>
					<tr>
						<td>Personne a charge</td>
						<td>
							<input type='text'  name='nbracharge' value='<?php echo $nbracharge;?>'/>
						</td>
						<td>Téléphone</td>
						<td>
							<input type='text'  name='tel' value='<?php echo $tel;?>'/>
						</td>
					</tr>
					<td>solde</td>
					<td>
						<input type='text'  name='solde' value='<?php echo $solde;?>'/>
					</td>				
					<td>Semaine présence</td> 
					<td> 
						<input type='checkbox' name='sem1' <?php if($sem1==1){ echo "checked";}   ?>/>
						<input type='checkbox' name='sem2' <?php if($sem2==1){ echo "checked";}  ?>/>
						<input type='checkbox' name='sem3' <?php if($sem3==1){ echo "checked";} ?>/>
						<input type='checkbox' name='sem4' <?php if($sem4==1){ echo "checked";}  ?>/>
					</td>
				</tr>
				<tr>
					<td>Jour passage</td>
					<td>
						<SELECT name="jourPassage" size="1">
							<OPTION value="2" <?php if($jourPassage==2){ echo "selected";} ?>> mardi
							<OPTION value="3" <?php if($jourPassage==3){ echo "selected";} ?>> mercredi
							<OPTION value="4" <?php if($jourPassage==4){ echo "selected";} ?>> jeudi
							<OPTION value="5" <?php if($jourPassage==5){ echo "selected";} ?>> vendredi
						</SELECT>
					</td>
					
					<td>Heure passage</td>
					<td>
						<SELECT name="heurePassage" size="1">
							<OPTION  <?php if($heurePassage==9){ echo "selected";} ?>> 9
							<OPTION  <?php if($heurePassage==10){ echo "selected";} ?>> 10
							<OPTION  <?php if($heurePassage==11){ echo "selected";} ?>> 11
							<OPTION  <?php if($heurePassage==12){ echo "selected";} ?>> 12
							<OPTION  <?php if($heurePassage==13){ echo "selected";} ?>> 13
							<OPTION  <?php if($heurePassage==14){ echo "selected";} ?>> 14
							<OPTION  <?php if($heurePassage==15){ echo "selected";} ?>> 15
							<OPTION  <?php if($heurePassage==16){ echo "selected";} ?>> 16
							<OPTION  <?php if($heurePassage==17){ echo "selected";} ?>> 17
						</SELECT>
						H
						<SELECT name="minutePassage" size="1">
							<OPTION  <?php if($minutePassage==0){ echo "selected";} ?>> 00
							<OPTION  <?php if($minutePassage==15){ echo "selected";} ?>> 15
							<OPTION  <?php if($minutePassage==30){ echo "selected";} ?>> 30
							<OPTION  <?php if($minutePassage==45){ echo "selected";} ?>> 45
						</SELECT>
						M
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