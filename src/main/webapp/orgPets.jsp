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
								if (!rs.next()){
								%>
								<div class="home">
								<h2>Sorry!</h2>
								<h3>This organization currently has no pets up for adoption :(</h3>
								</div>	
								<%} else {
									do {
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
						                             <button class="adopt-button" type="button" onclick="adopt(<%= petID %>)">Adopt</button>
						                         </div>
						                     </div>
						                 </div>
						<%
									 } while (rs.next());
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
	
    
    <script>
    window.onload = function() {
  	  	// disable buttons for admin
  	  <% if (session.getAttribute("userName") != null){ 
  	  		if ((Integer) session.getAttribute("isAdmin") == 1) {%>
		  	  	var elems = document.getElementsByClassName('adopt-button');
			  	for(var i = 0; i < elems.length; i++) {
			  	    elems[i].disabled = true;
			  	}
	  	<% 	}
  	  	} %>
    }
    
 	// handle adopt button
    function adopt(petID) {
    	<% if (session.getAttribute("userName") != null ) { %>
		    // logged in
    	 	<% if ((Integer) session.getAttribute("isAdmin") == 0) {%>
		    	 	// is a regular user
			    	window.location.href='submits.jsp?petID='+ petID;
    	 	<%} else {%>
    	 			// admin
    	 			window.location.href='userOrganizations.jsp'; // it should not get here, but just in case
    	 	<%} %>
		<%} else {%>
	    		// not logged in 
		    	window.location = 'userLogin.jsp';
    	<%}  %>
    }
    
    
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous">
    </script>
</body>
</html>