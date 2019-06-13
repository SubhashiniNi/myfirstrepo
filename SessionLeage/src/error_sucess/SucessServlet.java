package error_sucess;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SoccerLeage.Leage;

/**
 * Servlet implementation class SucessServlet
 */
@WebServlet("/sucesspage.view")
public class SucessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SucessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
         response.setContentType("text/html");
		
		PrintWriter out=response.getWriter();
		Leage l=(Leage) request.getAttribute("SUCESS");
		out.println("Name"+l.getName() +"Title" +l.getTitle() +"Year" +l.getYear());
		
	}

}
