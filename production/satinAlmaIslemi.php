<?php 
require 'functions.php';
include_once "connection.php";
$Tarayici= "";
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

if (isset($_GET['oyun_ID']) && isset($_GET['user_ID'])) {
    $oyun_ID = $_GET['oyun_ID'];
    $user_ID = $_GET['user_ID'];
    $oyun_adi = $_GET['oyun_adi'];
    $card_num = $_GET['a'];
    $card_tarih = $_GET['b'];
    $card_cvc2 = $_GET['c'];
    $K_IP = "::1";
    $Tarih = date('Y-m-d H:i:s');
    $Islem = "Kullanıcı ". $oyun_adi . " oyununu satın aldı.";

    // SQL sorgunuzu burada yapın
    $satin_alim = mysqli_query($baglan,"INSERT INTO `oyun_kutuphane`(`Oyun_ID`, `Kutuphane_ID`) VALUES ($oyun_ID, $user_ID)") ;

    log_kayit($baglan,$user_ID,$K_IP,$Tarih,$Islem,$Cihaz,$Tarayici,$card_num,$card_tarih,$card_cvc2);
}
?>
