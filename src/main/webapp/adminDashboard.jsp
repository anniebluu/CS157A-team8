<!-- http://localhost:8080/Registration_Luu/memberRegister.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>

  <head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
  </head>
  <style>
 	header {
 		background-color: gray;
 		display: flex;
 		align-items: center;
 	}
 	
 	header h2 {
 		padding: 10px;
 	}
 	
	.search-container {
		display: flex;              /* Flexbox for alignment */
		justify-content: center;
		margin-left: 30px;
		margin-right: 30px;
	}

	.search-container input[type="text"] {
		width: 1000px;              /* Increased width of the input */
		padding: 10px;             /* Increased padding for a larger look */
		border: 1px solid #ccc;    /* Border styling */
		border-radius: 4px;        /* Rounded corners */
		font-size: 18px;           /* Larger font size */
	}
	
	.search-container button {
		padding: 10px 15px; 
		border: none;
		background-color: white;
		font-size: 18px;
		margin-left: 5px;  
		cursor: pointer;            /* Pointer cursor on hover */
	}
	
	.search-container button:hover {
		background-color: yellow;
	}
    
    .dropdown {
    	float: right;
    	overflow: hidden; /* Clear floats */
    }
    
  	.dropdown .dropbtn {
  		padding: 10px 15px; 
  		font-size: 18px;
  		border: none;
  		cursor: pointer;
  	}
  	
  	.dropdown .dropbtn:hover {
  		background-color: yellow;
  	}
  	
  	.dropdown-content {
		display: none; /* Hidden by default */
		position: absolute; /* Position absolutely */
		background-color: white; /* White background */
		min-width: 160px; /* Minimum width */
		box-shadow: 0px 8px 16px rgba(0,0,0,0.2); /* Shadow effect */
		z-index: 1; /* Layer above other content */
	}
	
	.dropdown-content a {
		color: black; /* Text color */
		padding: 12px 16px; /* Padding inside dropdown items */
		text-decoration: none; /* Remove underline */
		display: block; /* Display as block */
	}
	
	/* Change background color on hover */
	.dropdown-content a:hover {
		background-color: #f1f1f1; /* Light gray background on hover */
	}

	/* Show the dropdown content on hover */
	.dropdown:hover .dropdown-content {
		display: block; /* Show dropdown */
	}

	/* Change background color on hover */
	.dropdown:hover .dropbtn {
		background-color: #555; /* Darker gray on hover */
	}
	
	section {
		display: flex;
		height: 80vh;
		background-color: #D3D3D3;
	}
        
  	nav {
  		display: flex;
  		background-color: #A9A9A9;
  		padding: 15px;
  	}
  	
	nav ul {
		list-style-type: none;
		padding: 0;
	}
	
	nav ul a {
		text-decoration: none; /* Remove underline */
		color: white;
    	padding: 14px 20px;   /* Add padding for better click area */
	}
	
	nav ul a:hover {
		color: yellow;
		
	}
	
	footer {
		display: flex;
 		background-color: gray;
 		
 	}
 	
  </style>
  
  <body>
  
	<header>
		<h2>Pet Query</h2>
		
		<div class="search-container">
		     <form action="/search" method="GET"> <!-- Replace with your search action -->
	            <input type="text" placeholder="Search..." name="query" required>
	            <button type="submit">Search</button>
        	</form>
		</div>

		<div class="dropdown" style="float:right;">
		  <button class="dropbtn">UserID</button>
		  <div class="dropdown-content">
		    <a href="#">User Profile</a>
		    <a href="#">Sign Out</a>
		  </div>
		</div>
		
		
	</header>
	
	<section>
		<nav>
			<ul>
                <li><a href="javascript:void(0);" onclick="changeIframeSrc('organizations.jsp')">Organizations</a></li>
                <li><a href="javascript:void(0);" onclick="changeIframeSrc('pets.jsp')">Pets</a></li>
               <!--  <li><a href="javascript:void(0);" onclick="changeIframeSrc('adoptions.jsp')">Adoptions</a></li> -->
                <li><a href="javascript:void(0);" onclick="changeIframeSrc('users.jsp')">Users</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="changeIframeSrc('employees.jsp')">Employees</a></li> -->
			</ul>
		</nav>
		
		<iframe id="frameContent" height=500px width=100% style="border:none;" title="tables"></iframe>
	</section>
	
	<footer>
		<p>Copyright © 2024 Pet Query</p>
	</footer>
  </body>
	<script>
	    function changeIframeSrc(src) {
	        document.getElementById('frameContent').src = src;
	    }
	</script>
</html>