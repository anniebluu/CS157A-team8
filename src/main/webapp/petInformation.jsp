<%@ page import="java.sql.*, cs157a.team8.database.Database"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pet Display</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <h3>Pet Details</h3>
    
    <%
        String orgID = request.getParameter("orgID");
        if (orgID != null && !orgID.isEmpty()) {
            try {
                java.sql.Connection con;
                con = new Database().getConnection();
                Statement stmt = con.createStatement();
                // Extract last 8 digits of orgID to fetch matching pets from the pets table
                String query = "SELECT * FROM pets WHERE petID LIKE '" + orgID.substring(4) + "-%'";
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    String petID = rs.getString("petID");
                    String petName = rs.getString("petName");
                    String age = rs.getString("age");
                    String category = rs.getString("category");
                    String imagePath = rs.getString("imagePath");
                    %>
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <img src="<%= imagePath %>" alt="<%= petName %>" class="img-fluid">
                        </div>
                        <div class="col-md-8">
                            <h4><%= petName %></h4>
                            <p><strong>Age:</strong> <%= age %></p>
                            <p><strong>Category:</strong> <%= category %></p>
                            <p><strong>Pet ID:</strong> <%= petID %></p>
                        </div>
                    </div>
                    <%
                }
                rs.close();
                stmt.close();
                con.close();
            } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        }
    %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous">
    </script>
</body>

</html>
