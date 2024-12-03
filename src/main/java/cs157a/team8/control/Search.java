package cs157a.team8.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs157a.team8.dao.SearchDao;
import cs157a.team8.entity.Pet;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String petID = request.getParameter("petID");
        String petName = request.getParameter("petName");
        String age = request.getParameter("age");
        String category = request.getParameter("category");
        
        SearchDao searchDao = new SearchDao();
        List<Pet> petList = searchDao.queryPets(petID, petName, age, category);

        request.setAttribute("petList", petList);
        request.getRequestDispatcher("displayPetsDashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
    
	}

}
