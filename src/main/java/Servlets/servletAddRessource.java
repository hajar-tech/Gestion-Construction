package Servlets;

import Daos.RessourcesDao;
import Models.Ressource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addRessource")

public class servletAddRessource extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nomRessource =  req.getParameter("nomRessource");
        String typeRessource =req.getParameter("typeRessource");
        int quantite = Integer.parseInt(req.getParameter("quantiteRessource")) ;

        Ressource ressource = new Ressource(nomRessource , typeRessource , quantite);
         RessourcesDao ressourcesDao = new RessourcesDao();
        int result = ressourcesDao.addRessource(ressource);

        if (result > 0){
            resp.sendRedirect("gestionRessources.jsp");
        }

    }
}
