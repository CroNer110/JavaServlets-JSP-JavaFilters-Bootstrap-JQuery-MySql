package com.josip.model;

import java.util.Date;

public class Promet {
	private int idLinija;
	private int idVoznja;
    private String nazPrijevoznika;
    private String regAutobusa;
    private String vrijemePolaska;
    private String odrediste;
    private String polaziste;
    private int trajanjeVoz;
    private Date datumPolaska;
    
    public int getIdLinija(){
    	return idLinija;
    }
    
    public void setIdLinija(int idLinija){
    	this.idLinija = idLinija;
    }
    
    public int getIdVoznja() {
        return idVoznja;
    }
    public void setIdVoznja(int idVoznja) {
        this.idVoznja = idVoznja;
    }
    
    public String getNazPrijevoznika() {
        return nazPrijevoznika;
    }
    public void setNazPrijevoznika(String nazPrijevoznika) {
        this.nazPrijevoznika = nazPrijevoznika;
    }
    public String getRegAutobusa() {
        return regAutobusa;
    }
    public void setRegAutobusa(String regAutobusa) {
        this.regAutobusa = regAutobusa;
    }
    public String getVrijemePolaska() {
        return vrijemePolaska;
    }
    public void setVrijemePolaska(String vrijemePolaska) {
        this.vrijemePolaska = vrijemePolaska;
    }
    public String getPolaziste() {
        return polaziste;
    }
    public void setPolaziste(String polaziste) {
        this.polaziste = polaziste;
    }
    public String getOdrediste() {
        return odrediste;
    }
    public void setOdrediste(String odrediste) {
        this.odrediste = odrediste;
    }
    
    public Date getDatumPolaska() {
        return datumPolaska;
    }
    public void setDatumPolaska(Date datumPolaska) {
        this.datumPolaska = datumPolaska;
    }
    
    public int getTrajanjeVoz() {
        return trajanjeVoz;
    }
    public void setTrajanjeVoz(int trajanjeVoz) {
        this.trajanjeVoz = trajanjeVoz;
    }
   
    @Override
    public String toString() {
        return "Novi unos vožnje [ID vožnje=" + idVoznja + ", auto prijevoznik=" + nazPrijevoznika +", polaziste="+ polaziste +", odredište="+ odrediste
                + ", registracija autobusa=" + regAutobusa + ", datum polaska=" + datumPolaska + ", vrijeme polaska="+ vrijemePolaska + ", trajanje vožnje="+ trajanjeVoz +"]";
    }    
}