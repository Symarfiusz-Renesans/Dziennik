<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=	, initial-scale=1.0">
	<title>Wstaw ocene</title>
</head>
<body>
	
	<?php
		include 'check.php';
		include 'czyZalogowany.php';

		$funWDS = 'SELECT * FROM szkolyIIchStudenci WHERE idSzkoly ='.$_GET['szkola'];

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		echo '<h3>Wybierz ocenę</h3><form action="WDBusunStudenta.php" method="POST"><select name="id">';
		while( $row = sqlsrv_fetch_array( $rezultat, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['Indeks'].'">';
			
		    echo $row['imie'].' '.$row['nazwisko'].'</option>';
		}
	?>

	</select><br><br><button>Potwierdź</button></form>
	<a href="dziennik.php">Anuluj</a>

</body>
</html>