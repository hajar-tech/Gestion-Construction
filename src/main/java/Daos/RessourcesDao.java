package Daos;

import Models.Ressource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

        String sql = "select nomRessource , typeRessource , quantite from Ressources";

        try{
            Connection con = DataBaseConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()){
                Ressource ressource = new Ressource(
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
}
