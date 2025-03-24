package Servlets;

import Daos.ProjetDao;
import Models.Projet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/displayProjectByName")

public class displayProjetServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idProjet = Integer.parseInt(req.getParameter("idProjet"));
        System.out.println("ID Projet reçu : " + idProjet);
        Projet projets = ProjetDao.displayProjetDetailsById(idProjet);
        if (projets != null) {
            req.setAttribute("projects", projets);
            System.out.println("Projet ajouté à la requête : " + projets.getNomProjet());
        } else {
            System.out.println("Erreur : le projet est null avant d'être envoyé à la JSP !");
        }



        req.getRequestDispatcher("afficherProjetDetails.jsp").forward(req , resp);
    }
}
