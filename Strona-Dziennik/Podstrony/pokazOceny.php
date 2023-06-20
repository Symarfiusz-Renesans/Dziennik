<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Oceny</title>
</head>
<body>

	<?php

		include 'check.php';
		include 'czyZalogowany.php';

	?>



	<?php

		$funWWP = "SELECT * FROM Przedmioty";
		$resultWWP = sqlsrv_query($polaczenie, $funWWP);
		echo '<table><tr><th>Przedmiot</th><th>Oceny</th></tr>';

		while($row = sqlsrv_fetch_array( $resultWWP, SQLSRV_FETCH_ASSOC)){
			echo'<tr><td>'.$row['Przedmiot'].'</td><td>';

			$funODS = "SELECT * FROM ocenyDanegoStudenta(".$_COOKIE['uzytkownik'].") ORDER BY idPrzedmiotu";
			$resultODS = sqlsrv_query($polaczenie, $funODS);

			while( $subRow = sqlsrv_fetch_array( $resultODS, SQLSRV_FETCH_ASSOC) ) {
				if($row['idPrzedmiotu'] == $subRow['idPrzedmiotu']){
					echo $subRow['ocena'].', ';
				}
			}

			echo'</td></tr>';
		}

		echo '</table>';

		echo '<a href="dziennik.php">Wróć</a>	';

	?>

	<a href="dziennik.php">Anuluj</a>		
	
</body>
</html>