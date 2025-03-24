<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import = "Models.Projet ,Models.Ressource , java.util.* ,Daos.RessourcesDao" %>
    <%@ page import="java.util.List" %>


    <%
        List<Ressource> ressources = RessourcesDao.getAllRessources();
         if (ressources != null && !ressources.isEmpty()) {
                System.out.println("Ressources reçues : " + ressources.size());
            } else {
                System.out.println("Pas de ressources reçues.");
            }
    %>


   <%
       Projet p = (Projet) request.getAttribute("projects");
          System.out.println(p);
       if (p != null) {
           out.println("Projet chargé dans la JSP : " + p.getNomProjet());
       } else {
           out.println("ERREUR : Le projet n'a pas été transmis à la JSP.");
       }
   %>

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

            if (p != null) {
        %>
        <ul class="bg-white mt-3 shadow-md rounded-lg divide-y divide-gray-200">

            <li class="p-4 flex items-center justify-between hover:bg-gray-100">
                <div>
                     <h2 class="text-lg font-semibold text-black"><%= p.getIdProjet() %></h2>
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



                    <!-- Bouton pour ouvrir la modale ajoute tache -->

                        <button  onclick="openModalAjouteTache(<%= p.getIdProjet() %>)" class="text-green-500 hover:text-green-700 transition"  >
                            ➕
                        </button>


                </div>
            </li>

        </ul>

        <% } else { %>
            <p class="text-center text-gray-500 text-lg">Aucun projet trouvé.</p>
        <% } %>
    </div>


<!-- Modale modifier un projet -->
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






<!-- Modale pour ajouter une tâche -->
<div id="modalAjoutTache" class="fixed inset-0 bg-gray-900 bg-opacity-50 hidden flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-lg w-1/3">
        <h2 class="text-2xl font-bold mb-4">Ajouter une Tâche</h2>

        <form action="addTaskServlet" method="post">

        <input type="hidden" id="idProjet" name="idProjet">


            <label class="block">Description de la Tâche :</label>
            <input type="text" name="descriptionTache" class="w-full border p-2 rounded" required>

            <label class="block mt-2">Date Début :</label>
            <input type="date" name="dateDebut" class="w-full border p-2 rounded" required>

            <label class="block mt-2">Date Fin :</label>
            <input type="date" name="dateFin" class="w-full border p-2 rounded" required>

            <label class="block mt-2">Ressources nécessaires :</label>
            <div id="ressourceContainer">
                <% if (ressources != null) {
                    for (Ressource r : ressources) { %>
                        <div class="flex items-center space-x-2">
                            <input type="checkbox" name="idRessource" value="<%= r.getIdRessource() %>">
                            <span><%= r.getNomRessource() %> (Dispo: <%= r.getQuantite() %>)</span>
                            <input type="number" name="quantite_<%= r.getIdRessource() %>" min="1" max="<%= r.getQuantite() %>" placeholder="Quantité" class="border p-1 w-20">
                        </div>
                <% } } else { %>
                    <p>Aucune ressource disponible.</p>
                <% } %>
            </div>

            <div class="mt-4 flex justify-end space-x-3">
                <button type="button" class="bg-gray-400 px-4 py-2 rounded-lg" onclick="closeModalAjouteTache()">Annuler</button>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Ajouter</button>
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

function openModalAjouteTache(id) {
        document.getElementById("idProjet").value = id;
        document.getElementById("modalAjoutTache").classList.remove("hidden");
    }

    function closeModalAjouteTache() {
        document.getElementById("modalAjoutTache").classList.add("hidden");
    }







</script>


</body>
</html>