<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="http://localhost:8000/trainstation/assets/css/styles.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
body, html {
  height: 100%;
}
body{
	background-color: rgb(51, 51, 51);
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.main {
	background-color: white;
	padding: 2em 2em 1em 2em;
	width: 30em;
	max-width: 100%;
	margin: auto;
	border-radius: 2%;
}
.submit{
	margin: 1em 0 1em 0;
	width: 100%;
}
.link{
	padding: 1em 0 0 0;
}
</style>
</head>
<body>

<div class="main" align="center">
	<h3>Sign Up</h3>
	<form action="<%= request.getContextPath() %>/register" method="post" class="register-form">
		<div class="form-group" align="left">
			<label for="username">UserName</label>
			<input type="text" id="username" name="userName" placeholder="Username" class="form-control" required="required"/>
		</div>
		<div class="form-group" align="left">
			<label for="first-name">First Name</label>
			<input type="text" id="first-name" name="firstName" placeholder="First Name" class="form-control" required="required"/>
		</div>
		<div class="form-group" align="left">
			<label for="last-name">Last Name</label>
			<input type="text" id="last-name" name="lastName" placeholder="Last Name" class="form-control" required="required"></td>
		</div>
		<div class="form-group" align="left">
			<label for="password">Password</label>
			<input type="password" id="password" name="password" placeholder="Password" class="form-control" required="required"/>
		</div>
		<div class="form-group" align="left">
			<label for="ssn">SSN</label>
			<input type="text" id="ssn" name="SSN" placeholder="SSN" class="form-control" required="required"/>
		</div>
		<div class="form-group" align="left">
			<label id="email">Email</label>
			<input type="text" id="email" name="email" placeholder="Email" class="form-control" required="required"/>
		</div>
		<button type="submit" class="btn btn-primary submit">Submit</button>
	</form>
	<div class="link">
		Have an account? <a href="/trainstation/login" >Sign In</a>
	</div>
</div>

</body>
</html>