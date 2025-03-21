<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Models.Ressource"%>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Gestion de Projets</title>
   <script src="https://cdn.tailwindcss.com"></script>
   <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">

   <style>
  .bodyElemnt {
      background-image: url("Images/télécharger.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
  }


   </style>
</head>
<body class=" bodyElemnt bg-gray-100">

    <!-- Navbar -->
    <nav class="bg-transparent backdrop-blur-lg p-4 mt-4  shadow-lg border-b border-gray-300/50">
        <div class="container mx-auto  flex justify-between items-center">
            <!-- Logo -->
            <a href="index.jsp" class="text-black text-2xl font-bold hover:text-gray-700 transition">
                Construction<span class="text-yellow-500">Xpert</span>
            </a>

            <!-- Liens de navigation -->
            <div class="flex space-x-6">
                 <!-- Bouton pour ouvrir le modal -->
                        <button onclick="openModal()" class="bg-black text-white px-4 py-2 rounded-lg shadow-md hover:bg-yellow-600 transition">
                            Ajouter Ressource
                        </button>
                <a href="logoutServlet" class="bg-black px-4 py-2 rounded-lg text-white hover:bg-red-600 transition">
                    Logout
                </a>
            </div>
        </div>
    </nav>

<main class="main">

   <!-- afficher la list des ressources-->


      <div class="container mx-auto mb-3 mt-7">

              <%
                  List<Ressource> ressources = (List<Ressource>) request.getAttribute("ressources");
                  if (ressources == null || ressources.isEmpty()) {
              %>
                  <p class="text-red-500">Aucune ressource disponible.</p>
              <%
                  } else {
              %>

             <div class="overflow-x-auto bg-white shadow-md rounded-lg p-6">
              <h1 class="text-2xl font-bold text-gray-800 mb-4">Liste des Ressources</h1>
                 <!-- Liste pour l'affichage des ressources -->
                 <ul class="space-y-4">
                     <% for (Ressource r : ressources) { %>
                         <li class="flex flex-col md:flex-row items-start md:items-center justify-between p-4 bg-gray-50 rounded-lg shadow-sm hover:bg-gray-100">
                             <!-- Nom de la ressource -->
                             <div class="flex-1 text-lg font-semibold">
                                 <%= r.getNomRessource() %>
                             </div>
                             <!-- Type de la ressource -->
                             <div class="flex-1 text-sm text-gray-600">
                                 <%= r.getTypeRessource() %>
                             </div>
                             <!-- Quantité de la ressource -->
                             <div class="flex-1 text-sm text-gray-600">
                                 <%= r.getQuantite() %>
                             </div>
                              <!-- Boutons Edit et Delete -->
                                                  <div class="flex space-x-4 mt-2 md:mt-0">
                                                      <!-- Bouton Edit -->
                                                      <button class="text-blue-500 hover:text-blue-700 transition-colors">
                                                          <i class="bx bx-edit-alt text-xl"></i> Edit
                                                      </button>

                                                      <!-- Bouton Delete -->
                                                      <form action="deleteRessource" method="post" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource ?');">
                                                          <input type="hidden" name="idRessource" value="<%= r.getIdRessource() %>">
                                                          <button type="submit" class="text-red-500 hover:text-red-700 transition-colors">
                                                              <i class="bx bx-trash text-xl"></i> Delete
                                                          </button>
                                                      </form>
                                                  </div>
                         </li>
                     <% } %>
                 </ul>
             </div>


              <% } %>
          </div>

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