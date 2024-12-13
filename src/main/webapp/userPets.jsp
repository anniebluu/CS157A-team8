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
				<select class="form-select" id="category" name="category" aria-label="Default select example">
					  <option id="select-all" onclick="filterSelection('all')" selected value='all'>All</option>
					  	<%
					        try {
					            java.sql.Connection con;
					            con = new Database().getConnection();
					            Statement stmt = con.createStatement();
					            ResultSet rs = stmt.executeQuery("SELECT DISTINCT Category FROM pets");
					            while (rs.next()) {
					            	String dashedString = rs.getString(1).replace(" ", "-");
					            	out.println("<option value='" + dashedString + "' onclick='filterSelection(\"" + dashedString + "\")'>" + rs.getString(1) + "</option>");
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
					
		<div class=guest-container>
			<div class="row row-cols-1 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 row-cols-xl-6 row-cols-xxl-7 justify-content-center">
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
				                 <div class="card-holder <%= category.replace(" ", "-") %>">
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
	    // reset the category to 'All' when the page is loaded/reloaded
	    window.onload = function() {
	    	filterSelection('all');
	  	  	document.getElementById("category").value = 'all';
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
