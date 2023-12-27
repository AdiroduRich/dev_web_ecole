<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet" />
    <title>Document</title>
</head>
<body style="margin: 0px;">

    <div style="background:orange; border-radius: 0px 0px 40% 40%; padding: 50px 0px;">
        <h2 style="text-align: center;">GESTION DES ETUDIANTS<h2>
    </div>

    <div style="padding: 0px 20px">

        <form method="POST" action="vues/add_student.php">
            <button class="btn" type="submit">Ajouter</button>
        </form>

        <div style="display: flex; margin-top: 10px; padding: 0px 5px; justify-content: space-around;">
            <p style="width: 10%; font-weight: bold;">Matricule</p>
            <p  style="width: 20%; font-weight: bold;">Nom</p>
            <p style="width: 20%; font-weight: bold;">Prénom</p>
            <p style="width: 10%; font-weight: bold;">Promotion</p>
            <p style="width: 25%; font-weight: bold;">Adresse mail</p>
            <p style="width: 5%; font-weight: bold;">Genre</p>
            <p style="width: 5%; font-weight: bold;"></p>
            <p style="width: 5%; font-weight: bold;"></p>
        </div>
        <div>
        <?php
            require_once("controllers/connect_db.php");

            $sql = "SELECT matricule, nom, prenom, promotion, email, genre, id FROM etudiants";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo '
                    <div style="display: flex; padding: 0px 5px; background: #f5f5f5; border-bottom: 1px solid gray; justify-content: space-around;">
                        <p style="width: 10%;">'. $row["matricule"].'</p>
                        <p  style="width: 20%;">'. $row["nom"].'</p>
                        <p style="width: 20%;">'. $row["prenom"].'</p>
                        <p style="width: 10%;">'. $row["promotion"].'</p>
                        <p style="width: 25%;">'. $row["email"].' mail</p>
                        <p style="width: 5%;">'. $row["genre"].'</p>
                        <p style="width: 5%;">
                            <form style="display: flex; align-items: center; justify-content: center;" method="POST" action="vues/update_student.php">
                                <input type="hidden" name="id" value="'. $row["id"].'" />
                                <input type="image" src="assets/update_icon.jpeg" style="width: 20px;" />
                            </form>
                        </p>
                        <p style="width: 5%;">
                            <form style=" display: flex; align-items: center; justify-content: center;" method="POST" action="controllers/delete.php">
                                <input type="hidden" name="id" value="'. $row["id"].'" />
                                <input type="image" src="assets/delete_icon.jpeg" style="width: 20px;" />
                            </form>
                        </p>
                    </div>';
            }
            } else {
                echo "Aucun étudiant présent";
            }
            $conn->close();
        ?>
        </div>
    </div>
</body>
</html>