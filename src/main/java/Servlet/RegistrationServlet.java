package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;

import DAO.UserDAO;
import Entities.User;
import Helper.SingletonConnection;

@WebServlet("/RegistrationServlet")
@MultipartConfig
public class RegistrationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()) {

			String name = req.getParameter("user_name");
			String email = req.getParameter("user_email");
			String mainPass = req.getParameter("user_password1");
			String rePass = req.getParameter("user_password2");
			String gender = req.getParameter("gender");
			String dob = req.getParameter("user_dob");
			String check = req.getParameter("checkBox");

			if (name.isEmpty())
				out.println("Enter your name!");
			else if (email.isEmpty())
				out.println("Enter your email!");
			else if (mainPass.isEmpty())
				out.println("Enter a password!");
			else if (rePass.isEmpty() || !rePass.equals(mainPass))
				out.println("Not matched with previouse one!");
			else if (dob.isEmpty())
				out.println("Select your date of birth!");
			else if (check == null)
				out.println("Checked the terms & conditions");
			else {
				User user = new User(name, email, mainPass, gender, dob);

				UserDAO userDao = new UserDAO();

				boolean result = userDao.insertIntoDB(user);

				if (result)
					out.println("Submit Successfully");
				else
					out.println("Not Submit. Something Error!!!");
			}
		}
	}

}
