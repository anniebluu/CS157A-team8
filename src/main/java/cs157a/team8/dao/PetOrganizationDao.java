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
	
}
