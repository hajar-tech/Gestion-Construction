package Servlets;

import Daos.ProjetDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteProject")
public class deleteProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idProjet = Integer.parseInt(req.getParameter("idProjet"));
        boolean isDeleted = ProjetDao.deleteProjet(idProjet);

        if (isDeleted) {
            resp.sendRedirect("displayProjectName");
        } else {
            resp.sendRedirect("afficherProjetDetails.jsp?error=delete");
        }
    }
    }

