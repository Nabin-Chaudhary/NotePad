<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import = "com.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/home.css">
<script src="https://kit.fontawesome.com/eed335ca78.js"
	crossorigin="anonymous"></script>
</head>
<body>

<%User user = (User)session.getAttribute("user");
if(user == null){
	response.sendRedirect("login.jsp");
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
			<div class="btn">
				<a href="profile.jsp">
					<div class="img">
						<i class="fa-solid fa-right-to-bracket"></i>
					</div>
					<div class="text">
						<h3><%=user.getName() %></h3>
					</div>
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
	
	<div class="body">
		<div class="img">
			<i class="fa-solid fa-address-book"></i>
		</div>
		<div class="text">
			<h1>E-Notes | Save your text.</h1>
		</div>
		<!-- code of buttons -->
		<div class="btn">
			<a href="AddNotes.jsp">
				<div class="img">
					<i class="fa-solid fa-right-to-bracket"></i>
				</div>
				<div class="text">
					<h3>Add Notes</h3>
				</div>
			</a> <a href="#">
				<div class="img">
					<i class="fa-solid fa-address-book"></i>
				</div>
				<div class="text">
					<h3>Show Notes</h3>
				</div>
			</a>
		</div>
	</div>
	 

</body>
</html>