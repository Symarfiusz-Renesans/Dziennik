<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Oceny</title>
	<link rel="stylesheet" href="../style/stylDoTabel.css">		
</head>
<body>

	<?php

		include '../czystyPHP/check.php';
		include '../czystyPHP/czyZalogowany.php';

	?>


<main >
	<div id="okno">
		<header class="flexBox">
			<h1>Twoje Oceny!</h1>
		</header>
		<div>
			<?php

				$funWWP = "SELECT * FROM Przedmioty";
				$resultWWP = sqlsrv_query($polaczenie, $funWWP);
				echo '<table><tr><th>Przedmiot</th><th>Oceny</th></tr>';

				while($row = sqlsrv_fetch_array( $resultWWP, SQLSRV_FETCH_ASSOC)){
					echo'<tr><td>'.$row['Przedmiot'].'</td><td>';

					$funODS = "SELECT * FROM ocenyDanegoStudenta(".$_COOKIE['id'].") ORDER BY idPrzedmiotu";
					$resultODS = sqlsrv_query($polaczenie, $funODS);

					echo $funODS;

					while( $subRow = sqlsrv_fetch_array( $resultODS, SQLSRV_FETCH_ASSOC) ) {
						if($row['idPrzedmiotu'] == $subRow['idPrzedmiotu']){
							echo $subRow['ocena'].', ';
						}
					}

					echo'</td></tr>';
				}

				echo '</table>';

			?>
		</div>
	</div>
</main>		
	
</body>
</html>