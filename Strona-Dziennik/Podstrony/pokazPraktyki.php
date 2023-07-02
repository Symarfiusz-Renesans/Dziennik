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

		$funWDP = "SELECT * FROM pokazDanaPraktyke(".$_COOKIE['id'].")";
		$wyliczRezultat = sqlsrv_query($polaczenie, $funWDP, array(), array( "Scrollable" => SQLSRV_CURSOR_KEYSET ));
		$wyliczRezultat = sqlsrv_num_rows($wyliczRezultat);
		$rezultat =sqlsrv_query($polaczenie, $funWDP);
		
		if ($wyliczRezultat != false) {

			echo '<table><tr><th>Rok</th><th>Klasa</th><th>Opiekun</th><th>Typ praktyk</th></tr>';
			while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
				$idOp;

				$funWDO = "SELECT * FROM opiekuniIIchWyksztalcenie WHERE Idzatrudnienia = ".$row['Id_zatrudn_naucz'];
				$subRezultat = sqlsrv_query($polaczenie ,$funWDO);
				while($subRow = sqlsrv_fetch_array($subRezultat, SQLSRV_FETCH_ASSOC)){
					$idOp = $subRow['skrot']." ".$subRow['imie']." ".$subRow['nazwisko'];
				}

				echo '<tr><td>Rok: '.$row['rokPraktyk'].'</td><td>Klasa: '.$row['klasa'].'</td><td>Opiekun: '.$idOp.'</td><td>Typ praktyk: '.$row['nazwaTypuPraktyk'].'</td></tr>';	
			}
			echo "</table>";
		} else {
			echo "<h2 style='color: black'>Wygląda na to, że jeszcze nie miałeś/łaś praktyk!</h2>";
		}

	?>
		</div>
	</div>
</main>	
	
</body>
</html>