<?php

	setcookie('wylogowany', true, time()+3600, "/");
	header("Location:..index.php");

?>