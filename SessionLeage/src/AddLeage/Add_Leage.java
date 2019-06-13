package AddLeage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SoccerLeage.Leage;

/**
 * Servlet implementation class Add_Leage
 */

@WebServlet("/add_league.do")
public class Add_Leage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private int Year;
       private String Name;
       private String Title;
       private List<String> errmsgs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Leage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request,response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		PrintWriter out=response.getWriter();
		errmsgs=new LinkedList<String>();
		String tempyear=request.getParameter("year");
		try {
			Year=Integer.parseInt(tempyear);
		}
		catch(Exception e) {
			errmsgs.add("year field cant be non numeric");
		}
		
		Title=request.getParameter("Title");
		
		if(Title.equals("select")) {
			errmsgs.add("select a league title");
		}
		
		Name=request.getParameter("name");
		if(Name.length()<=0) {
			errmsgs.add(" Name can not be blank");
		}
		
		if(!errmsgs.isEmpty()) {
			request.setAttribute("ERROR", errmsgs);
			
			RequestDispatcher view=request.getRequestDispatcher("/add_leage.view");
			view.forward(request,response);
		}
		else {
			
			//request.setAttribute("SUCESS", new Leage(Name,Title,Year));
			List<Leage> li=(List<Leage>) request.getServletContext().getAttribute("leagelist");
			li.add(new Leage(Name,Title,Year));
			RequestDispatcher view=request.getRequestDispatcher("/list_leages.view");
			view.forward(request,response);
		}
		
	}


}
