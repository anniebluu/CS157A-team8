package cs157a.team8.control;

import cs157a.team8.entity.User;
import cs157a.team8.dao.UserDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String userEmail=request.getParameter("userEmail");
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		String repeatPassword=request.getParameter("repeatPassword");
		
		
		User user=new User(userID, userEmail, userName, password, 0);
		UserDao userDao=new UserDao();
		
		// check if userID exists in database
		if (!password.equals(repeatPassword)) {
            String alert = "<div class=\"alert alert-danger wrap-input100\">\n" +
                    "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n" +
                    "                            Passwords do not match!\n" +
                    "                        </p>\n" +
                    "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("userRegister.jsp").forward(request, response);
		} else if(userDao.checkUserIDExists(userID)) {
			String alert = "<div class=\"alert alert-danger wrap-input100\">\n" +
                    "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n" +
                    "                            Username already exist!\n" +
                    "                        </p>\n" +
                    "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("userRegister.jsp").forward(request, response);
		} else if(userDao.checkUserEmailExists(userEmail)) {
			String alert = "<div class=\"alert alert-danger wrap-input100\">\n" +
                    "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n" +
                    "                            Email already exist!\n" +
                    "                        </p>\n" +
                    "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("userRegister.jsp").forward(request, response);
		} else {
			String result=userDao.insert(user);
			String alert = "<div class=\"alert alert-success wrap-input100\">\n" +
                    "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n" +
                    "                            Create account successfully!\n" +
                    "                        </p>\n" +
                    "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
		}
	}
}
