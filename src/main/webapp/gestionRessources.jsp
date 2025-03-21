<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<%@ page import="Models.Ressource , java.util.*"%>


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


   <!-- afficher la list des ressources-->


   <table>
        <thead>
         <tr>
            <th>nom de ressource</th>
            <th>type de ressource</th>
            <th>quantite de ressource</th>
         </tr>
        </thead>
        <tbody>

   <%
      List<Ressource> ressources = (List<Ressource>) request.getAttribute("ressources");

      if(ressources != null){
      for(Ressource r : ressources ){
   %>
        <tr>
            <td>><%= r.getNomRessource()%></td>
            <td>><%= r.getTypeRessource()%></td>
            <td>><%= r.getQuantite()%></td>
        </tr>
   <% } }%>
        </tbody>
   </table>

</main>

<!-- Modal pour ajouter une ressource -->
<div id="modal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
    <div class="bg-white p-6 rounded-lg shadow-lg w-96">
        <h2 class="text-xl font-semibold mb-4 text-gray-800">Ajouter une ressource</h2>
        <form action="addRessource" method="post" class="space-y-4">
            <div>
                <label class="block text-gray-700 font-medium">Nom de la ressource</label>
                <input type="text" name="nomRessource" class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
                <label class="block text-gray-700 font-medium">Type de ressource</label>
                <input type="text" name="typeRessource" class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
                <label class="block text-gray-700 font-medium">Quantité de ressource</label>
                <input type="number" name="quantiteRessource" class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div class="flex justify-end space-x-4 mt-4">
                <button type="button" onclick="closeModal()" class="px-4 py-2 bg-gray-400 text-white rounded-md hover:bg-gray-500">Annuler</button>
                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">Ajouter</button>
            </div>
        </form>
    </div>
</div>


  <script>
    function openModal(){
    document.getElementById("modal").classList.remove("hidden");
    }

    function closeModal(){
     document.getElementById("modal").classList.add("hidden");
     }

  </script>

</body>
</html>