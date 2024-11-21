package cs157a.team8.control;

import cs157a.team8.entity.Application;
import cs157a.team8.dao.ApplicationDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SetApplication
 */
@WebServlet("/SetApplication")
public class SetApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetApplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String appId = request.getParameter("appId");
		String action = request.getParameter("action");
		
		if (action.equals("approve")) {
			// Application is pending
			Application app = new Application(appId, 1);
			
			ApplicationDao appDao = new ApplicationDao();
			appDao.approve(app);
		}
		else {
			// Application is pending
			Application app = new Application(appId, 1);
						
			ApplicationDao appDao = new ApplicationDao();
			appDao.reject(app);
		}
		
		
	}
}

