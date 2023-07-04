<?php

	include	'check.php';

	$query = 'EXEC dodajNauczyciela
	@idSzkoly = '.$_GET['szkola'].',
	@imie = "'.$_POST['imie'].'",
	@nazwisko = "'.$_POST['nazw'].'",
	@wyksztalcenie = '.$_POST['wyksztalcenie'];

	echo $query;

	if (sqlsrv_query($polaczenie, $query) === false) {
		$error = sqlsrv_errors();
		foreach( $error as $e ) {
			setcookie("error", $e["message"], time()+60, "/");
        }
        echo $_COOKIE['error'];

        
	} else {
		setcookie("error", "Pomyślnie zatrudniono nauczyciela!", time()+60, "/");
	}

	header("Location:../Podstrony/zatrudnijNauczyciela.php?szkola=".$_GET['szkola']);

?>