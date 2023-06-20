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

		$funWDS = 'SELECT * FROM firmyIIchSpecjalizacje';

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		
		echo '<table><tr><th><b>Nazwa</b></th><th><b>Specjalizacja</b></th><th><b>Limit Praktyk</b></th></tr>';

		while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
			echo '<tr><td>'.$row['nazwa'].'</td><td>'.$row['nazwaSpecjalizacji'].'</td><td>'.$row['limitPraktykantow'].'</td></tr>';
		}

		echo '</table>';

	?>

	<a href="dziennik.php">Anuluj</a>

</body>
</html>