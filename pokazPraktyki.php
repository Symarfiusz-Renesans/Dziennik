<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Praktyki</title>
</head>
<body>

	<?php

		include 'check.php';
		include 'czyZalogowany.php';

		$funWDP = "SELECT * FROM pokazDanaPraktyke(".$_COOKIE['uzytkownik'].")";
		$rezultat = sqlsrv_query($polaczenie, $funWDP);

		while($row = sqlsrv_fetch_array($rezultat, SQLSRV_FETCH_ASSOC)){
			$idOp;
			$idFi;
			$idSp;

			$funWDO = "SELECT * FROM opiekuniIIchWyksztalcenie WHERE idOpiekuna = ".$row['idOpiekuna'];
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

	?>

	<a href="dziennik.php">Anuluj</a>
	
</body>
</html>