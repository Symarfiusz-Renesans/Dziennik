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
		$rezultat = sqlsrv_query($polaczenie, $funWDP, array(), array( "Scrollable" => 'static' ));

		echo $rezultat;

		echo sqlsrv_num_rows( $rezultat );

		echo $funWDP;
		if ( is_numeric( sqlsrv_num_rows( $rezultat ))) {
			while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
				$idOp;
				$idFi;
				$idSp;

				$funWDO = "SELECT * FROM opiekuniIIchWyksztalcenie WHERE idOpiekuna = ".$row['id_zatrudn_naucz'];
				$subRezultat = sqlsrv_query($polaczenie ,$funWDO);
				while($subRow = sqlsrv_fetch_array($subRezultat, SQLSRV_FETCH_ASSOC)){
					$idOp = $subRow['skrot']." ".$subRow['imie']." ".$subRow['nazwisko'];
				}

				$funWDF = "SELECT * FROM firmyIIchSpecjalizacje WHERE idFirmy = ".$row['idFirmy'].";";
				$subRezultat = sqlsrv_query($polaczenie, $funWDF);
				while($subRow = sqlsrv_fetch_array($subRezultat, SQLSRV_FETCH_ASSOC)){
					$idFi = $subRow['nazwa'];
					$idSp = $subRow['nazwaSpecjalizacji'];
				}

				echo '<h2>Typ praktyk: '.$row['nazwaTypuPraktyk'].'</h2>';
				echo '<h2>Firma: '.$idFi.'</h2>';
				echo '<h2>Specjalizacja: '.$idSp.'</h2>';
				echo '<h2>Opiekun: '.$idOp.'</h2>';
			}			
		} else {
			echo "<h2>Wygląda na to, że jeszcze nie miałeś/łaś praktyk!</h2>";
		}

	?>
		</div>
	</div>
</main>	
	
</body>
</html>