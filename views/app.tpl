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
	    	    
	    print "<div class='col-sm-6'><button type='button' class='btn btn-default' onclick='SBC.editRecord(".json_encode($users[$i]).")'>
  <span class='glyphicon glyphicon-pencil'></span></button></div>";

	    
	    print "<div class='col-sm-6'><button type='button' class='btn btn-default' onclick='SBC.confirmDelete(".$users[$i]['user_id'].");'><span class='glyphicon glyphicon-trash'></span></button></div>";
  
  	    print "</div></td></tr>\n";
	    
	 }
	   
  } 	  
		  
?>


</table>

<button type="button" id="addBtn" class="btn btn-primary btn-lg">
  Add
</button>


<!--  Partials are below --->

<!-- Add Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Record</h4>
      </div>
      <div class="modal-body">

	 <form action="action.php" method="POST" class="form">
	 <div class="form-group">
	 	<label for="first_name">First Name</label>
	 	<input type="text" name="first_name" id="first_name" value=""  class="form-control">
	 </div>

	 <div class="form-group">
	 	<label for="last_name">Last Name</label>
	 	<input type="text" name="last_name" id="last_name" value=""  class="form-control">
	 </div>

	<div class="form-group">
		<label for="login">Login</label>
		<input type="text" name="login" id="login" value=""  class="form-control">
	</div>

	<div class="form-group">
		<label>Password</label>
		<input type="password" name="password" id="password" value=""  class="form-control">
	</div>
	
	<input type="hidden" name="user_id" id="user_id" value="">
	
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary" name="action" id="actionBtn" value="Add">Add</button>
      </div>
    </div>
    
    </form>
  </div>
</div>


<!-- Delete modal -->
<div id="deleteModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
      </div>
      
      
      
      <div class="modal-footer">

      <form action="action.php" method="POST">
	  	<input type="hidden" name="user_id" id="deleteConfirm_user_id" value="">
	  	
	  	<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary" name="action" value="Delete">Delete</button>

       </form>
      </div>
      
    </div>
  </div>
</div>

<!-- End partials -->

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	
	$(document).ready(function () {
		
		$("#addBtn").click(function () {
		   SBC.editRecord();	
		})
		
	});
	
	
	var SBC = {};
	
	SBC.confirmDelete = function confirmDelete(id) {
	  $("#deleteConfirm_user_id").attr('value',id);
	  $('#deleteModal').modal('show');
	}
	
	
	SBC.editRecord = function editRecord(record) {
	  
	  if (!record) {
		// no data so it is a straight add
		
		$("#myModalLabel").html("Add Record");
	    $("#actionBtn").attr('value','Add');
	    $("#actionBtn").html('Add');
	    
	  } else {
	    // data passed so it is an edit
	    
	    $("#myModalLabel").html("Edit Record");
	  
	    $("#first_name").attr('value',record.first_name);
	    $("#last_name").attr('value',record.last_name);
	    $("#login").attr('value',record.login);
	    $("#password").attr('value',record.password);
	    $("#user_id").attr('value',record.user_id);
	  
	    $("#actionBtn").attr('value','Update');
	    $("#actionBtn").html('Update');
	  }
	  
	 $('#addModal').modal('show');
	  
	}

</script>

</body>
</html>