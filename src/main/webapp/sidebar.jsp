<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <div class="sidebar">
    <div class="sidebar-menu">
        <a href="userProfile.jsp" class="${userProfileActive}">My Profile</a>
        <a href="userApplications.jsp" class="${userApplicationsActive}">Applications</a>
        <a href="userAppointments.jsp" class="${userAppointmentseActive}">Appointments</a>
   </div>
    <div class="logout">
	    <form action="Logout" method="POST">
	    	<div class="info-row">
				<button type="submit" class="btn btn-secondary btn-lg">Log Out</button>
			</div>
		
	    </form>
    </div>
   </div>