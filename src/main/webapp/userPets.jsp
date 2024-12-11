<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Find Your New Best Friend!</title>

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
	        <a href="userApplications.jsp">Applications</a>
	        <a href="userAppointments.jsp">Appointments</a>
	        <a href="userOrganizations.jsp">Pet Organizations</a>
	        <a href="userPets.jsp" class="active">Find Your Pet</a>
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
		<h2>Find Your New Best Friend</h2>
<!-- 			<div class="content1">
					
					<p3>Browse our available pets and Apply to adopt. </p3>
					
					<form action="Search" method="Get">
			            <div class="row justify-content-center">
			                
			                <div class="col-md-8">
			                    <input type="text" class="form-control" name="Search" placeholder="Search for specific pets..." required>
			                </div>
			                <div class="col-md-2">
			                    <button type="submit" class="btn btn-primary">Search</button>
			                </div>
			                
			            </div>
			        </form>
			</div> -->
			

				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 row-cols-xl-5 justify-content-center">
					<%
						try {
							java.sql.Connection con;
								con = new Database().getConnection();
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT * FROM pets");
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
