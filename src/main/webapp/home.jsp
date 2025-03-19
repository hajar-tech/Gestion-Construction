<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import = "Models.Projet , java.util.*" %>
    <%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Gestion de Projets</title>
   <script src="https://cdn.tailwindcss.com"></script>
   <style>
  .bodyElemnt {
      background-image: url("Images/Download premium image of Construction architecture building development by Jigsaw about background, construction, sky, person, and watercolour 12093481.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
  }


   </style>
</head>
<body class=" bodyElemnt bg-gray-100">

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
<main class="main">
    <!-- Bouton pour ouvrir le modal -->
        <button onclick="openModal()" class="bg-green-500 text-white px-6 py-3 m-3 rounded-lg shadow-md hover:bg-blue-600 transition">
            Ajouter Projet
        </button>

  <!--section affichage des noms des projet-->
        <section class="flex justify-evenly flex-wrap gap-6 p-6">
            <% List<Projet> projectNames = (List<Projet>) request.getAttribute("projectNames"); %>

            <% if (projectNames != null && !projectNames.isEmpty()) { %>
                <% for (Projet p : projectNames) { %>
                    <div class="w-64 p-4 bg-yellow-400 rounded-xl shadow-lg transform transition duration-300 hover:scale-105">
                        <h3 class="text-xl font-bold text-black text-center"><%= p.getNomProjet() %></h3>

                        <form action="displayProjectByName" method="post" class="mt-4 text-center">
                            <input type="hidden" name="nomProjet" value="<%= p.getNomProjet() %>">
                            <button type="submit" class="bg-black text-yellow-400 px-4 py-2 rounded-lg hover:bg-gray-900 transition">
                                Détails
                            </button>
                        </form>
                    </div>
                <% } %>
            <% } else { %>
                <p class="text-white text-lg">Aucune information associée à ce projet trouvée.</p>
            <% } %>
        </section>

</main>
        <!-- Modal -->
        <div id="modal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
            <div class="bg-white p-6 rounded-lg shadow-lg w-96">
                <h2 class="text-xl font-bold mb-4">Ajouter un Projet</h2>

                <!-- Formulaire -->
                <form action="addProject" method="post">
                    <div class="mb-4">
                        <label class="block text-gray-700">Nom du projet</label>
                        <input type="text" name="NomProjet" class="w-full p-2 border rounded-lg" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700">Date de début</label>
                        <input type="date" name="dateDebutProjet" class="w-full p-2 border rounded-lg" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700">Date de fin</label>
                        <input type="date" name="dateFinProjet" class="w-full p-2 border rounded-lg" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700">Budget</label>
                        <input type="number" name="budget" class="w-full p-2 border rounded-lg" step="0.01" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700">Description</label>
                        <textarea name="descriptionProjet" class="w-full p-2 border rounded-lg" required></textarea>
                    </div>

                    <div class="flex justify-between">
                        <button type="button" onclick="closeModal()" class="bg-gray-400 text-white px-4 py-2 rounded-lg">Annuler</button>
                        <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 transition">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Script pour gérer l'ouverture/fermeture du modal -->
        <script>
            function openModal() {
                document.getElementById("modal").classList.remove("hidden");
            }

            function closeModal() {
                document.getElementById("modal").classList.add("hidden");
            }
        </script>

</body>
</html>
