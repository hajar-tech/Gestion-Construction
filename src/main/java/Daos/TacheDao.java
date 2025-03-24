package Daos;

import Models.Tache;
import Models.TacheRessource;

import java.sql.*;
import java.util.List;

public class TacheDao {

    public static int addTache (Tache tache){
        int idTache =0;

        String sql = "INSERT INTO Taches (descriptionTache, dateDebutTache, dateFinTache, idProjet) VALUES (?,?, ?, ?)";
        try{
            Connection con = DataBaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql , Statement.RETURN_GENERATED_KEYS);
            pst.setString(1,tache.getDescriptionTache());
            pst.setDate(2,tache.getDateDebut());
            pst.setDate(3,tache.getDateFin());
            pst.setInt(4, tache.getIdProjet());

            pst.executeUpdate();
            ResultSet rs = pst.getGeneratedKeys();
            if(rs.next()){
                idTache = rs.getInt(1);
                System.out.println("id tache est " +idTache);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return idTache ;
    }


    public void associerRessources(List<TacheRessource> ressources) {
        String sql = "INSERT INTO TacheRessources (idTache, idRessource, quantiteAssocier) VALUES (?, ?, ?)";
        try (   Connection conn = DataBaseConnection.getConnection()) {
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                for (TacheRessource tr : ressources) {
                    stmt.setInt(1, tr.getIdTache());
                    stmt.setInt(2, tr.getIdRessource());
                    stmt.setInt(3, tr.getQuantiteAssocier());
                    stmt.executeUpdate();
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
