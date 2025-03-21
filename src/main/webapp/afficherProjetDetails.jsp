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
    <nav class="bg-transparent backdrop-blur-lg p-4 shadow-lg border-b border-gray-300/50">
        <div class="container mx-auto flex justify-between items-center">
            <!-- Logo -->
            <a href="home.jsp" class="text-black text-2xl font-bold hover:text-gray-700 transition">
                Construction<span class="text-yellow-500">Xpert</span>
            </a>

            <!-- Liens de navigation -->
            <div class="flex space-x-6">
                <a href="#" class="text-black text-xl font-medium hover:text-yellow-500 transition">
                    Contact Us
                </a>
                <a href="logoutServlet" class="bg-red-500 px-4 py-2 rounded-lg text-white hover:bg-red-600 transition">
                    Logout
                </a>
            </div>
        </div>
    </nav>

<%
   List<Projet> projets = (List<Projet>) request.getAttribute("projects");
   if (projets != null && !projets.isEmpty()) {
%>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-6">
        <% for (Projet p : projets) { %>
            <div class="bg-white shadow-lg rounded-xl p-6 border border-gray-200">
                <h2 class="text-2xl font-bold text-black mb-3">
                    <%= p.getNomProjet() %>
                </h2>

                <p class="text-gray-600"><strong>Date Début :</strong> <%= p.getDateDebutProjrt() %></p>
                <p class="text-gray-600"><strong>Date Fin :</strong> <%= p.getDateFinProjet() %></p>
                <p class="text-gray-600"><strong>Budget :</strong> <%= p.getBudget() %> €</p>
                <p class="text-gray-600"><strong>Description :</strong> <%= p.getDescriptionProjet() %></p>

        <!-- Boutons d'actions -->
                <div class="mt-4 flex space-x-3">
        <!-- Bouton Modifier -->
                    <button onclick="openModal('<%= p.getIdProjet() %>', '<%= p.getNomProjet() %>', '<%= p.getDateDebutProjrt() %>', '<%= p.getDateFinProjet() %>', '<%= p.getBudget() %>', '<%= p.getDescriptionProjet() %>')"
                            class="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition">
                        Modifier
                    </button>

        <!-- Bouton Supprimer -->
                    <form action="deleteProject" method="post" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">
                        <input type="hidden" name="idProjet" value="<%= p.getIdProjet() %>">
                        <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-red-600 transition">
                            Supprimer
                        </button>
                    </form>

        <!-- Bouton Ajouter une tâche -->
                    <form action="addTask" method="get">
                        <input type="hidden" name="idProjet" value="<%= p.getIdProjet() %>">
                        <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-green-600 transition">
                            Ajouter Tâche
                        </button>
                    </form>
                </div>
            </div>
        <% } %>
    </div>
<%
   } else {
%>
    <p class="text-center text-gray-500 text-lg">Aucun projet trouvé.</p>
<%
   }
%>



<!-- Modale cachée au début -->
<div id="editModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 hidden flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
        <h2 class="text-2xl font-bold mb-4">Modifier Projet</h2>

        <form id="editForm" action="editProject" method="post">
            <input type="hidden" id="editId" name="idProjet">

            <label class="block">Nom du Projet :</label>
            <input type="text" id="editNom" name="nomProjet" class="w-full border p-2 rounded">

            <label class="block mt-2">Date Début :</label>
            <input type="date" id="editDateDebut" name="dateDebut" class="w-full border p-2 rounded">

            <label class="block mt-2">Date Fin :</label>
            <input type="date" id="editDateFin" name="dateFin" class="w-full border p-2 rounded">

            <label class="block mt-2">Budget :</label>
            <input type="number" id="editBudget" name="budget" class="w-full border p-2 rounded">

            <label class="block mt-2">Description :</label>
            <textarea id="editDescription" name="description" class="w-full border p-2 rounded"></textarea>

            <div class="mt-4 flex justify-end space-x-3">
                <button type="button" class="bg-gray-400 px-4 py-2 rounded-lg" onclick="closeModal()">Annuler</button>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Modifier</button>
            </div>
        </form>
    </div>
</div>

<script>
    function openModal(id, nom, dateDebut, dateFin, budget, description) {
        document.getElementById("editId").value = id;
        document.getElementById("editNom").value = nom;
        document.getElementById("editDateDebut").value = dateDebut;
        document.getElementById("editDateFin").value = dateFin;
        document.getElementById("editBudget").value = budget;
        document.getElementById("editDescription").value = description;
        document.getElementById("editModal").classList.remove("hidden");
    }

    function closeModal() {
        document.getElementById("editModal").classList.add("hidden");
    }
</script>


</body>
</html>