package com.cisco.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Validatedao {
	
	public boolean valid(String uname,String psw) {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airlines","root","yash");
			String sel="select * from admin where id=?";
			PreparedStatement pst=con.prepareStatement(sel);
			pst.setString(1, uname);
			ResultSet rs= pst.executeQuery();
			if(rs.next()) {
				if(rs.getString("id").equals(uname) && rs.getString("password").equals(psw))
					return true;
				else
					return false;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

}
