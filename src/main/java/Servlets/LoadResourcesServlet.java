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

        RessourcesDao ressourceDao = new RessourcesDao();
        List<Ressource> ressources = ressourceDao.getAllRessources();

        request.setAttribute("ressources", ressources);

        for (Ressource r : ressources){

        System.out.println(r.getNomRessource());}
        request.getRequestDispatcher("afficherProjetDetails.jsp").forward(request, response);
    }
}
