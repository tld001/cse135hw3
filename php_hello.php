<?php
  $background_color = array("red","white","blue");
  $random_color = $background_color[array_rand($background_color, 1)];
?>

<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>James Dang</title>
  <link href="http://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" type="text/css" >
  <link rel="stylesheet" type="text/css" href=style.css>
</head>

<body style ="background: <?php echo $random_color; ?>;" >
  <nav>
    <ul>
        <li><a href="index.html">Home</a></li>
        <li><a href="README.html">README</a></li>
        <li><a href="php_hello.php">PHP Hello</a></li>
        <li><a href="php_environment.php">PHP Environment</a></li>
        <li><a href="php_form.php">PHP Form</a></li>
        <li><a href="php_session1.php">PHP Session1</a></li>
        <li><a href="php_session2.php">PHP Session2</a></li>

        <li><a href="cgi_hello.html">CGI Hello</a></li>
        <li><a href="cgi_environment.html">CGI Environment</a></li>
        <li><a href="cgi_form.html">CGI Form</a></li>
        <li><a href="cgi_session1.html">CGI Session1</a></li>
        <li><a href="cgi_session2.html">CGI Session2</a></li>
    <ul>
  <nav>
  <section>
        <br>
        <?php 
          date_default_timezone_set('America/Los_Angeles');
          
          print "Hello Web World From Language PHP on ";
          print date("m/d/Y h:i a");
        ?>
        <br>
  <section>
</body>
</html>