package cs157a.team8.dao;

import cs157a.team8.database.Database;
import cs157a.team8.entity.User;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
//	private String dburl = "jdbc:mysql://localhost:3306/pet_query";
//	private String dbuname = "root";
//	private String dbpassword = " ";
//    private String dbdriver = "com.mysql.cj.jdbc.Driver";
//
//	public void loadDriver(String dbDriver)
//	{
//		try {
//			Class.forName(dbDriver);
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//	public Connection getConnection() {
//		Connection con = null;
//
//		try {
//			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return con;
//	}

	public String insert(User user) {
//		loadDriver(dbdriver);
		con = new Database().getConnection();
		String sql = "insert into users values(?,?,?,?,?)";
		String result="Data Entered Successfully";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserID());
			ps.setString(2, user.getUserEmail());
			ps.setString(3, user.getUserName());
			ps.setString(4, user.getPassword());
			ps.setInt(5, user.getAccountType());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered Successfully";
			e.printStackTrace();
		}

		return result;
	}
}
