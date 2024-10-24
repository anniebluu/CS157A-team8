package edu.sjsu.cs157ateam8;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class addPetFormDao {
	private String dburl = "jdbc:mysql://localhost:3306/petquery";
	private String dbuname = "root";
	private String dbpassword = "";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		Connection con = null;

		try {
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return con;
	}

	public String insertPet(Pet pet) {
		loadDriver(dbdriver);
		Connection con = getConnection();
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
