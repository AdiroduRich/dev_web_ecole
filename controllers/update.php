<?php

    require_once("connect_db.php");

    $id=$_POST['id'];
    $matricule = $_POST['mat'];
    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];
    $email = $_POST['email'];
    $promotion = $_POST['promotion'];
    $genre = $_POST['genre'];

    $sql = "UPDATE etudiants SET nom='$nom', prenom='$prenom', email='$email', promotion='$promotion', genre='$genre' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $conn->error;
    }

    $conn->close();
    header('Location: ../index.php');

?>
