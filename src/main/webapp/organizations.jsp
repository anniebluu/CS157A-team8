<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<html>
<head>
<title>Pet Organizations</title>
<style>
/* Set the background image for the page with vertical repeating */
/* Reset body and html margins and padding to prevent white space on the sides */
html, body {
  margin: 0;
  padding: 0;
  width: 100%;  /* Ensure body takes the full width of the viewport */
  height: 100%;  /* Ensure body takes the full height of the viewport */
  overflow-x: hidden; /* Prevent horizontal scrolling */
}

body {
  background-image: url('images/login.png');
  background-repeat: repeat; /* Repeat the image both horizontally and vertically */
  background-position: center;
  color: white; /* Set the font color to white */
  font-family: Arial, sans-serif; /* Set a clean font */
  display: flex;
  justify-content: center;
  align-items: flex-start; /* Align the content to the top of the page */
  flex-direction: column; /* Ensure content stacks vertically */
}

.org-container {
  display: flex;
  flex-wrap: wrap; /* Allow items to wrap onto the next row */
  justify-content: center; /* Center the buttons horizontally */
  gap: 20px; /* Space between the buttons */
  max-width: 1200px; /* Limit the container width */
  width: 100%;
  margin-top: 100px; /* Space before the buttons start */
  padding: 30px 20px 0; /* Padding on the top of the container, with padding on left/right */
}

.org-button {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 200px; /* Fixed width for all buttons */
  height: 200px; /* Fixed height for all buttons */
  margin: 10px;
  background-color: rgba(105, 105, 105, 0.8); /* Darker grey with some transparency */
  border-radius: 15px; /* Rounded corners */
  text-align: center;
  line-height: 1.2;
  font-size: 18px;
  color: white;
  font-weight: bold;
  cursor: pointer;
  text-decoration: none; /* Remove underline from links */
  transition: background-color 0.3s ease; /* Smooth transition for hover effect */
}

.org-button:hover {
  background-color: rgba(105, 105, 105, 1); /* Darker grey on hover */
}

/* Ensures that the buttons are properly aligned in rows */
.org-container .org-button:nth-child(4n+1) {
  margin-left: 0; /* Align the first button in each row to the left */
}

</style>
</head>
<body>

	<h2 style="text-align: center; margin-bottom: 30px;">Pet
		Organizations</h2>

	<div class="org-container">
		<%
        try {
            java.sql.Connection con;
            con = new Database().getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM petorganizations");
            int count = 0;
            while (rs.next()) {
                String orgName = rs.getString(2);
                out.println("<a href='listOfpets.jsp?orgName=" + orgName + "' class='org-button'>" + orgName + "</a>");
                count++;
                if (count % 4 == 0) {
                    out.println("<div style='flex-basis: 100%;'></div>"); 
                }
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
	</div>

</body>
</html>
