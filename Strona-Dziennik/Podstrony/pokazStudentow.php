<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pokaż Studentów</title>
</head>
<body>

	<?php
		include 'czyZalogowany.php';
		include 'check.php';

		$funWDS = 'SELECT * FROM wyswietlWszystkichStudentow() WHERE idSzkoly ='.$_GET['szkola'];

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		
		echo '<table><tr><th><b>Student</b></th><th><b>Rok</b></th><th><b>Stopien</b></th></tr>';

		while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
			echo '<tr><td>'.$row['imie'].' '.$row['nazwisko'].'</td><td>'.$row['rokStudiow'].'</td><td>'.$row['stopienStudiow'].'</td></tr>';
		}

		echo '</table>';
	?>

	<a href="dziennik.php">Anuluj</a>

</body>
</html>