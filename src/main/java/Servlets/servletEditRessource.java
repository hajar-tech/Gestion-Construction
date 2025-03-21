package Servlets;

import Daos.RessourcesDao;
import Models.Ressource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editRessource")

public class servletEditRessource extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idRessource = Integer.parseInt(req.getParameter("idRessource"));
        String nomRessource = req.getParameter("nomRessourceEditer");
        String typeRessource = req.getParameter("typeRessourceEditer");
        int quantiteRessource = Integer.parseInt(req.getParameter("quantiteRessourceEditer"));

        Ressource ressource = new Ressource(idRessource , nomRessource , typeRessource,quantiteRessource);
        RessourcesDao.editRessource(ressource);

        if (RessourcesDao.editRessource(ressource)){
            resp.sendRedirect("displayRessource");
        }
        else{
            System.out.println("error lors de la modification d'un ressouces");
        }
    }
}
