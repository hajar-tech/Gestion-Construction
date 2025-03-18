package Servlets;

import Daos.ProjetDao;
import Models.Projet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/displayProject")

public class displayProjetServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Projet> projets = ProjetDao.displayProjet();
        req.setAttribute("projects", projets);
        req.getRequestDispatcher("afficherProjetDetails.jsp").forward(req , resp);
    }
}
