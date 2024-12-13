package cs157a.team8.control;

import cs157a.team8.entity.Pet;
import cs157a.team8.dao.PetDao;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;




/**
 * Servlet implementation class Register
 */
@WebServlet("/AddPet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
	    maxFileSize = 1024 * 1024 * 10,       // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)
public class AddPet extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPet() {
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
        String petID = request.getParameter("petID");
        String petName = request.getParameter("petName");
        String age = request.getParameter("age");
        String category = request.getParameter("category");
        String imagePath = null;
        String petOrg = request.getParameter("petOrg");

        // for file upload
        Part filePart = request.getPart("image"); // gets <input type="file" name="image">
        if (filePart != null) 
        {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // gets filename from uploaded image
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + "images"; // should save file to images/ directory

            // save file to images folder (working (not working properly))
           Path filePath = Paths.get(uploadPath, fileName);
           filePart.write(filePath.toString()); //for file content
            
            // sets new under images directory
            imagePath = "images/" + fileName;
        }

        PetDao pdao = new PetDao();

        // Check if petID already exists
        if (pdao.checkPetIDExists(petID)) {
            String alert = "Pet ID already exists. Please use a different ID."; // alert if error
            request.setAttribute("alert", alert); // sends to jsp
            request.getRequestDispatcher("addPet.jsp").forward(request, response); // stays in same page
            return;
        }

        // Insert the new pet
        Pet pet = new Pet(petID, petName, age, category, imagePath);
        String result = pdao.insertPet(pet);
        
        
        // Send response back to user
        if ("Data Entered Successfully".equals(result)) {
            response.sendRedirect("pets.jsp"); // takes to dashboard if pet was added
        } else {
            String alert = "Failed to add pet. Please try again."; // alert if error
            request.setAttribute("alert", alert); // sends to jsp
            request.getRequestDispatcher("addPet.jsp").forward(request, response); // stays in same page
        }
    }

}
