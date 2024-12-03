<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Appointments</title>
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
	      justify-content: center;
	      align-items: center;
	      padding: 10px;
	      margin-top: 75px;
	      overflow: auto;
	      height: auto;
	      margin-bottom: 75px;">

<!--     	<div>
    		<h1 style="position: absolute; top: 100px; left: 300px;"> My Appointments </h1>
    	</div>
    	<table border="1" style="font-size: 20px; position: absolute; top: 150px; left: 300px;"> -->
    	 <table class="table table-light table-striped"">
    	 <thead>
    		<tr>
    			<th scope="col">Appointment ID</th>
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
                
                // Retrieve userID from session to query this user's appointments
                String userID = (String) session.getAttribute("userID");
                String query = "SELECT AppointmentID, Date, Time FROM creates NATURAL JOIN appointments WHERE UserID = '" + userID + "'";
                
                ResultSet rs = stmt.executeQuery(query);
                
                while (rs.next()) {
                	out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" 
                		+ "<td>" + rs.getString(2) + "</td>" 
                		+ "<td>" + rs.getString(3) + "</td>"
                		+ "<td><button type=\"button\" class=\"btn btn-outline-danger\" onclick='confirmCancel(" + "\"" + rs.getString(1)  + "\"" + ")'>Cancel</button></td>"
                		+ "<td></td>" + "</tr>");
             		
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
<!--     </div> -->
    
    <script>
       function confirmCancel(appointmentID) {
           if (confirm("Cancel?")) {
               // If confirmed, call delete function
               window.location.href = "CancelAppointment?id=" + String(appointmentID);
           }
       }
   </script>

</body>
</html>