package cs157a.team8.control;

import cs157a.team8.dao.PetDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeletePet
 */
@WebServlet("/DeletePet")
public class DeletePet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the record ID from the URL parameter
        String petID = request.getParameter("id");
        
        PetDao petDao = new PetDao();
        
        String alertMessage = "";
        if (petID != null) {
            // Delete the record from the database
        	petDao.deletePet(petID);
        	alertMessage = "Pet deleted!";
        	request.getRequestDispatcher("pets.jsp").forward(request, response);
        } else {
        	alertMessage = "Invalid Pet ID";
            response.getWriter().println("Invalid Pet ID");
        }
        request.setAttribute("alertMessage", alertMessage);
        // TODO: delete Organizations' pets
    }
}