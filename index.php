<?php
/**
 * Created by PhpStorm.
 * User: CryFiX
 * Date: 07.07.2018
 * Time: 17:26
 */
?>

<?php
include_once ("includes/connection.php");
echo "Imma awesome Hello World App!";
?>

<html>
<head>
    <title>Maturita</title>
    <link rel="stylesheet" type="text/css" href="assets/style.css">
</head>
<body>





<?php

if (isset($_POST['username'], $_POST['password'])){
    $user = $_POST['username'];
    $pass = md5($_POST['password']);
    if (empty($user) or empty($pass)){
        $error = "Vsetky policka je potrebne vyplnit";
    }
}

?>


<?php

if (isset($error)){
    echo $error;
}

?>
<form action="" method="post" autocomplete="off">
    <input type="text" name="username" placeholder="Uzivatelske meno">
    <input type="password" name="password" placeholder="Heslo">
    <input type="submit" name="submit" placeholder="Log In">
</form>



















</body>
</html>
