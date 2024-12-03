<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet">
    <link rel="stylesheet" href="test.css">
</head>
<body>

	<header class="header">

    <a href="#" class="logo"><i class="fas fa-paw"></i> Pet Query</a>

    	<div class="icons" onclick="location.href='http://localhost:8080/CS157A-team8/userLogin.jsp'">
        	<div class="fas fa-user"></div>
    	</div>
	</header>
	
<div class="container">
<div class="content1">
		<h3>Find your new best friend!</h3>
		<p3>Browse our available pets and Apply to adopt. </p3>
</div>
		
<div class="row justify-content-center">

<tbody>
<%
	try {
		java.sql.Connection con;
			con = new Database().getConnection();

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM pets");
			 while (rs.next()) {
                 String petID = rs.getString("petID");
                 String petName = rs.getString("petName");
                 String imagePath = rs.getString("imagePath");
                 %>
                 <div class="col-md-3 mb-3">
                     <div class="card text-center">
                         <div class="row justify-content-center">
                             <img src="<%= imagePath %>" class="img-fluid" alt="<%= petName %>">
                         </div>
                         <div class="card-body">
                             <h5 class="card-title"><%= petName %></h5>
                             <p class="card-text">Pet ID: <%= petID %></p>
                             <div class="button">
                                 <button type="button" class="btn btn-primary"
                                     onclick="location.href='http://localhost:8080/CS157A-team8/submits.jsp?petID=<%= petID %>'">
                                     Apply to Adopt!
                                 </button>
                             </div>
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
</tbody>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
