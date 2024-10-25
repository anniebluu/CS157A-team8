package cs157a.team8.dao;

import cs157a.team8.database.Database;
import cs157a.team8.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// method inserts new User into database
	public String insert(User user) {
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
	
	// method verifies user
	public String verify(User user) {
		Connection con = new Database().getConnection();
		String sql = "SELECT  password, accounttype, userEmail, userName FROM users WHERE userID = ?";
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
					user.setUserEmail(rs.getString(3));
					user.setUserName(rs.getString(4));
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
