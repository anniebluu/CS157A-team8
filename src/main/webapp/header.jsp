<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header class="header">
 	<div  class="logo" onclick="home()">
 		<i class="fas fa-paw" ></i> 
 		Pet Query
 	</div>
 	<nav>
		<ul>
			<li><a href='<%= (session.getAttribute("userName") != null)? "userOrganizations.jsp":  "guestOrganizations.jsp"%>' class="header-${userOrganizationsActive}">Organizations</a></li>
			<li><a href='<%= (session.getAttribute("userName") != null)? "userPets.jsp":  "guestPets.jsp"%>' class="header-${userPetseActive}">Pets</a></li>
		</ul>
	</nav>
	
	<div class="icons" onclick="profile()">
		<div class="fas fa-user"></div>
	</div>
</header>
<script>userPetseActive
function home() {
	<% if (session.getAttribute("userName") != null) { %>
	window.location = 'petQueryHome.jsp';
	<%} else {%>
		window.location = 'landingPage.jsp';
	<%}%>
}

function profile(){
	<% if (session.getAttribute("userName") != null) { %>
		window.location = 'userProfile.jsp';
	<%} else {%>
		window.location = 'userLogin.jsp';
	<%}%>
}
</script>