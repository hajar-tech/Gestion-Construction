package Models;

public class Ressource {
  private int idRessource;
  private int idFournisseur;
  private String nomRessource;
  private String typeRessource;
  private int quantite;

  //constructors
    public Ressource(){}

    public Ressource(int idRessource, int idFournisseur, String nomRessource, String typeRessource, int quantite) {
        this.idRessource = idRessource;
        this.idFournisseur = idFournisseur;
        this.nomRessource = nomRessource;
        this.typeRessource = typeRessource;
        this.quantite = quantite;
    }

    public Ressource(int idFournisseur, String nomRessource, String typeRessource, int quantite) {
        this.idFournisseur = idFournisseur;
        this.nomRessource = nomRessource;
        this.typeRessource = typeRessource;
        this.quantite = quantite;
    }

    //getters && setters


    public int getIdRessource() {
        return idRessource;
    }

    public void setIdRessource(int idRessource) {
        this.idRessource = idRessource;
    }

    public int getIdFournisseur() {
        return idFournisseur;
    }

    public void setIdFournisseur(int idFournisseur) {
        this.idFournisseur = idFournisseur;
    }

    public String getNomRessource() {
        return nomRessource;
    }

    public void setNomRessource(String nomRessource) {
        this.nomRessource = nomRessource;
    }

    public String getTypeRessource() {
        return typeRessource;
    }

    public void setTypeRessource(String typeRessource) {
        this.typeRessource = typeRessource;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
}
