package cs157a.team8.database;

import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
	
	private String dburl = null;
	private String dbuname = null;
	private String dbpassword = null;
    private String dbdriver = null;
	
    public Connection getConnection() {
        Connection con = null;
        try {
        	Properties prop = new Properties();
        	String propFilePath = "/db.properties";
        	InputStream in = getClass().getClassLoader().getResourceAsStream(propFilePath);

        	prop.load(in);
        	
        	dbdriver = prop.getProperty("jdbc.driver");
        	Class.forName(dbdriver);

        	dburl = prop.getProperty("jdbc.url");
        	dbuname = prop.getProperty("jdbc.username");
        	dbpassword = prop.getProperty("jdbc.password");
        	
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
            in.close();
            return con;
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
			e.printStackTrace();
			return null;
        }
       
    }

//    public static void main(String[] args) {
//        System.out.println(new Database().getConnection());
//    }
}
  