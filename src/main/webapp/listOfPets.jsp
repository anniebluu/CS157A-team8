<%@ page import="java.sql.*" %>
<%@ page import="cs157a.team8.database.Database" %>

<html>
<head>
    <title>Pet List</title>
    <style>
        /* Reset body and html margins and padding */
        html, body {
            margin: 0;
            padding: 0;
            width: 100%; 
            height: 100%;
            overflow-x: hidden; /* Prevent horizontal scrolling */
            background-image: url('images/login.png');
            background-repeat: repeat;
            background-position: center;
            color: white; /* Set the font color to white */
            font-family: Arial, sans-serif; /* Clean font */
        }

        /* Container for the pet boxes */
        .pet-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            max-width: 1200px;
            width: 100%;
            padding-top: 30px; /* 30px padding at the top */
            margin: 0 auto;
        }

        /* Individual pet box style */
        .pet-box {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 200px;
            height: 200px;
            background-color: rgba(105, 105, 105, 0.8); /* Dark grey with transparency */
            border-radius: 15px;
            text-align: center;
            line-height: 1.2;
            font-size: 18px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Hover effect for pet boxes */
        .pet-box:hover {
            background-color: rgba(105, 105, 105, 1); /* Darker grey on hover */
        }

        /* Ensures the boxes are properly aligned in rows */
        .pet-container .pet-box:nth-child(4n+1) {
            margin-left: 0;
        }
    </style>
</head>
<body>
    <h2>List of Pets</h2>

    <div class="pet-container">
        <%
            try {
                java.sql.Connection con = new Database().getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM pets"); // Adjust the query if necessary
                
                int petCount = 1; // Counter for pet labels (Pet 1, Pet 2, etc.)
                while (rs.next()) {
                    // Get the pet name from the database (rs.getString(2) represents the name column)
                    String petName = rs.getString(2); 
        %>
                    <!-- Dynamically create the pet boxes -->
                    <div class="pet-box">
                        <%= "Pet " + petCount %> <!-- Label the pet as Pet 1, Pet 2, etc. -->
                    </div>
        <%
                    petCount++; // Increment pet counter
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>
