package com.josip.controller;

import javax.script.*;
import java.io.IOException;
import java.io.*;


import com.josip.dao.PrometDao;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogFilter
 */

public class LogServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    private PrometDao dao;
	    public LogServlet() {
	        super();
	        dao = new PrometDao();
	    }
	    protected void doPost(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	 
	        // get request parameters for userID and password
	        final String user = request.getParameter("user");
	        final String pass = request.getParameter("pwd");
	        
	        
	        boolean uspjeh=false;
	        uspjeh=dao.provjeriUsera(user, pass);
	        if(uspjeh==true){
	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            //setting session to expire in 30 mins
	            session.setMaxInactiveInterval(30*60);
	            Cookie userName = new Cookie("user", user);
	            userName.setMaxAge(30*60);
	            response.addCookie(userName);

	            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/WEB-INF/JSP/pretraga.jsp");
	            requestDispatcher.forward(request, response);
	            
	        }else{
	        	
	        	
	        	HttpSession session = request.getSession();
	            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
	               
	            String fafa="Please fix the errors and try again.";
	            session.setAttribute("wrong",fafa);
	            
	            rd.include(request, response);
	        }
	 
	    }
	 
	}