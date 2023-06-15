<?php

	setcookie('typUzytkownika', $_POST['typ'], time()+3600, "/");
	header("Location:index.php");

?>