<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "trainstation.model.TrainSchedule" %>
<%@page import= "trainstation.model.TrainRoute" %>
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
	
	<div align="center">
		<form action="<%= request.getContextPath() %>/trainroute" method="post" class="register-form">
		<div>${message}</div>
			
			<div class="form-group" align="left">
				<label for="inputState">Origin</label>
			      <select id="inputState" class="form-control" name="origin">
			        <option value="NB" selected>New Brunswick</option>
			  		<option value="PA">Paterson</option>
			  		<option value="PE">Penn Station</option>
			  		<option value="TR">Trenton</option>
			  		<option value="HCM">Ga Sai Gon</option>
			  		<option value="ED">Edison</option>
			      </select>
			</div>
			<div class="form-group" align="left">
				<label for="inputState">Destination</label>
			      <select id="inputState" class="form-control" name="destination">
			        <option value="PA" selected>Paterson</option>
			  		<option value="ED">Edison</option>
			  		<option value="NB">New Brunswick</option>
			  		<option value="HCM">Ga Sai Gon</option>
			  		<option value="TR">Trenton</option>
			  		<option value="PE">Penn Station</option>
			      </select>
			</div>
			<div class="form-group" align="left">
				<label for="inputState">Date</label>
			    <input name="datefield" type='date'>
			</div>
			<button type="submit" class="btn btn-primary submit">Search</button>
		</form>
		
		<%ArrayList<TrainRoute> routes = (ArrayList<TrainRoute>) request.getAttribute("routes"); %>
		<table id="myTable" class="table table-hover">
		<thead>
		  <tr>
		    <th scope="col">TrainID</th>
		    <th scope="col"><button onclick="sortTable(0)">Depart Time</button></th>
		    <th scope="col">Origin</th>
		    <th scope="col"><button onclick="sortTable(2)">Arrival Time</button></th>
		    <th scope="col">Destination</th>
		    <th scope="col"><button onclick="sortTable(4)">Total Fare</button></th>
		  </tr>
		</thead>
		<tbody>
		  <% 
		 if (routes !=null){
		 for (TrainRoute route: routes){%>
		 <form action="<%= request.getContextPath() %>/schedule" method="post" class="register-form">
		   <tr>
		    <th scope="row"><select name="trainID"><option value="<%=route.gettrainId() %>"><%=route.gettrainId() %></option></select></th>
		    <td><%= route.getDepartTime() %></td>
		    <td><select name="origin"><option value="<%=route.getOrigin()%>"><%=route.getOrigin() %></option></select></td>
		    <td><%= route.getArrivalTime() %></td>
		    <td><select name="destination"><option value="<%=route.getDestination() %>"><%=route.getDestination() %></option></select></td>
		    <td><%= route.getTotalFare()%></td>
		  	<td><button type="submit" class="btn btn-primary">Reserve</button></td>
		 </form>
		  </tr>
		  
		  <%}} %>
		  
		</tbody>
		</table>

		<div><button><a href="<%= request.getContextPath() %>/reserve">Reservation History</a></button></div>
		<div><button><a href="<%= request.getContextPath() %>/question">Question</a></button></div>
	</div>
	
	<script>
	function sortTable(order) {
			console.log(order)
			order = order - 0;
		  var table, rows, switching, i, x, y, shouldSwitch;
		  table = document.getElementById("myTable");
		  switching = true;
		  /*Make a loop that will continue until
		  no switching has been done:*/
		  while (switching) {
		    //start by saying: no switching is done:
		    switching = false;
		    rows = table.rows;
		    console.log(rows + " con")
		    /*Loop through all table rows (except the
		    first, which contains table headers):*/
		    for (i = 1; i < (rows.length - 1); i++) {
		      //start by saying there should be no switching:
		      shouldSwitch = false;
		      /*Get the two elements you want to compare,
		      one from current row and one from the next:*/
		      x = rows[i].getElementsByTagName("td")[order];
		      y = rows[i + 1].getElementsByTagName("td")[order];
		      console.log(x.innerHTML + " con");
		      //check if the two rows should switch place:
		    	let valueX = x.innerHTML;
		      let valueY = y.innerHTML;
		      
		    	if(order == 4){
		    		valueX -= 0;
		    		valueY -= 0;
		    	}
		      if (valueX > valueY) {
		        //if so, mark as a switch and break the loop:
		        shouldSwitch = true;
		        break;
		      }
		    }
		    if (shouldSwitch) {
		      /*If a switch has been marked, make the switch
		      and mark that a switch has been done:*/
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		    }
		  }
		}
		</script>
		      
		
	<form action="<%= request.getContextPath() %>/logout">
    	<button type="submit" value="Logout">Logout</button>
	</form>
</body>
</html>