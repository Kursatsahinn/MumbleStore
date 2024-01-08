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
    $K_Tip = $_SESSION["k_tip"];
   $data = gelistirici_oyun($baglan);

  
   if(!isset($_SESSION['Kullanici_ID'])){
    header('Location: login.php');
   }

  $K_AdiQuery = mysqli_query($baglan,"SELECT K_Adi FROM kullanici WHERE Kullanici_ID = '$K_ID'");

  $K_Adi = mysqli_fetch_array($K_AdiQuery);

  $Kullanici_Adi = $K_Adi['K_Adi'];

  $K_IP = $_SERVER['REMOTE_ADDR'];
	$Tarih = date('Y-m-d H:i:s');
	$Islem = "Geliştiriciler Sayfasını Ziyaret Etti";
	$card_num = null;
	$card_tarih = null;
	$card_cvc2 = null;
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

  log_kayit($baglan,$K_ID,$K_IP,$Tarih,$Islem,$Cihaz,$Tarayici,$card_num,$card_tarih,$card_cvc2);



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
            background-color: green;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .purchaseButton:hover {
            background-color: limegreen;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .oyun-logo {
        width: 100%; /* Hücrenin genişliğine göre otomatik ayarlar */
        height: auto; /* Yükseklik orantılı olarak ayarlanır */
        max-width: 150px; /* Maksimum genişlik sınırı */
        max-height: 150px; /* Maksimum yükseklik sınırı */
        transition: transform 0.3s ease;
      }
      .oyun-logo:hover{
        transform: scale(3.3);
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
              <span><?php echo $hos_geldin; ?></span>
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
                    <div class="x_panel" style="background-color:#C9B6E4">
                      <div class="x_title">
                        <h2 style="color:black;">GELİŞTİRİCİLER</h2>
                        <div class="clearfix"></div>
                      </div>
                      <div class="x_content">

                        <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap"
                          cellspacing="0" width="100%">
                          <thead>
                            <tr>
                              <th style="text-align:center; vertical-align:middle">Şirket Adı</th>
                              <th style="text-align:center; vertical-align:middle">E-Posta</th>
                              <th style="text-align:center; vertical-align:middle">Değer</th>
                              <th style="text-align:center; vertical-align:middle">Kuruluş Tarihi</th>
                              <?php if ($K_Tip == 2) {
                                echo '<th style="text-align:center; vertical-align:middle">Düzenle/Sil</th>';
                              } ?>
                            </tr>
                          </thead>
                          <tbody>
                          <?php
                          $buttonStyle= "";
                              $gelistiriciQuery = mysqli_query($baglan,"SELECT * FROM gelistirici ORDER BY deger DESC;");
                                if (mysqli_num_rows($gelistiriciQuery)!=0){
                                  while($readGelistirici = mysqli_fetch_array($gelistiriciQuery)){
                                    $gelistirici_ID = $readGelistirici['Gelistirici_ID'];
                                    $gelistirici_adi = $readGelistirici['Gelistirici_Ad'];
                                    $e_posta = $readGelistirici['e_posta'];
                                    $deger = $readGelistirici['deger'];
                                    $tarih = $readGelistirici['tarih'];

                                    $deger_donusum = floatval($deger);
                                    $deger_sonhal = number_format($deger_donusum,0,'.','.');

                                    

                          ?>
                            <tr style="text-align:left;">
                              <td style="text-align:center; vertical-align:middle"><?php echo $gelistirici_adi ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $e_posta?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $deger_sonhal . '$' ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $tarih ?></td>
                              <?php if ($K_Tip == 2){
                                echo "<td style=\"text-align:center; vertical-align:middle\">
                                          <a href='gelistiriciGuncelleme.php?&gelistirici_ID={$gelistirici_ID}' style='width:100px; font-size:12px;' class='btn btn-primary btn-xs'><i class='fa fa-search'></i> Düzenle </a>
                                          <a href='gelistiriciSil.php?&gelistirici_ID={$gelistirici_ID}' style='width:100px; font-size:12px;' class='btn btn-danger btn-xs'><i class='fa fa-pencil'></i> Sil </a>
                                      </td>";
                              } ?>
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
                <br>
                <div class="row" >
                  <div class="col-md-12 col-sm-12 ">
                    <div class="dashboard_graph" style="background-color:#F0ECE5">

                      <div class="row x_title">
                        <div class="col-md-6">
                          <h3 style="color:black">Geliştirici Oyun Sayısı</h3>
                        </div>
                      </div>

                      <div class="col-md-12 col-sm-12 ">
                        <div id="grafik1" class="demo-placeholder"></div>
                      </div>

                      <div class="clearfix"></div>
                    </div>
                  </div>

                </div>
                <br>
                <br>
                




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

<!-- Pasta Grafiği -->





<!-- Firma oyun sayısı -->


<!-- Oyuncu Sayısı Grafiği -->  
  <script type="text/javascript">
    var dom = document.getElementById('grafik1');
    var firmalar = [<?php echo "'" . implode("','", $data['gelistirici']) . "'"; ?>];
    var oyunlar = [<?php echo implode(",", $data['oyun_sayisi']); ?>];
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
      tooltip: {
    trigger: 'axis',  // "item" da kullanılabilir, farklı davranışlar için
    axisPointer: {
      type: 'cross'  // İmleç tipi, 'line', 'shadow', 'none' da olabilir
    },
    formatter: function (params) {
      return params[0].name + ': ' + params[0].value;
    }
  },
  xAxis: {
    type: 'category',
    data: firmalar,
    axisLabel:{
      color:'black'
    }
  },
  yAxis: {
    type: 'value',
    axisLabel: {
      color:'black'
    }
  },
  series: [
    {
      data: oyunlar,
      type: 'line'
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