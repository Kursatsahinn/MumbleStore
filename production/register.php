<?php

require "settings.php";
/*
require, include gibi belirtilen dosyayı kodun yazıldığı dosya içerisine 
eklemek için kullanılır. Ama include gibi uyarı vermek yerine hata verir 
ve kodun çalışmasını durdurur. require fonksiyonunun da kullanımı 
include fonksiyonu ile aynıdır.
*/
include_once 'connection.php';
/*
Bu fonksiyon include fonksiyonu ile aynı şekilde çalışarak dışarıdan dosya 
dahil etme olanağı sağlar. Tek farkı bir dosya içerisinde aynı dosyanın birden 
fazla çağrılmasını engeller.
*/
ob_start();

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
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
}

	
</head>
<body class="my-login-page" style="background: linear-gradient(90deg, #756AB6 , #AC87C5, #BE9FE180, #BE9FE180,#AC87C5 , #756AB6);"">
	<section class="h-100" style=>
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img style="position:relative; left:0px; top:0px; width: 100%; height:100%" src="images/logo1.png" alt="logo">
					</div>
					<div class="card fat" style=" background-color: #DCD6F7;">
						<div class="card-body">
							<h4 class="card-title">Kayıt Ekranı</h4>
							
							<?php
							
							$kullaniciAdi = $_POST["kullaniciAdi"];
							$kullaniciSoyadi = $_POST["kullaniciSoyadi"];
							$nickname = $_POST["nickname"];
							$email = $_POST["email"];
							$sifre = $_POST["sifre"];
							$sifre_md5 = md5($sifre);
							$sifre2 = $_POST["sifre2"];
							$cinsiyet = $_POST["cinsiyet"];
							$katilimTarihi = date("Y-m-d");
							$k_tip = 1;
							
							/*echo "$kullaniciAdi <br>";
							echo "$kullaniciSoyadi <br>";
							echo "$nickname <br>";
							echo "$email <br>";
							echo "$sifre <br>";
							echo "$sifre2 <br>";
							echo "$dogumTarihi <br>";
							echo "$meslek <br>";
							echo "$cinsiyet <br>";*/

							
							if($_POST){
								
								if(!$kullaniciAdi || !$kullaniciSoyadi || !$nickname || !$email || !$sifre || !$sifre2 || !$nickname || !$cinsiyet ){
									echo "Lütfen boş alan bırakmayınız.";
								}else{
									if($sifre != $sifre2){
										echo "Girdiğiniz şifreler uyuşmuyor.";
									}else{
										
										$uyeEkle = mysqli_query($baglan, "
										INSERT INTO kullanici (Kullanici_adi, Kullanici_Soyadi, Cinsiyet_ID, Kullanici_eposta,K_Adi, Sifre,k_tip, k_tarih) 
										VALUES ('$kullaniciAdi','$kullaniciSoyadi','$cinsiyet','$email','$nickname','$sifre_md5','$k_tip','$katilimTarihi')");
										
										if($uyeEkle){

											echo '<script>Swal.fire({
												  title: "Üyelik Başarılı!",
												  text: "Birazdan giriş sayfasına yönlendirileceksiniz!",
												  icon: "success"
												});</script>';
											header("refresh: 3; url=login.php");
										}else{
											echo "Üyeliğiniz oluşturulamadı";
										}
									}
									
								}
								
							}
							
							?>
							
							
							<form method="POST" class="my-login-validation" novalidate="">
								<div class="form-group">
									<label for="name"><b>İsim</b></label>
									<input type="text" class="form-control" name="kullaniciAdi" required autofocus autocomplete="off">
								</div>
								
								<div class="form-group">
									<label for="name"><b>Soyisim</b></label>
									<input type="text" class="form-control" name="kullaniciSoyadi" required autofocus autocomplete="off">
								</div>
								
								<div class="form-group">
									<label for="name"><b>Kullanıcı Adı</b></label>
									<input type="text" class="form-control" name="nickname" required autofocus autocomplete="off">
								</div>

								<div class="form-group">
									<label for="email"><b>E-Mail</b></label>
									<input type="email" class="form-control" name="email" required autocomplete="off">
									<div class="invalid-feedback">
										<b>Mail adresi geçersiz</b>
									</div>
								</div>

								<div class="form-group">
									<label for="password"><b>Şifre</b></label>
									<input type="password" class="form-control" name="sifre" required data-eye autocomplete="off">
									<div class="invalid-feedback">
										<b>Şifre Gereklidir</b>
									</div>
								</div>
								
								<div class="form-group">
									<label for="password"><b>Şifre (Tekrar)</b></label>
									<input type="password" class="form-control" name="sifre2" required data-eye autocomplete="off">
									<div class="invalid-feedback">
										<b>Şifre Gereklidir</b>
									</div>
								</div>
								
								
								
								
								
								
								
								<div class="form-group">
									<label for="name"><b>Cinsiyet</b></label>
									<select class="form-control" name="cinsiyet">
										<option>Seçiniz..</option>													
										<?php

										$genderName='Cinsiyet_adi';
										$genderID='Cinsiyet_ID';

										$genderQuery = mysqli_query($baglan, "select * from cinsiyet");
										if(mysqli_num_rows($genderQuery)!=0)	{

											while($readGender = mysqli_fetch_array($genderQuery))	{
												echo "<option value='$readGender[$genderID]'>$readGender[$genderName]</option>";
											}
										}

										?>
									</select>
								</div>

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block" style="background-color:#424874; border-color:#424874">
										<b>Kayıt Ol</b>
									</button>
								</div>
								<div class="mt-4 text-center">
									<a href="login.php" style="color:#3F72AF"><b>Giriş Sayfası</b></a>
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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="js/my-login.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

	
</body>
</html>