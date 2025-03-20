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

       //vérification si la dateDebutProjet est supperieur à la date actuelle

        Date dateActuelle = new Date(System.currentTimeMillis());
        if(dateDebutProjet.before(dateActuelle)){
            req.setAttribute("error", "la date de debut ne peut pas etre inferieur  a la date actuelle");
            resp.sendRedirect("addProjetServlet");
        }

        //vérification si la dateFinProjet est supperieur à la dateDebutProjet

        if(dateFinProjet.before(dateDebutProjet)){
            req.setAttribute("error", "la date de Fin projet ne peut pas etre inferieur  a la date debut");
            resp.sendRedirect("addProjetServlet");
        }


        Projet projet = new Projet(nom , dateDebutProjet , dateFinProjet ,budgetProjet ,descriptionProjet);

       int idProjet = ProjetDao.insertProject(projet);
       if (idProjet > 0){
           resp.sendRedirect("displayProjectName");
       }else {
           resp.sendRedirect("index.jsp?error=Erreur lors de la création du projet");
       }

    }
}
