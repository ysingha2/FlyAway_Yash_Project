package com.cisco.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;



import com.cisco.dao.Storedetailsdao;

/**
 * Servlet implementation class Storedetails
 */
public class Storedetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Storedetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uname=(req.getParameter("uname")).toString();
		int age = Integer.parseInt(req.getParameter("age"));
		String email=req.getParameter("email").toString();
		int phno=Integer.parseInt(req.getParameter("phno"));
		int aadhar = Integer.parseInt(req.getParameter("aadhar"));
		Storedetailsdao store=new Storedetailsdao();
		store.storedetails(uname, age, email, phno, aadhar);
		RequestDispatcher rd=req.getRequestDispatcher("payment.jsp");
		req.setAttribute("aadhar", aadhar);
		rd.forward(req, res);
	}

}
