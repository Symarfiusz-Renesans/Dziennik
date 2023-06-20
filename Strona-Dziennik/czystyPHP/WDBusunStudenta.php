<?php

	include	'check.php';

	$query = 'EXEC usunStudenta @idS = '.$_POST['id'];

	sqlsrv_query($polaczenie, $query);

	header("Location:..dziennik.php");

?>