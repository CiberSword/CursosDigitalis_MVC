<?php
$db = mysqli_connect('mysql-cursosdigitalis.alwaysdata.net','317193','FalzarStorm#1','cursosdigitalis_db');
$db->set_charset("utf8");

if (!$db) {
    echo "Error: No se pudo conectar a MySQL.";
    echo "errno de depuración: " . mysqli_connect_errno();
    echo "error de depuración: " . mysqli_connect_error();
    exit;
}
