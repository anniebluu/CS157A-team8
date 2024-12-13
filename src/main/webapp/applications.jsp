<%@ page import="java.sql.*, cs157a.team8.database.Database"%>

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
	
	<title>Pet Query - Admin Applications</title>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
  
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
</head>
<% request.setAttribute("adminApplicationsActive", "active"); %>

<body>

	<!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
 	<jsp:include page="sidebar.jsp"/>

    
    <div class="main-content">
     	<div class="content-table">
			<h2>Applications</h2>
		
			<table class="table table-light table-striped">
				<thead>
				  <tr>
				    <th scope="col">Application ID</th>
				    <th scope="col">UserID</th>
				    <th scope="col">PetID</th>
				    <th scope="col">Status</th>
				    <th scope="col">Approve</th>
				    <th scope="col">Deny</th>
				    <th scope="col">Reset Status</th>
				    <th scope="col">Delete?</th>
				  </tr>
				</thead>
				<tbody>
					<%
						try {
						    java.sql.Connection con;
						    con = new Database().getConnection();
						
						    Statement stmt = con.createStatement();
						    ResultSet rs = stmt.executeQuery("SELECT * FROM submits NATURAL JOIN applications");
						                
						    while (rs.next()) {
						 		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>"+ "<td>" + rs.getString(2) + "</td>" + "<td>" + rs.getString(3) + "</td>");
						 		
						 		if(Integer.parseInt(rs.getString(4)) == 0) {
						 			out.println("<td>Pending</td>");
						 		}
						 		else if(Integer.parseInt(rs.getString(4)) == 1) {
						 			out.println("<td style=\"color:red;\">Denied</td>");
						 		}
						 		else if(Integer.parseInt(rs.getString(4)) == 2) {
						 			out.println("<td style=\"color:green;\">Approved</td>");
						 		}
						 		
						 		out.println("<td><form action=\"SetApplication\" method=\"post\"><input type=\"hidden\" name=\"appId\" value=\"" + rs.getString(1) + "\"/><button class=\"btn btn-success\" type=\"submit\" name=\"action\" value=\"approve\">Approve</button></form></td>" 
						 			+ "<td><form action=\"SetApplication\" method=\"post\"><input type=\"hidden\" name=\"appId\" value=\"" + rs.getString(1) + "\"/><button class=\"btn btn-danger\" type=\"submit\" name=\"action\" value=\"reject\">Reject</button></form></td>" 
						 			+ "<td><button type=\"button\" class=\"btn btn-secondary\" onclick='confirmReset(" + "\"" + rs.getString(1)  + "\"" + ")'>Reset</button></td>"
						    		+ "<td><button type=\"button\" class=\"btn btn-outline-danger\" onclick='confirmDelete(" + "\"" + rs.getString(1)  + "\"" + ")'>Delete</button></td>"
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
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
	</script>
	    <script>
       function confirmDelete(applicationID) {
           if (confirm("Delete?")) {
               // If confirmed, call delete function
               window.location.href = "DeleteApplication?id=" + String(applicationID);
           }
       }
       function confirmReset(applicationID) {
           if (confirm("Reset Status?")) {
               window.location.href = "SetApplication?id=" + String(applicationID);
           }
       }
   </script>
   
</body>
</html>