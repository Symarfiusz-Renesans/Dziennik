<?php

	include	'check.php';

	$idS;
	$n = "SELECT * FROM szkolyIIchDyrektorzy WHERE idDyrektora = ".$_COOKIE['uzytkownik'];

	$resultN = sqlsrv_query($polaczenie, $n);

	while( $row = sqlsrv_fetch_array( $resultN, SQLSRV_FETCH_ASSOC) ) {
		$idS = $row['idSzkoly'];
	}

	$query = 'EXEC dodajNauczyciela
	@idSzkoly = '.$idS.',
	@imie = "'.$_POST['imie'].'",
	@nazwisko = "'.$_POST['nazw'].'",
	@wyksztalcenie = '.$_POST['wyksztalcenie'].',

	@haslo = "'.$_POST['haslo'].'"';

	sqlsrv_query($polaczenie, $query);

	header("Location:..dziennik.php");

?>