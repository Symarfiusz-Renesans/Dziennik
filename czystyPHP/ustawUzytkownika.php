<?php

	setcookie('uzytkownik', $_POST['uzytkownik'], time()+3600, "/");
	header("Location:index.php");

?>