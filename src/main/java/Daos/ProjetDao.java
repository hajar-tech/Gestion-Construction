package Daos;

import Models.Projet;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjetDao {


//fonction pour ajouter un projet
    public static  int insertProject(Projet projet) {

        String query = "insert into Projets (NomProjet , dateDebutProjet , dateFinProjet ,budget, descriptionProjet)\n" +
                "VALUES (?,?,?,?,?)";
        int idProjet = 0;

        try {
            Connection connection = DataBaseConnection.getConnection();
            if (connection != null) {
                PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, projet.getNomProjet());
                preparedStatement.setDate(2, projet.getDateDebutProjrt());
                preparedStatement.setDate(3, projet.getDateFinProjet());
                preparedStatement.setDouble(4, projet.getBudget());
                preparedStatement.setString(5, projet.getDescriptionProjet());
                int affectedRow = preparedStatement.executeUpdate();
                if (affectedRow > 0) {
                    ResultSet rs = preparedStatement.getGeneratedKeys();
                    if (rs.next()) {
                        idProjet = rs.getInt(1);
                        System.out.println(" Projet inséré avec l'ID : " + idProjet);
                    }
                }


            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return idProjet;
    }

  //fonction pour afficher la liste des projet

  public static Projet displayProjetDetailsById(int  id){
        Projet projet=null ;
        String query = "select * from Projets where idProjet = ?";

        try{
            Connection con = DataBaseConnection.getConnection();
           PreparedStatement pst = con.prepareStatement(query);
           pst.setInt(1,id);
           ResultSet rs = pst.executeQuery();
           while (rs.next()){
               projet = new Projet(
                       rs.getInt("idProjet"),
                       rs.getString("NomProjet"),
                       rs.getDate("dateDebutProjet"),
                       rs.getDate("dateFinProjet"),
                       rs.getDouble("budget"),
                       rs.getString("descriptionProjet")
               );
              return projet;
           }

        } catch (SQLException e) {
           e.printStackTrace();
        }


        return projet;
  }

  public static List displayProjectName(){
        List<Projet> projetNames = new ArrayList<>();

        String query ="select NomProjet , idProjet from Projets";
        try {
            Connection con = DataBaseConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Projet projet = new Projet();
                projet.setNomProjet(rs.getString("NomProjet"));
                projet.setIdProjet(Integer.parseInt(rs.getString("idProjet")));
                projetNames.add(projet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

      return projetNames;
  }


    public static boolean deleteProjet(int idProjet) {
        String query = "DELETE FROM Projets WHERE idProjet=?";
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, idProjet);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Modifier un projet
    public static boolean updateProjet(Projet projet) {
        String query = "UPDATE Projets SET NomProjet=?, dateDebutProjet=?, dateFinProjet=?, budget=?, descriptionProjet=? WHERE idProjet=?";
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, projet.getNomProjet());
            ps.setDate(2, projet.getDateDebutProjrt());
            ps.setDate(3, projet.getDateFinProjet());
            ps.setDouble(4, projet.getBudget());
            ps.setString(5, projet.getDescriptionProjet());
            ps.setInt(6, projet.getIdProjet());

            return ps.executeUpdate() > 0; // Retourne true si une ligne est affectée
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
