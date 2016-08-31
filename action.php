<?php
	
	require_once 'config.inc';
	

	$action = $_REQUEST['action'];
	
	if ($action == 'Add') {
		
       $title = $_REQUEST['title'];
	   $studio = $_REQUEST['studio'];
	   $year = $_REQUEST['year'];
	   $boxoffice = $_REQUEST['boxoffice'];
	   $poster = $_REQUEST['poster'];
	   
	   // SHOULD HAVE VALIDATION HERE!?
		
	
	   $sql = "INSERT INTO movies (title,studio,year,boxoffice,poster) VALUES ('$title' , '$studio' , '$year' , '$boxoffice', '$poster')";
	   $result = mysqli_query($conn, $sql);
		
		
	} else if ($action == "Update") {
		
	   $title = $_REQUEST['title'];
	   $studio = $_REQUEST['studio'];
	   $year = $_REQUEST['year'];
	   $boxoffice = $_REQUEST['boxoffice'];
	   $movie_id = $_REQUEST['movie_id'];
	   $poster = $_REQUEST['poster'];
	
	   /*
	   $sql = "UPDATE movies SET title='" .$title."' ,studio='".$studio."' ,year='".$year."' ,boxoffice='".$boxoffice."', poster='".$poster."' WHERE movie_id='".$movie_id."'";
	   */
	   $sql = "UPDATE movies SET title='$title' ,studio='$studio' ,year=$year. ,boxoffice=$boxoffice, poster='$poster' WHERE movie_id=$movie_id";

       $result = mysqli_query($conn, $sql);
		
	}  else if ($action == "Delete") {

  	   /*
       $sql = "DELETE FROM movies WHERE movie_id='".$_POST['movie_id']."'"; 
       */

       $temp = $_POST['movie_id'];
  	   $sql = "DELETE FROM movies WHERE movie_id = '$temp'";

       $result = mysqli_query($conn, "DELETE FROM movies WHERE movie_id = $temp");
       if($result == false)
       		print("hi");
	
	}

	header('Location: index.php');
	
?>