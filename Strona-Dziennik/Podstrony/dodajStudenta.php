<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=	, initial-scale=1.0">
	<title>Wstaw ocene</title><link rel="stylesheet" type="text/css" href="../style/stylDoFormularzy.css">
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

			if (isset($_COOKIE['error'])) {
				echo $_COOKIE['error'];
			}
		?>

		<?php 

			echo '<form action="../czystyPHP/WDBdodajStudenta.php?szkola='.$_GET['szkola'].'" method="POST" class="flexBoxForm flexBox">';

		?>
			<label>Imię</label><input type="text" name="imie" max=20>
			<br><label>Nazwisko</label><input type="text" name="nazw" max=20>
		</select><br><button>Potwierdź</button>
		</form>
	</div>
</main>

</body>
</html>