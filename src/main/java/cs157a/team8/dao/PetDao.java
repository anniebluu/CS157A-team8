package cs157a.team8.dao;

import cs157a.team8.entity.Pet;
import cs157a.team8.database.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PetDao {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// method to query pets
	private Pet queryPets(String query) {
		Pet pet = new Pet();
		try {
			con = new Database().getConnection();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
	        ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				pet.setPetID(rs.getString(1));
				pet.setPetName(rs.getString(2));
				pet.setAge(rs.getString(3));
				pet.setCategory(rs.getString(4));
				
				return pet;
			}
		} catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if(this.con != null) {
                try {
                    this.con.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
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
        String sql = "insert into pets (petID, petName, age, category, imagePath) values (?, ?, ?, ?, ?)";
        
        try {
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
	        ps = con.prepareStatement(sql);
            ps.setString(1, pet.getPetID());
            ps.setString(2, pet.getPetName());
            ps.setString(3, pet.getAge());
            ps.setString(4, pet.getCategory());
            ps.setString(5, pet.getImagePath());
            ps.executeUpdate();
        } catch (SQLException e) {
            result = "Data Not Entered Successfully";
            e.printStackTrace();
        }

        return result;
    }
	
	// method checks if petID exist in database or not
    public boolean checkPetIDExists(String petID) {
        String query = "SELECT * FROM pets WHERE PetID = '" + petID + "'";
        return (queryPets(query) != null);
    }
    
    public void deletePet(String petID) {
    	con = new Database().getConnection();
    	String sql = "DELETE FROM pets WHERE PetID = '" + petID + "'";
    	try {
    		ps = con.prepareStatement(sql);
    		ps.executeUpdate();
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    

}
