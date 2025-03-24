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
      background-image: url("Images/pexels-asphotograpy-224924 (1).jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
  }


   </style>
</head>
<body class=" bodyElemnt bg-gray-100">

   <!-- Navbar -->
   <nav class="bg-transparent backdrop-blur-lg p-4 shadow-lg border-b border-gray-300/50">
       <div class="container mx-auto flex justify-between items-center">
           <!-- Logo -->
           <a href="index.jsp" class="text-black text-2xl font-bold hover:text-gray-700 transition">
               Construction<span class="text-yellow-500">Xpert</span>
           </a>

           <!-- Menu Hamburger (caché sur grand écran) -->
           <button id="menu-toggle" class="block sm:hidden text-black text-2xl focus:outline-none">
               ☰
           </button>

           <!-- Liens de navigation -->
           <div id="nav-links" class="hidden sm:flex space-x-6">
               <a href="#" class="text-black text-xl font-medium hover:text-yellow-500 transition">
                   Contact Us
               </a>
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
                    <div class="w-64 p-4 backdrop-blur-lg rounded-xl shadow-lg transform transition duration-300 hover:scale-105">
                        <h3 class="text-xl font-bold text-black text-center"><%= p.getNomProjet() %></h3>

                        <form action="displayProjectByName" method="post" class="mt-4 text-center">
                            <input type="hidden" name="idProjet" value="<%= p.getIdProjet() %>">

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
               <form id="projectForm" action="addProject" method="post">
                   <div class="mb-4">
                       <label class="block text-gray-700">Nom du projet</label>
                       <input type="text" name="NomProjet" class="w-full p-2 border rounded-lg" required>
                   </div>

                   <div class="mb-4">
                       <label class="block text-gray-700">Date de début</label>
                       <input type="date" id="dateDebutProjet" name="dateDebutProjet" class="w-full p-2 border rounded-lg" required>
                       <span id="errorDateDebut" class="error-message text-red-500"></span>
                   </div>

                   <div class="mb-4">
                       <label class="block text-gray-700">Date de fin</label>
                       <input type="date" id="dateFinProjet" name="dateFinProjet" class="w-full p-2 border rounded-lg" required>
                       <span id="errorDateFin" class="error-message text-red-500"></span>
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

        <!-- Script pour gérer ouverture/fermeture du modal -->
        <script>
            function openModal() {
                document.getElementById("modal").classList.remove("hidden");
            }

            function closeModal() {
                document.getElementById("modal").classList.add("hidden");
            }



            document.addEventListener("DOMContentLoaded", function () {
                let dateDebutInput = document.getElementById("dateDebutProjet");
                let dateFinInput = document.getElementById("dateFinProjet");
                let errorDateDebut = document.getElementById("errorDateDebut");
                let errorDateFin = document.getElementById("errorDateFin");
                let form = document.getElementById("projectForm");

                function validateDateDebut() {
                    let today = new Date();
                    let selectedDateDebut = new Date(dateDebutInput.value);

                    if (selectedDateDebut < today) {
                        errorDateDebut.textContent = "La date de début ne peut pas être inférieure à aujourd'hui.";
                        return false;
                    } else {
                        errorDateDebut.textContent = "";
                        return true;
                    }
                }

                function validateDateFin() {
                    let selectedDateDebut = new Date(dateDebutInput.value);
                    let selectedDateFin = new Date(dateFinInput.value);

                    if (selectedDateFin <= selectedDateDebut) {
                        errorDateFin.textContent = "La date de fin doit être supérieure à la date de début.";
                        return false;
                    } else {
                        errorDateFin.textContent = "";
                        return true;
                    }
                }

                // Validation en temps réel
                dateDebutInput.addEventListener("change", validateDateDebut);
                dateFinInput.addEventListener("change", validateDateFin);

                // Vérification avant soumission du formulaire
                form.addEventListener("submit", function (event) {
                    let isDateDebutValid = validateDateDebut();
                    let isDateFinValid = validateDateFin();

                    if (!isDateDebutValid || !isDateFinValid) {
                        event.preventDefault(); // Bloquer l'envoi du formulaire si les dates sont invalides
                    } else {
                        closeModal(); // Fermer le modal si tout est valide
                    }
                });
            });

            // Fonctions pour gérer l'affichage du modal
            function openModal() {
                document.getElementById("modal").classList.remove("hidden");
            }

            function closeModal() {
                document.getElementById("modal").classList.add("hidden");
            }




                // Sélection du bouton et du menu
                const menuToggle = document.getElementById("menu-toggle");
                const navLinks = document.getElementById("nav-links");

                // Ajout d'un event listener pour afficher/masquer les liens
                menuToggle.addEventListener("click", () => {
                    navLinks.classList.toggle("hidden"); // Toggle la classe hidden
                    navLinks.classList.toggle("flex"); // Affiche les liens en flex
                    navLinks.classList.toggle("flex-col"); // Affichage en colonne sur mobile
                    navLinks.classList.toggle("absolute"); // Position absolue sur mobile
                    navLinks.classList.toggle("top-16"); // Ajustement de la position sous la navbar
                    navLinks.classList.toggle("left-0"); // Alignement à gauche
                    navLinks.classList.toggle("w-full"); // Largeur pleine pour bien s'afficher
                    navLinks.classList.toggle("bg-white"); // Ajout d'un fond blanc pour visibilité
                    navLinks.classList.toggle("p-4"); // Ajout de padding pour aérer
                    navLinks.classList.toggle("shadow-lg"); // Ajout d'une ombre pour un bel effet
                });


        </script>

</body>
</html>
