package cs157a.team8.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cs157a.team8.database.Database;
import cs157a.team8.entity.Pet;

public class SearchDao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	// method to query pets (list b/c based on params)
    public List<Pet> queryPets(String petID, String petName, String age, String category) {
        List<Pet> petList = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT * FROM pets WHERE ");

        if (petID != null) {
            query.append(" PetID LIKE ?");
        }
        if (petName != null) {
            query.append(" petName LIKE ?");
        }
        if (age != null) {
            query.append(" age = ?");
        }
        if (category != null) {
            query.append(" category LIKE ?");
        }

        try {
            con = new Database().getConnection();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_query", "root", "Lupineapple#0117");
            ps = con.prepareStatement(query.toString());

            int index = 1; // to go through params
            if (petID != null) {
                ps.setString(index++, petID); // sets param in PreparedStatement
            }
            if (petName != null) {
                ps.setString(index++, petName); // sets param in PreparedStatement
            }
            if (age != null) {
                ps.setInt(index++, Integer.parseInt(age)); // sets param in PreparedStatement
            }
            if (category != null) {
                ps.setString(index++, category); // sets param in PreparedStatement
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                Pet pet = new Pet();
                pet.setPetID(rs.getString("petID"));
                pet.setPetName(rs.getString("petName"));
                pet.setAge(rs.getString("age"));
                pet.setCategory(rs.getString("category"));
                pet.setImagePath(rs.getString("imagePath"));
                petList.add(pet);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return petList;
    }

}
