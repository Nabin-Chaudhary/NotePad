<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href="../css/profile.css">
    <script src="https://kit.fontawesome.com/eed335ca78.js" crossorigin="anonymous"></script>
</head>
<body>

<% User user = (User)session.getAttribute("user"); %>

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
						<h3></h3>
					</div>
				</a> <a href="#">
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
			<h1>Profile</h1>
		</div>
		<!-- code of buttons -->
        <hr>
        <div class="info">
            <label for="">ID</label>
            <label for=""><%=user.getId() %></label>
        </div>
        <div class="info">
            <label for="">Email</label>
            <label for=""><%=user.getEmail() %></label>
        </div>
        <div class="info">
            <label for="">Name</label>
            <label for=""><%=user.getName() %></label>
        </div>
        <div class="btn">
			<a href="Home.jsp">Close</a>
		</div>
		
	</div>
	

</body>
</html>