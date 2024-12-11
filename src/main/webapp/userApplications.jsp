<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - My Applications</title>
    
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="style.css">
    

</head>
<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
	<div class="sidebar">
	    <div class="sidebar-menu">
	        <a href="userProfile.jsp">My Profile</a>
	        <a href="userApplications.jsp" class="active">Applications</a>
	        <a href="userAppointments.jsp">Appointments</a>
	        <a href="userOrganizations.jsp">Pet Organizations</a>
	        <a href="userPets.jsp">Find Your Pet</a>
	        <a href="submits.jsp">Adopt a Pet</a>
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
    		<h2>My Applications</h2>
	    	<table class="table table-light table-striped">
	    		<thead>
		    		<tr>
		    			<th scope="col">Application ID</th>
		    			<th scope="col">Status</th>
		    			<th scope="col">Make Appointment</th>
		    		</tr>
		    	</thead>
		    	<tbody>
		    		<%
		    		try {
		                java.sql.Connection con;
		                
		                con = new Database().getConnection();
		               
		                Statement stmt = con.createStatement();
		                
		                // Retrieve userID from session to query this user's applications
		                String userID = (String) session.getAttribute("userID");
		                String query = "SELECT ApplicationID, AppStatus FROM submits NATURAL JOIN applications WHERE UserID = '" + userID + "'";
		                
		                ResultSet rs = stmt.executeQuery(query);
		                
		                // Third column is for conditional button to make appointment based on whether application is accepted
		                while (rs.next()) {
		                	if (rs.getString(2).equals("2")) {
		                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + "Approved" + "</td>" + "<td><a href=\"creates.jsp\"><button type=\"button\" class=\"btn btn-primary\">Make Appointment</button></a></td>" + "</tr>");
		                	}
		                	else if (rs.getString(2).equals("1")) {
		                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + "Denied" + "</td>" + "<td>Denied</td>" + "</tr>");
		                	}
		                	else {
		                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + "Pending" + "</td>" + "<td>TBD</td>" + "</tr>");
		                	}
		             		
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
</body>
</html>