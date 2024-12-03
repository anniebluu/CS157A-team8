<%@ page import="java.sql.*, cs157a.team8.database.Database"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Organizations</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">
    <!-- Link to FontAwesome for the right arrow icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>

<body>
    <h3>Pet Organizations</h3>
    
    <table class="table table-light table-striped">
        <thead>
            <tr>
                <th scope="col">Phone Number</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Pets</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    java.sql.Connection con;
                    con = new Database().getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM petorganizations");
                    while (rs.next()) {
                        out.println("<tr>" + 
                            "<td>" + rs.getString(1) + "</td>" + 
                            "<td>" + rs.getString(2) + "</td>" + 
                            "<td>" + rs.getString(3) + "</td>" + 
                            "<td>" + rs.getString(4) + "</td>" + 
                            "<td>" + 
                            "<button type=\"button\" class=\"btn btn-outline-primary\" onclick='redirectToPets(\"" + rs.getString(1)  + "\")'>" + 
                            "<i class=\"fas fa-arrow-right\"></i></button>" + 
                            "</td>" + 
                            "</tr>");
                    }
                    
                    rs.close();
                    stmt.close();
                    con.close();
                } catch(SQLException e) {
                    out.println("SQLException caught: " + e.getMessage());
                }
            %>
        </tbody>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous">
    </script>

    <script>
        function redirectToPets(organizationID) {
            // Redirect to the organization redirect page with the organization ID
            window.location.href = "organizationsRedirect.jsp?id=" + String(organizationID);
        }
    </script>
</body>

</html>
