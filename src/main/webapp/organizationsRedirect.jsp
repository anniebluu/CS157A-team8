<%@ page import="java.sql.*, cs157a.team8.database.Database"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Pets by Organization</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">
    <!-- Link to FontAwesome for the right arrow icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        /* Add custom padding to each row */
        .table tbody tr {
            margin-bottom: 10px;  /* Adds space below each row */
        }
        
        /* Optional: Add more space inside the cells */
        .table td {
            padding: 15px; /* Adjust padding as per your preference */
        }
    </style>
</head>

<body>
    <h3>Pets by Organization</h3>
    
    <%
        String orgID = request.getParameter("id");  // Get the orgID passed in the URL

        // Extract the last 8 digits of the orgID (e.g., 262-2133 from 408-262-2133)
        String orgIDSub = orgID.substring(orgID.indexOf("-") + 1);
        
        try {
            java.sql.Connection con;
            con = new Database().getConnection();
            Statement stmt = con.createStatement();
            // Query to get pets matching the last 8 digits of the orgID
            String query = "SELECT * FROM pets WHERE petID LIKE '" + orgIDSub + "-%'";
            ResultSet rs = stmt.executeQuery(query);
            
            // Check if any pets exist
            if (!rs.next()) {
                out.println("<p>No pets found for this organization.</p>");
            } else {
                // Display the results if pets are found
                out.println("<table class=\"table table-light table-striped\">" +
                            "<thead>" +
                            "<tr>" +
                            "<th scope=\"col\">Pet ID</th>" +
                            "<th scope=\"col\">Name</th>" +
                            "<th scope=\"col\">Age</th>" +
                            "<th scope=\"col\">Category</th>" +
                            "<th scope=\"col\">Adopt?</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>");
                
                // Iterate through all the results
                do {
                    out.println("<tr>" +
                                "<td>" + rs.getString(1) + "</td>" +
                                "<td>" + rs.getString(2) + "</td>" +
                                "<td>" + rs.getString(3) + "</td>" +
                                "<td>" + rs.getString(4) + "</td>" +
                                "<td>" + 
                                "<button type=\"button\" class=\"btn btn-outline-primary\" onclick='redirectToSubmits(\"" + rs.getString(1)  + "\")'>" +
                                "<i class=\"fas fa-arrow-right\"></i> View Pet</button>" +
                                "</td>" +
                                "</tr>");
                } while (rs.next());  // Continue iterating through results
                
                out.println("</tbody></table>");
            }
            
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous">
    </script>

    <script>
        function redirectToSubmits(petID) {
            // Redirect to submits.jsp with the petID as a query parameter
            window.location.href = "submits.jsp?petID=" + petID;
        }
    </script>
</body>

</html>
