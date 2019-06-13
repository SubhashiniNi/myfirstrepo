package error_sucess;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddLeageView
 */
@WebServlet(
		urlPatterns = { "/add_leage.view" }, 
		initParams = { 
				@WebInitParam(name = "Title", value = "FSD,SAP,Spring,SapWebApp")
		})
public class AddLeageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String titlelist=null;
	private String[] titlearr;
	
	
       
    @Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		titlelist=config.getInitParameter("Title");
		titlearr=titlelist.split(",");
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public AddLeageView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Doprocess(request,response);
	}

	private void Doprocess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/HTML");
		PrintWriter out=response.getWriter();
		
		
		List<String> li=(List<String>) request.getAttribute("ERROR");
		if(li!=null) {
			out.println("<font color='red'>Please correct errors</font><br/>");
		
		
		for(String s:li) {
			
			out.println("<font color='red'>"+s+"</font><br/>");
		}
		}
		out.println("<br/>");

		out.println("<form action='add_league.do' method='post'>");
		out.println("year<input type='text' name='year'><br/><br/>");
		out.println("Title <select name='Title'>");
		
         for(String s:titlearr) {
			
			out.println("<option value='"+s+"'+>"+s+"</option>");
		}
         
		
	
		
		
		out.println("</select><br/><br/>");
		out.println("name<input type='text' name='name'><br/><br/>");
		out.println("<input type='submit' value='AddLeage' />");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
