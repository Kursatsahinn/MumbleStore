<?php 
    include_once "connection.php";
    $gelistirici_ID = $_GET['gelistirici_ID'];

    $gelistirici_bilgileri = mysqli_query($baglan,"SELECT * FROM gelistirici WHERE Gelistirici_ID = '$gelistirici_ID'");
    $gelistirici_bilgisi = mysqli_fetch_array($gelistirici_bilgileri);



    $gelistirici_adi = $gelistirici_bilgisi['Gelistirici_Ad'];
    $deger = $gelistirici_bilgisi['deger'];
    $tarih = $gelistirici_bilgisi['tarih'];
    $e_posta = $gelistirici_bilgisi['e_posta'];

    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geliştirici Güncelleme</title>
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
            <label style="font-weight:bold">Geliştirici Adı:</label>
            <input type="text" id="gelistirici_adi" value="<?php echo $gelistirici_adi; ?>" placeholder="Geliştirici Adı" readonly>
        </div>
        <div class="form-group">
            <label style="font-weight:bold">E-Posta:</label>
            <input type="text" id="e-posta" value="<?php echo $e_posta; ?>" placeholder="E-posta" readonly>
        </div>
        <div class="form-group">
            <label style="font-weight:bold">Kuruluş Tarihi:</label>
            <input type="text" id="tarih" value="<?php echo $tarih; ?>" placeholder="Tarih" readonly>
        </div>
        <div class="form-group">
            <label style="font-weight:bold">Değeri:</label>
            <input type="text" id="deger" value="<?php echo $deger; ?>" placeholder="Değer">
        </div>
        <div class="button-group">
            <button onclick="guncelle()">Güncelle</button>
            <button onclick="iptal()">İptal</button>
        </div>
    </div>

    <input type="hidden" id="gelistiriciID" value="<?php echo $gelistirici_ID; ?>">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        function guncelle() {   
            var gelistiriciID = document.getElementById('gelistiriciID').value;
            var deger= document.getElementById('deger').value;


            if (deger) {
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
                    xhttp.open("GET", "G_Guncelle.php?gelistirici_ID=" + gelistiriciID  + "&deger=" + deger , true);
                    xhttp.send();

                    window.location.href = 'gelistiriciler.php';
                });
            } else {
                swal("Hata!", "Lütfen tüm alanları doldurun.", "error");
            }
        }

        function iptal() {
            window.location.href = 'gelistiriciler.php';
        }
    </script>
</body>
</html>
