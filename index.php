<?php
	
	// CONNECT TO DB
    require_once 'config.inc';
       
    // FORM AND EXECUTE SOME QUERY
    $sql = "SELECT title,studio,year,boxoffice, poster FROM movies ORDER BY boxoffice DESC";
    $result = mysqli_query($conn, $sql);
    
    $movies = $result->fetch_all(MYSQLI_ASSOC);
   	
   	print $result;
	// RENDER THE VIEW
    include('./views/app.tpl');
?>

