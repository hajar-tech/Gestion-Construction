package Servlets;

import Daos.RessourcesDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteRessource")

public class servletDeleteRessource extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idRessource = Integer.parseInt(req.getParameter("idRessource")) ;
        System.out.println(idRessource);
        int result = RessourcesDao.deleteRessource(idRessource);
        if (result > 0){
            resp.sendRedirect("displayRessource");
        }

    }
}
