<?php
require "settings.php";
session_start();
ob_start();
include_once 'connection.php';
require "functions.php";

$user_ID = $_SESSION['Kullanici_ID'];

$kullanici_bilgiCek = mysqli_query($baglan, "SELECT kullanici.K_Adi,kullanici.Kullanici_eposta,kullanici.Sifre FROM kullanici WHERE Kullanici_ID = $user_ID");

$kullanici_bilgisi = mysqli_fetch_array($kullanici_bilgiCek);

$K_Adi = $kullanici_bilgisi['K_Adi'];
$K_Sifre = $kullanici_bilgisi['Sifre'];
$e_posta = $kullanici_bilgisi['Kullanici_eposta'];


if (isset($_POST['girisButonu'])) {
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

	function isMobile($userAgent)
	{
		return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|plucker|pocket|psp|symbian|treo|up\.browser|up\.link|webos|wos)/i", $userAgent);
	}

	function isTablet($userAgent)
	{
		return preg_match("/(tablet|ipad|playbook)|(android(?!.*(mobi|opera mini)))/i", $userAgent);
	}

	function isDesktop($userAgent)
	{
		return !isMobile($userAgent) && !isTablet($userAgent);
	}

	if (isMobile($userAgent)) {
		$Cihaz = 'Mobile';
	} elseif (isTablet($userAgent)) {
		$Cihaz = 'Tablet';
	} else {
		$Cihaz = 'Desktop';
	}

	$K_IP = $_SERVER['REMOTE_ADDR'];
	$Tarih = date('Y-m-d H:i:s');
	$Islem = "Kendi Bilgilerini Güncelledi";
	$card_num = null;
	$card_tarih = null;
	$card_cvc2 = null;
	log_kayit($baglan, $user_ID, $K_IP, $Tarih, $Islem, $Cihaz, $Tarayici, $card_num, $card_tarih, $card_cvc2);


	$email = $_POST['email'];
	$Kullanici_Adi = $_POST['K_Adi'];
	$pass = $_POST['password'];
	$password = md5($pass);

	$yeni_sifre = $_POST['yeni_sifre'];

	if (empty(trim($email))) {
		$email = $e_posta;
	}

	if (empty(trim($Kullanici_Adi))) {
		$Kullanici_Adi = $K_Adi;
	}

	if (!empty(trim($yeni_sifre))) {
		$yeni_sifre = md5($yeni_sifre);
	} else {
		$yeni_sifre = $K_Sifre;
	}

	if ($password == $K_Sifre) {
		$guncelle = mysqli_query($baglan, "UPDATE kullanici SET Kullanici_eposta = '$email', K_Adi = '$Kullanici_Adi', Sifre = '$yeni_sifre' WHERE kullanici.Kullanici_ID = $user_ID");
		session_unset();
		session_destroy();
		ob_end_flush();
		
		header("Location: login.php");
	}
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title><?php echo $siteBasligi; ?></title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/my-login.css">
	<link rel="icon" href="images/mumble.ico" type="image/ico" />
	<style>
		.btn-blueviolet {
			background-color: blueviolet;
			color: white;
		}

		/* Buton metni için beyaz renk */

		.btn-blueviolet:hover {
			background-color: blueviolet;
			color: white;
		}
	</style>
</head>

<body class="my-login-page" style="background: linear-gradient(90deg, #756AB6 , #AC87C5, #BE9FE180, #BE9FE180,#AC87C5 , #756AB6);">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img style="position:relative; left:0px; top:0px; width: 100%; height:100%" src="images/logo1.png" alt="logo">
					</div>
					<div class="card fat" style=" background-color: #DCD6F7;">
						<div class="card-body">
							<h2 class="card-title" style="text-align:center; font-family: 'Montserrat', sans-serif; font-weight: 600;">MumbleStore</h2>
							<form method="POST" class="my-login-validation" novalidate="" action="bilgiGuncelle.php">
								<div class="form-group">
									<label for="email"><b>E-posta:</b></label>
									<input type="email" class="form-control" name="email" value="<?php echo $e_posta ?>" autocomplete="false">
									<div class="invalid-feedback">
										<b>Yazılan e-posta adresi geçersizdir.</b>
									</div>
								</div>
								<div class="form-group">
									<label for="K_Adi"><b>Kullanıcı Adınız:</b></label>
									<input type="text" class="form-control" name="K_Adi" value="<?php echo $K_Adi ?>" autocomplete="false">
								</div>

								<div class="form-group">
									<label for="password"><b>Eski Şifreniz:</b>

									</label>
									<input type="password" class="form-control" name="password" required data-eye>
									<div class="invalid-feedback">
										<b>Şifre kısmı gerekli bir alandır.</b>
									</div>
								</div>
								<div class="form-group">
									<label for="password"><b>Yeni Şifreniz:</b>

									</label>
									<input type="password" class="form-control" name="yeni_sifre" data-eye>

								</div>


								<div class="form-group m-0">
									<button type="submit" name="girisButonu" class="btn btn-primary btn-block" style="background-color:#424874; border-color:#424874">
										<b>Güncelle</b>
									</button>
								</div>
								<div class="mt-4 text-center">
									<a href="index.php" style="color:#3F72AF"><b>Geri Dön</b></a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						<b style="color:#555">Copyright &copy; 2022 &mdash; VR.HERE</b>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="js/my-login.js"></script>
</body>

</html>