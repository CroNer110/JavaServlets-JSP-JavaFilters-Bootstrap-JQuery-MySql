package com.josip.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.josip.dao.PrometDao;
import com.josip.model.Promet;




public class PrometController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/WEB-INF/JSP/promet.jsp";
    private static String LIST_PROMET = "/WEB-INF/JSP/listPromet.jsp";
    private static String KRIVI = "/WEB-INF/JSP/krivi.jsp";
    private static String SIGN = "/WEB-INF/JSP/signUp.html";
    private static String GLAVNI = "/WEB-INF/JSP/pretraga.jsp";
   
    private PrometDao dao;

    public PrometController() {
        super();
        dao = new PrometDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	List<Promet>prometl = null;
		
		
		prometl = dao.getAllVoznje();
		request.getSession().setAttribute("prometl", prometl);
		
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher(GLAVNI);
		rd.forward(request, response);
    	
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String idVoznja = request.getParameter("idVoznja");
		String action = request.getParameter("action");
		String polaziste = request.getParameter("polaziste");			// izmjena, nova voznja
		String odrediste = request.getParameter("odrediste");
		String polazistep = request.getParameter("polazistep");
		String odredistep = request.getParameter("odredistep");// izmjena, nova voznja
		String nazPrijevoznika = request.getParameter("nazPrijevoznika");			// izmjena, nova voznja
		String regAutobusa = request.getParameter("regAutobusa");			// izmjena, nova voznja
		String vrijemePolaska = request.getParameter("vrijemePolaska");		// izmjena, nova voznja
		String trajanjeVoz = request.getParameter("trajanjeVoz");			// izmjena, nova voznja
		String datumPolaska = request.getParameter("datumPolaska");  // izmjena, nova voznja
     
		
    	List<Promet>prometl = null;
        Promet promet = new Promet();
		RequestDispatcher rd;
	
    	switch (action) {
		case "delete":
			
			System.out.println("Brisanje ID: " + idVoznja + " " + new Date() );
			
			dao.deleteVoznju(Integer.parseInt(idVoznja));
			
				
			prometl = dao.getAllVoznje();
			request.getSession().setAttribute("prometl", prometl);
			
					

			rd = request.getRequestDispatcher(LIST_PROMET);
			rd.forward(request, response);
			break;
		case "edit":
			System.out.println("Izmjena ID: " + idVoznja + " " + new Date() );
			
			
			
			try {
				promet = dao.getVoznjuById(Integer.parseInt(idVoznja));
				
			} catch (Exception e1) {
				System.out.println("Problemi!!!");
				e1.printStackTrace();
			}
			
			request.getSession().setAttribute("promet", promet);
			
			
			rd = request.getRequestDispatcher(INSERT_OR_EDIT);
			rd.forward(request, response);
			break;
		case "zapis":
			System.out.println("Zapis izmjenjenih podataka ID: " + idVoznja + " " + new Date() );
			
			System.out.println(promet);
			System.out.println(idVoznja);
			System.out.println(odredistep);
			System.out.println(polazistep);
			System.out.println(datumPolaska);
			System.out.println(nazPrijevoznika);
			try {
				promet = dao.getVoznjuById(Integer.parseInt(idVoznja));
				
			} catch (Exception e1) {
				System.out.println("Problemi!!!");
				e1.printStackTrace();
			}
			
			
			promet.setNazPrijevoznika(nazPrijevoznika);
            promet.setPolaziste(polazistep);
            promet.setRegAutobusa(regAutobusa);
            promet.setVrijemePolaska(vrijemePolaska);   
            promet.setOdrediste(odredistep);
        	
        	try {
        		promet.setIdVoznja(Integer.parseInt(idVoznja));
        		promet.setTrajanjeVoz(Integer.parseInt(trajanjeVoz));
                Date datum = new SimpleDateFormat("yyyy-MM-dd").parse(datumPolaska);
                promet.setDatumPolaska(datum);
            } catch (ParseException e) {
            	System.out.println("Ne valja ti datum!!!");
                e.printStackTrace();
            }
            
			dao.updateVoznju(promet);			
			
			// ponovno ucitavanje svih podataka
			prometl = dao.getAllVoznje();
			request.getSession().setAttribute("prometl", prometl);
				
			// prikaz novog stanja
			rd = request.getRequestDispatcher(LIST_PROMET);
			rd.forward(request, response);
			break;
		case "nova":
			System.out.println("Unos nove voznje: " + new Date() );
			
			rd = request.getRequestDispatcher(INSERT_OR_EDIT);
			rd.forward(request, response);
			break;
		case "pretraga":
			System.out.println("Nova pretraga voznji: " + polaziste + " " + odrediste + " " + new Date() );
			prometl=dao.getVoznjuByOdr(odrediste, polaziste);
			
			request.getSession().setAttribute("prometl", prometl);
			
			rd = request.getRequestDispatcher(LIST_PROMET);
			rd.forward(request, response);
			break;
		case "zapisnova":
			
			System.out.println("Zapis nove voznje: " + new Date() );
			
			dao.addVoznju(promet);
			
			
			// ponovno ucitavanje svih podataka
			prometl = dao.getAllVoznje();
			request.getSession().setAttribute("prometl", prometl);
						
			rd = request.getRequestDispatcher(GLAVNI);
			rd.forward(request, response);
			break;	
		default:
			System.out.println("Ispis svih voznji: "  + new Date() );
			prometl = dao.getAllVoznje();
			request.getSession().setAttribute("prometl", prometl);
					
			
			rd = request.getRequestDispatcher(LIST_PROMET);
			rd.forward(request, response);
			break;
		}
       
    }
}