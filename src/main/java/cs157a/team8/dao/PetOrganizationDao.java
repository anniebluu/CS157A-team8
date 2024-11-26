package cs157a.team8.dao;

import cs157a.team8.database.Database;
import cs157a.team8.entity.PetOrganization;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PetOrganizationDao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private PetOrganization queryOrganizations(String query) {
		PetOrganization organization = new PetOrganization();
		try {
			con = new Database().getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				organization.setOrganizationID(rs.getString(1));
				organization.setOrganizationName(rs.getString(2));
				organization.setOrganizationEmail(rs.getString(3));
				organization.setAddress(rs.getString(4));
				
				return organization;
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
	
	// method insert new PetOrganization into database
	public String insert(PetOrganization petOrganization) {
		con = new Database().getConnection();
		String sql = "insert into users values(?,?,?,?,?)";
		String result="Data Entered Successfully";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, petOrganization.getOrganizationID());
			ps.setString(2, petOrganization.getOrganizationName());
			ps.setString(3, petOrganization.getOrganizationEmail());
			ps.setString(4, petOrganization.getAddress());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered Successfully";
			e.printStackTrace();
		}

		return result;
	}
	
	// method checks if organizationID exist in database or not
    public boolean checkOrganizationIDExists(String organizationID) {
        String query = "SELECT * FROM petorganizations WHERE OrgID = '" + organizationID + "'";
        return (queryOrganizations(query) != null);
    }
    
    public void deleteOrganization(String organizationID) {
    	con = new Database().getConnection();
    	String sql = "DELETE FROM petorganizations WHERE OrgID = '" + organizationID + "'";
    	try {
    		ps = con.prepareStatement(sql);
    		ps.executeUpdate();
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
