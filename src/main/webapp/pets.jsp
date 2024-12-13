<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">

	window.onload = function (){
		<% 
		if (session.getAttribute("userName") == null){
            response.sendRedirect("landingPage.jsp");  // Redirect to the landing page
        } else {%>	
		<% 
		if ((Integer) session.getAttribute("isAdmin") == 0){
            response.sendRedirect("petQueryHome.jsp");  // Redirect to the landing page
        } }%>	
	}
	
</script>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Pet Query - Admin Pets</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
</head>
<% request.setAttribute("adminPetsActive", "active"); %>

<body>
	<!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
    <jsp:include page="sidebar.jsp"/>

	
	 <div class="main-content">
	 	<div class="content-table">
			<h2>Pets</h2>
	
			<table class="table table-light table-striped">
				<thead>
					<tr>
						<th scope="col">Pet ID</th>
						<th scope="col">Name</th>
						<th scope="col">Age</th>
						<th scope="col">Category</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete?</th>
					</tr>
				</thead>
				<tbody>
			    <%
					try {
					    java.sql.Connection con;
					    con = new Database().getConnection();
					    Statement stmt = con.createStatement();
					    ResultSet rs = stmt.executeQuery("SELECT * FROM petquery.pets ORDER BY CAST(PetID AS SIGNED) ASC;");
					    while (rs.next()) {
					    	String petID = rs.getString("petID");
							 out.println("<tr>" + 
					    "<td>" + rs.getString(1) + "</td>" + 
							 "<td>" + rs.getString(2) + "</td>" + 
					    "<td>" + rs.getString(3) + "</td>" + 
							 "<td>" + rs.getString(4) + "</td>" + 
						"<td>" + 
	                          "<button type=\"button\" class=\"btn btn-outline-primary\" onclick=\"window.location.href='editPets.jsp?petID=" + petID + "'\">" + 
	                            "<i class=\"fas fa-arrow-right\"></i></button>" + 
	                    "</td>" + 
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
       function confirmDelete(petID) {
           if (confirm("Delete?")) {
               // If confirmed, call delete function
               window.location.href = " DeletePet?id=" + petID;
              
           }
           alert("${alertMessage}");
       }
   </script>
   
</body>
</html>