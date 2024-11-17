package cs157a.team8.control;

import cs157a.team8.entity.AppSubmits;
import cs157a.team8.dao.ApplicationDao;
import cs157a.team8.dao.PetDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Register
 */
@WebServlet("/Submits")
public class Submits extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Submits() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String username = request.getParameter("username");
        String petID = request.getParameter("petID");

        ApplicationDao applicationDao = new ApplicationDao();
        String applicationID = applicationDao.getNextApplicationID();

        if (applicationID != null) {
            boolean submitted = applicationDao.insertApplication(applicationID, username, petID);
            if (submitted) {
                response.getWriter().println("Application submitted successfully. Your ApplicationID is: " + applicationID);
            } 
            else {
                response.getWriter().println("Error: Failed to submit application.");
            }
        } 
        else {
            response.getWriter().println("Error: Failed to get new ApplicationID.");
        }
    }
}
