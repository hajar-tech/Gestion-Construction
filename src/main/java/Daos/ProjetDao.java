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

  public static List displayProjet(){
        List<Projet> projets = new ArrayList<>();
        String query = "select * from Projets";

        try{
            Connection con = DataBaseConnection.getConnection();
           Statement pst = con.createStatement();
           ResultSet rs = pst.executeQuery(query);
           while (rs.next()){
               Projet projet = new Projet(
                       rs.getInt("idProjet"),
                       rs.getString("NomProjet"),
                       rs.getDate("dateDebutProjet"),
                       rs.getDate("dateFinProjet"),
                       rs.getDouble("budget"),
                       rs.getString("descriptionProjet")
               );
               projets.add(projet);
           }

        } catch (SQLException e) {
           e.printStackTrace();
        }


        return projets;
  }

  public static List<Projet> displayProjectName(){
        List<Projet> projetNames = new ArrayList<>();

        String query ="select NomProjet  from Projets";
        try {
            Connection con = DataBaseConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                Projet projet = new Projet();
                projet.setNomProjet(rs.getString("NomProjet"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

      return projetNames;
  }

}
