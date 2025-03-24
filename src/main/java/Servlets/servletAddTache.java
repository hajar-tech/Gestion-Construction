package Servlets;

import Daos.RessourcesDao;
import Daos.TacheDao;
import Models.Tache;
import Models.TacheRessource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/addTaskServlet")

public class servletAddTache extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idProjet = Integer.parseInt(req.getParameter("idProjet"));
        System.out.println(idProjet);
        String description = req.getParameter("descriptionTache");
        Date dateDebut = Date.valueOf(req.getParameter("dateDebut"));
        Date dateFin = Date.valueOf(req.getParameter("dateFin"));

        Tache nouvelleTache = new Tache(description , dateDebut , dateFin , idProjet);

        int idTache = TacheDao.addTache(nouvelleTache);
        TacheDao tacheDao = new TacheDao();
        RessourcesDao ressourcesDao = new RessourcesDao();

        if (idTache>0){
            List <TacheRessource> ressourcesAssociees = new ArrayList<>();
            String[] ressourcesSelectionnees = req.getParameterValues("idRessource");

            if (ressourcesSelectionnees != null) {
                for (String idRessourceStr : ressourcesSelectionnees) {
                    int idRessource = Integer.parseInt(idRessourceStr);
                    int quantite = Integer.parseInt(req.getParameter("quantite_" + idRessource));

                    if (quantite > 0) {
                        ressourcesAssociees.add(new TacheRessource(idTache, idRessource, quantite));
                        ressourcesDao.mettreAJourQuantite(idRessource, -quantite);
                    }
                }
                tacheDao.associerRessources(ressourcesAssociees);
            }
        }
        resp.sendRedirect("afficherProjetDetails.jsp?idProjet=" + idProjet);
    }
}
