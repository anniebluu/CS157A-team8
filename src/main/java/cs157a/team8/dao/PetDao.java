package cs157a.team8.dao;

import cs157a.team8.entity.Pet;
import cs157a.team8.database.Database;

import java.sql.Connection;
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
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				pet.setPetID(rs.getString(1));
				pet.setPetName(rs.getString(2));
				pet.setAge(rs.getString(3));
				pet.setCategory(rs.getString(4));
				pet.setImagePath(rs.getString(5));
				
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
    public String insertPet(Pet pet, String orgID) {
        
        con = new Database().getConnection();
        String sql = "insert into pets values(?, ?, ?, ?, ?);";
        String sql2 = "insert into owns values(?,?)";
        String result = "Data Entered Successfully";
        
        if (checkPetIDExists(pet.getPetID())) {
            result = "Error: petID already exists";
            return result;
        }
        
        try {
            con = new Database().getConnection();
        	ps = con.prepareStatement(sql);
            ps.setString(1, pet.getPetID());
            ps.setString(2, pet.getPetName());
            ps.setString(3, pet.getAge());
            ps.setString(4, pet.getCategory());
            ps.setString(5, pet.getImagePath());
            ps.executeUpdate();
            ps = con.prepareStatement(sql2);
            ps.setString(1, orgID);
            ps.setString(2, pet.getPetID());
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
    
    // method to delete a specific pet from database
    public void deletePet(String petID) {
    	con = new Database().getConnection();
    	String petsSql = "DELETE FROM pets WHERE PetID = '" + petID + "'";
    	String submitsSql = "DELETE FROM submits WHERE PetID = '" + petID + "'";
    	String adoptsSql = "DELETE FROM adopts WHERE PetID = '" + petID + "'";
    	String ownsSql = "DELETE FROM owns WHERE PetID = '" + petID + "'";
    	
    	try {
    		ps = con.prepareStatement(petsSql);
    		ps.executeUpdate();
    		
    		ps = con.prepareStatement(submitsSql);
    		ps.executeUpdate();
    		
    		ps = con.prepareStatement(adoptsSql);
    		ps.executeUpdate();
    		
    		ps = con.prepareStatement(ownsSql);
    		ps.executeUpdate();
    		
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
	public boolean updatePetName(Pet pet) {
	    con = new Database().getConnection();
	    String sql = "UPDATE pets SET PetName = ? WHERE PetID = ?";
	    boolean isUpdated = false;

	    try {
	        ps = con.prepareStatement(sql);
	        ps.setString(1, pet.getPetName());  // Set the new name
	        ps.setString(2, pet.getPetID());    // Specify the pet to update

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            isUpdated = true; // Update was successful
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isUpdated; // Return whether the update was successful
	}
	
	public boolean updatePetAge(Pet pet) {
	    con = new Database().getConnection();
	    String sql = "UPDATE pets SET Age = ? WHERE PetID = ?";
	    boolean isUpdated = false;

	    try {
	        ps = con.prepareStatement(sql);
	        ps.setString(1, pet.getAge());  // Set the new name
	        ps.setString(2, pet.getPetID());    // Specify the pet to update

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            isUpdated = true; // Update was successful
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isUpdated; // Return whether the update was successful
	}
	
	public boolean updatePetCategory(Pet pet) {
	    con = new Database().getConnection();
	    String sql = "UPDATE pets SET Category = ? WHERE PetID = ?";
	    boolean isUpdated = false;

	    try {
	        ps = con.prepareStatement(sql);
	        ps.setString(1, pet.getCategory());  // Set the new name
	        ps.setString(2, pet.getPetID());    // Specify the pet to update

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            isUpdated = true; // Update was successful
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isUpdated; // Return whether the update was successful
	}
	
	public boolean updatePetImage(Pet pet) {
	    con = new Database().getConnection();
	    String sql = "UPDATE pets SET imagePath = ? WHERE PetID = ?";
	    boolean isUpdated = false;

	    try {
	        ps = con.prepareStatement(sql);
	        ps.setString(1, pet.getImagePath());  // Set the new name
	        ps.setString(2, pet.getPetID());    // Specify the pet to update

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            isUpdated = true; // Update was successful
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isUpdated; // Return whether the update was successful
	}

}
