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
</head>
<body>
<form>
	<table border="1" id="customers">
	<tr>
		
		<th>Flight Id</th>
		<th>Source</th>
		<th>Destination</th>
		<th>Arrival time</th>
		<th>Departure time</th>
		<th>price</th>
	</tr>
<%
         	
	         	
	     		
	     			String insert="select * from schedule ";
	    			PreparedStatement pst=con.prepareStatement(insert);
	    			ResultSet rs=pst.executeQuery();
	    			/* out.print("<table border='1'>"); */
					while(rs.next()){
						int fid=rs.getInt("fid");
						String src=rs.getString("src");
						String dest=rs.getString("dest");
						int price=rs.getInt("price");
						out.println("<tr>"+
							"<td>"+ "<h5>"+fid+"</h5>"+"</td>"+
							"<td>"+ "<h5>"+rs.getString("src")+"</h5>"+"</td>"+
							"<td>"+ "<h5>"+rs.getString("dest")+"</h5>"+"</td>"+
							"<td>"+ "<h5>"+rs.getTime("arr")+"</h5>"+"</td>"+
							"<td>"+ "<h5>"+rs.getTime("dept")+"</h5>"+"</td>"+
							"<td>"+ "<h5> $"+price+"</h5>"+"</td>"+
									"</tr>");
						
					}
	     		 out.print("</table>");
	     		
         	%>
         	<hr>
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