<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header class="header">

	<a href="landingPage.jsp" class="logo"><i class="fas fa-paw"></i> Pet Query</a>
	
	<div class="icons" onclick="profile()">
		<div class="fas fa-user"></div>
	</div>
</header>
<script>
function profile(){
	<% if (session.getAttribute("userName") != null) { %>
		window.location = 'userProfile.jsp';
	<%} else {%>
		window.location = 'userLogin.jsp';
	<%}%>
}
</script>