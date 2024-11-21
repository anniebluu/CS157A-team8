package cs157a.team8.entity;

public class AppSubmits {
    private String username, petID;

    public AppSubmits() {
        super();
    }

    public AppSubmits(String username, String petID) {
        super();
        this.username = username;
        this.petID = petID;
    }

    public String getusername() {
        return username;
    }

    public void setusername(String username) {
        this.username = username;
    }
    
    public String getPetID() {
        return petID;
    }

    public void setPetID(String petID) {
        this.petID = petID;
    }
}
