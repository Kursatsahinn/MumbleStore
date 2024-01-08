<?php 
    include_once 'connection.php';
    require "functions.php";
    session_start();
    ob_start();
    $K_ID = $_GET['K_ID'];
    
    $Kullanici_AdiQuery = mysqli_query($baglan,"SELECT Kullanici_adi FROM kullanici WHERE Kullanici_ID = '$K_ID'");

    $Kullanici_Adi = mysqli_fetch_array($Kullanici_AdiQuery);

    $Kullanici_adi = $Kullanici_Adi['Kullanici_adi'];

    $baglan -> query("SET FOREIGN_KEY_CHECKS=0");

    $baglan -> query("DELETE FROM kullanici WHERE Kullanici_ID = $K_ID");

    $baglan -> query("DELETE FROM oyun_kutuphane WHERE Kutuphane_ID = $K_ID");

    $baglan -> query("SET FOREIGN_KEY_CHECKS=1");

    $K_ID = $_SESSION['Kullanici_ID'];
    $K_IP = $_SERVER['REMOTE_ADDR'];
	$Tarih = date('Y-m-d H:i:s');
	$Islem = "$Kullanici_adi kullanıcısını sildi";
	$card_num = null;
	$card_tarih = null;
	$card_cvc2 = null;
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

    log_kayit($baglan,$K_ID,$K_IP,$Tarih,$Islem,$Cihaz,$Tarayici,$card_num,$card_tarih,$card_cvc2);

    header("Location: kullanicilar.php");


?>