package com.cisco.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.cisco.dao.Changepswdao;

/**
 * Servlet implementation class Changepsw
 */
public class Changepsw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Changepsw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String psw=request.getParameter("passOne").toString();
		Changepswdao ch=new Changepswdao();
		ch.changepsw(psw);
		HttpSession session=request.getSession();
		session.setAttribute("change", true);
		response.sendRedirect("changepsw.jsp");
	}

}
