<?php
	
	// CONNECT TO DB
    require_once 'config.inc';
       
    // FORM AND EXECUTE SOME QUERY
    $sql = "SELECT user_id,login,first_name,last_name, password FROM users ORDER BY login";
    $result = mysqli_query($conn, $sql);
    
    $users = $result->fetch_all(MYSQLI_ASSOC);
   
	// RENDER THE VIEW
    include('./views/list.tpl');
?>

