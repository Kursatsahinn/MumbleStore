<?php 
    include_once "connection.php";
    $oyun_ID = $_GET['oyun_ID'];

    $oyun_bilgileri = mysqli_query($baglan,"SELECT oyun.Oyun_adi, gelistirici.Gelistirici_Ad, dagitici.dagitici_adi, oyun.Oyun_fiyati
                                        FROM oyun,gelistirici,dagitici
                                        WHERE oyun.Gelistirici_ID = gelistirici.Gelistirici_ID
                                        AND dagitici.dagitici_ID = oyun.dagitici_ID
                                        AND oyun.Oyun_ID = '$oyun_ID';");
    $oyun_bilgisi = mysqli_fetch_array($oyun_bilgileri);



    $oyun_adi = $oyun_bilgisi['Oyun_adi'];
    $gelistirici = $oyun_bilgisi['Gelistirici_Ad'];
    $dagitici = $oyun_bilgisi['dagitici_adi'];
    $fiyat = $oyun_bilgisi['Oyun_fiyati'];

    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oyun Güncelleme</title>
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
        <h3>Oyun Bilgileri Güncelleme</h3>
        <div class="form-group">
            <label style="font-weight:bold">Oyun Adı:</label>
            <input type="text" id="oyunAdi" value="<?php echo $oyun_adi; ?>" placeholder="Oyun Adı" readonly>
        </div>
        <div class="form-group">
            <label style="font-weight:bold">Geliştirici:</label>
            <input type="text" id="gelistirici" value="<?php echo $gelistirici; ?>" placeholder="Geliştirici" readonly>
        </div>
        <div class="form-group">
            <label style="font-weight:bold">Dağıtıcı:</label>
            <input type="text" id="dagitici" value="<?php echo $dagitici; ?>" placeholder="Dağıtıcı" readonly>
        </div>
        <div class="form-group">
            <label style="font-weight:bold">Fiyat:</label>
            <input type="text" id="fiyat" value="<?php echo $fiyat; ?>" placeholder="Fiyat">
        </div>
        <div class="button-group">
            <button onclick="guncelle()">Güncelle</button>
            <button onclick="iptal()">İptal</button>
        </div>
    </div>

    <input type="hidden" id="oyunID" value="<?php echo $oyun_ID; ?>">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        function guncelle() {   
            var oyunID = document.getElementById('oyunID').value;
            var fiyat =document.getElementById('fiyat').value;


            if (fiyat) {
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
                    xhttp.open("GET", "O_Guncelle.php?oyun_ID=" + oyunID  + "&fiyat=" + fiyat , true);
                    xhttp.send();

                    window.location.href = 'oyunlar.php';
                });
            } else {
                swal("Hata!", "Lütfen tüm alanları doldurun.", "error");
            }
        }

        function iptal() {
            window.location.href = 'oyunlar.php';
        }
    </script>
</body>
</html>
