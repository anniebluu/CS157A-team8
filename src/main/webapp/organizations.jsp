<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<html>
<head>
  <title>Pet Organizations</title>
</head>
<body>
<h2>Pet Organizations</h2>

<table border="1">
  <tr>
    <td>Phone Number</td>
    <td>Name</td>
    <td>Email</td>
    <td>Address</td>
  </tr>
    <%
        try {
            java.sql.Connection con;
            /* Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petquery?autoReconnect=true&useSSL=false", user, password); */
            con = new Database().getConnection();
           /*  out.println(db + " database successfully opened.<br/><br/>"); */

           /*  out.println("Initial entries in table \"petorganizations\": <br/>"); */
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM petorganizations");
            while (rs.next()) {
         out.println("<tr>" + "<td>" + rs.getString(1) + "</td>"+ "<td>" + rs.getString(2) + "</td>" + "<td>" + rs.getString(3) + "</td>" + "<td>" + rs.getString(4) + "</td>" + "</tr>");
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