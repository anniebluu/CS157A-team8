<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query Home</title>
    
    <!-- fontswesome cdn link -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="style.css">
	
</head>

<body>
	<!-- header section starts -->
   <header class="header">

    <a href="petQueryHome.jsp" class="logo"><i class="fas fa-paw"></i> Pet Query</a>
		<nav>
			<ul>
				<li><a href="guestOrganizations.jsp">Organizations</a></li>
				<li><a href="guestPets.jsp">Pets</a></li>
			</ul>
		</nav>

		<div class="icons" onclick="profile()"><div class="fas fa-user"></div></div>

	</header>
	<!-- header section ends -->

<div class="container">

    <div class="home">
        <h1>Welcome, <%= (session.getAttribute("userName") != null) ? session.getAttribute("userName") : "Guest" %>!</h1>
    </div>
</div>

</body>
<script>
function profile(){
	<% if (session.getAttribute("userName") != null) { %>
		window.location = 'userProfile.jsp';
	<%} else {%>
		window.location = 'userLogin.jsp';
	<%}%>
}
</script>
</html>
