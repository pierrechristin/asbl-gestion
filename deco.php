<?php
include('validation.php');
session_destroy();
$page='Location: ./index.php';
header ($page);
?>
<?php
include_once("../footer.php");
?>