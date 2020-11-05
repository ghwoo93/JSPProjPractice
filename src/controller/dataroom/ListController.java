package controller.dataroom;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;

public class ListController extends HttpServlet{
	@Override
	protected void doGet(
			HttpServletRequest req, HttpServletResponse resp) 
					throws ServletException, IOException {
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext(),"jsp");
		List list = dao.selectList();
		dao.close();
		System.out.println(list.size());
		req.setAttribute("list", list);
		req.getRequestDispatcher("/14DataRoom/List.jsp").forward(req, resp);
	}
}
