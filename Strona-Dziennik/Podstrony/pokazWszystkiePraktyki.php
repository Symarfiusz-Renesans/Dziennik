<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Praktyki</title>
	<link rel="stylesheet" href="../style/stylDoTabel.css">
</head>
<body>

<main >
	<div id="okno">
		<header class="flexBox">
			<h1>Twoje Praktyki!</h1>
		</header>
		<div>
	<?php

		include '../czystyPHP/check.php';
		include '../czystyPHP/czyZalogowany.php';

		$idZ;

		$funWDN = 'SELECT * FROM zatrudnienieNauczycieli WHERE idNauczyciela = '.$_COOKIE['id'];
		$rezultat =sqlsrv_query($polaczenie, $funWDN);
		while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
			$idZ = $row["idZatrudnienia"];
		}

		$funWDP = "SELECT * FROM studenciIIchPraktyki WHERE Id_zatrudn_naucz = ".$idZ;
		$wyliczRezultat = sqlsrv_query($polaczenie, $funWDP, array(), array( "Scrollable" => SQLSRV_CURSOR_KEYSET ));
		$wyliczRezultat = sqlsrv_num_rows($wyliczRezultat);
		$rezultat =sqlsrv_query($polaczenie, $funWDP);
		
		if ($wyliczRezultat != false) {

			echo '<table><tr><th>Rok</th><th>Klasa</th><th>Student</th><th>Typ praktyk</th></tr>';
			while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){

				echo '<tr><td>'.$row['rokPraktyk'].'</td><td>'.$row['klasa'].'</td><td>'.$row["imie"].' '.$row['nazwisko'].'</td><td>'.$row['nazwaTypuPraktyk'].'</td></tr>';	

			}
			echo "</table>";
		} else {
			echo "<h2 style='color: black'>Wygląda na to, że Twoi Studenci jeszcze nie mieli praktyk!</h2>";
		}

	?>
		</div>
	</div>
</main>	