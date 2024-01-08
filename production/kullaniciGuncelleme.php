<?php 
    include_once "connection.php";
    $user_ID = $_GET['user_ID'];

    $kullanici_bilgileri = mysqli_query($baglan,"SELECT Kullanici_adi, Kullanici_eposta, K_Adi, k_tip FROM kullanici WHERE Kullanici_ID = '$user_ID'");
    $kullanici_bilgisi = mysqli_fetch_array($kullanici_bilgileri);



    $kullanici_adi = $kullanici_bilgisi['Kullanici_adi'];
    $email = $kullanici_bilgisi['Kullanici_eposta'];
    $K_Adi = $kullanici_bilgisi['K_Adi'];
    $kullanici_tipi = $kullanici_bilgisi['k_tip'];

    $kullanici_tipleri_sorgu = mysqli_query($baglan, "SELECT * FROM kullanici_tipi");
    $kullanici_tipleri = mysqli_fetch_all($kullanici_tipleri_sorgu, MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kullanıcı Güncelleme</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #756AB6 , #AC87C5, #BE9FE180, #BE9FE180,#AC87C5 , #756AB6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .box {
            background-color: white;
            padding: 20px;
            margin: 10px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            width: 300px;
            background-color: #DCD6F7;
        }

        input[type="text"],
        input[type="email"],
        button {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        button {
            background-color: #044570;
            color: white;
            border: none;
            cursor: pointer;
            width: 48%;
            margin-right: 4%;
        }

        button:last-child {
            margin-right: 0;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }

        button:hover {
            background-color: #036;
        }

        .form-group {
            margin-bottom: 10px;
            /* width: 100%; */
        }
        .select2-container--default .select2-selection--single {
        width: 100px; /* veya istediğiniz bir genişlik değeri */
    }
    .select2-container {
    width: 100px !important; /* Kapsayıcıya göre tam genişlik */
}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
</head>
<body>
    <div class="box">
        <h3>Kullanıcı Bilgileri Güncelleme</h3>
        <div class="form-group">
            <input type="text" id="kullaniciAdi" value="<?php echo $kullanici_adi; ?>" placeholder="Kullanıcı Adı" readonly>
        </div>
        <div class="form-group">
            <input type="email" id="email" value="<?php echo $email; ?>" placeholder="E-posta" readonly>
        </div>
        <div class="form-group">
            <input type="text" id="K_Adi" value="<?php echo $K_Adi; ?>" placeholder="Kullanıcı Adı">
        </div>
        <div class="form-group" style="width:100%">
            <label for="kullaniciTipi">Kullanıcı Tipi:</label>
            <select id="kullaniciTipi" class="select2">
                <?php foreach ($kullanici_tipleri as $tip) { ?>
                    <option value="<?php echo $tip['k_tip']; ?>"
                        <?php if ($tip['k_tip'] == $kullanici_tipi) echo 'selected'; ?>>
                        <?php echo $tip['k_tip_adi']; ?>
                    </option>
                <?php } ?>
            </select>
        </div>
        <div class="button-group">
            <button onclick="guncelle()">Güncelle</button>
            <button onclick="iptal()">İptal</button>
        </div>
    </div>

    <input type="hidden" id="userID" value="<?php echo $user_ID; ?>">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        function guncelle() {   
            var userID = document.getElementById('userID').value;
            var k_tip =document.getElementById('kullaniciTipi').value;
            var k_adi =document.getElementById('K_Adi').value;

            if (k_tip && k_adi) {
                swal({
                    title: "Başarılı!",
                    text: "Bilgiler başarıyla güncellendi.",
                    icon: "success",
                    buttons: true,
                    timer: 3000
                }).then((value) => {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            console.log('Response from server: ' + this.responseText);
                        }
                    };
                    xhttp.open("GET", "K_Guncelle.php?user_ID=" + userID  +"&k_tip=" + k_tip + "&k_adi=" + k_adi , true);
                    xhttp.send();

                    window.location.href = 'kullanicilar.php';
                });
            } else {
                swal("Hata!", "Lütfen tüm alanları doldurun.", "error");
            }
        }

        function iptal() {
            window.location.href = 'kullanicilar.php';
        }
    </script>
    <script> 
    $(document).ready(function() {
            $('.select2').select2(); // Select2'yi başlat
        });
    </script>
</body>
</html>
