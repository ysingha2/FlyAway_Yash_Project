package com.cisco.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.cisco.dao.Validatedao;

/**
 * Servlet implementation class Validate
 */
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Validatedao vdao=new Validatedao();
		String uname=request.getParameter("uname").toString();
		String psw=request.getParameter("psw").toString();
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		boolean v=vdao.valid(uname, psw);
		if(v) {
			response.sendRedirect("adminop.jsp");
		}
		else
		{
			session.setAttribute("valid","notvalid");
			response.sendRedirect("login.jsp");
		}
			
	}

}
