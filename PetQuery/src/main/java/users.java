
public class users {
	private String username;
    private String name;
    private String email;
    private String password;
    private String accountType;
    
    public users(String username, String name, String email, String password, String accountType) {
        this.username = username;
        this.name = name;
        this.email = email;
        this.password = password;
        this.accountType = accountType;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
   
    public String getAccountType() {
		return accountType;
	}
    
    public void setAccountType (String accountType) {
        this.accountType = accountType;
    }

}
