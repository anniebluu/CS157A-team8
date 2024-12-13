<%@ page import="java.sql.*, cs157a.team8.database.Database"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Pet Query - Admin Organizations</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
</head>

<body>
	<!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
    <div class="sidebar">
    	<div class="sidebar-menu">
	 		<a href="adminProfile.jsp">My Profile</a>
			<a href="organizations.jsp" class="active">Organizations</a>
			<a href="addOrganization.jsp">Add Organization</a>
			<a href="pets.jsp">Pets</a>
			<a href="addPet.jsp">Add Pet</a>
			<a href="users.jsp">Users</a>
			<a href="applications.jsp">Applications</a>
			<a href="appointments.jsp">Appointments</a>
		</div>
		<div class="logout">
		    <form action="Logout" method="POST">
		    	<div class="info-row">
					<button type="submit" class="btn btn-secondary btn-lg">Log Out</button>
				</div>
			
		    </form>
	    </div>
    </div>
    
     <div class="main-content">
     	<div class="content-table">
			<h2>Pet Organizations</h2>
			<table class="table table-light table-striped">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Phone Number</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Delete?</th>
					</tr>
				</thead>
				
				<tbody>
				    <%
				        try {
				            java.sql.Connection con;
				            con = new Database().getConnection();
				            Statement stmt = con.createStatement();
				            ResultSet rs = stmt.executeQuery("SELECT * FROM petorganizations");
				            while (rs.next()) {
				         out.println("<tr>" + 
				            "<td>" + rs.getString(1) + "</td>" + 
				        		 "<td>" + rs.getString(2) + "</td>" + 
				            "<td>" + rs.getString(3) + "</td>" + 
				        		 "<td>" + rs.getString(4) + "</td>" + 
				        	"<td>" + "<button type=\"button\" class=\"btn btn-outline-danger\" onclick='confirmDelete(" + "\"" + rs.getString(1)  + "\"" + ")'>Delete</button>" + "</td>" + 
				        		 "</tr>");
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
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
	</script>
    <script>
       function confirmDelete(organizationID) {
           if (confirm("Delete?")) {
               // If confirmed, call delete function
               window.location.href = "DeleteOrganization?id=" + String(organizationID);
           }
       }
   </script>
</body>
</html>
