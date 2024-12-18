<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">

	window.onload = function (){
		<% 
		if (session.getAttribute("userName") == null){
            response.sendRedirect("landingPage.jsp");  // Redirect to the landing page
        } %>		
	}
	
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Query - My Profile</title>
    
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">
		
	<link rel="stylesheet" href="style.css">
</head>

<% request.setAttribute("userProfileActive", "active"); %>

<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	<jsp:include page="sidebar.jsp"/>
	

    <div class="main-content">
        <div class="content-box">
            <div class="content-form">
				<form action="updateProfile" method="post">
	                <div class="info-row">
	                	<span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="userID">Username</span>
	                	<input type="text" id="user id" 
						value="<%= (session.getAttribute("userID") != null) ? session.getAttribute("userID") : "" %>" readonly>
						<buttongrey>Edit</buttongrey>
	                    <buttongrey>Save</buttongrey>
	                </div>
                    <div class="info-row">
                    	<span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="password">Password</span>
                        <input type="password" id="password" name="password" 
                               value="<%= (session.getAttribute("password") != null) ? session.getAttribute("password") : "" %>" readonly>
                        <button type="button" onclick="enableEdit('password')">Edit</button>
                        <button type="submit">Save</button>
                    </div>
	                <div class="info-row">                    	
	                	<span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="name">Name</span>
	                	<input type="text" id="Name" 
						value="<%= (session.getAttribute("userName") != null) ? session.getAttribute("userName") : "" %>" readonly>
	                    <buttongrey>Edit</buttongrey>
	                    <buttongrey>Save</buttongrey>
	                </div>
	                <div class="info-row">
	                    <span class="input-group-text input-group-text-profile" id="inputGroup-sizing-default" for="email">Email</span>
	                    <input type="email" id="email" value="<%= (session.getAttribute("userEmail") != null) ? session.getAttribute("userEmail") : "" %>" readonly>
	                    <buttongrey>Edit</buttongrey>
	                    <buttongrey>Save</buttongrey>
	                </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function enableEdit(fieldId) {
            const field = document.getElementById(fieldId);
            field.removeAttribute('readonly');
            field.style.backgroundColor = '#ffffff'; // Change background to white when editable
            field.style.pointerEvents = 'auto'; // Make the input clickable
            field.focus();
        }

        function saveInfo(fieldId) {
            const field = document.getElementById(fieldId);
            field.setAttribute('readonly', true);
            field.style.backgroundColor = '#e0e0e0'; // Grey out background again
            field.style.pointerEvents = 'none'; // Make the input unclickable
            alert(fieldId + " has been saved.");
            // Add your code here to handle saving the updated information
        }
        
        window.addEventListener('popstate', function (event) {
            // This will reload the page when the back button is clicked
            location.reload();
        });
    </script>
</body>
</html>