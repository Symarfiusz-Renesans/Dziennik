<?php

	include	'check.php';

	$query = 'EXEC dodajStudenta
	@idSzkoly ='.$_GET['szkola'].',
	@imie ="'.$_POST['imie'].'",
	@nazwisko ="'.$_POST['nazw'].'"';

	sqlsrv_query($polaczenie, $query);

	if (sqlsrv_query($polaczenie, $query) === false) {
		$error = sqlsrv_errors();
		foreach( $error as $e ) {
			setcookie("error", $e["message"], time()+60, "/");
        }
        echo $_COOKIE['error'];

        
	} else {
		setcookie("error", "Pomyślnie dodano Studenta!", time()+60, "/");
	}

	echo $query;

	#header("Location:../Podstrony/dodajStudenta.php?szkola=".$_GET['szkola']);
		

?>