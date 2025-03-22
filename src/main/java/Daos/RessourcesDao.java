package Daos;

import Models.Ressource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RessourcesDao {

    int idFournisseur = 1;

    public int addRessource (Ressource ressource){
        int result = 0;

        String sql = "INSERT INTO Ressources ( nomRessource, typeRessource, quantite, idFournisseur) VALUES ( ?, ?, ?, ?);\n";
        try {
            Connection con = DataBaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, ressource.getNomRessource());
            pst.setString(2,ressource.getTypeRessource());
            pst.setInt(3, ressource.getQuantite());
            pst.setInt(4, idFournisseur);

            result = pst.executeUpdate();
            if (result >0){
                System.out.println("ressource ajoutee avec success");
            }else {
                System.out.println("error lors de ajoute de ressource ");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    public static List displayRessource (){
        List<Ressource> ressources = new ArrayList<>();

        String sql = "select idRessource , nomRessource , typeRessource , quantite from Ressources;";

        try{
            Connection con = DataBaseConnection.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Ressource ressource = new Ressource(
                        rs.getInt("idRessource"),
                        rs.getString("nomRessource"),
                        rs.getString("typeRessource"),
                        rs.getInt("quantite")
                );
                ressources.add(ressource);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return  ressources;
    }



    public static int deleteRessource (int idRessource){
        int deleteSuccess = 0;
        String sql ="delete from Ressources where idRessource = ?";
        try {
            Connection con = DataBaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1,idRessource);

            deleteSuccess = pst.executeUpdate();

            if (deleteSuccess > 0){
                System.out.println("supprission valide");
            }else {
                System.out.println("supprission invalide");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleteSuccess;

    }


    public static boolean editRessource (Ressource ressource) {

        String sql = "update Ressources set nomRessource = ? , typeRessource = ? , quantite = ? where idRessource = ?";
        try{
            Connection con = DataBaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1,ressource.getNomRessource());
            pst.setString(2, ressource.getTypeRessource());
            pst.setInt(3,ressource.getQuantite());
            pst.setInt(4, ressource.getIdRessource());

           return pst.executeUpdate() > 0;

        }catch (Exception e){
            e.printStackTrace();
        }

        return false;

    }


    public void mettreAJourQuantite(int idRessource, int quantite) {
        String sql = "UPDATE Ressources SET quantite = quantite + ? WHERE idRessource = ?";
        try (   Connection conn = DataBaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quantite);
            stmt.setInt(2, idRessource);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
