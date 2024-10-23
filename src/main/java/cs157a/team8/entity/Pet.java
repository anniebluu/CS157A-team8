package cs157a.team8.entity;

public class Pet {
    private String petID, petName, age, category;

    public Pet() {
        super();
    }

    public Pet(String petID, String petName, String age, String category) {
        super();
        this.petID = petID;
        this.petName = petName;
        this.age = age;
        this.category = category;
    }

    public String getPetID() {
        return petID;
    }

    public void setPetID(String petID) {
        this.petID = petID;
    }
    
    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
