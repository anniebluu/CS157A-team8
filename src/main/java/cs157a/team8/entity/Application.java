package cs157a.team8.entity;

public class Application{
	private String applicationID;
	private int appStatus;
	
	public Application() {
		super();
	}
	
	public Application(String applicationID, int appStatus) {
		super();
		this.applicationID = applicationID;
		this.appStatus = appStatus;
	}

	public String getApplicationID() {
		return applicationID;
	}

	public void setApplicationID(String applicationID) {
		this.applicationID = applicationID;
	}

	public int getAppStatus() {
		return appStatus;
	}

	public void setAppStatus(int appStatus) {
		this.appStatus = appStatus;
	}
	
}