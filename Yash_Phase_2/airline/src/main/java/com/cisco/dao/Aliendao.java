package com.cisco.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cisco.model.Alien;

public class Aliendao {
	public Alien getalien(int id) {
		Alien a=new Alien();
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingsys","root","root");
			String sel="select * from alien where aid=?";
			PreparedStatement pst=con.prepareStatement(sel);
			pst.setInt(1, id);
			ResultSet rs= pst.executeQuery();
			while(rs.next()) {
				a.setAid(rs.getInt("aid"));
				a.setAname(rs.getString("aname"));
				a.setTech(rs.getString("tech"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

}
