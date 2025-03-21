package Servlets;

import Daos.RessourcesDao;
import Models.Ressource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/displayRessource")

public class servletDisplayRessourse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List <Ressource> ressources = RessourcesDao.displayRessource();
        if (ressources!=null && !ressources.isEmpty()){
            System.out.println("list is not empty");
        }
        else {
            System.out.println("list is empty");
        }
        req.setAttribute("ressources", ressources);
        req.getRequestDispatcher("gestionRessources.jsp").forward(req, resp);
    }
}
