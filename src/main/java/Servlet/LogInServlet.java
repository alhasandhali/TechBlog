package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;

import DAO.UserDAO;
import Entities.User;
import Entities.Message;

@WebServlet("/LogInServlet")
public class LogInServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()) {
			out.println("Log In Servlet");

			String userEmail = req.getParameter("email");
			String userPass = req.getParameter("password");

			UserDAO userDao = new UserDAO();

			User u = userDao.getUserFromDB(userEmail, userPass);

			if (u == null) {
				Message msg = new Message("Invalid information! Try again.", "error", "alert-danger");
				HttpSession sec = req.getSession();
				sec.setAttribute("msg", msg);
				resp.sendRedirect("logIn.jsp");
			} else {
				HttpSession session = req.getSession();
				session.setAttribute("currentUser", u);
				resp.sendRedirect("profile.jsp");
			}
		}
	}
}
