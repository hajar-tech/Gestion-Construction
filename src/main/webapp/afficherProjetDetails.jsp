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

    <div class="container mx-auto">


        <%
            List<Projet> projets = (List<Projet>) request.getAttribute("projects");
            if (projets != null && !projets.isEmpty()) {
        %>
        <ul class="bg-white mt-3 shadow-md rounded-lg divide-y divide-gray-200">
            <% for (Projet p : projets) { %>
            <li class="p-4 flex items-center justify-between hover:bg-gray-100">
                <div>
                    <h2 class="text-lg font-semibold text-black"><%= p.getNomProjet() %></h2>
                    <p class="text-gray-600 mt-3 text-sm"><strong>Date Début :</strong> <%= p.getDateDebutProjrt() %></p>
                    <p class="text-gray-600 mt-3 text-sm"><strong>Date Fin :</strong> <%= p.getDateFinProjet() %></p>
                    <p class="text-gray-600 mt-3 text-sm"><strong>Budget :</strong> <%= p.getBudget() %> €</p>
                    <p class="text-gray-600 mt-3 text-sm"><strong>Description :</strong> <%= p.getDescriptionProjet() %></p>
                </div>

                <!-- Actions -->
                <div class="flex space-x-3">
                    <!-- Modifier -->
                    <button onclick="openModal('<%= p.getIdProjet() %>', '<%= p.getNomProjet() %>', '<%= p.getDateDebutProjrt() %>', '<%= p.getDateFinProjet() %>', '<%= p.getBudget() %>', '<%= p.getDescriptionProjet() %>')"
                        class="text-blue-500 hover:text-blue-700 transition">
                        ✏️
                    </button>

                    <!-- Supprimer -->
                    <form action="deleteProject" method="post" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">
                        <input type="hidden" name="idProjet" value="<%= p.getIdProjet() %>">
                        <button type="submit" class="text-red-500 hover:text-red-700 transition">
                            🗑️
                        </button>
                    </form>

                    <!-- Ajouter une tâche -->
                    <form action="addTask" method="get">
                        <input type="hidden" name="idProjet" value="<%= p.getIdProjet() %>">
                        <button type="submit" class="text-green-500 hover:text-green-700 transition">
                            ➕
                        </button>
                    </form>
                </div>
            </li>
            <% } %>
        </ul>

        <% } else { %>
            <p class="text-center text-gray-500 text-lg">Aucun projet trouvé.</p>
        <% } %>
    </div>


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



<!-- Modale ajoute de tache -->
<div id="taskModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 hidden flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
        <h2 class="text-2xl font-bold mb-4">Ajouter une Tâche</h2>
        <form action="addTask" method="post">
            <input type="hidden" name="idProjet" id="taskProjectId">

            <label>Nom de la tâche :</label>
            <input type="text" name="nomTache" required class="w-full border p-2 rounded">

            <label>Date de début :</label>
            <input type="date" name="dateDebut" required class="w-full border p-2 rounded">

            <label>Date de fin :</label>
            <input type="date" name="dateFin" required class="w-full border p-2 rounded">

            <label>Ressources :</label>
            <select name="ressources" multiple class="w-full border p-2 rounded">
                <%-- Dynamique : Liste des ressources disponibles --%>
                <% List<Ressource> ressources = (List<Ressource>) request.getAttribute("ressources"); %>
                <% for (Ressource res : ressources) { %>
                    <option value="<%= res.getIdRessource() %>"><%= res.getNomRessource() %> - Quantité: <%= res.getQuantite() %></option>
                <% } %>
            </select>

            <div class="mt-4 flex justify-end space-x-3">
                <button type="button" onclick="closeTaskModal()" class="bg-gray-400 px-4 py-2 rounded-lg">Annuler</button>
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600">Ajouter</button>
            </div>
        </form>
    </div>
</div>


<!-- Modale pour ajouter une tâche -->
<div id="modalAjoutTache" class="fixed inset-0 bg-gray-900 bg-opacity-50 hidden flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
        <h2 class="text-2xl font-bold mb-4">Ajouter une Tâche</h2>

        <form action="AjoutTacheServlet" method="post">
            <input type="hidden" name="idProjet" id="idProjet" value="<%= request.getParameter("idProjet") %>">

            <label class="block">Description :</label>
            <input type="text" name="description" class="w-full border p-2 rounded" required>

            <label class="block mt-2">Date Début :</label>
            <input type="date" name="dateDebut" class="w-full border p-2 rounded" required>

            <label class="block mt-2">Date Fin :</label>
            <input type="date" name="dateFin" class="w-full border p-2 rounded" required>

            <!-- Sélection des ressources -->
            <label class="block mt-2">Sélectionner des ressources :</label>
            <div id="listeRessources">
                <% List<Ressource> ressources = (List<Ressource>) request.getAttribute("ressources");
                   if (ressources != null) {
                       for (Ressource r : ressources) { %>
                           <div class="flex items-center space-x-2">
                               <input type="checkbox" name="idRessource" value="<%= r.getIdRessource() %>">
                               <span><%= r.getNomRessource() %> (Disponible: <%= r.getQuantiteDisponible() %>)</span>
                               <input type="number" name="quantite_<%= r.getIdRessource() %>" class="w-20 border p-1 rounded" min="1" placeholder="Qté">
                           </div>
                <%     }
                   } %>
            </div>

            <div class="mt-4 flex justify-end space-x-3">
                <button type="button" class="bg-gray-400 px-4 py-2 rounded-lg" onclick="closeModal()">Annuler</button>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Ajouter</button>
            </div>
        </form>
    </div>
</div>

<script>
    function openModalAjoutTache() {
        document.getElementById("modalAjoutTache").classList.remove("hidden");
    }

    function closeModal() {
        document.getElementById("modalAjoutTache").classList.add("hidden");
    }



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