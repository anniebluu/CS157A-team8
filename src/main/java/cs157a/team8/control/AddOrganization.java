package cs157a.team8.control;

import cs157a.team8.entity.PetOrganization;
import cs157a.team8.dao.PetOrganizationDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddOrganization
 */
@WebServlet("/AddOrganization")
public class AddOrganization extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrganization() {
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
        String orgID = request.getParameter("orgID");
        String orgName = request.getParameter("orgName");
        String orgEmail = request.getParameter("orgEmail");
        String address = request.getParameter("address");
        String url = request.getParameter("url");

        PetOrganization petOrganization = new PetOrganization(orgID, orgName, orgEmail, address, url);
        PetOrganizationDao petOrganizationDao = new PetOrganizationDao();

        String result = petOrganizationDao.insert(petOrganization);
        response.getWriter().println(result);
    }
}
