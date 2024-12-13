package cs157a.team8.control;
import cs157a.team8.entity.Pet;
import cs157a.team8.dao.PetDao;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
 * Servlet implementation class Register
 */
@WebServlet("/UpdatePetImage")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
	    maxFileSize = 1024 * 1024 * 10,       // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)
public class UpdatePetImage extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve session to check if admin 
        HttpSession session = request.getSession(false);
        // System.out.println("isAdmin: " + (Integer) session.getAttribute("isAdmin"));
        if ((Integer) session.getAttribute("isAdmin") == 0){
            response.sendRedirect("landingPage.jsp");  // Redirect to the login page
        	session.invalidate();
        } else {
        	String petID = request.getParameter("petID");  // Get petID
            System.out.println("\nEdit Pet ID: " + petID);

            // Get updated password from the form
//            String newName = request.getParameter("name");
//            System.out.println("Edit Pet name: " + newName);

            
//            String newPetAge = request.getParameter("age");
//            System.out.println("Edit Pet age: " + newPetAge);
            
//            String newPetCategory = request.getParameter("category");
//            System.out.println("Edit Pet category: " + newPetCategory);
            
            String imagePath = null;


         // for file upload
            Part filePart = request.getPart("image"); // gets <input type="file" name="image">
            if (filePart != null) 
            {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // gets filename from uploaded image
                String uploadPath = request.getServletContext().getRealPath("") + File.separator + "images"; // should save file to images/ directory

                // save file to images folder (working (not working properly))
               Path filePath = Paths.get(uploadPath, fileName);
               filePart.write(filePath.toString()); //for file content
                
                // sets new under images directory
                imagePath = "images/" + fileName;
            }


            // Validate that the password is not empty
            if (imagePath != null) {
                // Create a User object with the new password (userID is from the session)
                Pet pet = new Pet(petID, null, null, null, imagePath); // Only the name changes

                // Update the user in the database using UserDao
                PetDao petDao = new PetDao();
                boolean isUpdated = petDao.updatePetImage(pet); // Update only the pet name

                if (isUpdated) {
                    // Update the session with the new password
//                    session.setAttribute("petName", newName); // Update the session password with the new one

                    // Redirect to the editPets page
                    response.sendRedirect("editPets.jsp?petID=" + petID);
                } else {
                    // Handle failure (e.g., failure to update the pet)
                    response.getWriter().println("Pet update failed!");
                }
            } else {
                // pet name field is empty or invalid
                response.getWriter().println("Pet Image cannot be empty!");
            }
        }
        
        
    }
}