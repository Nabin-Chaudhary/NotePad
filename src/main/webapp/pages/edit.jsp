<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.model.User" %>    
<%@ page import = "com.model.Content" %>
<%@ page import = "com.Dao.ContentDao" %>
<%@ page import = "com.Db.DbConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes!!</title>
<link rel="stylesheet" href="../css/AddNotes.css">
    <script src="https://kit.fontawesome.com/eed335ca78.js" crossorigin="anonymous"></script>
</head>
<body>

<%
User user = (User)session.getAttribute("user");
Integer noteId = Integer.parseInt(request.getParameter("note_id"));
if(user == null){
	HttpSession logSession = request.getSession();
	logSession.setAttribute("logMsg","Please Login!!");
	response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
}
%>


<%
ContentDao cd1 = new ContentDao(DbConnection.getConnection());
Content cont =cd1.getDataById(noteId);

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
        <div class="content">
        <%
			String msg = (String)session.getAttribute("succNotes");
			if(msg != null){
				%>
				<div class="box" style="color:red; font-size:23px"><%=msg %></div>
				
				<%
				session.removeAttribute("succNotes");
			}
			%>
            <div class="text">
                <h1 style=color:white;>Add Your Notes</h1>
            </div>      

            <form action="../EditServlet" method="post">

                <div class="form">
                <%
                if(user != null){
                	%>
                	
                	<input type="hidden" value="<%=noteId %>" name="noteId"><br>
                	<% 
                	
                }
                %>
                    <div class="name">
                        <label for="">Note Title:</label>
                        <input type="text" name="noteName" value="<%=cont.getTitle() %>">
                    </div>
                    <div class="note-content">
                        <label for="">Note Content</label>
                        <textarea name="noteContent" cols="35" rows="9" placeholder="Enter your content here"><%=cont.getContent() %></textarea>
                    </div>
                    <div class="btn">
                        <input type="submit" value="Submit">
                    </div>
                </div>
            </form>
        </div>
    </div>


</body>
</html>