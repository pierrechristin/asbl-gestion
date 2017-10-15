<html>

<head>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<script src="../ckeditor/ckeditor.js"></script>
    <title>Aide alimentaire</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
	 <link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/tfe/css/stylelavande.css" />
	 <link rel="stylesheet" href="http://<?php echo $_SERVER['HTTP_HOST'] ?>/tfe/agenda/style.css" type="text/css" />
	
</head>
<body>
	<div class='entete'>
	<img src="http://<?php echo $_SERVER['HTTP_HOST'] ?>/tfe/images/loup.jpg" /> 
	</div>
	<div class='bloclarge' align='center'>
		<form method="post" action="verif.php">
			<p>Votre E-Mail :
			<input type="text" name="mail">
			votre mot de passe :
			<input type="password" name="mdp">
			</p>
			<input type="submit" value="Connexion">
		</form>
	</div>
	</div>
</body>
</html>


