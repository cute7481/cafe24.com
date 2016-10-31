package yoon.control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.*;

public class IndexControl extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException{	
		String view = "main.do";
	    String value = req.getHeader("user-agent");
	    if(value.contains("Mobile") || value.contains("mobile")){
	    	view = "main.do?rt=mobile";
	    	HttpSession session = req.getSession();
	    	if(session.getAttribute("mobile")==null){
	    		session.setAttribute("mobile", "mobile");
	    	}
	    }
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, res);
	}
}
