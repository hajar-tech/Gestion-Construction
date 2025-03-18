package Daos;

import Models.Projet;

import java.sql.*;

public class ProjetDao {

    static  String query = "insert into Projets (NomProjet , dateDebutProjet , dateFinProjet ,budget, descriptionProjet)\n" +
            "VALUES (?,?,?,?,?)";

    public static  int insertProject(Projet projet){
        int idProjet = 0;

        try {
            Connection connection = DataBaseConnection.getConnection();
            if (connection != null){
            PreparedStatement preparedStatement = connection.prepareStatement(query , Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,projet.getNomProjet());
            preparedStatement.setDate(2,projet.getDateDebutProjrt());
            preparedStatement.setDate(3,projet.getDateFinProjet());
            preparedStatement.setDouble(4,projet.getBudget());
            preparedStatement.setString(5, projet.getDescriptionProjet());
           int affectedRow = preparedStatement.executeUpdate();
           if(affectedRow > 0){
               ResultSet rs = preparedStatement.getGeneratedKeys();
               if (rs.next()){
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
}
