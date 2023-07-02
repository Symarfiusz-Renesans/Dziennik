<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Wstaw ocene</title>
	<link rel="stylesheet" href="../style/stylDoTabel.css">
</head>
<body>
	
<main >
	<div id="okno">
		<header class="flexBox">
			<h1>Twoja Szkoła!</h1>
		</header>
		<div>

	<?php
		include '../czystyPHP/check.php';
		include '../czystyPHP/czyZalogowany.php';

		$wybierzDaneOSzkole = 'SELECT * FROM dbo.szkolyIIchdyrektorzy WHERE idSzkoly = '.$_GET['szkola'];

		$result = sqlsrv_query($polaczenie ,$wybierzDaneOSzkole);
		echo '<table><tr><th>Nazwa</th><th>Typ szkoły</th><th>Dyrektor</th><th>Miasto</th><th>Ulica</th></tr>';
		while($row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC)){
			echo'<tr><td>'.$row['nazwa'].'</td><td>'.$row['Expr3'].'</td><td>'.$row['skrot'].' '.$row['imie'].' '.$row['nazwisko'].'</td><td>'.$row['miejscowosc'].'</td><td>'.$row['ulica'].'</td></tr>';
		}
	?>

		</div>
	</div>
</main>

</body>
</html>