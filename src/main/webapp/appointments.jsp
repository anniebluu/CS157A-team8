<%@ page import="java.sql.*, cs157a.team8.database.Database"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Appointments</title>
  
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
<!--   <style>
  	.approve-color {
  		background-color: lightgreen;
  	}
  	.reject-color {
  		background-color: lightcoral;
  	}
  </style> -->
</head>

<body>
	<h3>Appointments</h3>

	<table class="table table-light table-striped">
		<thead>
		  <tr>
		    <th scope="col">Appointment ID</th>
		    <th scope="col">User ID</th>
		    <th scope="col">Date</th>
		    <th scope="col">Time</th>
		    <th scope="col">Cancel?</th>
		  </tr>
		</thead>
		<tbody>
			<%
				try {
				    java.sql.Connection con;
				    con = new Database().getConnection();
				
				    Statement stmt = con.createStatement();
				    ResultSet rs = stmt.executeQuery("SELECT * FROM creates NATURAL JOIN appointments");
				                
				    while (rs.next()) {
				 		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>"+ "<td>" + rs.getString(2) + "</td>" + "<td>" + rs.getString(3) + "</td>" + "<td>" + rs.getString(4) + "</td>"); 		
				 		
				 		out.println("<td><button type=\"button\" class=\"btn btn-outline-danger\" onclick='confirmCancel(" + "\"" + rs.getString(1)  + "\"" + ")'>Cancel</button></td>"
				 			+ "</tr>");
				    }
				    rs.close();
				    stmt.close();
				    con.close();
				} catch(SQLException e) {
				    out.println("SQLException caught: " + e.getMessage());
				}
			%>
    	</tbody>
	</table>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
	</script>
	<script>
	    function confirmCancel(appointmentID) {
	           if (confirm("Cancel?")) {
	               // If confirmed, call delete function
	               window.location.href = "DeleteAppointment?id=" + String(appointmentID);
	           }
	       }
   </script>
</body>
</html>