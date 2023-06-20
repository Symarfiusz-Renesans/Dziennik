<?php

	include	'check.php';

	$idS;
	$n = "SELECT * FROM szkolyIIchDyrektorzy WHERE idDyrektora = ".$_COOKIE['uzytkownik'];

	$resultN = sqlsrv_query($polaczenie, $n);

	while( $row = sqlsrv_fetch_array( $resultN, SQLSRV_FETCH_ASSOC) ) {
		$idS = $row['idSzkoly'];
	}

	$query = 'EXEC dodajStudenta
	@idSzkoly ='.$idS.',
	@imie ="'.$_POST['imie'].'",
	@nazwisko ="'.$_POST['nazw'].'",
	@stopienSt ='.$_POST['stop'].',
	@rokSt = 1,
	@idTypu = '.$_POST['typ'].',
	@idNaucz = '.$_POST['wych'].',
	@idFirmy ='.$_POST['firm'].',
	@idOpiekuna = '.$_POST['opie'].' ,
	@rok = '.date("Y").',
	@haslo = "'.$_POST['haslo'].'"';

	sqlsrv_query($polaczenie, $query);

	header("Location:..dziennik.php");

		

?>