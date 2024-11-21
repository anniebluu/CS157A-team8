package cs157a.team8.control;

import cs157a.team8.entity.User;
import cs157a.team8.dao.UserDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String userID=request.getParameter("userID");
		String password=request.getParameter("password");
		// Don't know AccountType yet, so put -1
		User user=new User(userID, null, null, password, -1);
		UserDao userDao=new UserDao();
		String result=userDao.verify(user);
		
		// Check if user is an admin
		if (result.equals("Successfully logged in as admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
			response.sendRedirect("adminDashboard.jsp");
		}
		else if(result.equals("Successfully logged in as user")) {
			response.sendRedirect("userProfile.jsp");
			HttpSession session = request.getSession();
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("userID", user.getUserID());
		}
		
	}
}

