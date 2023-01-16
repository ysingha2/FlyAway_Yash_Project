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
	<!-- <form action="getalien" class="form-group">
	<label>Enter id to search</label>
		<input type="text" name="aid" class="form-control"/>
		<button type="submit" class="btn btn-primary">submit</button>
	</form> -->
	
	<form action="showflights.jsp" class="form-group">
	
		<label>Enter your date of journey</label>
		<input type="date" name="doj" class="form-control" /><hr>
		<select name="src" class="form-control">
			<option>--choose source--</option>
			<%
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select distinct(src) from schedule;");
				while(rs.next()){
					String source=rs.getString("src");
					out.println("<option val ="+source+">"+source+"</option>");
				}
			%>
		</select>
		<br><br>
		<select name="dest" class="form-control">
			<option>--choose destination--</option>
			<%
				rs=st.executeQuery("select distinct(dest) from schedule;");
				while(rs.next()){
					String destination=rs.getString("dest");
					out.println("<option val ="+destination+">"+destination+"</option>");
				}
			%>
		</select>
		<br><br>
		<label>Enter no of passengers</label>
		<input type="text" name="number" class="form-control">
		<br><br>
		
		<!-- <label>
                <input type="checkbox" 
                       > Show flights
         </label>
         
         <script type="text/javascript">
            $(document).ready(function() {
            	$(".selectt").hide();
                $('input[type="checkbox"]').click(function() {
                    $(".selectt").toggle();
                });
            });
        </script> -->
        
         <button class="btn btn-primary">Search flights</button>
         <%-- <div class="selectt">
         	<p>flights are</p>
         	<jsp:include page="showflights.jsp" />
         </div>
		 --%>
	</form>
	
</body>

<style>
	body{ 
  margin: auto;
  width: 640px; 
  padding: 50px;
  font-family: 'Lexend Deca', sans-serif; 
  color: #2E475D;
  background-color:#EAF0F6;    
 }
</style>
</html>