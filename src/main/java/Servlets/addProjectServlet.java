package Servlets;

import Daos.ProjetDao;
import Models.Projet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/addProject")
public class addProjectServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String nom = req.getParameter("NomProjet");
       String dateDebut = req.getParameter("dateDebutProjet");
       Date dateDebutProjet = Date.valueOf(dateDebut);
       String dateFin = req.getParameter("dateFinProjet");
       Date dateFinProjet = Date.valueOf(dateFin);
       String budget = req.getParameter("budget");
       Double budgetProjet = Double.valueOf(budget);
       String descriptionProjet = req.getParameter("descriptionProjet");

        Projet projet = new Projet(nom , dateDebutProjet , dateFinProjet ,budgetProjet ,descriptionProjet);

       int idProjet = ProjetDao.insertProject(projet);
       if (idProjet > 0){
           resp.sendRedirect("displayProjectName");
       }else {
           resp.sendRedirect("home.jsp?error=Erreur lors de la création du projet");
       }

    }
}
