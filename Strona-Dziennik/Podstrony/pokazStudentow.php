<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pokaż Studentów</title>
	<link rel="stylesheet" href="../style/stylDoTabel.css">
</head>
<body>

<main >
	<div id="okno">
		<header class="flexBox">
			<h1>Studenci</h1>
		</header>
		<div>

	<?php
		include '../czystyPHP/czyZalogowany.php';
		include '../czystyPHP/check.php';

		$funWDS = 'SELECT * FROM wyswietlWszystkichStudentow() WHERE idSzkoly ='.$_GET['szkola'];

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		
		echo '<table><tr><th><b>Imię i nazwisko</b></th><th><b>Rok</b></th><th><b>Szkoła</b></th></tr>';

		while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
			echo '<tr><td>'.$row['imie'].' '.$row['nazwisko'].'</td><td>'.$row['klasa'].'</td><td>'.$row['nazwa'].'</td></tr>';
		}

		echo '</table>';
	?>
		</div>
	</div>
</main>


</body>
</html>