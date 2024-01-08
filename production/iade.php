<?php 
    include_once 'connection.php';

    $oyun_ID = $_GET['oyun_ID'];
    $user_ID = $_GET['user_ID'];

    $baglan -> query("SET FOREIGN_KEY_CHECKS=0");

    $baglan -> query("DELETE FROM oyun_kutuphane WHERE oyun_ID = $oyun_ID AND Kutuphane_ID = $user_ID");

    $baglan -> query("SET FOREIGN_KEY_CHECKS=1");

    header("Location:kutuphane.php");




?>