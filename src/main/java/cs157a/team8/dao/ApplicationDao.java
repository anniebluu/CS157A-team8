package cs157a.team8.dao;

import cs157a.team8.database.Database;
import cs157a.team8.entity.Application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ApplicationDao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// method insert new Application into database
	public boolean insertApplication(String username, String petID) {
		String applicationQuery = "insert into applications (ApplicationID, AppStatus) values (?, ?)";
		String submitsQuery = "insert into submits (ApplicationID, UserID, PetID) values (?, ?, ?)";
        String adoptQuery = "insert into adopts (UserID, PetID) values (?, ?)";
        String applicationID = getNextApplicationID();
        
		con = new Database().getConnection();
		// String result="Data Entered Successfully";
		// String sql = "insert into users values(?,?,?,?,?)";

		try {
        	// added line below
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
        	ps = con.prepareStatement(applicationQuery);
            ps.setString(1, applicationID);
            ps.setInt(2, 0); // sets AppStatus = 0 (pending)
            ps.executeUpdate();
            
            ps = con.prepareStatement(adoptQuery);
            ps.setString(1, username);
            ps.setString(2, petID);
            ps.executeUpdate();
            
            ps = con.prepareStatement(submitsQuery);
            ps.setString(1, applicationID);
            ps.setString(2, username);
            ps.setString(3, petID);
            ps.executeUpdate();
            return true;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
	}
	
	// generating next appID
	public String getNextApplicationID() {
        String query = "select ApplicationID as maxID from applications order by ApplicationID desc limit 1";
        String nextID = null;
        try {
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
        	ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) // if query returned row, find max, get newID
            {
                String maxID = rs.getString("maxID");
                // figure out how to auto generate and auto increment each pet id A01, A02, etc.
                if (maxID != null) {
                	String firstInt = maxID.substring(1); // ignores A
                	int nextInt = Integer.parseInt(firstInt) + 1; // adds 1 to current max
                	nextID = "A" + String.format("%02d", nextInt); // combines and formats
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nextID;
    }
	
}