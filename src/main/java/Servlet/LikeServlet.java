package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import DAO.LikeDAO;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = resp.getWriter()){
			int uid = Integer.parseInt(req.getParameter("uid"));
	        int pid = Integer.parseInt(req.getParameter("pid"));

	        LikeDAO likeDao = new LikeDAO();
	        boolean isLiked = likeDao.isLikeByUser(pid, uid);

	        if (isLiked) {
	            likeDao.deleteLike(pid, uid);
	            out.print("unliked");
	        } else {
	            likeDao.insertLike(pid, uid);
	            out.print("liked");
	        }
		}
	}
}
