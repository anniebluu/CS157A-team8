package cs157a.team8.dao;

import cs157a.team8.entity.Pet;
import cs157a.team8.database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PetDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// method inserts new Pet into database
	public String insertPet(Pet pet) {
		Connection con = new Database().getConnection();
		String sql = "insert into pets values(?,?,?,?)";
		String result="Data Entered Successfully";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pet.getPetID());
			ps.setString(2, pet.getPetName());
			ps.setString(3, pet.getAge());
			ps.setString(4, pet.getCategory());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered Successfully";
			e.printStackTrace();
		}

		return result;
	}
}
