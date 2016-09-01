<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?= $action ?> Record</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>

<div class="container">
	
<h1><?= $action ?> Record</h1>

<form action="action.php" method="POST" class="form">
	<div class="form-group">
	 <label for="first_name">First Name</label>
	 <input type="text" name="first_name" value="<?= $first_name ?>"  class="form-control">
	</div>

	<div class="form-group">
	<label for="last_name">Last Name</label>
	<input type="text" name="last_name" value="<?= $last_name ?>"  class="form-control">
	</div>

	<div class="form-group">
	<label for="login">Login</label>
	<input type="text" name="login" value="<?= $login ?>"  class="form-control">
	</div>

	<div class="form-group">
	<label>Password</label>
	<input type="password" name="password" value="<?= $password ?>"  class="form-control">
	</div>

	<input type="hidden" name="user_id" value="<?= $user_id ?>">
	
	<div class="form-group">
	<input type="submit" value="<?= $action ?>" name="action" class="btn btn-primary">
	<input type="submit" value="Cancel" name="action"  class="btn btn-default">	
	</div>
	
</form>

</div>

</body>
</html>