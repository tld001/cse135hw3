<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Super Basic CRUD!</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>

<div class="container">
	
<h1>Super Basic CRUD!</h1>
	
<table class='table'>
<tr><th>First Name</th><th>Last Name</th><th>Login</th><th>Password</th><th></th></tr>
<?php
   if (count($users) == 0) {
?>
  <tr><td colspan='5'>No Users</td></tr>

<?php
  } else {
	  		   
     for ($i = 0; $i < count($users); $i++) {
	   
	    print "<tr>";
	    print "<td>". $users[$i]['first_name']   . "</td>" ;
	    print "<td>". $users[$i]['last_name']    . "</td>" ;
	    print "<td>". $users[$i]['login']        . "</td>" ;
	    print "<td>". $users[$i]['password']     . "</td>" ;
	    
	    print "<td><div class='row'>";
	    	    
	    print "<div class='col-sm-6'><form action='edit.php' method='POST' class='form-horizontal'><input type='hidden' name='user_id' value='".$users[$i]['user_id']."'>
	    <div class='form-group'><button type='submit' name='action' value='Update' class='btn btn-default'>
  <span class='glyphicon glyphicon-pencil'></span></button></div></form></div>";
	    
	    print "<div class='col-sm-6'><form action='delete.php' method='POST' class='form-horizontal'><input type='hidden' name='user_id' value='".$users[$i]['user_id']."'><div class='form-group'><button type='submit' class='btn btn-default' name='action' value=delete'>
  <span class='glyphicon glyphicon-trash'></span></button></div></form></div>";

  	    print "</div></td></tr>\n";
	    
	 }
	   
  } 	  
		  
?>


</table>

<form action="edit.php" method="POST">
	<input type="submit" name="action" value="Add" class="btn btn-lg btn-primary">
</form>	

<br><br>
<hr>
<br><br>

<div class="alert alert-danger" role="alert">
	<h2>Things Missing</h2>
	
	<ol>
		<li>Validation and more validation</li>
		<li>Paging</li>
		<li>Sorting</li>
		<li>JavaScript (Required or Optional?)</li>
		<li>As good as reasonable separation of code and template</li>
		<li>Little code improvements</li>
	</ol>
</div>

</div>

</body>
</html>