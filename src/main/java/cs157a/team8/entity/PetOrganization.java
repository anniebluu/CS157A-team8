package cs157a.team8.entity;

public class PetOrganization{
	private String organizationID, organizationName, organizationEmail, address, url;
	
	public PetOrganization() {
		super();
	}
	
	public PetOrganization(String organizationID, String organizationName, String organizationEmail, String address, String url) {
		super();
		this.organizationID = organizationID;
		this.organizationName = organizationName;
		this.organizationEmail = organizationEmail;
		this.address = address;
		this.url = url;
	}

	public String getOrganizationID() {
		return organizationID;
	}

	public void setOrganizationID(String organizationID) {
		this.organizationID = organizationID;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	 
	public String getOrganizationEmail() {
		return organizationEmail;
	}

	public void setOrganizationEmail(String organizationEmail) {
		this.organizationEmail = organizationEmail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getUrl() {
		return this.url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
}