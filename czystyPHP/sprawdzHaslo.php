<?php

	include 'check.php';

	$wybierzUzytkownika;

	switch ($_COOKIE['typUzytkownika']) {
		case 1:
			$wybierzUzytkownika = 'SELECT haslo FROM dbo.wyswietlDanegoStudenta('.$_COOKIE['uzytkownik'].')';
			break;
		case 2:
			$wybierzUzytkownika = 'SELECT haslo FROM dbo.wyswietlDanegoNauczyciela('.$_COOKIE['uzytkownik'].')';
			break;
		case 3:
			$wybierzUzytkownika = 'SELECT haslo FROM dbo.wyswietlDanegoDyrektora('.$_COOKIE['uzytkownik'].')';
			break;
	}

	$result = sqlsrv_query($polaczenie, $wybierzUzytkownika);

	while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
			if($_POST['haslo'] == $row['haslo']){
				header("Location:dziennik.php");
			} else {
				setcookie("error", true, time() + 3600, "/");
				header("Location:..index.php");
			}
	}

?>