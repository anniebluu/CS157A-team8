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

</head>
<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
    <div class="sidebar">
        <a href="userProfile.jsp">My Profile</a>
        <a href="userApplications.jsp">Applications</a>
        <a href="#">Appointments</a>
    </div>

    <div class="main-content">
    	<table border="1" style="font-size: 20px; position: absolute; top: 100px; left: 300px;">
    		<tr>
    			<td>Application ID</td>
    			<td>Status</td>
    			<td>Make Appointment</td>
    		</tr>
    		
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
                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td><a href=\"#\">Make Appointment</a></td>" + "</tr>");
                	}
                	else if (rs.getString(2).equals("1")) {
                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>Approval In-Progress</td>" + "</tr>");
                	}
                	else {
                		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>Rejected</td>" + "</tr>");
                	}
             		
                }
                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
    		
    		%>
    		
    	</table>
    </div>

</body>
</html>