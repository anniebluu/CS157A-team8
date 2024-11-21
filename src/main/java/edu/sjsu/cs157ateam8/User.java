package edu.sjsu.cs157ateam8;

public class User 
{
	private String userID, userEmail, userName, password;
	private int accountType;

	public User() {
		super();
	}

	public User(String userID, String userEmail, String userName, String password, int accountType) {
		super();
		this.userID = userID;
		this.userEmail = userEmail;
		this.userName = userName;
		this.password = password;
		this.accountType = accountType;
	}

	public String getUserID() {
		return this.userID;
	}

	public void setUserId(String userID) {
		this.userID = userID;
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}
    
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getAccountType() {
		return this.accountType;
	}
	
	public void setAccountType(int accountType) {
		this.accountType = accountType;
	}
	
}
