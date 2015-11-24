package com.josip.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthFilter
 */
public class AuthFilter implements Filter {

    private ServletContext context;
    
    
    public void init(FilterConfig fConfig) throws ServletException {
    	
    	
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }
     
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
 
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
         
        String uri = req.getRequestURI();
        this.context.log("Requested Resource::"+uri);
//         req.
        HttpSession session = req.getSession(false);
        
         
        if(session == null && !(uri.endsWith("html") || uri.endsWith("LogServlet"))){
            this.context.log("Unauthorized access request");
            res.sendRedirect("login.html");
        }else{	
        	chain.doFilter(request, response);// Just continue chain.
        }
         
         
    }
 
     
 
    public void destroy() {
        //close any resources here
    }
 
}