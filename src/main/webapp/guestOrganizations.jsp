<%@ page import="java.sql.*, cs157a.team8.database.Database"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Organizations</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">
    <!-- Link to FontAwesome for the right arrow icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" href="style.css">
</head>

<body>
	<!-- header section starts -->
   <header class="header">
    	<jsp:include page="header.jsp"/>
	</header>
	<!-- header section ends -->

    <div class=container>
		
		<div class="org-container">
		<%
	        try {
	            java.sql.Connection con;
	            con = new Database().getConnection();
	            Statement stmt = con.createStatement();
	            ResultSet rs = stmt.executeQuery("SELECT * FROM petorganizations");
	            while (rs.next()) {
	                String orgID = rs.getString(1);
	                String orgName = rs.getString(2);
	                out.println("<a href='orgPets.jsp?orgID=" + orgID + "' class='org-button'>" + orgName + "</a>");
	            }
	            rs.close();
	            stmt.close();
	            con.close();
	        } catch(SQLException e) {
	            out.println("SQLException caught: " + e.getMessage());
	        }
	    %>
		</div>
	</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous">
    </script>

    <script>
        function redirectToPets(organizationID) {
            // Redirect to the organization redirect page with the organization ID
            window.location.href = "organizationsRedirect.jsp?id=" + String(organizationID);
        }
    </script>
</body>
</html>

