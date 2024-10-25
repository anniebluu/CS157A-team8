package cs157a.team8.entity;

public class Appointment{
	private String appointmentID, date, time;
	
	public Appointment() {
		super();
	}
	
	public Appointment(String appointmentID, String date, String time) {
		super();
		this.appointmentID = appointmentID;
		this.date = date;
	}

	public String getAppointmentID() {
		return appointmentID;
	}

	public void setAppointmentID(String appointmentID) {
		this.appointmentID = appointmentID;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
}