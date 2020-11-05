package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController extends HttpServlet{
	
	@Override
	protected void doGet(
			HttpServletRequest req, HttpServletResponse resp) 
						throws ServletException, IOException {
		req.setAttribute("MAIN", "누구나 사용가능");
		req.getRequestDispatcher("/14DataRoom/Index.jsp").forward(req, resp);
	}
	
}
