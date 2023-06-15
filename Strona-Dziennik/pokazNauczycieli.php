<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Nauczyciele</title>
</head>
<body>
	
	<?php

		include 'czyZalogowany.php';
		include 'check.php';

		$funWDS = 'SELECT * FROM wyswietlWszystkichNauczycieli() WHERE idSzkoly ='.$_GET['szkola'];

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		
		echo '<table><tr><th><b>Nauczyciel</b></th></tr>';

		while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
			echo '<tr><td>'.$row['skrot'].' '.$row['imie'].' '.$row['nazwisko'].'</td></tr>';
		}

		echo '</table>';

	?>

	<a href="dziennik.php">Anuluj</a>

</body>
</html>