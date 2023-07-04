<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=	, initial-scale=1.0">
	<title>Wstaw ocene</title>
	<link rel="stylesheet" href="../style/stylDoFormularzy.css">
</head>
<body>

<main >
	<div id="okno">
		<header class="flexBox">
			<h1>Wypełnij Formularz!</h1>
		</header>

		<?php
			if (isset($_COOKIE['error'])) {
				echo $_COOKIE['error'];
			}
		?>
	
	<?php
		include '../czystyPHP/check.php';
		include '../czystyPHP/czyZalogowany.php';

		$funWDS = 'SELECT * FROM szkolyIIchStudenci WHERE idSzkoly ='.$_GET['szkola'];

		$rezultat = sqlsrv_query($polaczenie, $funWDS);
		echo '<form action="../czystyPHP/WDBusunStudenta.php?szkola='.$_GET['szkola'].'" method="POST" class="flexBoxForm flexBox"><label>Wybierz Studenta</label><select name="id">';
		while( $row = sqlsrv_fetch_array( $rezultat, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['Indeks'].'">';
			
		    echo $row['imie'].' '.$row['nazwisko'].'</option>';
		}
	?>

	</select><br><button>Potwierdź</button></form>

</body>
</html>