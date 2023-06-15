<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Logowanie</title>
	<link rel="stylesheet" href="style/styl.css">
</head>
<body>


	
<?php

		include 'czystyPHP/check.php';


   	if(isset($_COOKIE['wylogowany'])){

   		setcookie("typUzytkownika", null, -1, "/");
   		setcookie("uzytkownik", null, -1, "/");
		setcookie("wylogowany", null, -1, "/");
		header("Refresh:0");

    }

	if(!isset($_COOKIE['typUzytkownika'])){

		setcookie("uzytkownik", null, -1, "/");

		echo '<h1>Kim Jesteś?</h1><form action="ustawTyp.php" method="POST">
			<select name="typ">
				<option disabled selected>Zaznacz odpowiedź</option>
				<option value=1>Studentem</option>
				<option value=2>Nauczycielem</option>
				<option value=3>Dyrektorem</option>
			</select>

			<button>Dalej</button>
		</form>';
	}

	$result;
	$id;

	if(!isset($_COOKIE['uzytkownik']) && isset($_COOKIE['typUzytkownika'])){
		switch ($_COOKIE['typUzytkownika']) {
			case 1:
				$funWWS = "SELECT * FROM wyswietlWszystkichStudentow()";
				$result = sqlsrv_query($polaczenie, $funWWS);
				$id = "Indeks";
				break;
			case 2:
				$funWWN = "SELECT * FROM wyswietlWszystkichNauczycieli()";
				$result = sqlsrv_query($polaczenie, $funWWN);
				$id = "idNaucz";
				break;
			case 3:
				$funWWD = "SELECT * FROM wyswietlWszystkichDyrektorow()";
				$result = sqlsrv_query($polaczenie, $funWWD);
				$id = "idDyrektora";
				break;

		}
		echo '<form action="ustawUzytkownika.php" method="POST"><select name="uzytkownik"> ';
		while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
			echo '<option value="'.$row[$id].'">';
			
			if($_COOKIE['typUzytkownika'] != 1){
				echo $row['skrot']." ";
			}
		    echo $row['imie'].' '.$row['nazwisko'].'</option>';
		}
		echo '</select><button>Potwierdź</button></form>';
	}

	if(isset($_COOKIE['uzytkownik']) && isset($_COOKIE['typUzytkownika'])){

		if (isset($_COOKIE['error'])) {
			setcookie('error', "", time() - 3600);
		echo '<h1>Niepoprawne hasło!</h1><p>Spróbuj ponownie</p><hr>';
		}

		echo '<form action="sprawdzHaslo.php" method="POST"><input name="haslo" type="password"><button>Potwierdź</button></form>';

	}

?>

<a href="wyloguj.php">Anuluj</a>

</body>
</html>