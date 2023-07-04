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
		include '../czystyPHP/check.php';
		include '../czystyPHP/czyZalogowany.php';

		$wybierzUzytkownika = 'SELECT * FROM tytuly';
		$result = sqlsrv_query($polaczenie ,$wybierzUzytkownika);
		echo '<form action="../czystyPHP/WDBzatrudnijNauczyciela.php?szkola='.$_GET['szkola'].'" method="POST" class="flexBoxForm flexBox"><label>Imię</label><input type="text" name="imie" max=20><br><label>Nazwisko</label><input type="text" name="nazw" max=20><br><label>Wykształcenie</label><select name="wyksztalcenie"> ';
		while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row['idTytulu'].'">';
			
		    echo $row['tytul'].'</option>';
		}
	?>

	</select><br><button>Potwierdź</button></form>
	</form>
	</div>
</main>

</body>
</html>