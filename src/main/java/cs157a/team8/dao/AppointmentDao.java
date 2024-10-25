package cs157a.team8.dao;

import cs157a.team8.database.Database;
import cs157a.team8.entity.Appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AppointmentDao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// method insert new Application into database
	public String insert(Appointment appointment) {
		con = new Database().getConnection();
		String sql = "insert into users values(?,?,?,?,?)";
		String result="Data Entered Successfully";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, appointment.getAppointmentID());
			ps.setString(2, appointment.getDate());
			ps.setString(3, appointment.getTime());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Data Not Entered Successfully";
			e.printStackTrace();
		}

		return result;
	}
	
}