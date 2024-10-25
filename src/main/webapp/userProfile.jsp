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
    <link rel="stylesheet" href="style.css">

</head>
<body>
    <div class="sidebar">
        <a href="#" class="active">My Profile</a>
        <a href="#">Appointments</a>
    </div>

    <div class="main-content">
        <div class="content-box">
            <div class="user-info">
                <div class="info-row">
                    <label for="username">Username:</label>
					<input type="text" id="user id" 
					value="<%= (session.getAttribute("userID") != null) ? session.getAttribute("userID") : "" %>" readonly>
					<buttongrey>Edit</buttongrey>
                    <buttongrey>Save</buttongrey>
                </div>
                <div class="info-row">
                    <label for="password">Password:</label>
                    <input type="password" id="password" value="password123" readonly>
                    <button onclick="enableEdit('password')">Edit</button>
                    <button onclick="saveInfo('password')">Save</button>
                </div>
                <div class="info-row">
                    <label for="name">Name:</label>
					<input type="text" id="Name" 
					value="<%= (session.getAttribute("userName") != null) ? session.getAttribute("userName") : "" %>" readonly>
                    <button onclick="enableEdit('name')">Edit</button>
                    <button onclick="saveInfo('name')">Save</button>
                </div>
                <div class="info-row">
                    <label for="email">Email:</label>
                    <input type="email" id="email" value="john@example.com" readonly>
                    <button onclick="enableEdit('email')">Edit</button>
                    <button onclick="saveInfo('email')">Save</button>
                </div>
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
    </script>
</body>
</html>