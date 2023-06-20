<?php

	include	'check.php';

	$query = 'EXEC dodajOcene @indeks = '.$_POST['uczen'].', @przedmiot = '.$_POST['przedmiot'].', @ocena = '.$_POST['ocena'];

	sqlsrv_query($polaczenie, $query);

	header("Location:..dziennik.php");

?>