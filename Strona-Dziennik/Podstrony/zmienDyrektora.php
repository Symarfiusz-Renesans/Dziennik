<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=	, initial-scale=1.0">
	<title>Wstaw ocene</title>
	<link rel="stylesheet" type="text/css" href="../style/stylDoFormularzy.css">
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
		
		<form action="../czystyPHP/WDBzmienDyrektora.php" method="POST" class="flexBoxForm flexBox">
			<label>Imię</label><input type="text" name="imie" max=20><br>
			<label>Nazwisko</label><input type="text" name="nazw" max=20><br>
			<label>Wykształcenie</label><select name="wyksztalcenie"><br>
	
			<?php
				include '../czystyPHP/check.php';
				include '../czystyPHP/czyZalogowany.php';

				$wybierzUzytkownika = 'SELECT * FROM tytuly';
				$result = sqlsrv_query($polaczenie ,$wybierzUzytkownika);
				
				while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) ) {
					echo '<option value="'.$row['idTytulu'].'">';
		
			    	echo $row['tytul'].'</option>';
				}
				
			?>

			</select><label>Hasło</label><input type="password" name="haslo" max=50>
			</select><br><button>Potwierdź</button>
		</form>
	</div>
</main>	

</body>
</html>