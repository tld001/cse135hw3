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
        <li><a href="php_session.php">PHP Session</a></li>

        <li><a href="cgi-bin/hello.cgi">CGI Hello</a></li>
        <li><a href="cgi-bin/environment.cgi">CGI Environment</a></li>
        <li><a href="cgi-bin/form.cgi">CGI Form</a></li>
        <li><a href="cgi-bin/session.cgi">CGI Session</a></li>
    <ul>
  <nav>


  <form action="hello.php" method="get">

  <label>First Name:
   <input type="text" name="firstName" id="firstName">
  </label>

  <br>

  <label>Last Name:
   <input type="text" name="lastName" id="lastName">
  </label>

  <br>

  <label for="favColor">Favorite Color: </label>
   <select name="favColor" id="favColor">
    <option value="red">Red</option>
    <option value="white">White</option>
    <option value="blue">Blue</option>
   </select>
  
  <br>

  <label for="sendMethod">Send Method: </label>
   <select id="sendMethod" onchange="this.form.method = this.options[selectedIndex].value;">
    <option>GET</option>
    <option>POST</option>
   </select>

<input type="submit" value="Submit">

</form>


</body>
</html>