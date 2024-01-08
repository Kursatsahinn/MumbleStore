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

  

  $K_AdiQuery = mysqli_query($baglan,"SELECT Kullanici_Adi FROM kullanici WHERE Kullanici_ID = '$K_ID'");

  $K_Adi = mysqli_fetch_array($K_AdiQuery);

  $Kullanici_Adi = $K_Adi['Kullanici_Adi'];

  $oyunlar = kullanici_oyunlar($baglan,$K_ID);

  function getPastFiveDays() {
    $dates = [];
    for ($i = 4; $i >= 0; $i--) {
        // Her günü 'Y-m-d' formatında ekleyin
        $dates[] = date('Y-m-d', strtotime("-$i days"));
    }
    return $dates;
}

// Fonksiyonu çağır ve sonuçları yazdır
$pastFiveDays = getPastFiveDays();

function generateRandomNumbers() {
    $numbers = [];
    for ($i = 0; $i < 5; $i++) {
        // 200 ile 700 arasında rastgele bir sayı üret ve listeye ekle
        $numbers[] = rand(200, 700);
    }
    return $numbers;
}

// 5 adet rastgele sayı üret
$sayilar = generateRandomNumbers();

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

    </style>
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
          </div>
          <div class="clearfix"></div>

          <!-- menu profile quick info -->
          <div class="profile clearfix">
            <div class="profile_pic">
              <img src="images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
              <span>Welcome,</span>
              <h2><?php echo $Kullanici_Adi ?></h2>
            </div>
          </div>
          <!-- /menu profile quick info -->

          <br />

          <!-- sidebar menu -->
          <?php sidebar(); ?>
          <!-- /sidebar menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
              <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
              <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
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
                    <div class="x_panel">
                      <div class="x_title">
                        <h2 style="color:black;">OYUNLAR</h2>
                        <div class="clearfix"></div>
                      </div>
                      <div class="x_content">

                        <table class="table table-striped jambo_table bulk_action" id="dinamik">

                          <thead>
                            <tr>
                              <th>Logo</th>
                              <th>Oyun Adı</th>
                              <th>Geliştirici</th>
                              <th>Satıcı Şirket</th>
                              <th>Kategori</th>
                              <th>Fiyat</th>
                              <th>Çıkış Tarihi</th>
                              <th>Satın Alma</th>
                            </tr>
                          </thead>
                          <tbody>
                          <?php
                          $buttonStyle= "";
                              $oyunlarQuery = mysqli_query($baglan,"SELECT oyun.Oyun_ID ,oyun.Oyun_adi, gelistirici.Gelistirici_Ad, dagitici.dagitici_adi,kategori.Kategori_Tur,oyun.Oyun_fiyati,oyun.cikis_tarihi
                                                          FROM oyun,dagitici,kategori,gelistirici
                                                          WHERE dagitici.dagitici_ID = oyun.dagitici_ID
                                                          AND gelistirici.Gelistirici_ID = oyun.Gelistirici_ID
                                                          AND kategori.Kategori_ID = oyun.Kategori_ID
                                                          ORDER BY oyun.Oyun_ID ASC");
                                if (mysqli_num_rows($oyunlarQuery)!=0){
                                  while($readOyunlar = mysqli_fetch_array($oyunlarQuery)){
                                    $oyun_ID = $readOyunlar['Oyun_ID'];
                                    $oyun_adi = $readOyunlar['Oyun_adi'];
                                    $gelistirici = $readOyunlar['Gelistirici_Ad'];
                                    $dagitici = $readOyunlar['dagitici_adi'];
                                    $kategori = $readOyunlar['Kategori_Tur'];
                                    $fiyat = $readOyunlar['Oyun_fiyati'];
                                    $oyun_tarih = $readOyunlar['cikis_tarihi'];

                                    $var_mi = in_array($oyun_adi,$oyunlar['oyunlar']);

                                    if ($var_mi){
                                      $buttonStyle = "visibility: hidden;";
                                    }
                                    else{
                                      $buttonStyle = "";
                                    }

                          ?>
                            <tr style="text-align:left;">
                              <td><img src="Resimler/<?php echo $oyun_adi ?>.png" alt="Oyun Logosu" class="oyun-logo" loading="lazy"></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $oyun_adi ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $gelistirici ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $dagitici ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $kategori ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $fiyat . "$" ?></td>
                              <td style="text-align:center; vertical-align:middle"><?php echo $oyun_tarih ?></td>
                              <td style="text-align: center;"><a href='satin_alim.php?oyun_ID=<?php echo $oyun_ID; ?>&user_ID=<?php echo $K_ID; ?>' style='width:100px; font-size:12px; background:green; border-color:green; <?php echo $buttonStyle; ?> ' class='btn btn-primary btn-xs'><i class='fa fa-shopping-cart'></i> Satın Al</a></td>

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

                <div class="row">
                  <div class="col-md-12 col-sm-12 ">
                    <div class="dashboard_graph">

                      <div class="row x_title">
                        <div class="col-md-6">
                          <h3>Network Activities <small>Graph title sub-title</small></h3>
                        </div>
                        <div class="col-md-6">
                          <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                            <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                          </div>
                        </div>
                      </div>

                      <div class="col-md-12 col-sm-12 ">
                        <div id="deneme1" class="demo-placeholder"></div>
                      </div>

                      <div class="clearfix"></div>
                    </div>
                  </div>

                </div>


              </div>
      <!-- /page content -->

      <!-- footer content -->
      <footer>
        <div class="pull-right">
          Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
        </div>
        <div class="clearfix"></div>
      </footer>
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
<script type="text/javascript">
    var dom = document.getElementById('deneme1');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};

    var option;

    option = {
  tooltip: {
    trigger: 'item'
  },
  legend: {
    top: '5%',
    left: 'center'
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 10,
        borderColor: '#fff',
        borderWidth: 2
      },
      label: {
        show: false,
        position: 'center'
      },
      emphasis: {
        label: {
          show: true,
          fontSize: 40,
          fontWeight: 'bold'
        }
      },
      labelLine: {
        show: false
      },
      data: [
        <?php echo oyun_kategori($baglan) ?>
      ]
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>



<!-- Firma oyun sayısı -->
<script type="text/javascript">
  var firmalar = [<?php echo "'" . implode("','", $data['firmalar']) . "'"; ?>];
  var oyunlar = [<?php echo implode(",", $data['oyunlar']); ?>];

  var dom = document.getElementById('deneme2');
  var myChart = echarts.init(dom, null, {
    renderer: 'canvas',
    useDirtyRect: false
  });

  var option = {
    xAxis: {
      type: 'category',
      data: firmalar
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        data: oyunlar,
        type: 'bar'
      }
    ]
  };

  if (option && typeof option === 'object') {
    myChart.setOption(option);
  }

  window.addEventListener('resize', myChart.resize);
</script>

<!-- Oyuncu Sayısı Grafiği -->
<script type="text/javascript">
    var dom = document.getElementById('oyuncu_sayisi');
        var tarihler = [<?php echo "'" . implode("','", $pastFiveDays) . "'"; ?>];
    var sayilar = [<?php echo "'" . implode("','", $sayilar) . "'"; ?>];
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};

    var option;

    option = {
      xAxis: {
        type: 'category',
        data: tarihler
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: sayilar,
          type: 'line',
          smooth: true
        }
      ]
    };

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
  
    <script type="text/javascript">
    var dom = document.getElementById('grafik2');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};
    
    var option;

    option = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow'
    }
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: [
    {
      type: 'category',
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      axisTick: {
        alignWithLabel: true
      }
    }
  ],
  yAxis: [
    {
      type: 'value'
    }
  ],
  series: [
    {
      name: 'Direct',
      type: 'bar',
      barWidth: '60%',
      data: [10, 52, 200, 334, 390, 330, 220]
    }
  ]
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }

    window.addEventListener('resize', myChart.resize);
  </script>
  
  	<script>

	$(document).ready( function () {
    $('#dinamik').DataTable();
} );

  </script>


</body>

</html>