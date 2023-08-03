<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login!!</title>
<script src="https://kit.fontawesome.com/eed335ca78.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>

<%
User user = (User)session.getAttribute("useer");
if(user != null){
	response.sendRedirect("Home.jsp");
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
				<a href="login.jsp">
					<div class="img">
						<i class="fa-solid fa-right-to-bracket"></i>
					</div>
					<div class="text">
						<h3>Login</h3>
					</div>
				</a> <a href="register.jsp">
					<div class="img">
						<i class="fa-solid fa-address-book"></i>
					</div>
					<div class="text">
						<h3>Register</h3>
					</div>
				</a>
			</div>
		</div>
	</header>

	<div class="body">
		<div class="logo">

			<div class="img">
				<i class="fa-solid fa-right-to-bracket"></i>
			</div>
			<div class="text">
				<h3>Login!!</h3>
			</div>

		</div>
		<hr>
		<br>
		<div class="form">

			<form action="../LoginServlet" method="post">
			
			<%
			String msg = (String)session.getAttribute("logMsg");
			if(msg != null){
				%>
				<div class="box" style="color:red; font-size:23px"><%=msg %></div>
				
				<%
				session.removeAttribute("logMsg");
			}
			%>

				<div class="box">

					<label for="">Email</label> <input type="email" name="email"
						placeholder="Enter Email: ">

				</div>

				<div class="box">

					<label for="">Password</label> <input type="password"
						name="password" placeholder="Enter Password: ">

				</div>

				<div class="btn">

					<input type="submit" value="Login">

				</div>

			</form>

		</div>

	</div>

</body>
</html>