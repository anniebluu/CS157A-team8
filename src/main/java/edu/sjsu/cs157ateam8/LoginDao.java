package edu.sjsu.cs157ateam8;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
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

	public String verify(User user) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String sql = "SELECT password, accounttype FROM users WHERE userID = ?";
		String result = "Data Entered Successfully";
		ResultSet rs;

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserID());
			rs = ps.executeQuery();
			
			// Check if rs contains any results
			if (!rs.next()) {
				result = "Wrong UserID Entered";
			}
			// rs returned a result, so check if the password matches
			else {
				String pswd = rs.getString(1);
				String userPswd = user.getPassword();
				boolean match = pswd.equals(userPswd);
				
				if (match) {					
					// Check this user's AccountType
					int accType = rs.getInt(2);
					if (accType == 0) {
						result = "Successfully logged in as user";
					}
					else {
						result = "Successfully logged in as admin";
					}
				}
				else {
					result = "Wrong Password Entered";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered Successfully";
			e.printStackTrace();
		}
		

		

		return result;
	}
	
}
