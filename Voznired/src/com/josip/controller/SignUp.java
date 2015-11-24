package com.josip.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.josip.dao.PrometDao;

/**
 * Servlet implementation class SignUp
 */

public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String POCETNA = "login.html";
	private PrometDao dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        dao = new PrometDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out= response.getWriter();
		RequestDispatcher rs = getServletContext().getRequestDispatcher("WEB-INF/signUp.html");
		String user = request.getParameter("userN");
		String pass = request.getParameter("passN1");
		String pass2 = request.getParameter("passN2");
		
		if(user==null||pass==null||pass2==null||user==""||pass==""||pass2==""){
			 out.println("<br><font color=red>Upišite sva polja!!!</font>");
			 rs.include(request, response);
		}
		else if(!(pass.equals(pass2))){
			 out.println("<br><font color=red>Ponovite unos passworda!!!</font>");
			 rs.include(request, response);
		}
		else {
			
			dao.dodajUsera(user,pass);
			RequestDispatcher view = request.getRequestDispatcher(POCETNA);
            view.forward(request, response);
		}
	}

}
