<?php 
    include_once "connection.php";
    $oyun_ID = $_GET['oyun_ID'];
    $user_ID = $_GET['user_ID'];

    $oyun_bilgileri = mysqli_query($baglan,"SELECT oyun.Oyun_adi, gelistirici.Gelistirici_Ad, dagitici.dagitici_adi,oyun.Oyun_fiyati
    FROM oyun,dagitici,gelistirici
    WHERE oyun.Gelistirici_ID = gelistirici.Gelistirici_ID
    AND oyun.dagitici_ID = dagitici.dagitici_ID
    AND oyun.Oyun_ID = '$oyun_ID'");

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
    		<link rel="icon" href="images/mumble.ico" type="image/ico" />
    <title>Satın Alma</title>
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
        .swal-button {
        text-align: center; /* Buton içeriğini ortala */
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
        input[type="number"],
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
            /* Butonların genişliği */
            margin-right: 4%;
            /* İki buton arasındaki boşluk */
        }

        button:last-child {
            margin-right: 0;
            /* Son butona sağ taraftan boşluk ekleme */
        }

        .button-group {
            display: flex;
            /* Butonları yan yana hizalamak için */
            justify-content: space-between;
        }

        button:hover {
            background-color: #036;
        }

        .form-group {
            margin-bottom: 10px;
        }
        
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</head>

<body>
    <div class="box">
        <h3>Oyun Bilgileri</h3>
        <p>Oyun Adı: <?php echo $oyun_adi ?></p>
        <p>Geliştirici: <?php echo $gelistirici ?></p>
        <p>Dağıtıcı: <?php echo $dagitici ?></p>
        <p>Fiyatı: <?php echo $fiyat . "$" ?></p>
    </div>

    <div class="box">
        <h3>Satın Alma İşlemi</h3>
        <div class="form-group">
            <input type="text" id="creditCard" placeholder="Kredi Kartı No (XXXX XXXX XXXX XXXX)" maxlength="19">
        </div>
        <div class="form-group">
            <input type="text" id="expiryDate" placeholder="Tarih (AA/YY)" maxlength="5">
        </div>
        <div class="form-group">
            <input type="text" id="cvv" placeholder="CVV" maxlength="3">
        </div>
        <div class="button-group">
            <button style = "background-color:#424874" onclick="submitForm()">Onayla</button>
            <button style = "background-color:#424874" onclick="cancelForm()">İptal</button>
        </div>
    </div>
    <!-- Gizli inputlar eklendi -->
    <input type="hidden" id="oyunID" value="<?php echo $oyun_ID; ?>">
    <input type="hidden" id="userID" value="<?php echo $user_ID; ?>">
    <input type="hidden" id="oyun_adi" value="<?php echo $oyun_adi; ?>">
    


    <script>
        document.getElementById('creditCard').addEventListener('input', function (e) {
            var target = e.target, position = target.selectionEnd, length = target.value.length;
            target.value = target.value.replace(/\D/g, '').replace(/(\d{4})(?=\d)/g, '$1 ').trim();
            target.selectionEnd = position += ((position === length) ? 1 : 0);
        });

        document.getElementById('expiryDate').addEventListener('input', function (e) {
            var target = e.target;
            target.value = target.value.replace(/\D/g, '').replace(/(\d{2})(?=\d)/, '$1/');
        });

        function submitForm() {
            var creditCard = document.getElementById('creditCard').value.trim();
            var expiryDate = document.getElementById('expiryDate').value.trim();
            var cvv = document.getElementById('cvv').value.trim();
            var oyunID = document.getElementById('oyunID').value;  // Oyun ID değerini al
            var userID = document.getElementById('userID').value;  // Kullanıcı ID değerini al
            var oyun_adi =document.getElementById('oyun_adi').value;
           



            if (creditCard && expiryDate && cvv) {
                swal({
                    title: "Başarılı!",
                    text: "Satın alma işleminiz tamamlandı.",
                    icon: "success",
                    buttons: true,
                    timer: 3000  // 3 saniye sonra otomatik kapanacak
                }).then((value) => {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            console.log('Response from server: ' + this.responseText);
                        }
                    };
                    xhttp.open("GET", "satinAlmaIslemi.php?oyun_ID=" + oyunID + "&user_ID=" + userID +"&oyun_adi="+oyun_adi + "&a=" +creditCard + "&b=" + expiryDate + "&c=" + cvv, true);
                    xhttp.send();

                    window.location.href = 'oyunlar.php';
                });
            } else {
                swal("Hata!", "Lütfen tüm alanları doldurun.", "error");
            }
        }
        




        function cancelForm() {
            window.location.href = 'oyunlar.php';
        }
    </script>
</body>

</html>