<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Pet Query - Admin Pets</title>
	
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
			<a href="pets.jsp" class="active">Pets</a>
			<a href="addPet.jsp">Add Pet</a>
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
    
    <%
	    String petID = request.getParameter("petID");
		String petName = "";
		String petAge = "";
		String petCategory = "";
		String petImage = "";
		try {
 		    java.sql.Connection con;
		    con = new Database().getConnection();
		    Statement stmt = con.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT * FROM pets WHERE petID=" + petID + ";");
		    while (rs.next()) {
		    	petName = rs.getString(2);
		    	petAge = rs.getString(3);
		    	petCategory = rs.getString(4);
		    	petImage = rs.getString(5);
		    }
		    rs.close();
		    stmt.close();
		    con.close();
		} catch(SQLException e) {
		    out.println("SQLException caught: " + e.getMessage());
		}
    %>
	
    <div class="main-content">
        <div class="content-box">
            <div class="content-form">
				<form class="updatePet" action="updatePet" method="post">
					<div class="image">
						<img src="<%=petImage%>" class="card-img-top" id="pet-image">
					</div>
	                <div class="info-row">
	                	<span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="petID">Pet ID</span>
	                	<input type="text" id="petID" value="<%=petID%>" readonly>
						<buttongrey>Edit</buttongrey>
	                    <buttongrey>Save</buttongrey>
	                </div>
                    <div class="info-row">
                    	<span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="name">Pet Name</span>
                        <input type="name" id="name" name="name" 
                               value="<%=petName%>" readonly>
                        <button type="button" onclick="enableEdit('name')">Edit</button>
                        <button type="submit">Save</button>
                    </div>
	                <div class="info-row">
                    	<span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="age">Pet Age</span>
                        <input type="text" id="age" name="age" 
                               value="<%=petAge%>" readonly>
                        <button type="button" onclick="enableEdit('age')">Edit</button>
                        <button type="submit">Save</button>
                    </div>
	                <div class="info-row">
                    	<span class="input-group-text" id="inputGroup-sizing-default" for="category">Pet Category</span>
                        	<select class="form-select" id="category" name="category" aria-label="Default select example" style="font-size:1.5rem; background-color:#e0e0e0; border: 1px solid #ccc;" disabled>
							  <option selected ><%=petCategory%></option>
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
                        <button type="button" onclick="enableEdit('category')">Edit</button>
                        <button type="submit">Save</button>
                    </div>
					 <div class="info-row">
	                	<span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="image">Pet Image</span>
	                    <input type="file" class="form-control" id="image" name="image" accept="image/*" placeholder="Upload an image" readonly>
	                    <button type="button" onclick="enableEdit('image')">Edit</button>
                        <button type="submit">Save</button>
	                </div>
                </form>
            </div>
        </div>
    </div>	
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous">
	</script>
	
	<script>
        function enableEdit(fieldId) {
            const field = document.getElementById(fieldId);
            field.removeAttribute('readonly');
            field.removeAttribute('disabled');
            field.style.backgroundColor = '#ffffff'; // Change background to white when editable
            field.style.pointerEvents = 'auto'; // Make the input clickable
            field.focus();
        }

        function saveInfo(fieldId) {
            const field = document.getElementById(fieldId);
            field.setAttribute('readonly', true);
            field.style.backgroundColor = '#e0e0e0'; // Grey out background again
            field.style.pointerEvents = 'none'; // Make the input unclickable
            alert(fieldId + " has been saved.");
            // Add your code here to handle saving the updated information
        }
    </script>
   
</body>
</html>