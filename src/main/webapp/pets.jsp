<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<html>
<head>
  <title>Pets</title>
</head>
<body>
<h2>Pets</h2>

<table border="1">
  <tr>
    <td>Pet ID</td>
    <td>Name</td>
    <td>Age</td>
    <td>Category</td>
  </tr>
    <%
		try {
		    java.sql.Connection con;
		    con = new Database().getConnection();
		   /*  out.println(db + " database successfully opened.<br/><br/>"); */
		
		   /*  out.println("Initial entries in table \"petorganizations\": <br/>"); */
		    Statement stmt = con.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT * FROM pets");
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