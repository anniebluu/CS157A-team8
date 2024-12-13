<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">

	window.onload = function (){
		<% 
		if (session.getAttribute("userName") == null){
            response.sendRedirect("landingPage.jsp");  // Redirect to the landing page
        } else {%>	
		<% 
		if ((Integer) session.getAttribute("isAdmin") == 0){
            response.sendRedirect("petQueryHome.jsp");  // Redirect to the landing page
        } }%>		
	}
	
</script>

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
<% request.setAttribute("adminAddPetsActive", "active"); %>

<body>
	<!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
    <jsp:include page="sidebar.jsp"/>

    
	<div class="main-content">
           
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
	            
	            <%
		            int newPetID = 0;
			        try {
			            java.sql.Connection con;
			            con = new Database().getConnection();
			            Statement stmt = con.createStatement();
			            ResultSet rs = stmt.executeQuery("SELECT MAX(CAST(PetID AS SIGNED)) FROM pets;");
			            while (rs.next()) {
			            	newPetID = rs.getInt(1) + 1;
			            }
			            rs.close();
			            stmt.close();
			            con.close();
			        } catch(SQLException e) {
			            out.println("SQLException caught: " + e.getMessage());
			        }
	            %>
	            
	            <form action="AddPet" method="post" enctype="multipart/form-data">
	                <div class="input-group mb-3">
	                    <span class="input-group-text" id="inputGroup-sizing-default" for="petID">Pet ID</span>
	                    <input type="text" class="form-control" id="petID" name="petID" value="<%=newPetID%>" readonly>
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
	                    <span class="input-group-text" id="inputGroup-sizing-default" for="category">Pet Category</span>
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
	                	<span class="input-group-text" id="inputGroup-sizing-default" for="petImage">Pet Image</span>
	                    <input type="file" class="form-control" id="image" name="image" accept="image/*" placeholder="Upload an image" required>
	                </div>
	                
	               	<div class="input-group mb-3">
	                    <span class="input-group-text" id="inputGroup-sizing-default" for="petOrg">Pet Organization</span>
	                    <!-- <input type="text" class="form-control" id="category" name="category" placeholder="Enter Category: Dog & Puppies, Cat & Kittens, Rabbits, etc." required> -->
	                    <select class="form-select" id="petOrg" name="petOrg" aria-label="Default select example">
						  <option selected>Select Pet Organization</option>
						  	<%
						        try {
						            java.sql.Connection con;
						            con = new Database().getConnection();
						            Statement stmt = con.createStatement();
						            ResultSet rs = stmt.executeQuery("SELECT DISTINCT OrgID, OrgName FROM petorganizations");
						            while (rs.next()) {
						            	out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
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
	                                
	                <div class="info-row">
	                    <button type="submit">Add Pet</button>
	                </div>
	            </form>
            </div>
		</div>
	</div>
</body>
</html>
