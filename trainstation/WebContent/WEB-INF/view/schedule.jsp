<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "trainstation.model.TrainSchedule" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<% ArrayList<TrainSchedule> schedules = (ArrayList<TrainSchedule>) request.getAttribute("schedule"); %>
		<table style="width: 50%; margin: 50px 200px; class="table table-hover">
		<thead>
		  <tr>
		    <th scope="col">TrainID</th>
		    <th scope="col">StationID</th>
		    <th scope="col">Arrival Time</th>
		    <th scope="col">Depart Time</th>
		    <th scope="col">Fare</th>
		  </tr>
		</thead>
		<tbody>
		  <% 
		  if (schedules !=null){
		  for (TrainSchedule schedule: schedules){%>
		   <tr>
		    <th scope="row"><%= schedule.gettrainId() %></th>
		    <td><%= schedule.getstationId() %></td>
		    <td><%= schedule.getArrivalTime() %></td>
		    <td><%= schedule.getDepartTime() %></td>
		    <td>$<%= schedule.getFare() %></td>
		  
		  </tr>
		  <%}} %>
		  
		</tbody>
		</table>
	</div>
	
	<div>
		<h2 style="width: 50%; margin: 50px 200px;">Reservation Confirmation: </h2>
		<form style="width: 50%; margin: 50px 200px;" action="<%= request.getContextPath() %>/reserve" method="post">
		<div>${message}</div>
		
		
			<div class="form-group" align="left">
				<label for="inputState">Ticket Type</label>
	     	 <select id="ticketType" class="form-control" name="ticketType">
		      	<option value="normal" selected>Normal</option>
		  		<option value="children">Children</option>
		  		<option value="disabled">Disabled</option>
		  		<option value="senior">Senior</option>
	      </select>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">Trip Type</label>
	      <select id="roundTrip" class="form-control" name="tripType">
		      <option value="roundtrip" selected>Round Trip</option>
		  		<option value="oneway">1 Way</option>
	      </select>
			</div>
			
			<div class="form-group row">
			  <label for="example-date-input" class="col-2 col-form-label">Date</label>
			  <input class="form-control" type="date" id="date-input" name="date" required>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">User Name</label>
	      <select id="inputState" class="form-control" name="userName">
		      <option value="<%= request.getAttribute("userName")%>" selected><%= request.getAttribute("userName")%></option>
	      </select>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">TrainID</label>
	      <select id="inputState" class="form-control" name="trainId">
		      <option value="<%= request.getAttribute("trainId")%>" selected><%= request.getAttribute("trainId")%></option>
	      </select>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">Origin</label>
	      <select id="inputState" class="form-control" name="origin">
		      <option value="<%= request.getAttribute("origin")%>" selected><%= request.getAttribute("origin")%></option>
	      </select>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">Destination</label>
	      <select id="inputState" class="form-control" name="destination">
		      <option value="<%= request.getAttribute("destination")%>" selected><%= request.getAttribute("destination")%></option>
	      </select>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">Pre-Calculated Fare</label>
	      <select id="inputState" class="form-control" name="fare">
		      <option value="<%= request.getAttribute("fare")%>" selected><%= request.getAttribute("fare")%></option>
	      </select>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">Depart Time</label>
	      <select id="inputState" class="form-control" name="departTime">
		      <option value="<%= request.getAttribute("departTime")%>" selected><%= request.getAttribute("departTime")%></option>
	      </select>
			</div>
			
			<div class="form-group" align="left">
				<label for="inputState">Arrival Time</label>
	      <select id="inputState" class="form-control" name="arrivalTime">
		      <option value="<%= request.getAttribute("arrivalTime")%>" selected><%= request.getAttribute("arrivalTime")%></option>
	      </select>
			</div>
			<h3>Total Fare:<p id ="totalFare">$<%=request.getAttribute("fare")%></p></h3>
			<button type="submit" class="btn btn-primary submit">Confirm</button>
		</form>
	</div>
	<script>
	const inputDate = document.getElementById("date-input");
	let currentDay = new Date();
	let date = currentDay.getDate();
	let month = currentDay.getMonth() + 1;
	let year = currentDay.getFullYear();
	console.log(year, month, date)
	inputDate.min = year + '-' + month + '-' + date;
	console.log(inputDate)
	</script>
	<script>
	let totalFare = document.getElementById("totalFare");
	let preCalFare = ('<%= request.getAttribute("fare")%>' - 0)*2;
	totalFare.innerHTML = "$"+preCalFare
	console.log(preCalFare)
	let discounts = [{type: 'children', discount: 0.75},
		{type: 'senior',  discount: 0.65},
		{type: 'disabled',  discount: 0.5},
		{type: 'normal',  discount: 1}];
	let ticketType = document.getElementById("ticketType");
	let roundTrip = document.getElementById("roundTrip");
	roundTrip.addEventListener ("change", e => {
		let value = e.target.value;
		if (value == 'roundtrip'){
			let temp = totalFare.innerHTML;
			temp = (temp.substr(1) - 0) * 2;
			totalFare.innerHTML = "$" + temp;
			
		}
		else {
			let temp = totalFare.innerHTML;
			temp = (temp.substr(1) - 0) / 2;
			totalFare.innerHTML = "$" + temp;
			
		}
	})
	ticketType.addEventListener("change", e => {
		let type = e.target.value;
		console.log(type)
		let discount = discounts.find(d => d.type == type);
		let roundTripValue = roundTrip.value;
		console.log(roundTripValue)
		if (roundTripValue == 'roundtrip')
		totalFare.innerHTML = "$" + (preCalFare * discount.discount);
		else totalFare.innerHTML = "$" + (preCalFare * discount.discount)/2;
	})
	
	
	</script>
	
</body>
</html>