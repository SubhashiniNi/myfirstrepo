package SoccerLeage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class list_leages
 */
@WebServlet("/list_leages.view")
public class list_leages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Leage> leage=null;
	public list_leages() {
		super();
	}




       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
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
		List<Leage> leagelist = (List<Leage>) getServletContext().getAttribute("leagelist");
		
		
		/*
		leage=new ArrayList<Leage>();
		leage.add(new Leage("ABC","FSD",2019));
		leage.add(new Leage("BCD","FSD",2013));
		leage.add(new Leage("CDE","FSD",2012));
		leage.add(new Leage("FGH","FSD",2013));
		leage.add(new Leage("IJK","FSD",2015)); 
		leage.add(new Leage("LMN","FSD",2019));
		*/
		String pagetitle="Duke's sockerleage :listLeages";
	
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.println("<html><head> <title>"+pagetitle+"</title></head><body bgcolor='pink'><center><table   border='1' padding='0px'  width='70%'  style='border-collapse:collapse; background-color:lightgrey; cellpadding:60px; text-align:center ' ><th>Name</th><th>Title</th><th>Year</th> ");
		for(Leage l:leagelist) {
			out.println("<tr><td>"+l.getName()+"</td><td> "+l.getTitle()+" </td><td>"+l.getYear()+"</td><tr>");
		}
		out.println("</table></center></body></html>");
	}


}
