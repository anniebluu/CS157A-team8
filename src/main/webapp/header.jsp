<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

	window.onload = function (){
		<% 
		if (session.getAttribute("userName") == null){
            response.sendRedirect("landingPage.jsp");  // Redirect to the landing page
        } %>	

	}
	
</script>

<header class="header">
 	<div  class="logo" onclick="home()">
 		<i class="fas fa-paw" ></i> 
 		Pet Query
 	</div>
 	<nav>
		<ul>
			<li><a href='userOrganizations.jsp' class="header-${userOrganizationsActive}">Organizations</a></li>
			<li><a href='userPets.jsp' class="header-${userPetsActive}">Pets</a></li>
		</ul>
	</nav>
	
	<div class="icons" onclick="profile()">
		<div class="fas fa-user"></div>
	</div>
</header>
<script>
function home() {
	<% if (session.getAttribute("userName") != null) { %>
	window.location = 'petQueryHome.jsp';
	<%} else {%>
		window.location = 'landingPage.jsp';
	<%}%>
}

function profile(){
	<% if (session.getAttribute("userName") != null) { %>
<%-- 		<%= ((Integer) session.getAttribute("isAdmin") == 1) ? "window.location = 'adminProfile.jsp';" : "window.location = 'userProfile.jsp';"%> --%>	
 		window.location = 'userProfile.jsp';
 	<%} else {%>
		window.location = 'userLogin.jsp';
	<%}%>
}

window.addEventListener('popstate', function (event) {
    // This will reload the page when the back button is clicked
    location.reload();
});

</script>