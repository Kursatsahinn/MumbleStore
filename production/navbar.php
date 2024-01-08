<?php 
    function navbar(){
        echo '<div class="top_nav">
          <div class="nav_menu" style="background-color:#31304D">
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <nav class="nav navbar-nav">
              <ul class=" navbar-right">
                <li class="nav-item dropdown open" style="padding-left: 15px;">
                  <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false" style="color:white !important">
                    <img src="images/img.jpg" alt="">İşlemler
                  </a>
                  <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                    
                      <a class="dropdown-item"  href="bilgiGuncelle.php">
                        <span>Ayarlar</span>
                      </a>
                  <a class="dropdown-item"  href="kutuphane.php">Kütüphane</a>
                  <a class="dropdown-item"  href="login.php"><i class="fa fa-sign-out pull-right"></i> Çıkış</a>
                  </div>
                </li>
              </ul>
            </nav>
          </div>
        </div>';
    }
?>