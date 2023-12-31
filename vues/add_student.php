<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../style.css" rel="stylesheet" />
    <title>Document</title>
</head>
<body style="margin: 0px;">

    <?php include_once("components/header.php"); ?>

    <div style="padding: 0px 20px">
        <a href="../index.php">RETOUR</a>

        <h2 style="text-align:center">Ajouter un étudiant</h2>

        <form method="POST" action="../controllers/insert.php"
            style="display: flex; margin-top: 10px; padding: 0px 5px; justify-content: space-around;">
            <table>
                <tr>
                    <th>Matricule</th>
                    <td>
                        <input type="text" name="mat" />
                    </td>
                </tr>
                <tr>
                    <th>Nom</th>
                    <td>
                        <input type="text" name="nom" />
                    </td>
                </tr>
                <tr>
                    <th>Prenom</th>
                    <td>
                        <input type="text" name="prenom" />
                    </td>
                </tr>
                <tr>
                    <th>Promotion</th>
                    <td>
                        <select name="promotion">
                            <option value="L1">L1</option>
                            <option value="L2 A">L2 A</option>
                            <option value="L2 B">L2 B</option>
                            <option value="L3 DSG">L3 DSG</option>
                            <option value="L3 MSI">L3 MSI</option>
                            <option value="L3 GL">L3 GL</option>
                            <option value="L3 AS">L3 AS</option>
                            <option value="L3 TLC">L3 TLC</option>
                            <option value="L4 DSG">L4 DSG</option>
                            <option value="L4 MSI">L4 MSI</option>
                            <option value="L4 GL">L4 GL</option>
                            <option value="L4 AS">L4 AS</option>
                            <option value="L4 TLC">L4 TLC</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Adresse mail</th>
                    <td>
                        <input type="email" name="email" />
                    </td>
                </tr>
                <tr>
                    <th>Genre</th>
                    <td>
                        <select name="genre">
                            <option value="M">Homme</option>
                            <option value="F">Femme</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <button type="submit" id="addBtn" class="btn">ENREGISTRER</button>
                    </td>
                </tr>

            </table>    
    </div>

    <script>
        var addBtn =document.getElementById('addBtn');
        addBtn.addEventListener('click', (e)=>{
            window.alert("Etudiant ajouté avec succès");
        });
    </script>
</body>
</html>