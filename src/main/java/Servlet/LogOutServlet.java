package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import Entities.Message;

@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()) {
			
			HttpSession sec = req.getSession();
			
			sec.removeAttribute("currentUser");
			
			Message m = new Message("Log out successfully", "success", "alert-success");
			
			sec.setAttribute("msg", m);
			
			resp.sendRedirect("logIn.jsp");
		}
	}
}
