<?php

	include	'check.php';

	$query = 'EXEC dodajOcene @indeks = '.$_POST['uczen'].', @przedmiot = '.$_POST['przedmiot'].', @ocena = '.$_POST['ocena'];

	if (sqlsrv_query($polaczenie, $query) === false) {
		$error = sqlsrv_errors();
		foreach( $error as $e ) {
			setcookie("error", $e["message"], time()+60, "/");
        }
        echo $_COOKIE['error'];

        
	} else {
		setcookie("error", "Pomyślnie dodano ocenę!", time()+60, "/");
	}

	header("Location:../Podstrony/wstawOcene.php?szkola=".$_GET['szkola']."");


?>