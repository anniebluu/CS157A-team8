package cs157a.team8.dao;

import cs157a.team8.entity.Pet;
import cs157a.team8.database.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PetDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// method to query pets
    private Pet queryPets(String query) {
        Pet pet = new Pet();
        try {
            con = new Database().getConnection();
            // added line below
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) // if query returned rows, set and return
            {
                pet.setPetID(rs.getString(1));
                pet.setPetName(rs.getString(2));
                pet.setAge(rs.getString(3));
                pet.setCategory(rs.getString(4));

                return pet;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    // method to insert a new Pet
    public String insertPet(Pet pet) {
        if (checkPetIDExists(pet.getPetID())) {
            return "Error: petID already exists";
        }

        con = new Database().getConnection();
        String result = "Data Entered Successfully";
        String sql = "insert into pets (petID, petName, age, category) values (?, ?, ?, ?)";
        
        try {
        	// added line below
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
        	ps = con.prepareStatement(sql);
            ps.setString(1, pet.getPetID());
            ps.setString(2, pet.getPetName());
            ps.setString(3, pet.getAge());
            ps.setString(4, pet.getCategory());
            ps.executeUpdate();
        } catch (SQLException e) {
            result = "Data Not Entered Successfully";
            e.printStackTrace();
        }

        return result;
    }
    
    // method checks if a Pet ID already exists
    public boolean checkPetIDExists(String petID) {
        con = new Database().getConnection();
        String query = "select 1 from pets where petID = '" + petID + "'";
        return (queryPets(query) != null); // calls method to check pets in db
    }
}
