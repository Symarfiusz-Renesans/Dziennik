<?php

if(!isset($_COOKIE['typUzytkownika'])){
	setcookie("typUzytkownika", null, -1, "/");
 	setcookie("uzytkownik", null, -1, "/");
	header("Location: ../Podstrony/logowanie.php");
}

?>