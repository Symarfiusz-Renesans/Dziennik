<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dziennik</title>
	<link rel="stylesheet" href="style/stylDoGlownego.css">
</head>
<body>

<?php

	include 'czystyPHP/check.php';
	include 'czystyPHP/czyZalogowany.php';

	$idS = '';
	$imie = '';
	$nazwisko = '';
	$skrot = '';
	$czyJestOpiekunem = false;

	function przywitajSie($s, $i, $n){

		echo 'Witaj '.$s.' '.$i.' '.$n.'!';

	}
?>

	

<main>
	<header class="flexBox">
		<h1>
			<?php
				switch ($_COOKIE['typUzytkownika']) {
					case 3:
						$wybierzUzytkownika = 'SELECT * FROM dbo.wyswietlDanegoStudenta('.$_COOKIE['uzytkownik'].')';
						$result = sqlsrv_query($polaczenie ,$wybierzUzytkownika);

						while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
							$skrot = '';
							$imie = $row['imie'];
							$nazwisko = $row['nazwisko'];
							$idS = $row['idSzkoly'];
						}	

						break;
					case 2:
						$wybierzUzytkownika = 'SELECT * FROM dbo.wyswietlDanegoNauczyciela('.$_COOKIE['uzytkownik'].')';
						$result = sqlsrv_query($polaczenie, $wybierzUzytkownika);
				
						while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
							$skrot = $row['skrot'];
							$imie = $row['imie'];
							$nazwisko = $row['nazwisko'];
							$idS = $row['idSzkoly'];
							$czyJestOpiekunem = $row['czyJestOpiekunem'];
						}
				
						break;
					case 1:
						$wybierzUzytkownika = 'SELECT * FROM dbo.wyswietlDanegoDyrektora('.$_COOKIE['uzytkownik'].')';
						$result = sqlsrv_query($polaczenie, $wybierzUzytkownika);
			
						while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
							$skrot = $row['skrot'];
							$imie = $row['imie'];
							$nazwisko = $row['nazwisko'];
							$idS = $row['idSzkoly'];
						}

						break;
				}

				przywitajSie($skrot, $imie, $nazwisko);
			?>
		</h1>
	</header>
	<section>
		<nav>

			<?php

				switch ($_COOKIE['typUzytkownika']) {
					case 3:
						echo '<a href="Podstrony/pokazOceny.php"><h3>Pokaż oceny</h3></a><a href="Podstrony/pokazPraktyki.php"><h3>Pokaż swoją praktykę</h3></a><a href="Podstrony/pokazNauczycieli.php?szkola='.$idS.'"><h3>Pokaż nauczycieli</h3></a>';

						break;
					case 2:
						echo '<a href="Podstrony/pokazStudentow.php?szkola='.$idS.'"><h3>Pokaż studentów</h3></a><hr><a href="Podstrony/wstawOcene.php?szkola='.$idS.'"><h3>Wstaw ocenę</h3></a>';
						if ($czyJestOpiekunem) {
							echo '<hr><a href="Podstrony/wstawOcene.php?szkola='.$idS.'"><h3>Pokaż Praktyki Studentów</h3></a>';
						}
				
						break;
					case 1:
						echo '<a href="Podstrony/pokazStudentow.php?szkola='.$idS.'"><h3>Pokaż studentów</h3></a><a href="Podstrony/pokazNauczycieli.php?szkola='.$idS.'"><h3>Pokaż Nauczycieli</h3></a><hr><a href="Podstrony/zmienDyrektora.php"><h3>Zmień Dyrektora</h3></a><a href="Podstrony/zatrudnijNauczyciela.php"><h3>Zatrudnij nauczyciela</h3></a><a href="Podstrony/dodajStudenta.php?szkola='.$idS.'"><h3>Dodaj Studenta</h3></a><a href="Podstrony/usunStudenta.php?szkola='.$idS.'"><h3>Usuń Studenta</h3></a>';

						break;
				}



			?>
		
		</nav>
		<div>
			<iframe src="" frameborder="0"  allowtransparency = "true"></iframe>
		</div>
	</section>

</main>


<aside>
	<a href="czystyPHP/wyloguj.php"><h3>Wyloguj się</h3></a>
</aside>

<?php
	sqlsrv_close( $polaczenie );
?>

</body>
</html>