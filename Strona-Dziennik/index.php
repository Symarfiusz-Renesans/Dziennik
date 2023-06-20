<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Logowanie</title>
	<link rel="stylesheet" href="style/stylDoLogowania.css">
</head>
<body>


	
<?php

		include 'czystyPHP/check.php';


   	if(!isset($_COOKIE['typUzytkownika'])){

   		setcookie("typUzytkownika", null, -1, "/");
   		setcookie("uzytkownik", null, -1, "/");
		setcookie("wylogowany", null, -1, "/");
		header("Location: Podstrony/logowanie.php");

    }

?>

<main>
	<header class="flexBox">
		<h1>Dziennik</h1>
	</header>
	<div class="flexBox">
		<div id="loguj">
			<header class="flexBox">
				<h1>Zaloguj się!</h1>
			</header>
			<form action="" class="flexBoxForm flexBox">
				<label>Login:</label><input type="text" name="login"><br>
				<label>Hasło:</label><input type="password" name="haslo"><br>
				<button>Kontynuuj</button>
			</form>
		</div>
	</div>
</main>

</body>
</html>