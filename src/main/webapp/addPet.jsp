<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - Add Pet</title>
    
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
	 		<a href="adminProfile.jsp">My Profile</a>
			<a href="organizations.jsp">Organizations</a>
			<a href="addOrganization.jsp">Add Organization</a>
			<a href="pets.jsp">Pets</a>
			<a href="addPet.jsp" class="active">Add Pet</a>
			<a href="users.jsp">Users</a>
			<a href="applications.jsp">Applications</a>
			<a href="appointments.jsp">Appointments</a>
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
		<h2>Add A New Pet</h2>
           
		<div class=content-box>
			<div class="content-form">

	            <!-- check alert msg -->
	            <%
	                String alert = (String) request.getAttribute("alert");
	                if (alert != null) {
	            %>
	                <div class="alert alert-danger" role="alert">
	                    <%= alert %>
	                </div>
	            <%
	                }
	            %>
	            
	            <form action="AddPet" method="post" enctype="multipart/form-data">
	                <div class="input-group mb-3">
	                    <span class="input-group-text" id="inputGroup-sizing-default" for="petID">Pet ID</span>
	                    <input type="text" class="form-control" id="petID" name="petID" placeholder="Enter New Pet ID (xxx-xxxx-xxx)" required>
	                </div>
	
	                <div class="input-group mb-3">
	                    <span class="input-group-text" id="inputGroup-sizing-default" for="petName">Pet Name</span>
	                    <input type="text" class="form-control" id="petName" name="petName" placeholder="Enter Pet Name" required>
	                </div>
	
	                <div class="input-group mb-3">
	                   <span class="input-group-text" id="inputGroup-sizing-default" for="age">Pet Age</span>
	                    <input type="text" class="form-control" id="age" name="age" placeholder="Enter Pet Age (years, months)" required>
	                </div>
	
	                <div class="input-group mb-3">
	                    <span class="input-group-text" id="inputGroup-sizing-default" for="petName">Category</span>
	                    <!-- <input type="text" class="form-control" id="category" name="category" placeholder="Enter Category: Dog & Puppies, Cat & Kittens, Rabbits, etc." required> -->
	                    <select class="form-select" id="category" name="category" aria-label="Default select example">
						  <option selected>Select Category: Rabbits & Bunnies, Dogs & Puppies, Cats & Kittens, etc.</option>
						  	<%
						        try {
						            java.sql.Connection con;
						            con = new Database().getConnection();
						            Statement stmt = con.createStatement();
						            ResultSet rs = stmt.executeQuery("SELECT DISTINCT Category FROM pets");
						            while (rs.next()) {
						            	out.println("<option>" + rs.getString(1) + "</option>");
						            }
						            rs.close();
						            stmt.close();
						            con.close();
						        } catch(SQLException e) {
						            out.println("SQLException caught: " + e.getMessage());
						        }
						    %>
						</select>
	                </div>
	
	                <div class="input-group mb-3">
	                	<span class="input-group-text" id="inputGroup-sizing-default" for="petName">Pet Image</span>
	                    <input type="file" class="form-control" id="image" name="image" accept="image/*" placeholder="Upload an image" required>
	                </div>
	                                
	                <div class="info-row">
	                    <button type="submit" class="btn btn-primary">Add Pet</button>
	                </div>
	            </form>
            </div>
		</div>
	</div>
</body>
</html>
