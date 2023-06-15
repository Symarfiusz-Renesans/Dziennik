<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Dziennik</title>
</head>
<body>

	<?php
		include 'check.php';
		include 'czyZalogowany.php';

		function dziennikDlaStudenta($id){
			include 'check.php';

			$wybierzUzytkownika = 'SELECT * FROM dbo.wyswietlDanegoStudenta('.$_COOKIE['uzytkownik'].')';
			$result = sqlsrv_query($polaczenie ,$wybierzUzytkownika);
			$idS;
			
			while( $row = sqlsrv_fetch_array($result, SQLSRV_FETCH_ASSOC) ) {
				echo '<h1>Witaj '.$row['imie'].' '.$row['nazwisko'].'!</h1><hr>';
				$idS = $row['idSzkoly'];
			}

			echo '<a href="pokazOceny.php"><h3>Pokaż oceny</h3></a><a href="pokazPraktyki.php"><h3>Pokaż swoją praktykę</h3></a><a href="pokazNauczycieli.php?szkola='.$idS.'"><h3>Pokaż nauczycieli</h3></a>';
			
		}
		function dziennikDlaNauczyciela($id){

			include 'check.php';

			$wybierzUzytkownika = 'SELECT * FROM dbo.wyswietlDanegoNauczyciela('.$_COOKIE['uzytkownik'].')';
			$result = sqlsrv_query($polaczenie, $wybierzUzytkownika);
			
			while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
				echo '<h1>Witaj '.$row['skrot'].' '.$row['imie'].' '.$row['nazwisko'].'!</h1><hr>';

				$idS = $row['idSzkoly'];
			}

			echo '<a href="pokazStudentow.php?szkola='.$idS.'"><h3>Pokaż studentów</h3></a><hr><a href="wstawOcene.php?szkola='.$idS.'"><h3>Wstaw ocenę</h3></a><a ';
		}
		function dziennikDlaDyrektora($id){

			include 'check.php';

			$idS;

			$wybierzUzytkownika = 'SELECT * FROM dbo.wyswietlDanegoDyrektora('.$_COOKIE['uzytkownik'].')';
			$result = sqlsrv_query($polaczenie, $wybierzUzytkownika);
			
			while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
				echo '<h1>Witaj '.$row['skrot'].' '.$row['imie'].' '.$row['nazwisko'].'!</h1><hr>';
				$idS = $row['idSzkoly'];
			}

			echo '<a href="pokazStudentow.php?szkola='.$idS.'"><h3>Pokaż studentów</h3></a><a href="pokazNauczycieli.php?szkola='.$idS.'"><h3>Pokaż Nauczycieli</h3></a><a href="pokazFirmy.php"><h3>Pokaż Firmy</h3></a><hr><a href="zmienDyrektora.php"><h3>Zmień Dyrektora</h3></a><a href="zatrudnijNauczyciela.php"><h3>Zatrudnij nauczyciele</h3></a><a href="dodajStudenta.php?szkola='.$idS.'"><h3>Dodaj Studenta</h3></a><a href="usunStudenta.php?szkola='.$idS.'"><h3>Usuń Studenta</h3></a>';
		}
	?>

	<?php
		switch ($_COOKIE['typUzytkownika']) {
			case 1:
				dziennikDlaStudenta($_COOKIE['uzytkownik']);
				break;
			case 2:
				dziennikDlaNauczyciela($_COOKIE['uzytkownik']);
				break;
			case 3:
				dziennikDlaDyrektora($_COOKIE['uzytkownik']);
				break;
		}
	?>

	<hr><a href="wyloguj.php"><h3>Wyloguj</h3></a>

</body>
</html>