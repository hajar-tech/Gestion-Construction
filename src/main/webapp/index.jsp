
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page d'Index</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

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

    <!-- Section principale -->
    <main class="container mx-auto p-8">
        <div class="flex flex-wrap justify-center gap-6 md:justify-evenly">
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
   <section class="container mx-auto p-8 text-center">
       <h2 class="text-3xl font-semibold text-gray-800 mb-6">Nos Partenaires</h2>
       <div class="flex flex-wrap justify-center gap-8">
           <!-- Partenaire 1 -->
           <div class="flex flex-col items-center">
               <div class="w-32 h-32 rounded-full overflow-hidden shadow-lg">
                   <img src="partner1.jpg" alt="Partenaire 1" class="w-full h-full object-cover">
               </div>
               <p class="mt-4 text-lg font-medium text-gray-700">Société Alpha</p>
           </div>

           <!-- Partenaire 2 -->
           <div class="flex flex-col items-center">
               <div class="w-32 h-32 rounded-full overflow-hidden shadow-lg">
                   <img src="partner2.jpg" alt="Partenaire 2" class="w-full h-full object-cover">
               </div>
               <p class="mt-4 text-lg font-medium text-gray-700">Société Beta</p>
           </div>

           <!-- Partenaire 3 -->
           <div class="flex flex-col items-center">
               <div class="w-32 h-32 rounded-full overflow-hidden shadow-lg">
                   <img src="partner3.jpg" alt="Partenaire 3" class="w-full h-full object-cover">
               </div>
               <p class="mt-4 text-lg font-medium text-gray-700">Société Gamma</p>
           </div>
       </div>
   </section>


    <!-- Footer -->
    <footer class="bg-gray-800 text-white text-center p-4 mt-8">
        <p>&copy; 2025 ConstructionXpert Services. Tous droits réservés.</p>
    </footer>

</body>
</html>
