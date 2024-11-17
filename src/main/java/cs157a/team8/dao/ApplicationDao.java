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
	public boolean insertApplication(String applicationID, String username, String petID) {
		String applicationQuery = "insert into applications (ApplicationID, AppStatus) values (?, ?)";
        String adoptQuery = "insert into adopts (UserID, PetID) values (?, ?)";
		
		con = new Database().getConnection();
		// String result="Data Entered Successfully";
		// String sql = "insert into users values(?,?,?,?,?)";

		try {
        	// added line below
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
        	ps = con.prepareStatement(applicationQuery);
            ps.setString(1, applicationID);
            ps.setInt(2, 0); // AppStatus = 0
            ps.executeUpdate();
            
            ps = con.prepareStatement(adoptQuery);
            ps.setString(1, username);
            ps.setString(2, petID);
            ps.executeUpdate();
            return true;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
	}
	
	// generating next appID
	public String getNextApplicationID() {
        String query = "select ApplicationID as Max from applications order by ApplicationID desc limit 1";
        String nextID = null;
        try {
        	con = new Database().getConnection();
        	ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                String max = rs.getString("Max");
                // figure out how to auto generate and auto increment each pet id A01, A02, etc.
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nextID;
    }
	
	
	
}