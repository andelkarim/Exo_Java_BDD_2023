<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);
        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("année");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<p>Extraire les films dont l'année est supérieur à l'année 2000 et inférieur à 2015.</p>
 String anneeDebut = request.getParameter("anneeDebut");
    String anneeFin = request.getParameter("anneeFin");
    if (anneeDebut != null && anneeFin != null) {
        try {
            String url = "jdbc:mariadb://localhost:3306/films";
            String user = "mysql";
            String password = "mysql";
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            String sql = "SELECT idFilm, titre, année FROM Film WHERE année > 2000 AND année < 2015";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(anneeDebut));
            pstmt.setInt(2, Integer.parseInt(anneeFin));
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                out.println("ID: " + rs.getString("idFilm") + ", Titre: " + rs.getString("titre") + ", Année: " + rs.getInt("année") + "<br>");
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Erreur: " + e.getMessage());
        }
    }

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>
   <form method="get" action="#">
        <label for="rechercheAnnee">Entrez une année pour la recherche:</label>
        <input type="number" id="rechercheAnnee" name="rechercheAnnee" required>
        <input type="submit" value="Rechercher">
    </form>

    <% 
    String rechercheAnnee = request.getParameter("rechercheAnnee");
    if (rechercheAnnee != null && !rechercheAnnee.trim().isEmpty()) {
        try {
            String url = "jdbc:mariadb://localhost:3306/films";
            String user = "mysql";
            String password = "mysql";
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            String sql = "SELECT idFilm, titre, année FROM Film WHERE année = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(rechercheAnnee));
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                out.println("ID: " + rs.getString("idFilm") + ", Titre: " + rs.getString("titre") + ", Année: " + rs.getInt("année") + "<br>");
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Erreur: " + e.getMessage());
        }
    }
    %>



<h2>Exercice 3 : Modification du titre du film</h2>
<p>Créer un fichier permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur)</p>
<form method="post" action="#">
    <label for="idFilm">ID du film:</label>
    <input type="text" id="idFilm" name="idFilm" required>
    <label for="nouveauTitre">Nouveau titre:</label>
    <input type="text" id="nouveauTitre" name="nouveauTitre" required>
    <input type="submit" value="Modifier le titre">
</form>

<% 
String idFilm = request.getParameter("idFilm");
String nouveauTitre = request.getParameter("nouveauTitre");
if (idFilm != null && nouveauTitre != null && !idFilm.trim().isEmpty() && !nouveauTitre.trim().isEmpty()) {
    try {
        String url = "jdbc:mariadb://localhost:3306/films";
        String user = "mysql";
        String password = "mysql";
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nouveauTitre);
        pstmt.setInt(2, Integer.parseInt(idFilm));
        int affectedRows = pstmt.executeUpdate();

        out.println(affectedRows + " ligne(s) mise(s) à jour.");
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("Erreur: " + e.getMessage());
    }
}
%>

<h2>Exercice 4 : La valeur maximum</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>
<form method="post" action="#">
    <label for="titre">Titre du film:</label>
    <input type="text" id="titre" name="titre" required>
    <label for="nouvelleAnneeFilm">Année:</label>
    <input type="number" id="nouvelleAnneeFilm" name="nouvelleAnneeFilm" required>
    <input type="submit" value="Ajouter un film">
</form>

<% 
String titre = request.getParameter("titre");
String nouvelleAnneeFilm = request.getParameter("nouvelleAnneeFilm");
if (titre != null && nouvelleAnneeFilm != null && !titre.trim().isEmpty() && !nouvelleAnneeFilm.trim().isEmpty()) {
    try {
        String url = "jdbc:mariadb://localhost:3306/films";
        String user = "mysql";
        String password = "mysql";
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO Film (titre, année) VALUES (?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, titre);
        pstmt.setInt(2, Integer.parseInt(nouvelleAnneeFilm));
        int affectedRows = pstmt.executeUpdate();

        out.println(affectedRows + " film(s) ajouté(s).");
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("Erreur: " + e.getMessage());
    }
}
%>
</body>
</html>
