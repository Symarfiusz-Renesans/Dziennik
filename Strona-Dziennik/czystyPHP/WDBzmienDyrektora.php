<?php

	include	'check.php';

	$query = 'EXEC zmienDyrektora
	@idD ='.$_COOKIE['uzytkownik'].',
	@imie = "'.$_POST['imie'].'",
	@nazwisko = "'.$_POST['nazw'].'",
	@wyksztalcenie = '.$_POST['wyksztalcenie'].',
	@haslo = "'.$_POST['haslo'].'"';

	sqlsrv_query($polaczenie, $query);

	header("Location:dziennik.php");

?>