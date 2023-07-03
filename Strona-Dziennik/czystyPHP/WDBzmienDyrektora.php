<?php

	include	'check.php';

	$query = "EXEC zmienDyrektora
	@idD =".$_COOKIE['id'].",
	@imie = '".$_POST['imie']."',
	@nazwisko = '".$_POST['nazw']."',
	@wyksztalcenie = ".$_POST['wyksztalcenie'].",
	@haslo = '".$_POST['haslo']."'";

	echo $query;



	if (sqlsrv_query($polaczenie, $query) === false) {
		$error = sqlsrv_errors();
		foreach( $error as $e ) {
			setcookie("error", $e["message"], time()+60, "/");
        }
        echo $_COOKIE['error'];

        
	} else {
		setcookie("error", "Zamiana Dyrektorów nastąpiła pomyślnie! Prosimy o odświeżenie strony!", time()+60, "/");
	}

	header("Location:../Podstrony/zmienDyrektora.php");

?>