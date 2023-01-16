<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
<%
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airlines","root","yash");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="homestyle.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
            <link rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<form action="Storedetails">
  <div class="container">
    <h1>Register</h1>
    <p>Enter your details to book</p>
    <hr>
    <% int rep=(int)session.getAttribute("number");
    	int fid=Integer.parseInt(request.getParameter("id"));
    	
    	String insert="select price from schedule where fid=?";
		PreparedStatement pst=con.prepareStatement(insert);
		pst.setInt(1, fid);
		ResultSet rs=pst.executeQuery();
		int price=0;
		while(rs.next()){
			price=rs.getInt("price");
		}
		int res=price*rep;
		session.setAttribute("pay",res);
		session.setAttribute("fid",fid);
    %>
    <div class="row">
		<div class="col-md-7">
			<label>Name</label>
			<input class="form-control" name="uname" &nbsp;>
		</div>
		<div class="">
			<label>Age</label>
			<input class="form-control" name="age" &nbsp;>
		</div>
		<div class="col-md-7">
			<label>Email id</label>
			<input class="form-control" name="email">
		</div>
	</div>
	<div class="row">
		<div class="col-md-7">
			<label>phone number</label>
			<input class="form-control" name="phno" &nbsp;>
		</div>
		<div class="">
			<label>Aadhar number</label>
			<input class="form-control" name="aadhar">
		</div>
	</div>
	<hr>
	<%for ( int i = 2; i<=rep; i++){ %>
	<% out.println("<strong> Enter passenger "+i+" details</strong>"); %>
	<div class="row">
		<div class="col-md-7">
			<label>Name</label>
			<input class="form-control" &nbsp;>
		</div>
		<div class="">
			<label>Age</label>
			<input class="form-control" &nbsp;>
		</div>
		<div class="col-md-7">
			<label>Email id</label>
			<input class="form-control">
		</div>
	</div>
	<div class="row">
		<div class="col-md-7">
			<label>phone number</label>
			<input class="form-control">&nbsp;
		</div>
		<div class="">
			<label>Aadhar number</label>
			<input class="form-control">
		</div>
	</div>
	<hr>
	<%}%>
    <p>By Booking tickets you agree to our <a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="registerbtn">Proceed to pay</button>
  </div>

</form>
</body>

<style>
	* {box-sizing: border-box}

/* Add padding to containers */
.container {
  padding: 16px;
}

	body{ 
  margin: auto;
  width: 640px; 
  padding: 50px;
  font-family: 'Lexend Deca', sans-serif; 
  color: #2E475D;
  background-color:#EAF0F6;    
 }


/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit/register button */
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity:1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</html>