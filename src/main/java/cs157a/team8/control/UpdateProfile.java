package cs157a.team8.control;
import cs157a.team8.entity.User; 
import cs157a.team8.dao.UserDao;
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
@WebServlet("/updateProfile")
public class UpdateProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve userID from the session
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");  // Get userID from session

        // Get updated password from the form
        String newPassword = request.getParameter("password");

        // Validate that the password is not empty
        if (newPassword != null && !newPassword.trim().isEmpty()) {
            // Create a User object with the new password (userID is from the session)
            User user = new User(userID, null, null, newPassword, 0); // Only the password changes

            // Update the user in the database using UserDao
            UserDao userDao = new UserDao();
            boolean isUpdated = userDao.updateUser(user); // Update only the password

            if (isUpdated) {
                // Update the session with the new password
                session.setAttribute("password", newPassword); // Update the session password with the new one

                // Redirect to the profile page
                response.sendRedirect("userProfile.jsp");
            } else {
                // Handle failure (e.g., failure to update the password)
                response.getWriter().println("Profile update failed!");
            }
        } else {
            // Password field is empty or invalid
            response.getWriter().println("Password cannot be empty!");
        }
    }
}