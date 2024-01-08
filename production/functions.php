<?php 
    include_once "connection.php";
    function oyun_kategori($baglan){
        $kategoriQuery = mysqli_query($baglan,"SELECT kategori.Kategori_Tur, COUNT(oyun.Oyun_ID) as oyun_sayisi
                                  FROM kategori, oyun
                                  WHERE kategori.Kategori_ID = oyun.Kategori_ID
                                  GROUP BY kategori.Kategori_Tur
                                  ORDER BY oyun_sayisi DESC
                                  LIMIT 11");
  
  $kategoriSayilar = "";
  $kat_oyunlar = "";

  $Kategori_Tur = "Kategori_Tur";
  $oyun_sayisi = "oyun_sayisi";

  if(mysqli_num_rows($kategoriQuery) !=0){
    while ($readKategori = mysqli_fetch_array($kategoriQuery)){
      $kat_oyunlar .= "{ value: " . $readKategori[$oyun_sayisi] . ", name: '" . $readKategori[$Kategori_Tur] . "' }, ";
    }
  }

  $kat_oyunlar = rtrim($kat_oyunlar, ', ');
  return $kat_oyunlar;
}
function firma_oyunSayi($baglan) {
    $firmaOyunQuery = mysqli_query($baglan, "SELECT dagitici.dagitici_adi, COUNT(oyun.Oyun_ID) as oyun_sayisi
                                    FROM dagitici,oyun
                                    WHERE dagitici.dagitici_ID = oyun.dagitici_ID
                                    GROUP BY dagitici.dagitici_adi
                                    ORDER BY oyun_sayisi DESC;");

    $firmalar = array();
    $oyunlar = array();

    if (mysqli_num_rows($firmaOyunQuery) != 0) {
        while ($readFirma = mysqli_fetch_array($firmaOyunQuery)) {
            $firmalar[] = $readFirma['dagitici_adi'];
            $oyunlar[] = $readFirma['oyun_sayisi'];
        }
    }

    return array('firmalar' => $firmalar, 'oyunlar' => $oyunlar);
}

function kullanici_Sayisi($baglan){
  $kullaniciSayisiQuery = mysqli_query($baglan,"SELECT COUNT(kullanici.Kullanici_ID) as kullanici_sayilari FROM kullanici");

  if (mysqli_num_rows($kullaniciSayisiQuery) != 0){
    while ($k_sayisi = mysqli_fetch_array($kullaniciSayisiQuery)){
      $kullanici_sayisi = $k_sayisi['kullanici_sayilari'];
    }
  }

  return $kullanici_sayisi;
}

function oyun_sayisi($baglan){
  $oyun_sayisiQuery = mysqli_query($baglan, "SELECT COUNT(oyun_kutuphane.Oyun_ID) as oyun_sayisi
                                            FROM oyun,kullanici,oyun_kutuphane
                                            WHERE oyun.Oyun_ID = oyun_kutuphane.Oyun_ID
                                            AND kullanici.Kullanici_ID = oyun_kutuphane.Kutuphane_ID");
  if (mysqli_num_rows($oyun_sayisiQuery) != 0){
    while ($o_sayisi = mysqli_fetch_array($oyun_sayisiQuery)){
      $oyun_sayisi = $o_sayisi['oyun_sayisi'];
    }
  }

  return $oyun_sayisi;
}



function kullanici_oyunlar($baglan,$K_ID){
    $K_OyunlarQuery = mysqli_query($baglan, "SELECT oyun.Oyun_adi 
    FROM oyun,kullanici,oyun_kutuphane
    WHERE oyun.Oyun_ID = oyun_kutuphane.Oyun_ID
    AND oyun_kutuphane.Kutuphane_ID = kullanici.Kullanici_ID
    AND kullanici.Kullanici_ID = '$K_ID' ");

    $oyunlar = array();
    if(mysqli_num_rows($K_OyunlarQuery) !=0){
      while ($K_oyun = mysqli_fetch_array($K_OyunlarQuery)){
        $oyunlar[] = $K_oyun['Oyun_adi'];
      }
    }
    return array('oyunlar' => $oyunlar);
}


function log_kayit($baglan, $K_ID, $K_IP, $Tarih, $Islem, $Cihaz, $Tarayici, $card_num, $card_tarih, $card_cvc2) {
    $stmt = mysqli_prepare($baglan, "INSERT INTO log_kayit (Kullanici_ID, K_IP, Tarih, Islem, Cihaz, Tarayici, card_num, card_tarih, CV2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt, "issssssss", $K_ID, $K_IP, $Tarih, $Islem, $Cihaz, $Tarayici, $card_num, $card_tarih, $card_cvc2);
    mysqli_stmt_execute($stmt);
}


function gelistirici_dagitici($baglan){
  $sql = "SELECT dagitici.dagitici_adi, COUNT(gelistirici.Gelistirici_ID) as gelistirici_Sayisi
    FROM dagitici,gelistirici,gelistirici_dagitici
    WHERE gelistirici_dagitici.Gelistirici_ID = gelistirici.Gelistirici_ID
    AND gelistirici_dagitici.dagitici_ID = dagitici.dagitici_ID
    GROUP BY dagitici_adi
    ORDER BY gelistirici_Sayisi DESC";

  $dagitici = array();
  $gelistirici_sayisi = array();

  $sorgu = mysqli_query($baglan,$sql);

  if (mysqli_num_rows($sorgu) != 0){
    while ($veri = mysqli_fetch_array($sorgu)){
      $dagitici[] = $veri['dagitici_adi'];
      $gelistirici_sayisi[] = $veri['gelistirici_Sayisi'];
    }
  }

  return array('dagitici' => $dagitici, 'gelistirici' => $gelistirici_sayisi);

}

function gelistirici_oyun($baglan) {
    $oyunQuery = mysqli_query($baglan, "SELECT gelistirici.Gelistirici_Ad, COUNT(oyun.Oyun_ID) as oyun_sayisi
                                        FROM oyun, gelistirici
                                        WHERE gelistirici.Gelistirici_ID = oyun.Gelistirici_ID
                                        GROUP BY gelistirici.Gelistirici_Ad
                                        ORDER BY oyun_sayisi DESC
                                        LIMIT 10;");
    $gelistirici = array();
    $oyun_sayisi = array();

    if (mysqli_num_rows($oyunQuery) != 0) {
        while ($veri = mysqli_fetch_array($oyunQuery)) {
            $ad = $veri['Gelistirici_Ad'];
            // 10 karakterden uzun isimleri kısalt
            if (strlen($ad) > 10) {
                $ad = substr($ad, 0, 9) . '.';
            }
            $gelistirici[] = $ad;
            $oyun_sayisi[] = $veri['oyun_sayisi'];
        }
    }

    return array('gelistirici' => $gelistirici, 'oyun_sayisi' => $oyun_sayisi);
}


function yuzdeler($baglan){
  $sorgu = mysqli_query($baglan, "SELECT 
                        o.Oyun_adi,
                        ROUND((COUNT(*) / (SELECT COUNT(*) FROM oyun_kutuphane)) * 100, 2) as yuzde
                        FROM oyun_kutuphane ok
                        JOIN oyun o ON ok.Oyun_ID = o.Oyun_ID
                        GROUP BY ok.Oyun_ID, o.Oyun_adi
                        ORDER BY yuzde DESC
                        LIMIT 5;");

    $toplam_yuzde = 0;
    $oyun_yuzdesi = "";

    if (mysqli_num_rows($sorgu) != 0){
      while ($yuzdeler = mysqli_fetch_array($sorgu)){
        $oyun_yuzdesi .= "{ value: " . $yuzdeler['yuzde']  .  ", name: '" . $yuzdeler['Oyun_adi'] . "' }, ";

        $toplam_yuzde += (float)$yuzdeler['yuzde'];


      }
    }
    $diger = 100 - $toplam_yuzde ;
    $oyun_yuzdesi .= "{ value: " . $diger  . ", name: '" . "Diğer" . "' }, ";

      $oyun_yuzdesi = rtrim($oyun_yuzdesi, ', ');
    return $oyun_yuzdesi;
}

function genel_sure($baglan){
  $genelSureSorgu = mysqli_query($baglan, "SELECT 
                                SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(STR_TO_DATE(cikis.Tarih, '%Y-%m-%d %H:%i:%s'), STR_TO_DATE(giris.Tarih, '%Y-%m-%d %H:%i:%s'))))) AS toplam_genel_sure
                                FROM 
                                (SELECT * FROM log_kayit WHERE Islem = 'Sisteme Giriş Yaptı') giris
                                JOIN 
                                (SELECT * FROM log_kayit WHERE Islem = 'Sistemden Çıkış Yaptı') cikis
                                ON 
                                giris.Kullanici_ID = cikis.Kullanici_ID
                                AND STR_TO_DATE(cikis.Tarih, '%Y-%m-%d %H:%i:%s') > STR_TO_DATE(giris.Tarih, '%Y-%m-%d %H:%i:%s')
                                AND STR_TO_DATE(cikis.Tarih, '%Y-%m-%d %H:%i:%s') = (
                                    SELECT MIN(STR_TO_DATE(Tarih, '%Y-%m-%d %H:%i:%s')) 
                                    FROM log_kayit 
                                    WHERE Islem = 'Sistemden Çıkış Yaptı' 
                                    AND STR_TO_DATE(Tarih, '%Y-%m-%d %H:%i:%s') > STR_TO_DATE(giris.Tarih, '%Y-%m-%d %H:%i:%s') 
                                    AND Kullanici_ID = giris.Kullanici_ID
                                );
                            ");
    if (mysqli_num_rows($genelSureSorgu) > 0) {
        $deger = mysqli_fetch_assoc($genelSureSorgu);
        $genel_sure = $deger['toplam_genel_sure'];

        // Zamanı 'Saat Dakika' formatına dönüştürme
        list($saat, $dakika, $saniye) = explode(':', $genel_sure);
        $toplam_sure = $saat . " Saat " .  $dakika . " Dakika";
    } else {
        echo "Kayıt bulunamadı.";
    }

    return $toplam_sure;
}


function erkek_Sayisi($baglan){
  $erkek_sorgu = mysqli_query($baglan, "SELECT COUNT(kullanici.Kullanici_ID) as erkek_sayisi FROM kullanici
                              WHERE kullanici.Cinsiyet_ID = 1;");
  if (mysqli_num_rows($erkek_sorgu) != 0){
    $sayi = mysqli_fetch_assoc($erkek_sorgu);
    $erkek_sayisi = $sayi['erkek_sayisi'];
  }
  return $erkek_sayisi;
}
function kadin_Sayisi($baglan){
  $erkek_sorgu = mysqli_query($baglan, "SELECT COUNT(kullanici.Kullanici_ID) as kadin_sayisi FROM kullanici
                              WHERE kullanici.Cinsiyet_ID = 2;");
  if (mysqli_num_rows($erkek_sorgu) != 0){
    $sayi = mysqli_fetch_assoc($erkek_sorgu);
    $kadin_sayisi = $sayi['kadin_sayisi'];
  }
  return $kadin_sayisi;
}

function giris_sayisi($baglan){
  $giris_sorgu = mysqli_query($baglan,"SELECT COUNT(log_kayit.Log_ID) as giris_sayisi
                              FROM log_kayit
                              WHERE log_kayit.Islem = 'Sisteme Giriş Yaptı';");
      if (mysqli_num_rows($giris_sorgu) != 0){
        $giris = mysqli_fetch_assoc($giris_sorgu);
        $giris_sayisi = $giris['giris_sayisi'];
      }

      return $giris_sayisi;
}


function islemler($baglan){
  $islem_sayisi = mysqli_query($baglan,"SELECT
                                DATE(Tarih) AS Tarih,
                                COUNT(CASE WHEN islem LIKE '%Giriş Yaptı%' THEN 1 END) AS GirisYapti,
                                COUNT(CASE WHEN islem LIKE '%Çıkış Yaptı%' THEN 1 END) AS CikisYapti,
                                COUNT(CASE WHEN islem LIKE '%Satın aldı%' THEN 1 END) AS SatinAldi,
                                COUNT(CASE WHEN islem LIKE '%Bilgilerini Güncelledi%' THEN 1 WHEN islem LIKE '%Sildi%' THEN 1 END) AS BilgileriniGuncelledi,
                                COUNT(CASE WHEN islem LIKE '%Şirketler Sayfasını Ziyaret Etti%' THEN 1 END) AS SirketlerSayfasiniZiyaretEtti,
                                COUNT(CASE WHEN islem LIKE '%Geliştiriciler Sayfasını Ziyaret Etti%' THEN 1 END) AS GelisitiricilerSayfasiniZiyaretEtti,
                                COUNT(CASE WHEN islem LIKE '%Oyunlar Sayfasını Ziyaret Etti%' THEN 1 END) AS OyunlarSayfasiniZiyaretEtti,
                                COUNT(CASE WHEN islem LIKE '%Anasayfayı Ziyaret Etti%' THEN 1 END) AS AnasayfayiZiyaretEtti
                              FROM
                                log_kayit
                              WHERE
                                Tarih >= CURRENT_DATE - INTERVAL 6 DAY
                              GROUP BY
                                DATE(Tarih)
                              ORDER BY
                                DATE(Tarih);
                              ");
    $tarihler = array();
    $giris_sayisi = array();
    $cikis_sayisi = array();
    $satin_alim = array();
    $guncelleme = array();
    $sirketler = array();
    $gelistiriciler = array();
    $oyunlar = array();
    $anasayfalar = array();
    

    if (mysqli_num_rows($islem_sayisi) != 0){
      while ($okuma = mysqli_fetch_array($islem_sayisi)){
        $tarihler[] = $okuma['Tarih'];
        $giris_sayisi[] = $okuma['GirisYapti'];
        $cikis_sayisi[] = $okuma['CikisYapti'];
        $satin_alim[] = $okuma['SatinAldi'];
        $guncelleme[] = $okuma['BilgileriniGuncelledi'];
        $sirketler[] = $okuma['SirketlerSayfasiniZiyaretEtti'];
        $gelistiriciler[] = $okuma['GelisitiricilerSayfasiniZiyaretEtti'];
        $oyunlar[] = $okuma['OyunlarSayfasiniZiyaretEtti'];
        $anasayfalar[] = $okuma['AnasayfayiZiyaretEtti'];
      }
    }

    

    return array("tarihler" => $tarihler, "giris_sayisi" => $giris_sayisi, "cikis_sayisi" => $cikis_sayisi, "satin_alim" => $satin_alim, "guncelleme" =>$guncelleme,
    "sirketler" => $sirketler, "gelistiriciler" => $gelistiriciler,"oyunlar" => $oyunlar, "anasayfalar" => $anasayfalar);
}


function tarayicilar($baglan){
  $tarayiciSayisi = mysqli_query($baglan,"SELECT log_kayit.Tarayici, COUNT(log_kayit.Log_ID) as sayi
                                FROM log_kayit
                                WHERE log_kayit.Islem LIKE '%Giriş Yaptı%'
                                GROUP BY log_kayit.Tarayici;");

              $tarayici_giris = "";
              if (mysqli_num_rows($tarayiciSayisi) != 0){
                while ($okuma = mysqli_fetch_array($tarayiciSayisi)){
                  $tarayici_giris .= "{ value: " . $okuma['sayi']  .  ", name: '" . $okuma['Tarayici'] . "' }, ";
                }
              }

              $tarayici_giris = rtrim($tarayici_giris, ', ');
              return $tarayici_giris;
}
function cihazlar($baglan){
  $CihazSayisi = mysqli_query($baglan,"SELECT log_kayit.Cihaz, COUNT(log_kayit.Log_ID) as sayi
                                FROM log_kayit
                                WHERE log_kayit.Islem LIKE '%Giriş Yaptı%'
                                GROUP BY log_kayit.Cihaz;");

              $cihaz_giris = "";
              if (mysqli_num_rows($CihazSayisi) != 0){
                while ($okuma = mysqli_fetch_array($CihazSayisi)){
                  $cihaz_giris .= "{ value: " . $okuma['sayi']  .  ", name: '" . $okuma['Cihaz'] . "' }, ";
                }
              }

              $cihaz_giris = rtrim($cihaz_giris, ', ');
              return $cihaz_giris;
}






    

?>