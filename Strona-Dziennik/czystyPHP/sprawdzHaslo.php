<?php

	include 'check.php';

	$wybierzUzytkownika = "SELECT * FROM wyswietlHasloUzytkownika('".$_POST["login"]."')";
	$jestWiersz = 0;

	$result = sqlsrv_query($polaczenie, $wybierzUzytkownika);

	while( $wiersz = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
		if($_POST['haslo'] == $wiersz['haslo']){
			setcookie("typUzytkownika", $wiersz["idTypuUzytkownika"], time() + 3600, "/");
			setcookie("uzytkownik", $wiersz["idUzytkownika"], time() + 3600, "/");

			$wybierzId;
			if ($wiersz["idTypuUzytkownika"] == 3) {
   				$wybierzId  = 'SELECT * FROM wyswietlDanegoStudenta('.$wiersz["idUzytkownika"].')';

   				echo $wybierzId;

   				$result = sqlsrv_query($polaczenie, $wybierzId); 
   				while( $subwiersz = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ){
   					setcookie("id", $subwiersz["Indeks"], time() + 3600, "/");
   				} 
   			} else if($wiersz["idTypuUzytkownika"] == 2){
   				$wybierzId  = 'SELECT * FROM wyswietlDanegoNauczyciela('.$wiersz["idUzytkownika"].')';
   				$result = sqlsrv_query($polaczenie, $wybierzId);
				
				while( $subwiersz = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
					setcookie("id", $subwiersz["idNaucz"], time() + 3600, "/");
					setcookie("czyOpiekun", $subwiersz["opiekun"], time() + 3600, "/");
				}
			} else {
				$wybierzId  = 'SELECT * FROM wyswietlDanegoDyrektora('.$wiersz["idUzytkownika"].')';

   				$result = sqlsrv_query($polaczenie, $wybierzId);
				while( $subwiersz = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
					setcookie("id", $subwiersz["idDyrektora"], time() + 3600, "/");
				}
			}

			$jestWiersz++;

			header("Location: ../index.php");
		} else {
			setcookie("error", "Podano nieprawidłowe hasło!", time() + 60, "/");
			header("Location: ../index.php");
		}
	}

	if (!$jestWiersz) {
		setcookie("error", "Podano nieprawidłowy login!", time() + 60, "/");
		header("Location: ../index.php");
	}

?>