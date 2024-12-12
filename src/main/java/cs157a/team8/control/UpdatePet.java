package cs157a.team8.control;
import cs157a.team8.entity.Pet;
import cs157a.team8.dao.PetDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Register
 */
@WebServlet("/UpdatePet")
public class UpdatePet extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve userID from the session
        HttpSession session = request.getSession();
        String petID = (String) session.getAttribute("petID");  // Get userID from session

        // Get updated password from the form
        String newName = request.getParameter("petName");
        
        String newPetAge = request.getParameter("age");

        // Validate that the password is not empty
        if (newName != null && !newName.trim().isEmpty()) {
            // Create a User object with the new password (userID is from the session)
            Pet pet = new Pet(petID, newName, newPetAge, null, null); // Only the password changes

            // Update the user in the database using UserDao
            PetDao petDao = new PetDao();
            boolean isUpdated = petDao.updatePet(pet); // Update only the password

            if (isUpdated) {
                // Update the session with the new password
                session.setAttribute("petName", newName); // Update the session password with the new one

                // Redirect to the profile page
                response.sendRedirect("editPets.jsp");
            } else {
                // Handle failure (e.g., failure to update the password)
                response.getWriter().println("Pet update failed!");
            }
        } else {
            // Password field is empty or invalid
            response.getWriter().println("Password cannot be empty!");
        }
    }
}