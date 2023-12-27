<?php
    require_once("../controllers/connect_db.php");

    $sql = "SELECT matricule, nom, prenom, promotion, email, genre FROM etudiants";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "matricule: " . $row["matricule"]. " - Nom: " . $row["nom"]. " " . $row["nom"]. "<br>";
    }
    } else {
        echo "Aucun étudiant présent";
    }
    $conn->close();
?>