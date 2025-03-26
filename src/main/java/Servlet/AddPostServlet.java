package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import DAO.PostDAO;
import DAO.UserDAO;
import Entities.Message;
import Entities.Post;
import Entities.User;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");

		try (PrintWriter out = resp.getWriter()) {
			String catS = req.getParameter("ctgry");
			int catId = Integer.parseInt(req.getParameter("ctgry"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String tags = req.getParameter("tags");
			String status = req.getParameter("status");
			Part part = req.getPart("postPic");
			String img = part.getSubmittedFileName();

			HttpSession sec = req.getSession();
			User user = (User) sec.getAttribute("currentUser");
			int userId = user.getId();

			if (title.isEmpty())
				out.println("noTitle");
			else if(catS == null || catS.isEmpty())
				out.println("noCat");
			else {
				Post post = new Post(title, content, img, status, catId, userId, tags);

				PostDAO postDao = new PostDAO();

				boolean result = postDao.insertIntoDB(post);

				if (result) {
					out.println("success");
					String path = req.getServletContext().getRealPath("/") + "images" + File.separator
							+ post.getImage();
					Helper.PhotoHelper.saveFile(part.getInputStream(), path);
				} else
					out.println("notSubmit");
			}
		}
	}

}
