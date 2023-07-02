<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=	, initial-scale=1.0">
	<title>Wstaw ocene</title>
</head>
<body>
	
	<?php
		include '../czystyPHP/check.php';
		include '../czystyPHP/czyZalogowany.php';

		$wybierzUzytkownika = 'SELECT * FROM tytuly';
		$result = sqlsrv_query($polaczenie ,$wybierzUzytkownika);
		echo '<form action="WDBzatrudnijNauczyciela.php" method="POST"><p>Imię</p><input type="text" name="imie" max=20><p>Nazwisko</p><input type="text" name="nazw" max=20><p>Wykształcenie</p><select name="wyksztalcenie"> ';
		while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['idTytulu'].'">';
			
		    echo $row['tytul'].'</option>';
		}
		echo '</select><p>haslo</p><input type="password" name="haslo" max=50>';
	?>

	</select><br><br><button>Potwierdź</button></form>
	<a href="dziennik.php">Anuluj</a>

</body>
</html>