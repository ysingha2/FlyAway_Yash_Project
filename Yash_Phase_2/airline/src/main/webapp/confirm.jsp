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
<% int aadhar=(int)session.getAttribute("aadhar");
	String insert="select * from person where aadhar=?";
		PreparedStatement pst=con.prepareStatement(insert);
		pst.setInt(1, aadhar);
		ResultSet rs=pst.executeQuery();
		int bid=0;
		if(rs.next())
		{
			out.println("<h2> Hi "+rs.getString("pname")+"</h2>");
			bid=rs.getInt("bid");
		}
		
		
		int fid=(int)session.getAttribute("fid");
		String insert1="select * from schedule where fid=?;";
		PreparedStatement pst1=con.prepareStatement(insert1);
		pst1.setInt(1,fid);
		ResultSet rs1=pst1.executeQuery();
		int id=0,price=0;
		String src="",dest="",arrtime="",deptime="";
		if(rs1.next()){
			 id=rs1.getInt("fid");
			 src=rs1.getString("src");
			 dest=rs1.getString("dest");
			 price=rs1.getInt("price");
			 arrtime=rs1.getTime("arr").toString();
			 deptime=rs1.getTime("dept").toString();
		}
		int total=(int)session.getAttribute("pay");
		%>
	
<p>Your reservation request for Fligh ID <strong><%out.print(id); %></strong>, from
<strong><%out.print(src); %></strong> to <strong> <%out.print(dest); %> </strong>has been confirmed. Please review the details of your booking.</p>

<p style="border: 1px solid #EAF0F6;padding:4px">Booking Confirmation Code:<strong> ARS<%out.println(bid);%></strong></p>
<hr>
<div style="text-align: center;">
	<table style="text-align: center;">
		<tr>
			<th>Arrival time</th>
			<th>Date Of Journey</th>
			<th>Departure time</th>
		</tr>
		<tr>
			<td><%=arrtime %></td>
			<td> <%out.print(session.getAttribute("DOJ")); %></td>
			<td><%=deptime %></td>
		</tr>
	</table>
</div>
	<hr style="color: #EAF0F6;">
<h3>Total paid amount</h3>
<div style="text-align:center;">
	<table style= "text-align: center;">
		<tr>
		<td>Ticket cost * passengers</td>
		</tr>
		<tr></tr>
		<tr></tr>
		<tr>
		<td><%=price %> * <%=(total/price) %></td>
		<td>&nbsp;&nbsp;&nbsp;</td>
		<td><%=total %></td>
		</tr>
		<tr></tr>
		<tr>
				<th>Amount paid</th>
				<th>&nbsp;&nbsp;&nbsp;</th>
				<th><%=total %></th>
		</tr>
	</table>
</div>
<strong style="text-align:center;">Enjoy your journey!! Happy journey</strong>
</body>
<style>
	table{ 
  margin: auto;
  width: 640px; 
  padding: 50px;
  font-family: 'Lexend Deca', sans-serif; 
  color: #2E475D;
  border: 1px solid #EAF0F6; 
  border-collapse: separate;
    border-spacing: 2px;
    border-color: #EAF0F6;
 }

	body{ 
  margin: auto;
  width: 640px; 
  padding: 50px;
  font-family: 'Lexend Deca', sans-serif; 
  color: #2E475D;
    
 }
</style>
</html>