<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
		if (session.getAttribute("userName") == null){
            response.sendRedirect("landingPage.jsp");  // Redirect to the landing page
        } else {%>	
   <div class="sidebar">
    <div class="sidebar-menu">
        <a href="userProfile.jsp" class="${userProfileActive}">My Profile</a>
        <% if ((Integer) session.getAttribute("isAdmin") == 0) { %>
	        <a href="userApplications.jsp" class="${userApplicationsActive}">Applications</a>
	        <a href="userAppointments.jsp" class="${userAppointmentseActive}">Appointments</a>
   		<% } else { %> 
			<a href="organizations.jsp" class="${adminOrganizationsActive }">Organizations</a>
			<a href="addOrganization.jsp" class="${adminAddOrganizationsActive }">Add Organization</a>
			<a href="pets.jsp" class="${adminPetsActive }">Pets</a>
			<a href="addPet.jsp" class="${adminAddPetsActive }">Add Pet</a>
			<a href="users.jsp" class="${adminUsersActive }">Users</a>
			<a href="applications.jsp" class="${adminApplicationsActive }">Applications</a>
			<a href="appointments.jsp" class="${adminAppointmentsActive }">Appointments</a>
   		<% } %>
   </div>
    <div class="logout">
	    <form action="Logout" method="POST">
	    	<div class="info-row">
				<button type="submit" class="btn btn-secondary btn-lg">Log Out</button>
			</div>
		
	    </form>
    </div>
   </div>
   <% }%>
 