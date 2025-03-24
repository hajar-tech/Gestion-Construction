<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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


        <h1> Tache ajoutee avec success</h1>




        <script>
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
    </head>