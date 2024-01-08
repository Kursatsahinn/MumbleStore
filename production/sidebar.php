<?php 
    function sidebar($K_TİP){
    echo '<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section" style="background-color:#161A30">
            <ul class="nav side-menu" style="background-color:#161A30">
            <li><a href="index.php"><i class="fa fa-home"></i> Anasayfa </a></li>
            <li><a><i class="fa fa-cogs"></i> İşlemler <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="oyunlar.php"><i class="fa fa-gamepad"></i> Oyunlar </a></li>
                    <li><a href="sirketler.php"><i class="fa fa-briefcase"></i> Şirketler </a></li>
                    <li><a href="gelistiriciler.php"><i class="fa fa-briefcase"></i> Geliştiriciler </a></li>
                </ul>
            </li>';

    if ($K_TİP == 2) {
        echo '<li><a href="kullanicilar.php"><i class="fa fa-users"></i> Kullanıcı Yönetimi </a></li>';
    }

    echo '<li><a href="logout.php"><i class="fa fa-home"></i> Çıkış </a></li></ul></div></div>';
}

?>