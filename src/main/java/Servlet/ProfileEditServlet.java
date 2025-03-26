package Servlet;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.*;

import DAO.UserDAO;
import Entities.Message;
import Entities.User;

@WebServlet("/ProfileEditServlet")
@MultipartConfig
public class ProfileEditServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");

		try (PrintWriter out = resp.getWriter()) {
			String name = req.getParameter("user_name");
			String email = req.getParameter("user_email");
			String pass = req.getParameter("user_pass");
			String gender = req.getParameter("gender");
			String dob = req.getParameter("user_dob");
			Part part = req.getPart("user_image");
			String img = part.getSubmittedFileName();

			HttpSession sec = req.getSession();
			User user = (User) sec.getAttribute("currentUser");

			user.setName(name);
			user.setEmail(email);
			user.setPassword(pass);
			user.setGender(gender);
			user.setDob(dob);
			String oldImg = user.getProfile();
			user.setProfile(img);

			UserDAO userDao = new UserDAO();
			boolean result = userDao.updateUser(user);

			if (result) {
				String path = req.getServletContext().getRealPath("/") + "images" + File.separator + user.getProfile();

				String pathOldImg = req.getServletContext().getRealPath("/") + "images" + File.separator + oldImg;
				if (!oldImg.equals("default.png")) {
					Helper.PhotoHelper.deleteFile(pathOldImg);
				}

				if (Helper.PhotoHelper.saveFile(part.getInputStream(), path)) {
					out.println("Profile updated.");
					Message msg = new Message("Profile updated successfully...", "success", "alert-success");
					sec.setAttribute("msg", msg);
				} else {
					out.println("Profile not updated. Something went wrong!!!");
					Message msg = new Message("Profile not updated. Something went wrong!!!", "error", "alert-danger");
					sec.setAttribute("msg", msg);
				}

			} else {
				out.println("Profile not updated. Something went wrong!");
				Message msg = new Message("Profile not updated. Something went wrong!", "error", "alert-danger");
				sec.setAttribute("msg", msg);
			}

			resp.sendRedirect("profile.jsp");

			out.println("<h1>" + user.getName() + "</h1>");
			out.println("<h1>" + user.getEmail() + "</h1>");
			out.println("<h1>" + user.getPassword() + "</h1>");
			out.println("<h1>" + user.getGender() + "</h1>");
			out.println("<h1>" + user.getDob() + "</h1>");
			out.println("<h1>" + user.getProfile() + "</h1>");
		}

	}

}
