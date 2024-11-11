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

  </head>
  
  <body>
    <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
 	<div class="sidebar">
		<a href="javascript:void(0);" onclick="changeIframeSrc('organizations.jsp')">Organizations</a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('pets.jsp')">Pets</a>
		<a href="javascript:void(0);" onclick="changeIframeSrc('users.jsp')">Users</a>
    </div>
  
	<div class="main-content">
				
				<iframe id="frameContent" height=500px width=100% style="border:none;" title="tables"></iframe>
			
	</div>
  </body>
	<script>
	    function changeIframeSrc(src) {
	        document.getElementById('frameContent').src = src;
	    }
	</script>
</html>