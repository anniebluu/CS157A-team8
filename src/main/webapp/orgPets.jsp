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
	<div class="container">
		
		<div class="guest-container">
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 row-cols-xl-5 justify-content-center">
					<%
						
						try {
							String orgID = request.getParameter("orgID");
								java.sql.Connection con;
								con = new Database().getConnection();
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT * FROM owns, pets WHERE owns.PetID = pets.PetID && owns.OrgID = '" + orgID + "'");
								 while (rs.next()) {
					                 String petID = rs.getString("petID");
					                 String petName = rs.getString("petName");
					                 String petAge = rs.getString("Age");
					                 String category = rs.getString("Category");
					                 String imagePath = rs.getString("imagePath");
					%>
					                 <div class="card-holder">
					                 	<div class="card h-100">
						                    <img src="<%= imagePath %>" class="card-img-top" alt="<%= petName %>">
					                         <div class="card-body">
					                             <h3 class="card-title"><%= petName %></h3>
					                             <p class="card-text"><%= petAge %></h5>
					                             <p class="card-text"><small class="text-body-secondary"><%= category %></small></h5>
					                         </div>
					                         <div class="info-row">
					                             <button type="button" onclick="window.location.href='submits.jsp?petID=<%= petID %>'">Adopt</button>
					                         </div>
					                     </div>
					                 </div>
					<%
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
	</div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous">
    </script>
</body>
</html>