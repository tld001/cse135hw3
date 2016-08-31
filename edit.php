<?php

 require_once 'config.inc';

 $action = $_POST['action'];

 
 $first_name = '';
 $last_name = '';
 $login = '';
 $password = '';
 
 
 if ($action == "Update") {
   
    $user_id = $_POST['user_id'];
         
    $sql = "SELECT login,first_name,last_name, password FROM users where user_id = ".$user_id;
    $result = mysqli_query($conn, $sql);

    while($row = mysqli_fetch_assoc($result)) {
    
	 $first_name = $row['first_name'];
	 $last_name = $row['last_name'];
	 $login = $row['login'];
	 $password = $row['password'];
	}
	 
 }
 
 // RENDER THE VIEW
 include('./views/edit.tpl');

?>