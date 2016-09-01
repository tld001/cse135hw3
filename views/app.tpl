<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Box Office Tracker - James Dang</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href=style.css>
</head>
<body>

<nav>
    <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="README.html">README</a></li>
    <ul>
</nav>

<div class="container">
	
<h1>Box Office Tracker</h1>
	
<table class='table'>
<tr>
<th> <a href="?orderBy=title">Title</a> </th>
<th> <a href="?orderBy=studio">Studio</a> </th>
<th> <a href="?orderBy=year">Year</a> </th>
<th> <a href="?orderBy=boxoffice">BoxOffice</a> </th>
<th>Poster</th>
<th></th>
</tr>
<?php
	$order_by = array('title','studio', 'year', 'boxoffice');
	$order = 'title';

	if (isset($_GET['order_by']) && in_array($_GET['order_by'], $order_by)) 
	{
    	$order = $_GET['order_by'];
	}
?>

<?php
   if (count($movies) == 0) {
?>
  <tr><td colspan='5'>No Movies</td></tr>

<?php
  } else {
	  		   
     for ($i = 0; $i < count($movies); $i++) {

     	$number = money_format('$%i', $movies[$i]['boxoffice']);
	   
	    print "<tr>";
	    print "<td>". $movies[$i]['title']   . "</td>" ;
	    print "<td>". $movies[$i]['studio']    . "</td>" ;
	    print "<td>". $movies[$i]['year']        . "</td>" ;
	    print "<td>". $number   . "</td>" ;
	    print "<td>". $movies[$i]['poster']       . "</td>" ;
	    
	    print "<td><div class='row'>";
	    	    
	    print "<div class='col-sm-6'><button type='button' class='btn btn-default' onclick='SBC.editRecord(".json_encode($movies[$i]).")'>
  <span class='glyphicon glyphicon-pencil'></span></button></div>";

	    
	    print "<div class='col-sm-6'><button type='button' class='btn btn-default' onclick='SBC.confirmDelete(".$movies[$i]['movie_id'].");'><span class='glyphicon glyphicon-trash'></span></button></div>";
  
  	    print "</div></td></tr>\n";
	    
	 }
	   
  } 	  
		  
?>


</table>

<button type="button" id="addBtn" class="btn btn-primary btn-lg">
  Add
</button>


<!--  Partials are below -->

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
	 	<label for="title">Title</label>
	 	<input type="text" name="title" id="title" value=""  class="form-control">
	 </div>

	 <div class="form-group">
	 	<label for="studio">Studio</label>
	 	<input type="text" name="studio" id="studio" value=""  class="form-control">
	 </div>

	<div class="form-group">
		<label for="year">Year</label>
		<input type="number" name="year" id="year" value=""  class="form-control">
	</div>

	<div class="form-group">
		<label for="boxoffice">BoxOffice</label>
		<input type="number" name="boxoffice" id="boxoffice" value=""  class="form-control">
	</div>

	<div class="form-group">
		<label for="poster">Poster</label>
		<input type="text" name="poster" id="poster" value=""  class="form-control">
	</div>
	
	<input type="hidden" name="movie_id" id="movie_id" value="">
	
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
	  	<input type="hidden" name="movie_id" id="deleteConfirm_movie_id" value="">
	  	
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
	  $("#deleteConfirm_movie_id").attr('value',id);
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
	  
	    $("#title").attr('value',record.title);
	    $("#studio").attr('value',record.studio);
	    $("#year").attr('value',record.year);
	    $("#boxoffice").attr('value',record.boxoffice);
	    $("#poster").attr('value',record.poster);
	    $("#movie_id").attr('value',record.movie_id);
	  
	    $("#actionBtn").attr('value','Update');
	    $("#actionBtn").html('Update');
	  }
	  
	 $('#addModal').modal('show');
	  
	}

</script>

</body>
</html>