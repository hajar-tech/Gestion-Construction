
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page d'Index</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">

    <style>
       .container-main {
            background-image : url('Images/pexels-yury-kim-181374-585419.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
       }
    </style>
</head>
<body class="bg-gray-100">

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

    <!-- Section principale -->
    <main class="container-main p-8">
        <div class="flex flex-wrap justify-center mt-10 mb-12 gap-6 md:justify-evenly">
            <!-- Gestion des projets -->
            <div class="bg-white shadow-lg rounded-lg p-6 hover:bg-blue-100 transition-all w-full sm:w-80">
                <h2 class="text-2xl font-semibold text-center text-blue-600">Gestion des Projets</h2>
                <p class="text-center text-gray-700 mt-4">Gérez les projets en cours, suivez leur avancement et attribuez les ressources.</p>
                <a href="displayProjectName" class="block text-center mt-4 text-white bg-blue-500 hover:bg-blue-600 rounded-lg py-2">
                    Accéder
                </a>
            </div>

            <!-- Gestion des ressources -->
            <div class="bg-white shadow-lg rounded-lg p-6 hover:bg-yellow-100 transition-all w-full sm:w-80">
                <h2 class="text-2xl font-semibold text-center text-yellow-600">Gestion des Ressources</h2>
                <p class="text-center text-gray-700 mt-4">Gérez les ressources nécessaires pour vos projets, avec suivi des stocks et des fournisseurs.</p>
                <a href="displayRessource" class="block text-center mt-4 text-white bg-yellow-500 hover:bg-yellow-600 rounded-lg py-2">
                    Accéder
                </a>
            </div>
        </div>
    </main>
   <!-- Section pour notre collaboration -->
   <section class="w-full bg-gray-100 py-12">
      <h2 class="text-4xl font-bold text-gray-800 text-center mb-10">Nos Partenaires</h2>
      <div class="flex flex-wrap justify-center gap-6 md:justify-evenly px-6">

          <!-- Partenaire 1 -->
          <div class="bg-white shadow-lg rounded-lg p-6 hover:shadow-xl transition-all w-full sm:w-80 text-center">
              <img src="Images/pexels-frans-van-heerden-201846-2699258.jpg" alt="Société Générale des Travaux du Maroc" class="w-full h-48 object-cover rounded-md">
              <p class="mt-4 text-2xl font-semibold text-gray-700"><a href="https://www.sgtm-maroc.com/">SGTM</a></p>
          </div>

          <!-- Partenaire 2 -->
          <div class="bg-white shadow-lg rounded-lg p-6 hover:shadow-xl transition-all w-full sm:w-80 text-center">
              <img src="Images/pexels-asphotograpy-224924.jpg" alt="Partenaire 2" class="w-full h-48 object-cover rounded-md">
              <p class="mt-4 text-2xl font-semibold text-gray-700"><a href="https://ma.kompass.com/c/ste-boufrssigue/ma3233665/">ste Boufrssigue</a></p>
          </div>

          <!-- Partenaire 3 -->
          <div class="bg-white shadow-lg rounded-lg p-6 hover:shadow-xl transition-all w-full sm:w-80 text-center">
              <img src="Images/pexels-pixabay-209266.jpg" alt="Partenaire 3" class="w-full h-48 object-cover rounded-md">
              <p class="mt-4 text-2xl font-semibold text-gray-700"><a href="https://ma.kompass.com/c/sogotrad/ma3141292/">Sogotrad</a></p>
          </div>

      </div>
   </section>





    <!-- Footer -->
    <footer class="bg-gray-800 text-white text-center p-4 mt-8">
        <p>&copy; 2025 ConstructionXpert Services. Tous droits réservés.</p>
    </footer>




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
</html>
