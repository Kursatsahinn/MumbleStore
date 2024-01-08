<?php 
  require "sidebar.php";
  require "navbar.php";
  require "settings.php";
  require "footer.php";
  require "functions.php";
  include_once "connection.php";
  session_start();
  ob_start();



  if (!isset($_SESSION["Kullanici_ID"])){
    header('Location:login.php');
    exit;
  }
  $K_ID = $_SESSION["Kullanici_ID"];
  $K_Tip = $_SESSION["k_tip"];
  $data = firma_oyunSayi($baglan);

  $K_AdiQuery = mysqli_query($baglan,"SELECT K_Adi FROM kullanici WHERE Kullanici_ID = '$K_ID'");

  $K_Adi = mysqli_fetch_array($K_AdiQuery);

  $Kullanici_Adi = $K_Adi['K_Adi'];

  $K_IP = $_SERVER['REMOTE_ADDR'];
	$Tarih = date('Y-m-d H:i:s');
	$Islem = "Anasayfayı Ziyaret Etti";
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


  ob_end_flush();
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/mumble.ico" type="image/ico" />

    <title><?php echo $title; ?></title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- SlideShow -->
    <link rel="stylesheet" href="css/slider.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
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
                <h2><?php echo $Kullanici_Adi; ?></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <?php 
                sidebar($K_Tip);
            ?>
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
          <?php 
            navbar();
          ?>
        <!-- /top navigation -->

        

        <!-- page content -->
        <div class="right_col" role="main" style="background-color:#f7f7f7">
          <!-- top tiles -->
          <?php 
            if($K_Tip == 2){
              echo '<div class="tile_count">
            <div class="col-md-2 col-sm-4 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>Toplam Kullanıcı</span>
              <div class="count" >'. kullanici_Sayisi($baglan) .'</div>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i>Geçirilen Süre</span>
              <div class="count" style="font-size:19px">'. genel_sure($baglan) .'</div>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>Toplam Erkek Kullanıcı</span>
              <div class="count">'. erkek_Sayisi($baglan).'</div>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>Toplam Kadın Kullanıcı</span>
              <div class="count">'. kadin_Sayisi($baglan).'</div>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-gamepad"></i>Satılan Oyun</span>
              <div class="count">'. oyun_sayisi($baglan).'</div>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>Toplam Giriş</span>
              <div class="count">'.giris_sayisi($baglan).'</div>
            </div>
          </div>';
            }
          ?>
          <div class="row" style="display: inline-block;" >
          
        </div>
          <!-- /top tiles -->
          

          <!-- Slider -->
          <div class="row">
            <div class="col-md-12 col-sm-12 ">
              <div class="dashboard_graph" style="background-color:#f7f7f7"> 

                <!-- Slideshow -->
                <div class="slideshow-container">

                  <!-- Resimler ve Sol üst sayaç -->
                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Baldur's Gate 3.png" style="width:100%">
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/ELDEN RING.png" style="width:100%">
                  </div>  

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Stray.png" style="width:100%">
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Starfield.png" style="width:100%">
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Risk Of Rain 2.png" style="width:100%">
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Sons Of the Forest.png" style="width:100%">   
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Need For Speed Unbound.png" style="width: 100%;"">
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Resident Evil 4.png" style="width:100%">
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Sekiro.png" style="width:100%">
                  </div>

                  <div class="mySlides">
                      <div class="numbertext"></div>
                      <img src="Resimler/Atomic Heart.png" style="width:100%">
                  </div>

                  <!-- ileri geri butonları -->
                  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                  <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>
                <br>

                  <!-- Noktalar -->
                <div style="text-align:center">
                  <span class="dot" onclick="currentSlide(1)"></span>
                  <span class="dot" onclick="currentSlide(2)"></span>
                  <span class="dot" onclick="currentSlide(3)"></span>
                  <span class="dot" onclick="currentSlide(4)"></span>
                  <span class="dot" onclick="currentSlide(5)"></span>
                  <span class="dot" onclick="currentSlide(6)"></span>
                  <span class="dot" onclick="currentSlide(7)"></span>
                  <span class="dot" onclick="currentSlide(8)"></span>
                  <span class="dot" onclick="currentSlide(9)"></span>
                  <span class="dot" onclick="currentSlide(10)"></span>
                </div>

                <script src="js/script.js"> </script>

                <div class="clearfix"></div>

              </div>
            </div>              
          </div>
          <br/>

          <!-- Oyun Haberleri -->
          <div class="row"> 
            <div class="col-md-6 col-sm-4 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="color:black">Güncel Oyun Haberleri</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">

                    <ul class="list-unstyled timeline widget">
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a><b>Insomniac Games'ten hacklenme&nbsp;sonrası ilk açıklama geldi</b></a>
                                          </h2>
                            <div class="byline">
                              <span>3 Saat Önce</span>  <a>Kürşat Şahin</a> tarafından
                            </div>
                            <p class="excerpt">Popüler Spider-Man serisinin arkasındaki isim Insomniac Games, 
                              geçtiğimiz günlerde fidye yazılımı saldırısına uğradı ve bitcoinle talep edilen fidye ödenmediğinden çalışan bilgileri, 
                              sözleşmeler, gelecek oyun planları, Wolverine oyununa ait görüntüler, bütçe planlaması dahil milyonlarca dosya yayınlandı. 
                              Birkaç gün sonra oyun şirketinden açıklama geldi...
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a><b>GTA 6 Fragmanı, GTA 5'in İçinde Yeniden Oluşturuldu</b></a>
                                          </h2>
                            <div class="byline">
                              <span>9 Saat Önce</span> <a>Ege Can Çil</a> tarafından
                            </div>
                            <p class="excerpt"><a>Video oyun dünyasının dev isimlerinden Rockstar Games, son günlerde GTA 5'in kaynak kodlarının sızdırılması meselesi ile gündemde. Bu gelişme, şirketin Bully 2 üzerinde de çalıştığının anlaşılmasına neden oldu. 
                              Ayrıca GTA 6'nın kod adı gibi bilgiler de açığa çıktı. Ancak hacker'lar, bu kadarla kalmayacak gibi görünüyorlar.
                              Bu kez, kodları sızdıran ekipten ilginç bir hamle geldi. Hacker'lar, 
                              GTA 6'nın kısa bir süre önce yayımlanan fragmanını, GTA 5'te yeniden uyarladılar. 
                              Paylaşılan görüntü, GTA 6 ile GTA 5 arasındaki kalite farkının anlaşılabilmesi açısından dikkat çekiciydi.</a>
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a><b>Merakla beklenen PS5 oyunu ertelendi</b></a>
                                          </h2>
                            <div class="byline">
                              <span>11 Saat Önce</span> <a>Ege Can Çil</a> Tarafından
                            </div>
                            <p class="excerpt">
                            İlk olarak 2019 yılında “Project Eve” olarak duyurulan fakat daha sonrasında adı değişen Stellar Blade, 
                            bilim kurgu temalı kıyamet sonrası dünyada geçen bir aksiyon rol yapma oyunu olarak karşımıza çıkacak. 
                            Söz konusu yapım, ilk duyurulduğunda çok merak edilmişti.
                            Koreli Shift Up tarafından geliştirilen oyunun normalde bu yıl PlayStation 5 konsolu için piyasaya sürülmesi bekleniyordu. 
                            Ancak görünen o ki Sony tarafında işler pek iyi gitmedi.
                            </a>
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a><b>Unreal Engine 5’li Venom işte böyle görünecek!</b></a>
                                          </h2>
                            <div class="byline">
                              <span>16 Saat Önce</span> <a>Kürşat Şahin</a> Tarafından
                            </div>
                            <p class="excerpt">
                            Marvel’s Spider-Man oyunları son yıllarda büyük ses getirmeyi başardı. 
                            Hem süper kahraman hayranlarını hem de aksiyon sevenleri bir araya getirmeyi başaran oyun, 
                            Venom projesinin de önünü açtı. 
                            Bu kapsamda Unreal Engine 5 ile geliştirilen Venom oyunu konsepti de büyük ilgi topladı.
                            
                            
                            <p><b>Venom oyunu konsepti göz kamaştırdı</b></p>

                            Unreal Engine 5 ile hazırlanan yeni bir Venom konsept videosu sosyal medyada yankı uyandırıyor.
                            Insomniac Games tarafından geliştirilecek yeni Venom oyununun, potansiyel olarak nasıl görüneceğini gözler önüne serdi.
                            Resmi oynanış fragmanı olmasa da, konsept videonun dikkat çektiğini belirtmek gerekiyor. 
                            Venom’un duvarda sürünme ve şehirde çeşitli düşmanlara karşı savaşma becerisini gösteren video, 
                            ayrıca kendine özgü yeteneklerini de nasıl kullanacağını ortaya çıkardı.
                            </p>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
          </div>


          <!-- Enler -->
            <div class="col-md-6 col-sm-6">

                <!-- YEAR OF THE GAME -->
                <div class="card">
                    <div class="image">
                      <img src="Resimler/Baldur's Gate 3.png" />
                    </div>
                    <div class="card-inner">
                      <div class="header">
                        <h2><b>YILIN OYUNU</b></h2>
                        <h3>Baldur's Gate 3</h2>
                    </div>
                    <div class="content">
                      <p>Larian Studios</p>
                    </div>
                      </div>
                </div>

                <!-- 1 -->
                <div class="col-md-6 col-sm-6">
                  <div class="card">
                      <div class="image">
                        <img src="Resimler/Starfield.png" />
                      </div>
                      <div class="card-inner">
                        <div class="header">
                          <h2><b>EN İYİ RPG</b></h2>
                          <h3>StarField</h2>
                      </div>
                      <div class="content">
                        <p>Bethesda Game Studios </p>
                      </div>
                        </div>
                  </div>
                </div>
                <!-- 2 -->
                <div class="col-md-6 col-sm-6">
                  <div class="card">
                      <div class="image">
                        <img src="Resimler/Football Manager 2024.png" />
                      </div>
                      <div class="card-inner">
                        <div class="header">
                          <h2><b>EN İYİ SİMULASYON</b></h2>
                          <h3>FM 2024</h2>
                      </div>
                      <div class="content">
                        <p>Sports Interactive</p>
                      </div>
                        </div>
                  </div>
                </div>
                <!-- 3 -->
                <div class="col-md-6 col-sm-6">
                  <div class="card">
                      <div class="image">
                        <img src="Resimler/FC24.png" />
                      </div>
                      <div class="card-inner">
                        <div class="header">
                          <h2><b>EN İYİ SPOR OYUNU</b></h2>
                          <h3>FC 24</h2>
                      </div>
                      <div class="content">
                        <p>EA Games</p>
                      </div>
                        </div>
                  </div>
                </div>
                <!-- 4 -->
                <div class="col-md-6 col-sm-6">
                  <div class="card">
                      <div class="image">
                        <img src="Resimler/Lies Of P.png" />
                      </div>
                      <div class="card-inner">
                        <div class="header">
                          <h2><b>EN İYİ TASARIM</b></h2>
                          <h3>Lies of P</h2>
                      </div>
                      <div class="content">
                        <p>Round 8 Studio</p>
                      </div>
                        </div>
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
    <!-- Chart.js -->
    <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.pie.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

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
  title: {
    text: 'Türlere Göre Oyun Sayısı',
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
      name: 'Oyun Sayısı',
      type: 'pie',
      radius: '50%',
      data: [
        <?php echo oyun_kategori($baglan) ?>
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
  <!-- Pasta Grafiği -->

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

	
  </body>
</html>
