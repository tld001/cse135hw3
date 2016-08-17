<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>James Dang</title>
  <link href="http://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" type="text/css" >
  <link rel="stylesheet" type="text/css" href=style.css>
</head>

<body>
  <nav>
    <ul>
        <li><a href="index.html">Home</a></li>
        <li><a href="README.html">README</a></li>
        
        <li><a href="php_hello.php">PHP Hello</a></li>
        <li><a href="php_environment.php">PHP Environment</a></li>
        <li><a href="php_form.php">PHP Form</a></li>
        <li><a href="sessionpage1.php">PHP Session</a></li>

        <li><a href="cgi-bin/hello.cgi">CGI Hello</a></li>
        <li><a href="cgi-bin/environment.cgi">CGI Environment</a></li>
        <li><a href="cgi-bin/form.cgi">CGI Form</a></li>
        <li><a href="cgi-bin/session.cgi">CGI Session</a></li>
    <ul>
  <nav>
  <section>
        <br>
        <?php 
          date_default_timezone_set('America/Los_Angeles');
          while(list($variable,$value) = each($_SERVER))
          {
            echo "$variable : $value <br>";
          }
          
        ?>
        <br>
  <section>
</body>
</html>