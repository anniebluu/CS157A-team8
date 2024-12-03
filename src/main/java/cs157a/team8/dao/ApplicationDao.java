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
	
	private Application queryApplications(String query) {
		Application application = new Application();
		try {
			con = new Database().getConnection();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
	        ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				application.setApplicationID(rs.getString(1));
				application.setAppStatus(rs.getInt(2));
				
				return application;
			}
		} catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if(this.con != null) {
                try {
                    this.con.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
		return null;
	}
	
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
		
	// method approve existing Application in database
	public String approve(Application application) {
		con = new Database().getConnection();
		String sql = "UPDATE applications SET AppStatus = 2 WHERE ApplicationID = ?";
		String result="Data Updated Successfully";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,  application.getApplicationID());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Updated Successfully";
			e.printStackTrace();
		}
		
		return result;
	}
	
	// method approve existing Application in database
	public String reject(Application application) {
		con = new Database().getConnection();
		String sql = "UPDATE applications SET AppStatus = 1 WHERE ApplicationID = ?";
		String result="Data Updated Successfully";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,  application.getApplicationID());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Updated Successfully";
			e.printStackTrace();
		}
		
		return result;
	}

	// generating next appID
	public String getNextApplicationID() {
		con = new Database().getConnection();
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
	
	// method checks if applicationID exist in database or not
    public boolean checkApplicationIDExists(String applicationID) {
        String query = "SELECT * FROM applications WHERE ApplicationID = '" + applicationID + "'";
        return (queryApplications(query) != null);
    }
    
    public void deleteApplication(String applicationID) {
    	con = new Database().getConnection();
    	String sql = "DELETE FROM applications WHERE ApplicationID = '" + applicationID + "'";
    	try {
    		ps = con.prepareStatement(sql);
    		ps.executeUpdate();
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	sql = "DELETE FROM submits WHERE ApplicationID = '" + applicationID + "'";
    	try {
    		ps = con.prepareStatement(sql);
    		ps.executeUpdate();
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void resetApplicationStatus(String applicationID) {
		con = new Database().getConnection();
		String sql = "UPDATE applications SET AppStatus = 0 WHERE ApplicationID = '" + applicationID + "'";
		String result="Data Updated Successfully";
		
		try {
			ps = con.prepareStatement(sql);;
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Updated Successfully";
			e.printStackTrace();
		}
	}
	
}