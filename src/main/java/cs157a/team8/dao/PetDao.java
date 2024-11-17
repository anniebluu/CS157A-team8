package cs157a.team8.dao;

import cs157a.team8.entity.Pet;
import cs157a.team8.database.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PetDao {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    // method to insert a new Pet
    public String insertPet(Pet pet) {
        if (checkPetIDExists(pet.getPetID())) {
            return "Error: petID already exists";
        }

        con = new Database().getConnection();
        String result = "Data Entered Successfully";
        String sql = "insert into pets (petID, petName, age, category) values (?, ?, ?, ?)";
        
        try {
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
        String query = "select 1 from pets where petID = ?";
        try {
        	ps = con.prepareStatement(query);
            ps.setString(1, petID);
            rs = ps.executeQuery();
            return rs.next(); // checks for petID, if result returned, petID exists in db
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
