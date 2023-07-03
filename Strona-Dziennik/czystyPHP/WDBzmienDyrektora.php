<?php

	include	'check.php';

	$query = 'EXEC zmienDyrektora
	@idD ='.$_COOKIE['uzytkownik'].',
	@imie = "'.$_POST['imie'].'",
	@nazwisko = "'.$_POST['nazw'].'",
	@wyksztalcenie = '.$_POST['wyksztalcenie'].',
	@haslo = "'.$_POST['haslo'].'"';



	if (sqlsrv_query($polaczenie, $query) === false) {
		$error = sqlsrv_errors();
		foreach( $error as $e ) {
			setcookie("error", $e["message"], time()+60, "/");
        }
        echo $_COOKIE['error'];

        
	}

	#header("Location:../Podstrony/zmienDyrektora.php");

?>