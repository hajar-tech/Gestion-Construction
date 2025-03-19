<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import = "Models.Projet , java.util.*" %>
    <%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<!-- Navbar -->
    <nav class="bg-black p-4 shadow-lg">
        <div class="container mx-auto flex justify-between items-center">
            <!-- Logo -->
            <a href="home.jsp" class="text-white text-2xl font-bold hover:text-gray-200 transition">
                Construction<span class="text-yellow-400">Xpert</span>
            </a>

            <!-- Liens de navigation -->
            <div class="flex space-x-6">
                <a href="#" class="text-white hover:text-yellow-400 transition">Contact Us</a>
                <a href="logoutServlet" class="bg-red-500 px-4 py-2 rounded-lg text-white hover:bg-red-600 transition">
                    Logout
                </a>
            </div>
        </div>
    </nav>

<%
   List<Projet> projets = (List<Projet>) request.getAttribute("projects");
   if (projets != null) {
       for (Projet p : projets) {
%>
       <ul>
           <li>Nom du Projet : <%= p.getNomProjet() %></li>
           <li>Date Début : <%= p.getDateDebutProjrt()%></li>
           <li>Date Fin : <%= p.getDateFinProjet() %></li>
           <li>Budget : <%= p.getBudget() %></li>
           <li>Description : <%= p.getDescriptionProjet() %></li>
       </ul>
<%
       }
   } else {
%>
   <p>Aucun projet trouvé.</p>
<%
   }
%>

</body>
</html>