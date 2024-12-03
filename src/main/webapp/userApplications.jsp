<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>My Applications</title>
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
<!--     <style>
    	.apply-color {
    		background-color: lightblue;
    	}
    </style> -->
    
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
        <a href="userProfile.jsp">My Profile</a>
        <a href="userApplications.jsp">Applications</a>
        <a href="userAppointments.jsp">Appointments</a>
        <a href="displayPetsDashboard.jsp">Find Your Pet</a>
        <a href="submits.jsp">Adopt a Pet</a>
    </div>


    <div style="
    font-size:1.5rem;
   		flex: 1;
      background-color: #f0f0f0;
/*       display: flex; */
      justify-content: center;
      align-items: center;
      padding: 10px;
      margin-top: 75px;
      overflow: auto;
      height: auto;
      margin-bottom: 75px;">
<!--       <div>
   		<button class="btn btn-info" type="submit" style="font-size: 20px; position:absolute; top: 100px; left: 250px;" onClick="location.href='http://localhost:8080/CS157A-team8/submits.jsp'">Apply to adopt a pet!</button>
   	</div>
 -->
    	<!-- <table border="1" style="font-size: 20px; position: absolute; top: 150px; left: 300px;"> -->
    	<table class="table table-light table-striped"">
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
	                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td><a href=\"creates.jsp\">Approved - Make Appointment</a></td>" + "</tr>");
	                	}
	                	else if (rs.getString(2).equals("1")) {
	                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>Rejected</td>" + "</tr>");
	                	}
	                	else {
	                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>Pending</td>" + "</tr>");
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

</body>
</html>