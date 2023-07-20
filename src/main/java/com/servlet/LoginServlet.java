package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Db.DbConnection;
import com.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User us = new User();
		us.setEmail(email);
		us.setPassword(password);

		UserDao dao = new UserDao(DbConnection.getConnection());
		User user = dao.loginUser(us);

		if (user != null) {

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/pages/Home.jsp");

		} else {

			HttpSession session = request.getSession();
			session.setAttribute("logMsg", "Please try again!!");
			response.sendRedirect(request.getContextPath() + "/pages/login.jsp");

		}

	}

}