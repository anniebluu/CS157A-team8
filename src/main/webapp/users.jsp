<%@ page import="java.sql.*"%>
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
     String db = "petquery";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "Sequelrelationsystem6*";
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petquery?autoReconnect=true&useSSL=false", user, password);
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