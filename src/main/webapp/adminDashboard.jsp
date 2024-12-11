<!-- http://localhost:8080/Registration_Luu/memberRegister.jsp -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" 
	crossorigin="anonymous"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  </head>
  
  <body>
    <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
 	<div class="sidebar">
		<a href="javascript:void(0);" onclick="changeIframeSrc('organizations.jsp')"><i class="bi bi-database"> Organizations</i></a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('addOrganization.jsp')"><i class="bi bi-database-add"> Add Organization</i></a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('pets.jsp')"><i class="bi bi-database"> Pets</i></a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('addPet.jsp')"><i class="bi bi-database-add"> Add Pet</i></a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('users.jsp')"><i class="bi bi-database"> Users</i></a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('applications.jsp')"><i class="bi bi-database"> Applications</i></a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('appointments.jsp')"><i class="bi bi-database"> Appointments</i></a>
    </div>

	<div class="main-content">
				
		<iframe id="frameContent" height=100% width=100% style="border:none;" title="tables"></iframe>
			
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" 
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" 
	crossorigin="anonymous"></script>
  </body>
	<script>
	    function changeIframeSrc(src) {
	        document.getElementById('frameContent').src = src;
	    }
	</script>
</html>