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
import com.model.Content;

@WebServlet("/AddContentServlet")
public class AddContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String name = request.getParameter("noteName");
			String content = request.getParameter("noteContent");
			int uId = Integer.parseInt(request.getParameter("uId"));
			
			
			ContentDao dao = new ContentDao(DbConnection.getConnection());
			boolean f = dao.addContent(name,content,uId);
			HttpSession session;
		
			
			if(f) {
				session = request.getSession();
				session.setAttribute("succNotes", "Note Saved successfully!!");
				response.sendRedirect(request.getContextPath()+"/pages/AddNotes.jsp");
				
			}
			else {
				session = request.getSession();
				session.setAttribute("succNotes", "Something went wrong!!");
				response.sendRedirect(request.getContextPath()+"/pages/AddNotes.jsp");
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
