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
	 
	<style>
		/* The "show" class is added to the filtered elements */
		.card-holder {
			display: none;
		}
		
		.show {
		  display: inline;
		}
	</style>
</head>

<% request.setAttribute("userPetsActive", "active"); %>

<body>

   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->

	<div class="container">
		<nav>
			<div class="input-group mb-3" style="top: 20px;">
				<select class="form-select" id="category" name="category" aria-label="Default select example" onchange="filterSelection(this.value)">
					  <option value="all" <% if (request.getParameter("category") == null || request.getParameter("category").equals("all")) out.print("selected"); %>>All</option>
					  	<%
					        try {
					            java.sql.Connection con;
					            con = new Database().getConnection();
					            Statement stmt = con.createStatement();
					            ResultSet rs = stmt.executeQuery("SELECT DISTINCT Category FROM pets");
					            while (rs.next()) {
					            	String dashedString = rs.getString(1).replace(" ", "-");
					            	out.println("<option value='" + dashedString + "' " + (request.getParameter("category") != null && request.getParameter("category").equals(dashedString) ? "selected" : "") + ">" + rs.getString(1) + "</option>");
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
		</nav>
					
		<div class="guest-container">
			<div class="row row-cols-1 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-6 row-cols-xxl-7 justify-content-center">
				<%
					String categoryFilter = request.getParameter("category");
					if (categoryFilter == null || categoryFilter.equals("all")) {
						categoryFilter = "";
					} else {
						categoryFilter = categoryFilter.replace("-", " "); // Convert dashed to space-separated string
					}

					try {
						java.sql.Connection con;
						con = new Database().getConnection();
						Statement stmt = con.createStatement();
						String query = "SELECT * FROM pets";
						if (!categoryFilter.equals("")) {
							query += " WHERE Category = ?";
						}
						PreparedStatement pstmt = con.prepareStatement(query);
						if (!categoryFilter.equals("")) {
							pstmt.setString(1, categoryFilter);
						}
						ResultSet rs = pstmt.executeQuery();
						
						while (rs.next()) {
				                 String petID = rs.getString("petID");
				                 String petName = rs.getString("petName");
				                 String petAge = rs.getString("Age");
				                 String category = rs.getString("Category");
				                 String imagePath = rs.getString("imagePath");
				%>
				                 <div class="card-holder <%= category.replace(" ", "-") %>">
				                 	<div class="card h-100">
					                    <img src="<%= imagePath %>" class="card-img-top" alt="<%= petName %>">
				                         <div class="card-body">
				                             <h3 class="card-title"><%= petName %></h3>
				                             <p class="card-text"><%= petAge %></p>
				                             <p class="card-text"><small class="text-body-secondary"><%= category %></small></p>
				                         </div>
				                         <div class="info-row">
				                             <button class="adopt-button" type="button" onclick="adopt(<%= petID %>)">Adopt</button>
				                         </div>
				                     </div>
				                 </div>
				<%
							 }
								 rs.close();
					             pstmt.close();
					             con.close();
							} catch(SQLException e) {
								out.println("SQLException caught: " + e.getMessage());
							}
				%>
			</div>
		</div>
	</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
	    // reset the category to 'All' when the page is loaded/reloaded
	    window.onload = function() {
	    	filterSelection('all');
	  	  	document.getElementById("category").value = '<%= request.getParameter("category") != null ? request.getParameter("category") : "all" %>';
	  	  	
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
	    	 			window.location.href='userPets.jsp'; // it should not get here, but just in case
	    	 	<%} %>
    		<%} else {%>
		    		// not logged in 
			    	window.location = 'userLogin.jsp';
	    	<%}  %>
	    }
	    
	    // filter the selection
	    function filterSelection(c) { 
			var x, i;
			x = document.getElementsByClassName("card-holder");
			if (c == "all")
				c = "";
			// Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
			for (i = 0; i < x.length; i++) {
				categoryRemoveClass(x[i], "show");
				if (x[i].className.indexOf(c) > -1)
					categoryAddClass(x[i], "show");
			}
		}
		
		// Show filtered elements
		function categoryAddClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				if (arr1.indexOf(arr2[i]) == -1) {
					element.className += " " + arr2[i];
				}
			}
		}
		
		// Hide elements that are not selected
		function categoryRemoveClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				while (arr1.indexOf(arr2[i]) > -1) {
					arr1.splice(arr1.indexOf(arr2[i]), 1);
				}
			}
			element.className = arr1.join(" ");
		}
	</script>
	
</body>
</html>
