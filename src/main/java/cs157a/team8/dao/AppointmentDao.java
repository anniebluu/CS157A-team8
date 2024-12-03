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
	
	// method insert new Appointment into database
	public String insert(String userid, Appointment appointment) {
		con = new Database().getConnection();
		String appointmentsQuery = "insert into appointments (AppointmentID, Date, Time) values(?,?,?)";
		String createsQuery = "insert into creates (UserID, AppointmentID) values(?,?)";
		String result="Appointment Created Successfully. Your Appointment ID is " + appointment.getAppointmentID();

		try {
			ps = con.prepareStatement(appointmentsQuery);
			ps.setString(1, appointment.getAppointmentID());
			ps.setString(2, appointment.getDate());
			ps.setString(3, appointment.getTime());
			ps.executeUpdate();
			
			ps = con.prepareStatement(createsQuery);
			ps.setString(1, userid);
			ps.setString(2, appointment.getAppointmentID());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Error: Appointment Not Created Successfully";
			e.printStackTrace();
		}

		return result;
	}
	
	// method delete Application into database
	public String cancelAppointment(String appointmentID) {
		con = new Database().getConnection();
		String appointmentsQuery = "DELETE FROM appointments WHERE AppointmentID = '" + appointmentID + "'";
		String createsQuery = "DELETE FROM creates WHERE AppointmentID = '" + appointmentID + "'";
		String result="Appointment Cancelled Successfully";

		try {
			ps = con.prepareStatement(appointmentsQuery);
			ps.executeUpdate();
			
			ps = con.prepareStatement(createsQuery);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result="Error: Failed to Cancel Appointment";
			e.printStackTrace();
		}

		return result;
	}
	
	
	// generating next appID
	public String getNextAppointmentID() {
		con = new Database().getConnection();
        String query = "select AppointmentID as maxID from appointments order by AppointmentID desc limit 1";
        String nextID = null;
        try {
        	ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) // if query returned row, find max, get newID
            {
                String maxID = rs.getString("maxID");
                // figure out how to auto generate and auto increment each appointment ID
                if (maxID != null) {
                	String firstInt = maxID.substring(3); // ignores AP-
                	int nextInt = Integer.parseInt(firstInt) + 1; // adds 1 to current max
                	if (nextInt < 10) {
                		nextID = "AP-00" + String.format("%02d", nextInt);
                	}
                	else if (nextInt < 100) {
                		nextID = "AP-0" + String.format("%02d", nextInt);
                	}
                	else {
                		nextID = "AP-" + String.format("%02d", nextInt);
                	}
                	System.out.println(nextID);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nextID;
    }
		
	
	
}