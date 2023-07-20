package com.servlet;

import com.Dao.UserDao;
import com.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DbConnection;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("uName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);

		HttpSession session = null;

		UserDao dao = new UserDao(DbConnection.getConnection());
		boolean f = dao.addUser(us);

		if (f) {
			response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("regMsg", "Something went wrong");
			response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
		}

	}

}
