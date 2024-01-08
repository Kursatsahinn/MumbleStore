<?php 
    include_once "connection.php";
    $dagitici_ID = $_GET['dagitici_ID'];

    $dagitici_bilgileri = mysqli_query($baglan,"SELECT * FROM dagitici WHERE dagitici_ID = '$dagitici_ID'");
    $dagitici_bilgisi = mysqli_fetch_array($dagitici_bilgileri);



    $dagitici_adi = $dagitici_bilgisi['dagitici_adi'];
    $e_posta = $dagitici_bilgisi['e-posta'];
    $deger = $dagitici_bilgisi['deger'];
    $tarih = $dagitici_bilgisi['tarih'];

    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dağıtıcı Güncelleme</title>
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
            <label style="font-weight:bold">Dağıtıcı Adı:</label>
            <input type="text" id="dagitici_adi" value="<?php echo $dagitici_adi; ?>" placeholder="Dağıtıcı Adı" readonly>
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

    <input type="hidden" id="dagiticiID" value="<?php echo $dagitici_ID; ?>">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        function guncelle() {   
            var dagiticiID = document.getElementById('dagiticiID').value;
            var deger =document.getElementById('deger').value;


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
                    xhttp.open("GET", "S_Guncelle.php?dagitici_ID=" + dagiticiID  + "&deger=" + deger , true);
                    xhttp.send();

                    window.location.href = 'sirketler.php';
                });
            } else {
                swal("Hata!", "Lütfen tüm alanları doldurun.", "error");
            }
        }

        function iptal() {
            window.location.href = 'sirketler.php';
        }
    </script>
</body>
</html>
