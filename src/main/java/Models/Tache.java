package Models;

import java.sql.Date;

public class Tache {
    private int idTache;
    private String descriptionTache;
    private Date dateDebut;
    private Date dateFin;
    private int idProjet;


    //constructors

    public Tache(String descriptionTache, Date dateDebut, Date dateFin, int idProjet) {
        this.descriptionTache = descriptionTache;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.idProjet = idProjet;
    }

    public Tache(int idTache, String descriptionTache, Date dateDebut, Date dateFin, int idProjet) {
        this.idTache = idTache;
        this.descriptionTache = descriptionTache;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.idProjet = idProjet;
    }

    //getters && setters

    public int getIdTache() {
        return idTache;
    }

    public void setIdTache(int idTache) {
        this.idTache = idTache;
    }

    public String getDescriptionTache() {
        return descriptionTache;
    }

    public void setDescriptionTache(String descriptionTache) {
        this.descriptionTache = descriptionTache;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public int getIdProjet() {
        return idProjet;
    }

    public void setIdProjet(int idProjet) {
        this.idProjet = idProjet;
    }
}
