<%@ page import="java.sql.*, cs157a.team8.database.Database"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Pet Organizations</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="style.css">

	
</head>

<% request.setAttribute("userOrganizationsActive", "active"); %>


<body>

	<!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->

<%-- 	<jsp:include page="sidebar.jsp"/>
 --%>	

	<div class="main-content no-sidebar">
    	<div class="content-table">
	    	<h2>Pet Organizations</h2>
	    
		    <table class="table table-light table-striped">
		        <thead>
		            <tr>
		                <th scope="col">Phone Number</th>
		                <th scope="col">Name</th>
		                <th scope="col">Email</th>
		                <th scope="col">Address</th>
		                <th scope="col">URL</th>
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
		                            "<td>" + 
		                            "<button type=\"button\" class=\"btn btn-outline-primary\" onclick='openURL(\"" + rs.getString(5)  + "\")'>" + 
		                            "<i class=\"fas fa-arrow-right\"></i></button>" + 
		                            "</td>" + 
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
        function openURL(url) {
            // Redirect to the organization redirect page with the organization ID
        	window.open(url, '_blank').focus();
        }
    </script>
    
    <!-- <title>Pet Organizations</title>

</head>
<body>

	<h2 style="text-align: center; margin-bottom: 30px;">Pet
		Organizations</h2>

	<div class="org-container">
<%-- 		<%
        try {
            java.sql.Connection con;
            con = new Database().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM petorganizations");
            int count = 0;
            while (rs.next()) {
                String orgName = rs.getString(2);
                out.println("<a href='listOfpets.jsp?orgName=" + orgName + "' class='org-button'>" + orgName + "</a>");
                count++;
                if (count % 4 == 0) {
                    out.println("<div style='flex-basis: 100%;'></div>"); 
                }
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %> --%>
	</div> -->
	
</body>

</html>
