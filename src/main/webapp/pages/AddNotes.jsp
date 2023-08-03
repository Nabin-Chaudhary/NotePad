<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes!!</title>
<link rel="stylesheet" href="../css/AddNotes.css">
    <script src="https://kit.fontawesome.com/eed335ca78.js" crossorigin="anonymous"></script>
</head>
<body>

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
            <div class="text">
                <h1 style=color:white;>Add Your Notes</h1>
            </div>      

            <form action="">

                <div class="form">
                    <div class="name">
                        <label for="">Note Title:</label>
                        <input type="text" name="noteName">
                    </div>
                    <div class="note-content">
                        <label for="">Note Content</label>
                        <textarea name="noteContent" cols="35" rows="9" placeholder="Enter your content here"></textarea>
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