<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <!-- fontswesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="test.css">

</head>
<body>
   <!-- header section starts -->
	<jsp:include page="header.jsp"/>
	<!-- header section ends -->
	
    <div class="sidebar">
        <a href="userProfile.jsp" class="active">My Profile</a>
        <a href="userApplications.jsp">Applications</a>
        <a href="userAppointments.jsp">Appointments</a>
        <a href="displayPetsDashboard.jsp">Find Your Pet</a>
        <a href="submits.jsp">Adopt a Pet</a>
    </div>

    <div class="main-content">
        <div class="content-box">
            <div class="user-info">
                    <form action="updateProfile" method="post">
                    <div class="info-row">
                    <label for="username">Username:</label>
					<input type="text" id="user id" 
					value="<%= (session.getAttribute("userID") != null) ? session.getAttribute("userID") : session.getAttribute("userID") %>" readonly>
					<buttongrey>Edit</buttongrey>
                    <buttongrey>Save</buttongrey>
                </div>
                    <div class="info-row">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" 
                               value="<%= (session.getAttribute("password") != null) ? session.getAttribute("password") : "" %>" readonly>
                        <button type="button" onclick="enableEdit('password')">Edit</button>
                        <button type="submit">Save</button>
                    </div>
                <div class="info-row">
                    <label for="name">Name:</label>
					<input type="text" id="Name" 
					value="<%= (session.getAttribute("userName") != null) ? session.getAttribute("userName") : "" %>" readonly>
                    <buttongrey>Edit</buttongrey>
                    <buttongrey>Save</buttongrey>
                </div>
                <div class="info-row">
                    <label for="email">Email:</label>
                    <input type="email" id="email" value="<%= (session.getAttribute("userEmail") != null) ? session.getAttribute("userEmail") : "" %>" readonly>
                    <buttongrey>Edit</buttongrey>
                    <buttongrey>Save</buttongrey>
                </div>
                </form>
            </div>
        </div>
       	<!-- Bottom-left button to redirect to petQueryHome.jsp -->
        <div class="bottom-left">
            <button onclick="window.location.href='petQueryHome.jsp'" class="btn btn-secondary">Home</button>
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
    </script>
    <style>
        /* Position the button at the bottom left */
        .bottom-left {
            position: absolute;
            bottom: 20px;
            left: 20px;
        }

        .bottom-left .btn {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }

        .bottom-left .btn:hover {
            background-color: #5a6268;
        }
    </style>
</body>
</html>