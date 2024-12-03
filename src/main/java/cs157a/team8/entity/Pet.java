package cs157a.team8.entity;

public class Pet {
    private String petID, petName, category, age, imagePath;

    public Pet() {
        super();
    }

    public Pet(String petID, String petName, String age, String category, String imagePath) {
        super();
        this.petID = petID;
        this.petName = petName;
        this.age = age;
        this.category = category;
        this.imagePath = imagePath;
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

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
    	imagePath = "images/" + petName + ".png";
    }
}
