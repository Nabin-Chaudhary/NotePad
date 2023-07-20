<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import = "com.model.User" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register!!</title>
<script src="https://kit.fontawesome.com/eed335ca78.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/register.css">
</head>
<body>


<%
	User user = (User)session.getAttribute("user");

	if(user != null){
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
				<a href="Login.jsp">
					<div class="img">
						<i class="fa-solid fa-right-to-bracket"></i>
					</div>
					<div class="text">
						<h3>Login</h3>
					</div>
				</a> <a href="Register.jsp">
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
				<i class="fa-solid fa-address-book"></i>
			</div>
			<div class="text">
				<h3>Registration!!</h3>
			</div>

		</div>
		<hr>
		<br>
		<div class="form">

			<form action="../AddServlet" method="post">

				<%
				String msg = (String)session.getAttribute("regMsg");
				
				if(msg != null){
					%>
					
				<div class="box" style="color:red; font-size:23px"><%=msg %></div>
				
				<% 
					session.removeAttribute("regMsg");
				}
				%>




				<div class="box">

					<label for="">Name</label> <input type="text" name="uName"
						placeholder="Enter Full Name: " required>

				</div>

				<div class="box">

					<label for="">Email</label> <input type="email" name="email"
						placeholder="Enter Email: " required>

				</div>

				<div class="box">

					<label for="">Password</label> <input type="password"
						name="password" placeholder="Enter Password: " required>

				</div>

				<div class="btn">

					<input type="submit" value="Register">

				</div>

			</form>

		</div>

	</div>

</body>
</html>