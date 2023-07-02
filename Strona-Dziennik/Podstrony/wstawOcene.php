<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Wstaw ocene</title>
	<link rel="stylesheet" href="../style/stylDoLogowania.css">
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

		$wybierzUzytkownika = 'SELECT * FROM dbo.wyswietlWszystkichStudentow() WHERE idSzkoly = '.$_GET['szkola'];
		$result = sqlsrv_query($polaczenie ,$wybierzUzytkownika);
		echo '<form action="czystyPHP/WDBocene.php" method="POST" class="flexBoxForm flexBox"><label>Uczeń</label><select name="uczen"> ';
		while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['Indeks'].'">';
			
		    echo $row['imie'].' '.$row['nazwisko'].'</option>';
		}
		echo '</select><label>Ocena</label><input type="number" name="ocena" min=0 max=6><label>Przedmiot</label><select name="przedmiot">';

		$funWWP = "SELECT * FROM Przedmioty";
		$resultWWP = sqlsrv_query($polaczenie, $funWWP);

		while($row = sqlsrv_fetch_array( $resultWWP, SQLSRV_FETCH_ASSOC)){
			echo'<option value='.$row['idPrzedmiotu'].'>'.$row['Przedmiot'].'</option>';
		}
	?>

		</select><br><br><button>Potwierdź</button></form>

		</div>
	</div>
</main>

</body>
</html>