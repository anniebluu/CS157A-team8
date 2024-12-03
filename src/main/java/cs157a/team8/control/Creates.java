package cs157a.team8.control;

import cs157a.team8.entity.AppSubmits;
import cs157a.team8.entity.Appointment;
import cs157a.team8.dao.ApplicationDao;
import cs157a.team8.dao.AppointmentDao;
import cs157a.team8.dao.PetDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Creates
 */
@WebServlet("/Creates")
public class Creates extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Creates() {
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
    	String date = request.getParameter("date");
    	String time = request.getParameter("time");
    	
    	AppointmentDao  appointmentDao = new AppointmentDao();
    	String appointmentID = appointmentDao.getNextAppointmentID();
    	
    	if (appointmentID != null) {
    		Appointment newApp = new Appointment(appointmentID, date, time);
    		
    		String create = appointmentDao.insert(username, newApp);
    		
    		request.getRequestDispatcher("userAppointments.jsp").forward(request, response);
    	}
    	else {
    		response.getWriter().println("Error: Failed to get new AppointmentID.");
    	}

    }
}
