package cs157a.team8.database;

import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

    private String dburl = "jdbc:mysql://localhost:3306/petquery"; // Replace with your database URL
    private String dbuname = "root"; // Replace with your database username
    private String dbpassword = "HaroldChu!00"; // Replace with your database password
    private String dbdriver = "com.mysql.cj.jdbc.Driver"; // JDBC driver for MySQL

    public Connection getConnection() {
        Connection con = null;
        try {
            // Load the JDBC driver
            Class.forName(dbdriver);

            // Establish the database connection
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
            return con;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        Database db = new Database();
        Connection conn = null;
        try {
            conn = db.getConnection();
            if (conn != null) {
                System.out.println("Database successfully connected!");
            } else {
                System.out.println("Failed to connect to the database.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
