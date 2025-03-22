package Models;

public class TacheRessource {
    private int idTache;       // Clé étrangère vers Tache
    private int idRessource;   // Clé étrangère vers Ressource
    private int quantiteAssocier;

    //constructors

    public TacheRessource(){}

    public TacheRessource(int idTache, int idRessource, int quantiteAssocier) {
        this.idTache = idTache;
        this.idRessource = idRessource;
        this.quantiteAssocier = quantiteAssocier;
    }

    //getters && seters

    public int getIdTache() {
        return idTache;
    }

    public void setIdTache(int idTache) {
        this.idTache = idTache;
    }

    public int getIdRessource() {
        return idRessource;
    }

    public void setIdRessource(int idRessource) {
        this.idRessource = idRessource;
    }

    public int getQuantiteAssocier() {
        return quantiteAssocier;
    }

    public void setQuantiteAssocier(int quantiteAssocier) {
        this.quantiteAssocier = quantiteAssocier;
    }
}
