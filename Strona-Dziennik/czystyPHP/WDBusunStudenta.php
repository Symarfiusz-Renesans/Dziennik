<?php

	include	'check.php';

	$query = 'EXEC usunStudenta @i = '.$_POST['id'];

	if (sqlsrv_query($polaczenie, $query) === false) {
		$error = sqlsrv_errors();
		foreach( $error as $e ) {
			setcookie("error", $e["message"], time()+60, "/");
        }
        echo $_COOKIE['error'];

        
	} else {
		setcookie("error", "Pomyślnie usunięto studenta.", time()+60, "/");
	}


	header("Location:../Podstrony/usunStudenta.php?szkola=".$_GET['szkola']);

?>