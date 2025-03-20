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

@WebServlet("/editProject")

public class editProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idProjet = Integer.parseInt(req.getParameter("idProjet"));
        String nomProjet = req.getParameter("nomProjet");
        Date dateDebut = Date.valueOf(req.getParameter("dateDebut"));
        Date dateFin = Date.valueOf(req.getParameter("dateFin"));
        double budget = Double.parseDouble(req.getParameter("budget"));
        String description = req.getParameter("description");

        Projet projet = new Projet(idProjet, nomProjet, dateDebut, dateFin, budget, description);
        boolean isUpdated = ProjetDao.updateProjet(projet);

        if (isUpdated) {
            req.getRequestDispatcher("displayProjectByName").forward(req,resp);
        } else {
            resp.sendRedirect("afficherProjetDetails.jsp?error=update");
        }
    }

}
