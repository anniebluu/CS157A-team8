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
	
	private User queryUsers(String query) {
		User user = new User();
		try {
			con = new Database().getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				user.setUserId(rs.getString(1));
				user.setUserEmail(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setAccountType(rs.getInt(5));
				
				return user;
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
	

	// method inserts new User into database
	public String insert(String userID, String userEmail, String userName, String password) {
		con = new Database().getConnection();
		String sql = "insert into users values(?,?,?,?,?)";
		String result="Data Entered Successfully";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, userID);
			ps.setString(2, userEmail);
			ps.setString(3, userName);
			ps.setString(4, password);
			ps.setInt(5, 0);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered Successfully";
			e.printStackTrace();
		}

		return result;
	}
	
	// method checks if userID exist in database or not
    public boolean checkUserIDExists(String userID) {
        String query = "SELECT * FROM users WHERE UserID = '" + userID + "'";
        return (queryUsers(query) != null);
    }
    
	// method checks if userID exist in database or not
    public boolean checkUserEmailExists(String userEmail) {
        String query = "SELECT * FROM users WHERE UserEmail = '" + userEmail + "'";
        return (queryUsers(query) != null);
    }
    
    // method checks if the password of UserID matches
    public User checkPassword(String userID, String password) {
    	String query = "SELECT * FROM users WHERE UserID = '" + userID + "' && Password = '" + password + "'";
    	return queryUsers(query);
    }
    
    // method deletes a specific user from the database
    public void deleteUser(String userID) {
    	con = new Database().getConnection();
    	// delete user from users table, submits table, adopts table, and creates table
    	String usersSql = "DELETE FROM users WHERE UserID = '" + userID + "'";
    	String submitsSql = "DELETE FROM submits WHERE UserID = '" + userID + "'";
    	String adoptsSql = "DELETE FROM adopts WHERE UserID ='" + userID + "'";
    	String createsSql = "DELETE FROM creates WHERE UserID ='" + userID + "'";
    	
    	try {
    		ps = con.prepareStatement(usersSql);
    		ps.executeUpdate();
    		
    		ps = con.prepareStatement(submitsSql);
    		ps.executeUpdate();
    		
    		ps = con.prepareStatement(adoptsSql);
    		ps.executeUpdate();
    		
    		ps = con.prepareStatement(createsSql);
    		ps.executeUpdate();
    		
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	// method verifies user during login
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
	
	public boolean updateUser(User user) {
	    con = new Database().getConnection();
	    String sql = "UPDATE users SET password = ? WHERE userID = ?";
	    boolean isUpdated = false;

	    try {
	        ps = con.prepareStatement(sql);
	        ps.setString(1, user.getPassword());  // Set the new password
	        ps.setString(2, user.getUserID());    // Specify the user to update

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            isUpdated = true; // Update was successful
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isUpdated; // Return whether the update was successful
	}
	
}
