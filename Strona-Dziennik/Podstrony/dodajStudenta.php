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

		$funWDS = 'SELECT * FROM wyswietlWszystkichNauczycieli() WHERE idSzkoly ='.$_GET['szkola'];

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		echo '<h3>Dane Podstatawowe</h3><form action="WDBdodajStudenta.php" method="POST"><p>Imię</p><input type="text" name="imie" max=20><p>Nazwisko</p><input type="text" name="nazw" max=20><p>Stopień Studiów</p><input type="number" name="stop" min=1 max=3><select name="wych">';
		while( $row = sqlsrv_fetch_array( $rezultat, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['idNaucz'].'">';
			
		    echo $row['skrot'].' '.$row['imie'].' '.$row['nazwisko'].'</option>';
		}
		echo '</select><h3>Praktyki</h3><p>Firma</p>';

		$funWDS = 'SELECT * FROM Firmy';

		$rezultat = sqlsrv_query($polaczenie, $funWDS);

		echo '<select name="firm">';
		while( $row = sqlsrv_fetch_array( $rezultat, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['idFirmy'].'">';
			
		    echo $row['nazwa'].'</option>';
		}
		echo '</select><p>Opiekun</p><select name="opie">';

		$funWDS = 'SELECT * FROM opiekuniIIchWyksztalcenie';

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		
		while( $row = sqlsrv_fetch_array( $rezultat, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['idOpiekuna'].'">';
			
		    echo $row['skrot'].' '.$row['imie'].' '.$row['nazwisko'].'</option>';
		}

		echo '</select><p>Typ praktyk</p><select name="typ">';

		$funWDS = 'SELECT * FROM typyPraktyk';

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		
		while( $row = sqlsrv_fetch_array( $rezultat, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['IdTypuPraktyk'].'">'.$row['nazwaTypuPraktyk'].'</option>';
		}

		echo '</select><h3>Inne</h3><p>haslo</p><input type="password" name="haslo" max=50>';
	?>

	</select><br><br><button>Potwierdź</button></form>
	<a href="dziennik.php">Anuluj</a>

</body>
</html>