<?php

include_once("../index.php");

//initialisation de certaines variables
$d=$_GET['dt'];
$base=ouvrebase();
?>

<div class="bloclarge">
	<h1>Detail de la date : <?php echo $d;?></h1>
	<?php
		$sql="select * from agenda where dt='$d'";
		$req=$base->query($sql);
		$dataArray=$req->fetchAll();
		if(empty($dataArray))
			echo "Aucune information pour cette date";
		else
			for($i=0; $i < count($dataArray); $i=$i+1)
			{
				$data=$dataArray[$i];
	?>
			<table >
			<tr height="50px"><td width="150px"><strong>Evenement</strong></td><td><?php echo $data['event'];?></td></tr>
			<tr height="50px"><td><strong>Lieu</strong></td><td><?php echo $data['lieu'];?></td></tr>
			</table>
	<?php
			}
	?>
</div>
<?php
include_once("../footer.php");
?>
