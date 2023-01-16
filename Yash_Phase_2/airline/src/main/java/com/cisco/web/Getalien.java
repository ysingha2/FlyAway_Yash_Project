package com.cisco.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.cisco.dao.Aliendao;
import com.cisco.model.Alien;

/**
 * Servlet implementation class Getalien
 */
public class Getalien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getalien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest req, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(req.getParameter("aid"));
		Aliendao adao=new Aliendao();
		Alien a=adao.getalien(id);
		//System.out.println(a);
		req.setAttribute("fetchalien", a);
		RequestDispatcher rd=req.getRequestDispatcher("show.jsp");
		rd.forward(req, res);
	}

}
