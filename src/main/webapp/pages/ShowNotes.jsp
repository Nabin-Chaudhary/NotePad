<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.User"%>
<%@ page import="com.Dao.ContentDao"%>
<%@ page import="com.Db.DbConnection"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.model.Content"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes!!</title>
<link rel="stylesheet" href="../css/ShowNotes.css">
<script src="https://kit.fontawesome.com/eed335ca78.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		HttpSession logSession = request.getSession();
		logSession.setAttribute("logMsg", "Please Login!!");
		response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	}
	%>

	<header>
		<div class="navbar">
			<div class="logo">
				<div class="img">
					<i class="fa-solid fa-graduation-cap"></i>
				</div>
				<div class="text">
					<a href="index.jsp">ENotes</a>
				</div>
			</div>
			<div class="navlinks">
				<a href="Home.jsp">
					<div class="img">
						<i class="fa-solid fa-house"></i>
					</div>
					<div class="text">
						<h3>Home</h3>
					</div>
				</a> <a href="AddNotes.jsp">
					<div class="img">
						<i class="fa-solid fa-cart-plus"></i>
					</div>
					<div class="text">
						<h3>AddNotes</h3>
					</div>
				</a> <a href="ShowNotes.jsp">
					<div class="img">
						<i class="fa-solid fa-folder-open"></i>
					</div>
					<div class="text">
						<h3>ShowNotes</h3>
					</div>
				</a>
			</div>
			<div class="btns">
				<a href="profile.jsp">
					<div class="img">
						<i class="fa-solid fa-right-to-bracket"></i>
					</div> <%
 if (user != null) {
 %>
					<div class="text">
						<h3><%=user.getName()%></h3>
					</div> <%
 }
 %>

				</a> <a href="../LogOutServlet">
					<div class="img">
						<i class="fa-solid fa-address-book"></i>
					</div>
					<div class="text">
						<h3>LogOut</h3>
					</div>
				</a>
			</div>
		</div>
	</header>

	<%
			String msg = (String)session.getAttribute("updtMessage");
			if(msg != null){
				%>
				<div class="box" style="color:red; font-size:23px"><%=msg %></div>
				
				<%
				session.removeAttribute("updtMessage");
				
			}
			%>

	<%
	if (user != null) {
		ContentDao cd = new ContentDao(DbConnection.getConnection());
		List<Content> content = cd.getData(user.getId());
		for (Content co : content) {
	%>
	<div class="body">
	
		<div class="row justify-content-between px-4">

			<div
				class="col-6 p-3 mb-2 border border-end-0 border-dark-subtle border-3 m-2">
				<%=co.getTitle() %></div>

			<div
				class="col-3 p-3 mb-2 border border-end-0 border-dark-subtle border-3 m-2">
				<%=co.getPdate()%></div>
		</div>

		<div
			class="col-sm-11 p-3 border border-end-0 border-dark-subtle border-3 mx-4 my-2">
			<%=co.getContent()%></div>

		<div class="col justify-content-evenly col-3 gap-2 mx-auto">
			<a href="edit.jsp?note_id=<%= co.getId()%>"><button type="button" class="btn btn-success px-4 ">Edit</button></a>
			<button type="button" class="btn btn-danger px-4 m-2">Delete</button>
		</div>

	</div>

	<%
	}
		
	}
	%>









</body>
</html>