package com.josip.model;


public class User {
	private int idUser;
    private String user;
    private String pass;
  
    
    public int getIdUser(){
    	return idUser;
    }
    
    public void setIdUser(int idUser){
    	this.idUser = idUser;
    }
     
    public String getUser() {
        return user;
    }
    public void setUser(String user) {
        this.user = user;
    }
    
    
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
}