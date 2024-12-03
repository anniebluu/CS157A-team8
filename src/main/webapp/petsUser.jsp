<%@ page import="java.sql.*"%>
<%@ page import="cs157a.team8.database.Database"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pets</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">
    <!-- Link to FontAwesome for the right arrow icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <h3>Pets</h3>

    <table class="table table-light table-striped">
        <thead>
            <tr>
                <th scope="col">Pet ID</th>
                <th scope="col">Name</th>
                <th scope="col">Age</th>
                <th scope="col">Category</th>
                <th scope="col">Adopt?</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    java.sql.Connection con;
                    con = new Database().getConnection();
                    Statement stmt = con.createStatement();
                    // Query to get distinct categories from the pets table
                    ResultSet rs = stmt.executeQuery("SELECT DISTINCT category FROM pets");

                    while (rs.next()) {
                        String category = rs.getString(1); // Get category name
                        // Query for pets with this category
                        Statement stmt2 = con.createStatement();
                        ResultSet rs2 = stmt2.executeQuery("SELECT * FROM pets WHERE category = '" + category + "'");

                        while (rs2.next()) {
                            out.println("<tr>" + 
                                "<td>" + rs2.getString(1) + "</td>" + 
                                "<td>" + rs2.getString(2) + "</td>" + 
                                "<td>" + rs2.getString(3) + "</td>" + 
                                "<td>" + category + "</td>" + 
                                "<td>" + 
                                "<button type=\"button\" class=\"btn btn-outline-primary\" onclick='redirectToAdopt(" + "\"" + rs2.getString(1)  + "\"" + ")'>" + 
                                "<i class=\"fas fa-arrow-right\"></i></button>" + 
                                "</td>" + 
                                "</tr>");
                        }

                        rs2.close();
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
        function redirectToAdopt(petID) {
            // Redirect to the Adopt action without confirmation
            window.location.href = "AdoptPet?id=" + String(petID);
        }
    </script>
</body>

</html>
