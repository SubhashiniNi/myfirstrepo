package error_sucess;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import SoccerLeage.Leage;

public class LeaguelListener implements ServletContextListener {
	
	String str=null;
     public void contextInitialized(ServletContextEvent event) {
    	 ServletContext context=event.getServletContext();
    	 
    	 List<Leage> li=new ArrayList<Leage>();
    	 str=(String)context.getInitParameter("leage-file");
    	 System.out.println(str);
    	 
    	 String[] sarr=str.split(",");
    	 Leage newLeage=new Leage(sarr[0], sarr[1], Integer.parseInt(sarr[2]));
    	 li.add(newLeage);
    	 context.setAttribute("leagelist", li);
    	 
     }
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		//ServletContextListener.super.contextDestroyed(sce);
		System.out.println("Destroyed");
	}
     
     
     
     
}
