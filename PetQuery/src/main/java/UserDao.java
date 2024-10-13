import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDao {
	private String dburl="jdbc:mysql://localhost:3306/pet_query";
	private String dbusername="root";
	private String dbpassword="mysql";
	private String dbdriver="com.mysql.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
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
			con = DriverManager.getConnection(dburl, dbusername, dbpassword);
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	public String insert(users user) {
		loadDriver(dbdriver);
		Connection con=getConnection();
		String result = "data entered successfully";
		String sql="insert into pet_query.users values(?,?,?,?, ?)";
		try {
			 PreparedStatement statement = con.prepareStatement("INSERT INTO users (Username, UsrEmail, UsrName, UsrPassword, AccountType) VALUES (?, ?, ?, ?, ?)");
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getName());
			statement.setString(3, user.getEmail());
			statement.setString(4, user.getPassword());
            statement.setString(5, user.getAccountType());
			statement.executeUpdate();
			
		}
		catch (SQLException e){
			e.printStackTrace();
			result = "data not entered";
		}
		return result;
	}
}
