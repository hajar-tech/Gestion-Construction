package Daos;

import Models.Tache;

import java.sql.*;

public class TacheDao {

    public static int addTache (Tache tache){
        int idTache =0;

        String sql = "INSERT INTO Tache (descriptionTache, dateDebutTache, dateFinTache, idProjet) VALUES (?,?, ?, ?)";
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return idTache ;



    }
}
