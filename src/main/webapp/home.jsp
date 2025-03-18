<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Gestion de Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

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
                <a href="LogoutServlet" class="bg-red-500 px-4 py-2 rounded-lg text-white hover:bg-red-600 transition">
                    Logout
                </a>
            </div>
        </div>
    </nav>

    <!-- Bouton pour ouvrir le modal -->
        <button onclick="openModal()" class="bg-green-500 text-white px-6 py-3 m-3 rounded-lg shadow-md hover:bg-blue-600 transition">
            Ajouter Projet
        </button>

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
