<?php

    require_once("connect_db.php");

    $id = $_POST['id'];

    $sql = "DELETE FROM etudiants WHERE id=$id";
    
    if ($conn->query($sql) === TRUE) {
        echo "Record deleted successfully";
    } else {
        echo "Error deleting record: " . $conn->error;
    }

    $conn->close();
    header('Location: ../index.php');
?>
