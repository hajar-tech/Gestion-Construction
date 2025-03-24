package Servlets;

import Daos.DataBaseConnection;
import Daos.RessourcesDao;
import Models.Ressource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/loadResources")
public class LoadResourcesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = DataBaseConnection.getConnection();
        RessourcesDao ressourceDao = new RessourcesDao();
        List<Ressource> ressources = ressourceDao.getAllRessources();
        int idProjet = Integer.parseInt(request.getParameter("idProjet"));

        if (ressources != null && !ressources.isEmpty()) {
            System.out.println("Ressources trouvées : " + ressources.size());
        } else {
            System.out.println("Aucune ressource trouvée.");
        }

        request.setAttribute("ressourcess", ressources);
        request.setAttribute("idProjet",idProjet);


        for (Ressource r : ressources){

        System.out.println(r.getNomRessource());}
        request.getRequestDispatcher("afficherProjetDetails.jsp").forward(request, response);
    }
}
