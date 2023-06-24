<?php

     $serverName = "TwojKomputer";
     
     $connectionInfo = array( "Database"=>"praktyki", "UID" =>"sa", "PWD" => "2006");
     $polaczenie = sqlsrv_connect( $serverName, $connectionInfo);

     if( $polaczenie ) {
     }else{
          echo "<h1>ERROR</h1><h2>Spróbuj ponownie później</h2>";
          die( print_r( sqlsrv_errors(), true));
     }
?>