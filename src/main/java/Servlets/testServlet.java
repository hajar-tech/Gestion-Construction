package Servlets;

import Daos.DataBaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/testServlet")
public class testServlet extends HttpServlet {

    private Connection con;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter p = resp.getWriter();

        if (con != null){
            p.println("connection réussit avec data base");
        }else {
            p.println("echec de connecter avec data base");
        }

    }

    @Override
    public void init() throws ServletException {
        super.init();

        con = DataBaseConnection.getConnection();
    }
}
