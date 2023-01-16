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
<form action="details.jsp">
<table border="1" id="customers">
	<tr>
		<th>' '</th>
		<th>Flight Id</th>
		<th>Arrival time</th>
		<th>Departure</th>
		<th>Price</th>
	</tr>
<%
         	
	         	String source=request.getParameter("src");
	     		String destination=request.getParameter("dest");
	     		session.setAttribute("DOJ", request.getParameter("doj"));
	     		int num=Integer.parseInt(request.getParameter("number"));
	     		session.setAttribute("number", num);
	     		
	     			String insert="select * from schedule where src=? and dest=?;";
	    			PreparedStatement pst=con.prepareStatement(insert);
	    			pst.setString(1, source);
	    			pst.setString(2, destination); 
	    			ResultSet rs=pst.executeQuery();
	    			/* out.print("<table border='1'>"); */
					while(rs.next()){
						int fid=rs.getInt("fid");
						String src=rs.getString("src");
						String dest=rs.getString("dest");
						int price=rs.getInt("price");
						out.println("<tr>"+
							"<td>"+ "<input type=radio class=form-control name=id value=" + fid +">"+"</td>"+
							"<td>"+ "<h5>"+fid+"</h5>"+"</td>"+
							"<td>"+ "<h5>"+rs.getTime("arr")+"</h5>"+"</td>"+
							"<td>"+ "<h5>"+rs.getTime("dept")+"</h5>"+"</td>"+
							"<td>"+ "<h5> $"+price+"</h5>"+"</td>"+
									"</tr>");
						
					}
	     		 out.print("</table>");
	     		
         	%>
         	<hr>
         	<button class="btn btn-success">Book Now</button>
         	</form>

</body>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</html>