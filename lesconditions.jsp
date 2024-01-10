<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>

<form action="#" method="post">
      <p>
        Saisir la valeur A :
        <input type="text" id="inputValeurA" name="valeurA" />
      </p>
      <p>
        Saisir la valeur B :
        <input type="text" id="inputValeurB" name="valeurB" />
      </p>
      <p>
        Saisir la valeur C :
        <input type="text" id="inputValeurC" name="valeurC" />
      </p>
      <p><input type="submit" value="Afficher" /></p>
    </form>

    <%-- Récupération des valeurs --%> <% String valeurA =
    request.getParameter("valeurA"); %> <% String valeurB =
    request.getParameter("valeurB"); %> <% String valeurC =
    request.getParameter("valeurC"); %> <%-- Vérification de la condition entre
    les trois valeurs --%> <% if (valeurA != null && valeurB != null && valeurC
    != null) { %> <%-- Conversion des valeurs en entiers pour la comparaison
    --%> <% int intValeurA = Integer.parseInt(valeurA); %> <% int intValeurB =
    Integer.parseInt(valeurB); %> <% int intValeurC = Integer.parseInt(valeurC);
    %> <%-- Condition if pour vérifier si C est compris entre A et B --%> <% if
    (intValeurC > intValeurA && intValeurC < intValeurB) { %>
    <p>Oui, C est compris entre A et B.</p>
    <% } else { %>
    <p>Non, C n'est pas compris entre A et B.</p>
    <% } %> <% } %>



<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>
 <!-- Exercice 2 Form -->
    <form action="#" method="post">
      <p>
        Saisir un nombre : <input type="text" id="inputNombre" name="nombre" />
      </p>
      <p><input type="submit" value="Vérifier" /></p>
    </form>

    <%-- Récupération de la valeur du nombre --%> <% String nombreStr =
    request.getParameter("nombre"); %> <%-- Vérification de la parité du nombre
    --%> <% if (nombreStr != null) { %> <%-- Conversion de la valeur en entier
    --%> <% int nombre = Integer.parseInt(nombreStr); %> <%-- Condition if pour
    vérifier la parité --%> <% if (nombre % 2 == 0) { %>
    <p>Le nombre est pair.</p>
    <% } else { %>
    <p>Le nombre est impair.</p>
    <% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
