package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.ContentDao;
import com.Db.DbConnection;


@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			Integer noteid = Integer.parseInt(request.getParameter("noteId"));
			String title = request.getParameter("noteName");
			String content = request.getParameter("noteContent");
			
			ContentDao cd1 = new ContentDao(DbConnection.getConnection());
			boolean f= cd1.updateContent(title,content,noteid);
			HttpSession session;
			if(f) {
				session = request.getSession();
				session.setAttribute("updtMessage","Data updated successfully!!");
				response.sendRedirect(request.getContextPath()+"/pages/ShowNotes.jsp");
			}
			else {
				session = request.getSession();
				session.setAttribute("updtMessage","Something went wrong!!");
				response.sendRedirect(request.getContextPath()+"/pages/ShowNotes.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
