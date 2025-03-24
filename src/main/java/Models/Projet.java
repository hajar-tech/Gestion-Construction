package Models;

import java.sql.Date;

public class Projet {
    private int idProjet;
    private String NomProjet;
    private Date dateDebutProjrt;
    private Date dateFinProjet;
    private double budget;
    private String descriptionProjet;


    public Projet(){}

    public Projet(String nomProjet, Date dateDebutProjrt, Date dateFinProjet, double budget, String descriptionProjet) {
        NomProjet = nomProjet;
        this.dateDebutProjrt = dateDebutProjrt;
        this.dateFinProjet = dateFinProjet;
        this.budget = budget;
        this.descriptionProjet = descriptionProjet;
    }

    public Projet(int idProjet, String nomProjet, Date dateDebutProjrt, Date dateFinProjet, double budget, String descriptionProjet) {
        this.idProjet = idProjet;
        NomProjet = nomProjet;
        this.dateDebutProjrt = dateDebutProjrt;
        this.dateFinProjet = dateFinProjet;
        this.budget = budget;
        this.descriptionProjet = descriptionProjet;
    }

    public int getIdProjet() {
        return idProjet;
    }

    public void setIdProjet(int idProjet) {
        this.idProjet = idProjet;
    }

    public String getNomProjet() {
        return NomProjet;
    }

    public void setNomProjet(String nomProjet) {
        NomProjet = nomProjet;
    }

    public Date getDateDebutProjrt() {
        return dateDebutProjrt;
    }

    public void setDateDebutProjrt(Date dateDebutProjrt) {
        this.dateDebutProjrt = dateDebutProjrt;
    }

    public Date getDateFinProjet() {
        return dateFinProjet;
    }

    public void setDateFinProjet(Date dateFinProjet) {
        this.dateFinProjet = dateFinProjet;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public String getDescriptionProjet() {
        return descriptionProjet;
    }

    public void setDescriptionProjet(String descriptionProjet) {
        this.descriptionProjet = descriptionProjet;
    }

    @Override
    public String toString() {
        return "Projet{" +
                "idProjet=" + idProjet +
                ", NomProjet='" + NomProjet + '\'' +
                ", dateDebutProjrt=" + dateDebutProjrt +
                ", dateFinProjet=" + dateFinProjet +
                ", budget=" + budget +
                ", descriptionProjet='" + descriptionProjet + '\'' +
                '}';
    }
}
