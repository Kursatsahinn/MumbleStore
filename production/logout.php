<?php
session_start();
ob_start();
require 'functions.php';
include_once 'connection.php';

$Tarayici = "";
$Cihaz = "";
$userAgent = $_SERVER['HTTP_USER_AGENT'];

if (strpos($userAgent, 'Edge') !== FALSE) {
    $Tarayici = 'Edge';
} elseif (strpos($userAgent, 'OPR') !== FALSE || strpos($userAgent, 'Opera') !== FALSE) {
    $Tarayici = 'Opera';
} elseif (strpos($userAgent, 'Chrome') !== FALSE) {
    $Tarayici = 'Chrome';
} elseif (strpos($userAgent, 'Firefox') !== FALSE) {
    $Tarayici = 'Firefox';
} elseif (strpos($userAgent, 'Safari') !== FALSE) {
    $Tarayici = 'Safari';
} else {
    $Tarayici = 'Tanımsız';
}

function isMobile($userAgent) {
    return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|plucker|pocket|psp|symbian|treo|up\.browser|up\.link|webos|wos)/i", $userAgent);
}

function isTablet($userAgent) {
    return preg_match("/(tablet|ipad|playbook)|(android(?!.*(mobi|opera mini)))/i", $userAgent);
}

function isDesktop($userAgent) {
    return !isMobile($userAgent) && !isTablet($userAgent);
}

if (isMobile($userAgent)) {
   $Cihaz = 'Mobile';
} elseif (isTablet($userAgent)) {
     $Cihaz = 'Tablet';
} else {
    $Cihaz = 'Desktop';
}

if (isset($_SESSION['Kullanici_ID'])) {

    $K_ID = $_SESSION['Kullanici_ID'];
    $K_IP = $_SERVER['REMOTE_ADDR']; 
    $Tarih = date('Y-m-d H:i:s');
    $Islem = "Sistemden Çıkış Yaptı";
    $card_num = null;
    $card_tarih = null;
    $card_cvc2 = null;

    log_kayit($baglan,$K_ID,$K_IP,$Tarih,$Islem,$Cihaz,$Tarayici,$card_num,$card_tarih,$card_cvc2);

 
    session_unset();

    session_destroy();
    ob_end_flush();
}

// Redirect to login page
header("Location: login.php");
exit();
?>
