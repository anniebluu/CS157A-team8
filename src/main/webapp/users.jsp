<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<html>
<head>
  <title>Users</title>
</head>
<body>
<h2>Users</h2>

<table border="1">
  <tr>
    <td>User ID</td>
    <td>Email</td>
    <td>Name</td>
  </tr>
    <%
        try {
            java.sql.Connection con;
            con = new Database().getConnection();
           /*  out.println(db + " database successfully opened.<br/><br/>"); */

           /*  out.println("Initial entries in table \"petorganizations\": <br/>"); */
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");
            while (rs.next()) {
         out.println("<tr>" + "<td>" + rs.getString(1) + "</td>"+ "<td>" + rs.getString(2) + "</td>" + "<td>" + rs.getString(3) + "</td>" + "</tr>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
</body>
</html>