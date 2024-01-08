<?php
  require "sidebar.php";
  require "footer.php";
  require "navbar.php";
  require "settings.php";
  require "functions.php";
  include_once "connection.php";

  session_start();
  ob_start();


  $K_ID = $_SESSION['Kullanici_ID'];
  $K_Tip = $_SESSION['k_tip'];
    $K_AdiQuery = mysqli_query($baglan,"SELECT K_Adi FROM kullanici WHERE Kullanici_ID = '$K_ID'");

  $K_Adi = mysqli_fetch_array($K_AdiQuery);

  $Kullanici_Adi = $K_Adi['K_Adi'];
   $data = firma_oyunSayi($baglan);
   $tarayici = tarayicilar($baglan);
   $cihaz = cihazlar($baglan);
  
   if(!isset($_SESSION['Kullanici_ID'])){
    header('Location: login.php');
   }

   if ($K_Tip == 1){
    header('Location:index.php');
   }

   $veri = islemler($baglan);



  




?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title><?php echo $title; ?></title>
  <link rel="icon" href="images/mumble.ico" type="image/ico" />

  <!-- Bootstrap -->
  <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
  <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
  <!-- Datatables -->

  <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
  <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="../build/css/custom.min.css" rel="stylesheet">

  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
        .swal-content__input {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .purchaseButton {
            background-color: red;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .purchaseButton:hover {
            background-color: red;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .oyun-logo {
        width: 100%; /* Hücrenin genişliğine göre otomatik ayarlar */
        height: auto; /* Yükseklik orantılı olarak ayarlanır */
        max-width: 150px; /* Maksimum genişlik sınırı */
        max-height: 150px; /* Maksimum yükseklik sınırı */
        transition: transform 0.3s ease;
      }
      

      body{
        max-height: 100vh;
      }
      

    </style>
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container" style="background-color:#161A30;">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view" style="background-color:#161A30;">
          <div class="navbar nav_title" style="border: 0; background-color: #161A30" >
              <a href="index.php" class="site_title"><i class="fa fa-gamepad"></i> <span><?php echo $title  ?></span></a>
            </div>
          <div class="clearfix"></div>

          <!-- menu profile quick info -->
          <div class="profile clearfix">
            <div class="profile_pic">
              <img src="images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
              <span><?php  echo $hos_geldin; ?></span>
              <h2><?php echo $Kullanici_Adi ?></h2>
            </div>
          </div>
          <!-- /menu profile quick info -->

          <br />

          <!-- sidebar menu -->
          <?php sidebar($K_Tip); ?>
          <!-- /sidebar menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small" style="display:flex; justify-content:center;align-items:center; background-color:#31304D">
              <a data-toggle="tooltip" data-placement="top" title="Settings" href="bilgiGuncelle.php" style="width:50%; background-color:#31304D">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="logout.php" style="width:50%; background-color:#31304D">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
          <!-- /menu footer buttons -->
        </div>
      </div>

      <!-- top navigation -->
      <?php navbar(); ?>
      <!-- /top navigation -->

      <!-- page content -->
              <div class="right_col" role="main"  >
                <div class="row">
                  <div class="col-md-12 col-sm-12 ">
                    <div class="x_panel"style="background-color:#C9B6E4">
                      <div class="x_title"> 
                        <h2 style="color:black;">KULLANICILAR</h2>
                        <div class="clearfix"></div>
                      </div>
                      <div class="x_content">

                        <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap"
                          cellspacing="0" width="100%">
                          <thead>
                            <tr>
                              <th style="text-align:center; vertical-align:middle">ID</th>
                              <th style="text-align:center; vertical-align:middle">İsim</th>
                              <th style="text-align:center; vertical-align:middle">Soyisim</th>
                              <th style="text-align:center; vertical-align:middle">Cinsiyet</th>
                              <th style="text-align:center; vertical-align:middle">E-Posta</th>
                              <th style="text-align:center; vertical-align:middle">Kullanıcı Adı</th>
                              <th style="text-align:center; vertical-align:middle">Kullanıcı Tipi</th>
                              <th style="text-align:center; vertical-align:middle">Kayıt Tarihi</th>
                              <th style="text-align:center; vertical-align:middle">İşlemler</th>
                            </tr>
                          </thead>
                          <tbody>
                          <?php
                          $buttonStyle= "";
                              $kullanicilar = mysqli_query($baglan,"SELECT kullanici.Kullanici_ID, kullanici.Kullanici_adi, kullanici.Kullanici_Soyadi, cinsiyet.Cinsiyet_adi, kullanici.Kullanici_eposta,kullanici.K_Adi, kullanici_tipi.k_tip_adi, kullanici.k_tarih
                                FROM kullanici,cinsiyet,kullanici_tipi
                                WHERE kullanici_tipi.k_tip = kullanici.k_tip 
                                AND kullanici.Cinsiyet_ID = cinsiyet.Cinsiyet_ID");

                                if (mysqli_num_rows($kullanicilar) != 0){
                                  while ($kullaniciOku = mysqli_fetch_array($kullanicilar)){
                                    $Kullanici_ID = $kullaniciOku['Kullanici_ID'];
                                    $Kullanici_Adi = $kullaniciOku['Kullanici_adi'];
                                    $Kullanici_Soyadi = $kullaniciOku['Kullanici_Soyadi'];
                                    $Cinsiyet = $kullaniciOku['Cinsiyet_adi'];
                                    $E_Posta = $kullaniciOku['Kullanici_eposta'];
                                    $K_Adi = $kullaniciOku['K_Adi'];
                                    $K_Tipi = $kullaniciOku['k_tip_adi'];
                                    $K_Tarih = $kullaniciOku['k_tarih'];

                                    

                          ?>
                            <tr style="text-align:left;">
                              <td style="text-align:center; vertical-align:middle"><?php echo $Kullanici_ID ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $Kullanici_Adi ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $Kullanici_Soyadi ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $Cinsiyet ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $E_Posta ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $K_Adi ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $K_Tipi ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $K_Tarih ?></td>
                              <td style="text-align:center; vertical-align:middle"><a href='kullaniciGuncelleme.php?&user_ID=<?php echo $Kullanici_ID; ?>' style='width:100px; font-size:12px; ' class='btn btn-primary btn-xs'><i class='fa fa-search'></i> Düzenle </a>
                              <a href='kullanici_sil.php?&K_ID=<?php echo $Kullanici_ID; ?>' style='width:100px; font-size:12px;' class='btn btn-danger btn-xs'><i class='fa fa-pencil'></i> Sil </a></td>
                                                
                            </tr>
                            <?php
                                  }
                                }
                            ?>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <br>
              <div class="row">
                <div class="col-md-12 col-sm-12 ">
                <div class="x_panel" style="background-color:#C9B6E4">
                  <div class="x_title">
                    <h2 style="color:black">LOG KAYITLARI</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="row">
                      <div class="col-sm-12">
                        <div class="card-box table-responsive">
                          <table id="datatable-buttons" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                              <tr>
                                <th style="text-align:center; vertical-align:middle">Kullanici Adi</th>
                                <th style="text-align:center; vertical-align:middle">IP Adresi</th>
                                <th style="text-align:center; vertical-align:middle">Tarih</th>
                                <th style="text-align:center; vertical-align:middle">İşlem</th>
                                <th style="text-align:center; vertical-align:middle">Cihaz</th>
                                <th style="text-align:center; vertical-align:middle">Tarayıcı</th>
                                <th style="text-align:center; vertical-align:middle">Kart Numarası</th>
                                <th style="text-align:center; vertical-align:middle">Kart Tarihi</th>
                                <th style="text-align:center; vertical-align:middle">CV2</th>
                              </tr>
                            </thead>
                            <tbody>
                              <?php 
                                $loglar = mysqli_query($baglan,"SELECT kullanici.K_Adi, log_kayit.K_IP, log_kayit.Tarih,log_kayit.Islem, log_kayit.Cihaz,log_kayit.Tarayici,log_kayit.card_num,log_kayit.card_tarih,log_kayit.CV2
                                                        FROM kullanici,log_kayit
                                                        WHERE log_kayit.Kullanici_ID = kullanici.Kullanici_ID
                                                        ORDER BY log_kayit.Tarih DESC;");
                                  if (mysqli_num_rows($loglar) != 0){
                                    while ($logOku = mysqli_fetch_array($loglar)){
                                      $K_Adi = $logOku['K_Adi'];
                                      $K_IP = $logOku['K_IP'];
                                      $Tarih = $logOku['Tarih'];
                                      $Islem = $logOku['Islem'];
                                      $Cihaz = $logOku['Cihaz'];
                                      $Tarayici = $logOku['Tarayici'];
                                      $kart_num = $logOku['card_num'];
                                      $kart_tarih = $logOku['card_tarih'];
                                      $CV2 = $logOku['CV2'];
                                  
                              ?>
                                <tr>
                                <td style="text-align:center; vertical-align:middle"><?php echo $K_Adi ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $K_IP ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $Tarih ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $Islem ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $Cihaz ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $Tarayici ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $kart_num ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $kart_tarih ?></td>
                                <td style="text-align:center; vertical-align:middle"><?php echo $CV2 ?></td>
                              </tr>
                              <?php 
                                  }
                                }
                              ?>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="dashboard_graph" style="background-color:#F0ECE5">

                  <div class="row x_title">
                    <div class="col-md-6" style="color:black">
                      <h3>Günlere Göre Yapılan İşlemler</h3>
                    </div>
                  </div>

                      <div class="col-md-12 col-sm-12 ">
                        <div id="log_grafik" class="demo-placeholder"></div>
                      </div>

                      <div class="clearfix"></div>
                </div>
              </div>
            </div>
            <br>
            <br>
            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="dashboard_graph" style="background-color:#F0ECE5">

                  <div class="row x_title">
                    <div class="col-md-6" style="color:black">
                      <h3>Giriş Yapılan Tarayıcı ve Cihazlar</h3>
                    </div>
                  </div>

                      <div class="col-md-6 col-sm-6 ">
                        <div id="tarayicilar" class="demo-placeholder"></div>
                      </div>
                      <div class="col-md-6 col-sm-6 ">
                        <div id="cihazlar" class="demo-placeholder"></div>
                      </div>

                      <div class="clearfix"></div>
                </div>
              </div>
            </div>

                





            </div>
      <!-- /page content -->

      <!-- footer content -->
      <?php footer() ?>
      <!-- /footer content -->
    </div>
  </div>

  <!-- jQuery -->
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- FastClick -->
  <script src="../vendors/fastclick/lib/fastclick.js"></script>
  <!-- NProgress -->
  <script src="../vendors/nprogress/nprogress.js"></script>
  <!-- iCheck -->
  <script src="../vendors/iCheck/icheck.min.js"></script>
  <!-- Datatables -->
  <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
  <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
  <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
  <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
  <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
  <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
  <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
  <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
  <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
  <script src="../vendors/jszip/dist/jszip.min.js"></script>
  <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
  <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

  <!-- Custom Theme Scripts -->
  <script src="../build/js/custom.min.js"></script>
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>







   <script type="text/javascript">
    var dom = document.getElementById('log_grafik');
    var tarihler = [<?php echo "'" . implode("','", $veri['tarihler']) . "'"; ?>];
    var giris_sayisi = [<?php echo "'" . implode("','", $veri['giris_sayisi']) . "'"; ?>];
    var cikis_sayisi = [<?php echo "'" . implode("','", $veri['cikis_sayisi']) . "'"; ?>];
    var satin_alim = [<?php echo "'" . implode("','", $veri['satin_alim']) . "'"; ?>];
    var guncelleme = [<?php echo "'" . implode("','", $veri['guncelleme']) . "'"; ?>];
    var sirketler = [<?php echo "'" . implode("','", $veri['sirketler']) . "'"; ?>];
    var gelistirciler = [<?php echo "'" . implode("','", $veri['gelistiriciler']) . "'"; ?>];
    var oyunlar = [<?php echo "'" . implode("','", $veri['oyunlar']) . "'"; ?>];
    var anasayfa = [<?php echo "'" . implode("','", $veri['anasayfalar']) . "'"; ?>];

    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  title: {
    text: 'İşlem Türleri'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['Giriş', 'Çıkış', 'Satın Alım', 'Güncelleme', 'Şirketler Sayfası','Geliştiriciler Sayfası','Oyunlar Sayfası','Anasayfa']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: tarihler
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: 'Giriş',
      type: 'line',
      stack: 'Total',
      data: giris_sayisi
    },
    {
      name: 'Çıkış',
      type: 'line',
      stack: 'Total',
      data: cikis_sayisi
    },
    {
      name: 'Satın Alım',
      type: 'line',
      stack: 'Total',
      data: satin_alim
    },
    {
      name: 'Güncelleme/Silme',
      type: 'line',
      stack: 'Total',
      data: guncelleme
    },
    {
      name: 'Şirketler Sayfası',
      type: 'line',
      stack: 'Total',
      data: sirketler
    },
    {
      name: 'Geliştiriciler Sayfası',
      type: 'line',
      stack: 'Total',
      data: gelistirciler
    },
    {
      name: 'Oyunlar Sayfası',
      type: 'line',
      stack: 'Total',
      data: oyunlar
    },
    {
      name: 'Anasayfa',
      type: 'line',
      stack: 'Total',
      data: anasayfa
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>

<script type="text/javascript">
    var dom = document.getElementById('tarayicilar');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  title: {
    text: 'Tarayıcı Giriş Sayısı',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: 'Giriş Sayısı',
      type: 'pie',
      radius: '50%',
      data: [
        <?php echo $tarayici; ?>
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
<script type="text/javascript">
    var dom = document.getElementById('cihazlar');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  title: {
    text: 'Cihaz Giriş Sayısı',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: 'Giriş Sayısı',
      type: 'pie',
      radius: '50%',
      data: [
        <?php echo $cihaz; ?>
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
  







</body>

</html>