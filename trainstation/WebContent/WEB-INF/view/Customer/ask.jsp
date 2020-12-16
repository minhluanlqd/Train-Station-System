<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "trainstation.model.Question" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Question</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
	.main{
		width: 60em;
		margin: auto;	
	}
	.search{
		justify-content: center;
		text-align: center;
	}
</style>
</head>
<body>
	<nav class="nav nav-pills nav-justified mb-3">
	 <a class="nav-item nav-link active" href= "<%= request.getContextPath() %>/login">Back</a>
	 <a class="nav-item nav-link disabled"></a>
	 <a class="nav-item nav-link disabled"></a>
	 <a class="nav-item nav-link disabled"></a>
	</nav>
	<form class="main" action="<%= request.getContextPath() %>/question" method="post">
		<div class="form-group">
		<textarea class="form-control" type="text" name="question" placeholder="Ask a question"></textarea>
		<button class="btn">Ask</button>
		</div>
	</form>
</body>
</html>