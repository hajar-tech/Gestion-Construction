package Servlets;

import Daos.ProjetDao;
import Models.Projet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/displayProjectName")
public class displayProjectNameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Projet> projectNames = ProjetDao.displayProjectName();
        req.setAttribute("projectNames",projectNames);
        req.getRequestDispatcher("homa.jsp").forward(req , resp);

    }
}
