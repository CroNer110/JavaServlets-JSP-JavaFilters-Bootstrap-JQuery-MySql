package com.josip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.josip.model.Promet;
import com.josip.util.DbUtil;

public class PrometDao {

    private Connection connection;

    public PrometDao() {
        connection = DbUtil.getConnection();
    }

    public void addVoznju(Promet promet) { //Ovo necu pokretat jer nisam siguran da li da izvedem izmjene na svakoj tablici posebno ili ovako odjednom...
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into promet(nazPrijevoznika,vrijemePolaska,regAutobusa,datumPolaska) values (?, ?, ?, ?) where linija.idLinija=promet.idLinija;", PreparedStatement.RETURN_GENERATED_KEYS);
            // Parameters start with 1
            preparedStatement.setString(1, promet.getNazPrijevoznika());
            preparedStatement.setString(2, promet.getVrijemePolaska());
            preparedStatement.setString(3, promet.getRegAutobusa());
            preparedStatement.setDate(4, new java.sql.Date(promet.getDatumPolaska().getTime()));
            preparedStatement.executeUpdate();
            
            ResultSet keyResultSet1 = preparedStatement.getGeneratedKeys(); // dohvacanje generiranog ID-a         
			int NidVoznja = 0;         
			if (keyResultSet1.next()) {             
				NidVoznja = (int) keyResultSet1.getInt(1);             
				//customerId = String.valueOf(newCustomerId);         
			}  
			promet.setIdVoznja(NidVoznja);
			
			keyResultSet1.close();
			connection.close();
            
            PreparedStatement pStatement=connection.prepareStatement("insert into linija(trajanjeVoz,odrediste) values (?, ?) where linija.idLinija=promet.idLinija;", PreparedStatement.RETURN_GENERATED_KEYS);
            pStatement.setInt(1, promet.getTrajanjeVoz());  
            pStatement.setString(2, promet.getOdrediste());
            pStatement.executeUpdate();
            ResultSet keyResultSet2 = preparedStatement.getGeneratedKeys(); // dohvacanje generiranog ID-a         
			int NidLinija = 0;         
			if (keyResultSet2.next()) {             
				NidLinija = (int) keyResultSet2.getInt(1);             
				//customerId = String.valueOf(newCustomerId);         
			}  
			promet.setIdLinija(NidLinija);
			
            preparedStatement.close();
            pStatement.close();
            
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean provjeriUsera(String user,String pass){
    	
    	try{
    		
    		 PreparedStatement preparedStatement = connection.prepareStatement("select user,pass from users where BINARY user=? and BINARY pass=?");
    		 preparedStatement.setString(1,user);
             preparedStatement.setString(2,pass);
    		 ResultSet rs = preparedStatement.executeQuery();
    		
    		 
             if(!(rs.next())) {     
            	 return false;   
             }         
             
             rs.close();
             preparedStatement.close();
            
    	}catch (SQLException e) {
            e.printStackTrace();
            return false;
    	}
    	
    	return true;  	
    }
    
    public void dodajUsera(String user,String pass){
    	try{
    		PreparedStatement preparedStatement=connection.
    	    prepareStatement("insert into users(user,pass) values (?,?)");
    		preparedStatement.setString(1,user);
    		preparedStatement.setString(2,pass);
    		
    		preparedStatement.executeUpdate();
    		preparedStatement.close();
    		
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    	
    }
    
    public void deleteVoznju(int idVoznja) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from promet where idVoznja=?");
            // Parameters start with 1
            preparedStatement.setInt(1, idVoznja);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


	public void updateVoznju(Promet promet) {
        try {
        	PreparedStatement pStatement=connection
                    .prepareStatement("update linija set trajanjeVoz=?,odrediste=?,polaziste=? where idLinija=(select idLinija from promet where idVoznja=?)");
        	pStatement.setInt(1, promet.getTrajanjeVoz());  
            pStatement.setString(2, promet.getOdrediste());
            pStatement.setString(3, promet.getPolaziste());
            pStatement.setInt(4, promet.getIdVoznja());
            
        	pStatement.executeUpdate();
        	
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update promet set nazPrijevoznika=?, vrijemePolaska=?, regAutobusa=?, datumPolaska=? where idVoznja=?");
            // Parameters start with 1
            preparedStatement.setString(1, promet.getNazPrijevoznika());
            preparedStatement.setString(2, promet.getVrijemePolaska());
            preparedStatement.setString(3, promet.getRegAutobusa());
            preparedStatement.setDate(4, new java.sql.Date(promet.getDatumPolaska().getTime()));
            preparedStatement.setInt(5, promet.getIdVoznja());
            
            preparedStatement.executeUpdate();        
            
            pStatement.close();
            preparedStatement.close();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Promet> getAllVoznje() {
        List<Promet> prometl = new ArrayList<Promet>();
        try {
            PreparedStatement pStatement = connection.prepareStatement("select idVoznja,odrediste,polaziste,nazPrijevoznika,regAutobusa,datumPolaska,vrijemePolaska,trajanjeVoz from promet,linija where promet.idLinija=linija.idLinija");
            ResultSet rs = pStatement.executeQuery();
            while (rs.next()) {
                Promet promet = new Promet();
                promet.setIdVoznja(rs.getInt("idVoznja"));
                promet.setOdrediste(rs.getString("odrediste"));
                promet.setVrijemePolaska(rs.getString("vrijemePolaska"));
                promet.setTrajanjeVoz(rs.getInt("trajanjeVoz"));
                promet.setNazPrijevoznika(rs.getString("nazPrijevoznika"));
                promet.setRegAutobusa(rs.getString("regAutobusa"));
                promet.setDatumPolaska(rs.getDate("datumPolaska"));
                promet.setPolaziste(rs.getString("polaziste"));
                prometl.add(promet);
                      
            }
            
            rs.close(); 
            pStatement.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return prometl;
    }

    public Promet getVoznjuById(int idVoznja) {
        Promet promet = new Promet();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select promet.idVoznja, linija.odrediste, linija.polaziste, promet.nazPrijevoznika, promet.regAutobusa, promet.datumPolaska, promet.vrijemePolaska, linija.trajanjeVoz from promet,linija where promet.idLinija=linija.idLinija and promet.idVoznja=?");
            preparedStatement.setInt(1, idVoznja);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	promet.setIdVoznja(rs.getInt("idVoznja"));
                promet.setOdrediste(rs.getString("odrediste"));
                promet.setVrijemePolaska(rs.getString("vrijemePolaska"));
                promet.setTrajanjeVoz(rs.getInt("trajanjeVoz"));
                promet.setNazPrijevoznika(rs.getString("nazPrijevoznika"));
                promet.setRegAutobusa(rs.getString("regAutobusa"));
                promet.setDatumPolaska(rs.getDate("datumPolaska"));
                promet.setPolaziste(rs.getString("polaziste"));
                
            }
            rs.close();
            preparedStatement.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return promet;
    }
    public List<Promet> getVoznjuByOdr(String odrediste,String polaziste) {
    	List<Promet> prometl = new ArrayList<Promet>();
    	
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select promet.idVoznja,linija.odrediste,linija.polaziste ,promet.nazPrijevoznika,promet.regAutobusa,promet.datumPolaska,promet.vrijemePolaska,linija.trajanjeVoz from promet,linija where promet.idLinija=linija.idLinija and linija.odrediste=? and linija.polaziste=?");
            preparedStatement.setString(1,odrediste);
            preparedStatement.setString(2,polaziste);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Promet promet = new Promet();
            	promet.setIdVoznja(rs.getInt("idVoznja"));
                promet.setOdrediste(rs.getString("odrediste"));
                promet.setVrijemePolaska(rs.getString("vrijemePolaska"));
                promet.setTrajanjeVoz(rs.getInt("trajanjeVoz"));
                promet.setNazPrijevoznika(rs.getString("nazPrijevoznika"));
                promet.setRegAutobusa(rs.getString("regAutobusa"));
                promet.setDatumPolaska(rs.getDate("datumPolaska"));  
                promet.setPolaziste(rs.getString("polaziste"));
                prometl.add(promet);
                
            }
            rs.close();
            preparedStatement.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prometl;
        
    }
    
    public void zatvoriKonekciju(){
    	try{
    		if(!connection.isClosed()){
    	connection.close();
    		}
    	}catch (SQLException e) {
            e.printStackTrace();
        }
    }
}