<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import = "Models.Projet , java.util.*" %>
    <%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails des Projets</title>
</head>
<body>

<a href="displayProject">Afficher</a>

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