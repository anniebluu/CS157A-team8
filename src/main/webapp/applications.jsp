<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<html>
<head>
  <title>Applications</title>
  
  <style>
  	.approve-color {
  		background-color: lightgreen;
  	}
  	.reject-color {
  		background-color: lightcoral;
  	}
  </style>
  
</head>
<body>
<h2>Applications</h2>

<table border="1">
  <tr>
    <td>Application ID</td>
    <td>UserID</td>
    <td>PetID</td>
    <td>Status</td>
    <td>Approve</td>
    <td>Reject</td>
  </tr>
    <%
        try {
            java.sql.Connection con;
            con = new Database().getConnection();

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM submits NATURAL JOIN applications");
                        
            while (rs.next()) {
         		out.println("<tr>" + "<td>" + rs.getString(1) + "</td>"+ "<td>" + rs.getString(2) + "</td>" + "<td>" + rs.getString(3) + "</td>" + "<td>" + rs.getString(4) + "</td>"
            		+ "<td><form action=\"SetApplication\" method=\"post\"><input type=\"hidden\" name=\"appId\" value=\"" + rs.getString(1) + "\"/><button class=\"approve-color\" type=\"submit\" name=\"action\" value=\"approve\">Approve</button></form></td>" 
         			+ "<td><form action=\"SetApplication\" method=\"post\"><input type=\"hidden\" name=\"appId\" value=\"" + rs.getString(1) + "\"/><button class=\"reject-color\" type=\"submit\" name=\"action\" value=\"reject\">Reject</button></form></td>" 
            		+ "</tr>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
</table>
</body>
</html>