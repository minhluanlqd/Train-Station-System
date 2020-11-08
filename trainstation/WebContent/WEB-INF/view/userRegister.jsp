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
</head>
<body>

<div align="center">
  <h1>Sign Up</h1>
  <form action="<%= request.getContextPath() %>/register" method="post" class="register-form">
   <table style="with: 80%">
   	<tr>
     <td>UserName</td>
     <td><input type="text" name="userName" placeholder="Username"/></td>
    </tr>
    <tr>
     <td>First Name</td>
     <td><input type="text" name="firstName" placeholder="First Name"/></td>
    </tr>
    <tr>
     <td>Last Name</td>
     <td><input type="text" name="lastName" placeholder="Last Name"/></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" placeholder="Password"/></td>
    </tr>
    <tr>
     <td>SSN</td>
     <td><input type="text" name="SSN" placeholder="SSN"/></td>
    </tr>
    <tr>
     <td>Email</td>
     <td><input type="text" name="email" placeholder="Email"/></td>
    </tr>
    <tr>
     <td>User Role</td>
     <td><input type="text" name="userRole" placeholder="User Role"/></td>
    </tr>
   </table>
   <button type="submit" class="btn btn-primary">Submit</button>
  </form>
 </div>

</body>
</html>