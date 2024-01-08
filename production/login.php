<?php
$_SESSION = array();
require "settings.php"; // require, include gibi belirtilen dosyayı kodun yazıldığı dosya içerisine eklemek için kullanılır. Ama include gibi uyarı vermek yerine hata verir ve kodun çalışmasını durdurur. require fonksiyonunun da kullanımı include fonksiyonu ile aynıdır.
session_start(); // oturumu başlatıyoruz.
ob_start(); // yönlendirmelerde ihtiyacımız var. sayfa yönlendirmeleri
include_once 'connection.php'; // Bu fonksiyon include fonksiyonu ile aynı şekilde çalışarak dışarıdan dosya dahil etme olanağı sağlar. Tek farkı bir dosya içerisinde aynı dosyanın birden fazla çağrılmasını engeller.
require "functions.php";
//name ile text'lerden veri çekme

if(isset($_POST['girisButonu'])){ // isset, parametre olarak aldığı değişkenin tanımlı olup olmadığını kontrol eder.
		
	$email = $_POST['email'];
	$pass = $_POST['password'];
	$password = md5($pass);

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

	
	if($email && $password){

		$query = mysqli_query($baglan, "SELECT * FROM kullanici WHERE Kullanici_eposta='$email' AND Sifre='$password'");
		$numrow = mysqli_num_rows($query);
		
		if($numrow > 0){

			$query = mysqli_query($baglan, "SELECT * FROM kullanici WHERE Kullanici_eposta='$email' AND Sifre='$password'");
			$row = mysqli_fetch_array($query);

			$_SESSION["e_posta"] = $row["Kullanici_eposta"]; // Sessionlar oturum bilgilerini saklamak için kullanılan yapılardır.
			$_SESSION["Kullanici_ID"] = $row["Kullanici_ID"];
			$_SESSION["k_tip"] = $row["k_tip"];
			$_SESSION["first_login"] = "first"; // log kaydı için kenarda dursun

			$user_ID = $_SESSION['Kullanici_ID'];
			$K_IP = $_SERVER['REMOTE_ADDR'];
			$Tarih = date('Y-m-d H:i:s');
			$Islem = "Sisteme Giriş Yaptı";
			$card_num = null;
			$card_tarih = null;
			$card_cvc2 = null;

			log_kayit($baglan,$user_ID,$K_IP,$Tarih,$Islem,$Cihaz,$Tarayici,$card_num,$card_tarih,$card_cvc2);

			if ($row['k_tip'] == 1){
				header('Location:index.php');
			}elseif ($row['k_tip'] == 2){
				header('Location:index.php');
			}else{
				exit("User Group Id Bulunamadı");
			}

		}else{

			echo "<script type='text/javascript'>
			window.location='login.php?user=false';
			</script>";

		}
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
		} /* Buton metni için beyaz renk */

		.btn-blueviolet:hover{
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
							<form method="POST" class="my-login-validation" novalidate="" action="login.php">
								<div class="form-group">
									<label for="email"><b>E-posta</b></label>
									<input type="email" class="form-control" name="email" value="" required autofocus autocomplete="false">
									<div class="invalid-feedback">
										<b>Yazılan e-posta adresi geçersizdir.</b>
									</div>
								</div>

								<div class="form-group">
									<label for="password"><b>Şifre</b>
										
									</label>
									<input type="password" class="form-control" name="password" required data-eye>
								    <div class="invalid-feedback">
								    	<b>Şifre kısmı gerekli bir alandır.</b>
							    	</div>
								</div>

								<div class="form-group">
									<div class="custom-checkbox custom-control">
										<input type="checkbox" name="remember" id="remember" class="custom-control-input">
										<label for="remember" class="custom-control-label"><b>Beni Hatırla</b></label>
									</div>
								</div>

								<div class="form-group m-0">
									<button type="submit" name="girisButonu" class="btn btn-primary btn-block" style="background-color:#424874; border-color:#424874">
										<b>Giriş</b>
									</button>
								</div>
								<div class="mt-4 text-center">
									<a href="register.php" style="color:#3F72AF"><b>Yeni Kayıt</b></a>
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
