<?php
/**
 * Created by PhpStorm.
 * User: CryFiX
 * Date: 19.07.2018
 * Time: 21:59
 */
try{
    $pdo = new PDO ('mysql:host=localhost;dbname=maturita', 'root', '');
}catch (PDOException $e){
    exit('Database error.');
}