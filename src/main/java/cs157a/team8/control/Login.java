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
//		// Don't know AccountType yet, so put -1
//		User user=new User(userID, null, null, password, -1);
		UserDao userDao=new UserDao();
//		String result=userDao.verify(user);
//		
//		// Check if user is an admin
//		if (result.equals("Successfully logged in as admin")) {
//			HttpSession session = request.getSession();
//			session.setAttribute("userID", userID);
//			response.sendRedirect("adminDashboard.jsp");
//		}
//		else if(result.equals("Successfully logged in as user")) {
//			response.sendRedirect("userProfile.jsp");
//			HttpSession session = request.getSession();
//            session.setAttribute("userName", user.getUserName());
//            session.setAttribute("userID", user.getUserID());
//		}
		
		// check that the user exists in the database
		if(userDao.checkUserIDExists(userID)) {
			// check that the userID and password match entry in database
			User user = userDao.checkPassword(userID, password);
			System.out.print(user);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userID", user.getUserID());
				session.setAttribute("password", user.getPassword());
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userEmail", user.getUserEmail());
				session.setAttribute("isAdmin", user.getAccountType());
				response.sendRedirect("petQueryHome.jsp");
			} else {
				// An alert to send to login page.
	            String alert = "<div class=\"alert alert-danger wrap-input100\">\n" +
	                    "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n" +
	                    "                            Wrong password!\n" +
	                    "                        </p>\n" +
	                    "                    </div>";
	            // Set attribute for alert tag in login.jsp page.
	            request.setAttribute("alert", alert);
	            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
			}
		} else {
			// An alert to send to login page.
            String alert = "<div class=\"alert alert-danger wrap-input100\">\n" +
                    "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n" +
                    "                            Wrong username!\n" +
                    "                        </p>\n" +
                    "                    </div>";
            // Set attribute for alert tag in login.jsp page.
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
		}
		
	}
}

