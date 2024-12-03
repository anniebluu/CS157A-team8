package cs157a.team8.control;

import cs157a.team8.dao.AppointmentDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteAppointment
 */
@WebServlet("/DeleteAppointment")
public class DeleteAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAppointment() {
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
    	
        String appointmentID = request.getParameter("id");
        
        AppointmentDao appointmentDao = new AppointmentDao();

        if (appointmentID != null) {
            // Delete the record from the database
        	appointmentDao.cancelAppointment(appointmentID);
        	request.getRequestDispatcher("appointments.jsp").forward(request, response);
        } else {
            response.getWriter().println("Invalid Appointment ID");
        }
    }
}