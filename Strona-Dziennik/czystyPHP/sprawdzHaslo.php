<?php

	include 'check.php';

	$wybierzUzytkownika = "SELECT * FROM wyswietlHasloUzytkownika('".$_POST["login"]."')";

	$result = sqlsrv_query($polaczenie, $wybierzUzytkownika);
	echo var_dump($result);

	if ( is_numeric( sqlsrv_num_rows( $result ))) {
		// code...
	}
		while( $wiersz = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
			if($_POST['haslo'] == $wiersz['haslo']){
				setcookie("typUzytkownika", $wiersz["idTypuUzytkownika"], time() + 3600, "/");
   				setcookie("uzytkownik", $wiersz["idUzytkownika"], time() + 3600, "/");
				header("Location: ../index.php");
			} else {
				setcookie("error", "Podano nieprawidłowe hasło!", time() + 60, "/");
				header("Location: ../index.php");
			}
		}

?>