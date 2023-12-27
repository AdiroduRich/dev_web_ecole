<?php

    require_once("connect_db.php");

    $matricule = $_POST['mat'];
    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];
    $email = $_POST['email'];
    $promotion = $_POST['promotion'];
    $genre = $_POST['genre'];

    $sql = "INSERT INTO etudiants (matricule, nom, prenom, email, promotion, genre)
    VALUES ('$matricule', '$nom', '$prenom', '$email', '$promotion', '$genre')";

    if ($conn->query($sql) === TRUE) {
        echo "Nouvel etudiant created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
    header('Location: ../index.php');
?>
