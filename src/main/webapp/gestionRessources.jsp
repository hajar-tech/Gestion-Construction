<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
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

<main class="main">
    <!-- Bouton pour ouvrir le modal -->
        <button onclick="openModal()" class="bg-green-500 text-white px-6 py-3 m-3 rounded-lg shadow-md hover:bg-blue-600 transition">
            Ajouter Projet
        </button>

</main>

</body>
</html>