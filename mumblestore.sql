-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Oca 2024, 19:40:38
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `mumblestore`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cinsiyet`
--

CREATE TABLE `cinsiyet` (
  `Cinsiyet_ID` int(11) NOT NULL,
  `Cinsiyet_adi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `cinsiyet`
--

INSERT INTO `cinsiyet` (`Cinsiyet_ID`, `Cinsiyet_adi`) VALUES
(1, 'Erkek'),
(2, 'Kadın'),
(3, 'Belirsiz');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dagitici`
--

CREATE TABLE `dagitici` (
  `dagitici_ID` int(11) NOT NULL,
  `dagitici_adi` varchar(50) NOT NULL,
  `e-posta` varchar(100) NOT NULL,
  `deger` varchar(100) NOT NULL,
  `tarih` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `dagitici`
--

INSERT INTO `dagitici` (`dagitici_ID`, `dagitici_adi`, `e-posta`, `deger`, `tarih`) VALUES
(1, 'Steam', 'support@steampowered.com', '10000000000', '12 Eylül 2003'),
(2, 'Epic Games', 'support@epicgames.com', '31500000000', '15 Ocak 1991'),
(3, 'Ubisoft', 'AccountSupport@ubi.com', '33330000000', '28 Mart 1986'),
(4, 'Blizzard', 'support@blizzard.com', '74280000000', '8 Şubat 1991'),
(5, 'EA', 'support@ea.com', '37030000000', '27 Mayıs 1982');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelistirici`
--

CREATE TABLE `gelistirici` (
  `Gelistirici_ID` int(11) NOT NULL,
  `Gelistirici_Ad` varchar(100) NOT NULL,
  `deger` varchar(100) NOT NULL,
  `tarih` varchar(100) NOT NULL,
  `e_posta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `gelistirici`
--

INSERT INTO `gelistirici` (`Gelistirici_ID`, `Gelistirici_Ad`, `deger`, `tarih`, `e_posta`) VALUES
(1, 'Activision', '290766', '25 Mart 2010', 'activision@support.com'),
(2, 'Bethesda Game Studios ', '338623', '11 Eylül 2017', 'bethesdagamestudios@support.com'),
(3, 'From Software', '317588', '12 Nisan 2010', 'fromsoftware@support.com'),
(4, 'Deep Silver', '330735', '15 Temmuz 2002', 'deepsilver@support.com'),
(5, 'Unknown Worlds Entertainment', '324047', '29 Mart 2004', 'unknownworldsentertainment@support.com'),
(6, 'Ludeon Studios', '325791', '23 Kasım 2011', 'ludeonstudios@support.com'),
(7, 'Lazy Bear Games', '342449', '26 Ocak 2016', 'lazybeargames@support.com'),
(8, 'SEGA', '258406', '09 Şubat 2012', 'sega@support.com'),
(9, 'Respawn Entertainment', '342785', '22 Aralık 2017', 'respawnentertainment@support.com'),
(10, 'WB Games', '284060', '12 Mart 2013', 'wbgames@support.com'),
(12, 'Nintendo', '299052', '01 Temmuz 2015', 'nintendo@support.com'),
(13, 'Valve Corporation', '269108', '06 Haziran 2018', 'valvecorporation@support.com'),
(14, 'Rockstar Games', '326803', '05 Aralık 2013', 'rockstargames@support.com'),
(15, 'Electronic Arts', '289770', '05 Kasım 2015', 'electronicarts@support.com'),
(16, 'Ubisoft', '332164', '03 Ağustos 2002', 'ubisoft@support.com'),
(17, 'Square Enix', '280179', '18 Ekim 2017', 'squareenix@support.com'),
(18, 'Sony Interactive Entertainment', '283300', '31 Ocak 2001', 'sonyinteractiveentertainment@support.com'),
(19, 'CD Projekt', '261789', '29 Nisan 2002', 'cdprojekt@support.com'),
(20, 'GearBox', '276870', '13 Ekim 2011', 'gearbox@support.com'),
(21, 'FacePunch Studios', '339170', '26 Aralık 2019', 'facepunchstudios@support.com'),
(22, 'Techland', '344731', '14 Ekim 2019', 'techland@support.com'),
(23, 'Rare Ltd', '319082', '18 Eylül 2019', 'rareltd@support.com'),
(24, 'BANDAI NAMCO', '266580', '11 Ocak 2002', 'bandainamco@support.com'),
(25, 'Playground Games', '302027', '03 Temmuz 2011', 'playgroundgames@support.com'),
(26, 'Sickhead Games', '304016', '29 Temmuz 2018', 'sickheadgames@support.com'),
(27, 'CyberConnect2', '286387', '25 Ağustos 2006', 'cyberconnect2@support.com'),
(28, 'Iron Gate Studio', '269879', '12 Ocak 2011', 'irongatestudio@support.com'),
(29, 'Red Barrels', '283977', '05 Kasım 2007', 'redbarrels@support.com'),
(30, 'CAPCOM', '308031', '19 Kasım 2016', 'capcom@support.com'),
(32, 'Overkill Software', '272290', '08 Mayıs 2015', 'overkillsoftware@support.com'),
(33, 'Sports Interactive', '330428', '25 Aralık 2017', 'activision@support.com'),
(34, 'Larian Studios', '284147', '23 Temmuz 2006', 'bethesdagamestudios@support.com'),
(35, 'VOID Interactive', '343277', '02 Nisan 2016', 'fromsoftware@support.com'),
(36, 'Poncle', '300973', '26 Mart 2006', 'deepsilver@support.com'),
(37, 'Red Hook Studios', '315454', '27 Eylül 2013', 'unknownworldsentertainment@support.com'),
(38, 'Behaviour Interactive Inc.', '284461', '29 Aralık 2012', 'ludeonstudios@support.com'),
(39, 'Mintrocket', '306549', '01 Şubat 2015', 'lazybeargames@support.com'),
(40, 'Highwire Games', '312113', '04 Mart 2010', 'sega@support.com'),
(41, 'Frontier Developments', '258544', '17 Haziran 2001', 'respawnentertainment@support.com'),
(42, 'Colossal Order', '312118', '17 Ocak 2007', 'wbgames@support.com'),
(43, 'Ghost Ship Games', '264350', '03 Ocak 2018', '2k@support.com'),
(44, 'Shiro Games', '254975', '05 Ağustos 2009', 'nintendo@support.com'),
(45, 'Endnight Games', '273252', '17 Mart 2010', 'valvecorporation@support.com'),
(46, 'One More Level', '268127', '01 Nisan 2017', 'rockstargames@support.com'),
(47, 'Owlcat Games', '269823', '19 Şubat 2000', 'electronicarts@support.com'),
(48, 'Bohemia Interactive', '258825', '13 Eylül 2017', 'ubisoft@support.com'),
(49, 'Paradox Development Studio', '264175', '08 Aralık 2016', 'squareenix@support.com'),
(50, 'Square Enix', '257243', '22 Ağustos 2000', 'sonyinteractiveentertainment@support.com'),
(51, 'Blizzard Entertainment', '306665', '23 Mayıs 2004', 'cdprojekt@support.com'),
(52, 'Avalanche Software', '342532', '02 Kasım 2002', 'gearbox@support.com'),
(53, 'Gamepires', '302054', '22 Mart 2017', 'facepunchstudios@support.com'),
(54, '10 Chambers', '300530', '04 Mart 2015', 'techland@support.com'),
(55, 'Relic Entertainment', '324703', '17 Ağustos 2009', 'rareltd@support.com'),
(56, 'Ludeon Studios', '272611', '21 Şubat 2019', 'bandainamco@support.com'),
(57, 'Redbeet Interactive', '315872', '28 Aralık 2000', 'playgroundgames@support.com'),
(58, 'Round8 Studio', '322854', '26 Nisan 2014', 'sickheadgames@support.com'),
(59, 'Nicalis, Inc. ', '305803', '19 Temmuz 2011', 'cyberconnect2@support.com'),
(60, 'Creative Assembly', '266215', '04 Haziran 2010', 'irongatestudio@support.com'),
(61, 'Visual Concepts', '338945', '11 Ağustos 2014', 'redbarrels@support.com'),
(62, 'Firaxis Games', '323877', '27 Kasım 2015', 'capcom@support.com'),
(63, 'Mundfish', '299425', '21 Ocak 2014', '505games@support.com'),
(64, 'Turn 10 Studios', '333277', '26 Ekim 2014', 'overkillsoftware@support.com'),
(65, 'Croteam', '318556', '09 Haziran 2015', 'activision@support.com'),
(66, 'Klei Entertainment', '294921', '10 Mart 2001', 'bethesdagamestudios@support.com'),
(67, 'Studio Wildcard', '256680', '09 Haziran 2001', 'fromsoftware@support.com'),
(68, 'Forgotten Empires', '314061', '29 Aralık 2011', 'deepsilver@support.com'),
(69, 'Undertow Games', '325854', '25 Kasım 2018', 'unknownworldsentertainment@support.com'),
(70, 'Mega Crit', '263018', '30 Eylül 2014', 'ludeonstudios@support.com'),
(71, 'Beat Games', '311084', '28 Nisan 2013', 'lazybeargames@support.com'),
(72, 'Offworld Industries', '333459', '30 Ocak 2007', 'sega@support.com'),
(73, 'Hinterland Studios', '286887', '28 Aralık 2012', 'respawnentertainment@support.com'),
(74, 'New World Interactive', '313058', '06 Eylül 2018', 'wbgames@support.com'),
(75, 'Hopoo Games', '250703', '03 Ocak 2011', '2k@support.com'),
(76, 'Massive Entertainment', '342533', '05 Kasım 2002', 'nintendo@support.com'),
(77, 'The Fun Pimps', '315726', '09 Ekim 2017', 'valvecorporation@support.com'),
(78, 'Colossal Order', '261962', '12 Ocak 2010', 'rockstargames@support.com'),
(79, 'BlueTwelve Studio', '325448', '10 Mart 2007', 'electronicarts@support.com'),
(80, 'Teyon', '272742', '08 Haziran 2011', 'ubisoft@support.com'),
(81, 'Brave At Night', '321313', '09 Nisan 2014', 'squareenix@support.com'),
(82, 'Coffee Stain Studios', '333860', '18 Aralık 2011', 'sonyinteractiveentertainment@support.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelistirici_dagitici`
--

CREATE TABLE `gelistirici_dagitici` (
  `Gelistirici_ID` int(11) NOT NULL,
  `dagitici_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `gelistirici_dagitici`
--

INSERT INTO `gelistirici_dagitici` (`Gelistirici_ID`, `dagitici_ID`) VALUES
(3, 1),
(14, 1),
(20, 2),
(2, 1),
(15, 5),
(21, 1),
(16, 3),
(29, 1),
(22, 2),
(23, 1),
(30, 1),
(25, 1),
(19, 1),
(37, 2),
(18, 7),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(38, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(39, 2),
(40, 2),
(41, 1),
(42, 2),
(43, 1),
(44, 2),
(45, 1),
(46, 2),
(47, 2),
(48, 1),
(49, 1),
(17, 2),
(24, 1),
(51, 4),
(52, 2),
(53, 1),
(54, 2),
(55, 1),
(6, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 2),
(62, 2),
(63, 2),
(65, 1),
(66, 1),
(67, 1),
(68, 2),
(69, 1),
(49, 2),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(77, 1),
(79, 2),
(80, 2),
(81, 1),
(82, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `Kategori_ID` int(11) NOT NULL,
  `Kategori_Tur` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`Kategori_ID`, `Kategori_Tur`) VALUES
(1, 'Macera'),
(2, 'Aksiyon'),
(3, 'Simulasyon'),
(4, 'Gerilim / Korku'),
(5, 'Hayatta Kalma'),
(6, 'First Person'),
(7, 'Third Person'),
(8, 'MOBA'),
(9, 'RPG'),
(10, 'MMO'),
(11, 'RTS'),
(12, 'Turn Based Strategy'),
(13, 'J-RPG'),
(14, 'Platform'),
(15, 'Hack and Slash'),
(16, 'Açık Dünya'),
(17, 'Puzzle'),
(18, 'Soulslike'),
(19, 'Dövüş'),
(20, 'Spor'),
(21, 'Yarış'),
(22, 'Zengin Hikaye'),
(23, 'Soulslike');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `Kullanici_ID` int(11) NOT NULL,
  `Kullanici_adi` varchar(50) NOT NULL,
  `Kullanici_Soyadi` varchar(50) NOT NULL,
  `Cinsiyet_ID` int(11) NOT NULL,
  `Kullanici_eposta` varchar(50) NOT NULL,
  `K_Adi` varchar(100) NOT NULL,
  `Sifre` varchar(255) DEFAULT NULL,
  `k_tip` int(10) DEFAULT NULL,
  `k_tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`Kullanici_ID`, `Kullanici_adi`, `Kullanici_Soyadi`, `Cinsiyet_ID`, `Kullanici_eposta`, `K_Adi`, `Sifre`, `k_tip`, `k_tarih`) VALUES
(3, 'Can', 'Çil', 1, 'cilegecan0@gmail.com', 'ecchill', '5583413443164b56500def9a533c7c70', 2, '2023-12-22'),
(4, 'Sema', 'Kaplan', 2, 'sema.kaplann1907@gmail.com', 'semakpln1907', '5583413443164b56500def9a533c7c70', 2, '2023-12-22'),
(5, 'Kürşat', 'Şahin', 1, 'kursat_sahinn03@gmail.com', 'kursat_sahinn', '5583413443164b56500def9a533c7c70', 2, '2023-12-22'),
(9, 'Hakkı ', 'Ayman', 1, 'hakki_ayman@gmail.com', 'hakki_Tech', '5583413443164b56500def9a533c7c70', 1, '2023-12-22'),
(10, 'Halit', 'Kılınç', 1, 'halit_kilinc@gmail.com', 'Walbonex', '5583413443164b56500def9a533c7c70', 1, '2023-12-23'),
(11, 'Hakan', 'Kılınç', 1, 'hakan_kilinc@gmail.com', 'hakan_kilinc', '5583413443164b56500def9a533c7c70', 1, '2023-12-25'),
(12, 'Suben', 'İpek', 2, 'suben_46@gmail.com', 'subenn45', '5583413443164b56500def9a533c7c70', 1, '2023-12-26');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici_tipi`
--

CREATE TABLE `kullanici_tipi` (
  `k_tip` int(11) NOT NULL,
  `k_tip_adi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanici_tipi`
--

INSERT INTO `kullanici_tipi` (`k_tip`, `k_tip_adi`) VALUES
(1, 'Kullanıcı'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log_kayit`
--

CREATE TABLE `log_kayit` (
  `Log_ID` int(11) NOT NULL,
  `Kullanici_ID` int(11) NOT NULL,
  `K_IP` varchar(200) NOT NULL,
  `Tarih` varchar(200) NOT NULL,
  `Islem` text NOT NULL,
  `Cihaz` varchar(100) NOT NULL,
  `Tarayici` varchar(100) NOT NULL,
  `card_num` varchar(30) DEFAULT NULL,
  `card_tarih` varchar(100) DEFAULT NULL,
  `CV2` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `log_kayit`
--

INSERT INTO `log_kayit` (`Log_ID`, `Kullanici_ID`, `K_IP`, `Tarih`, `Islem`, `Cihaz`, `Tarayici`, `card_num`, `card_tarih`, `CV2`) VALUES
(1, 5, '::1', '2023-12-24 17:55:13', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(2, 5, '::1', '2023-12-24 17:58:21', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(3, 3, '::1', '2023-12-24 17:58:47', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(4, 3, '::1', '2023-12-24 17:58:49', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(5, 10, '::1', '2023-12-24 18:09:45', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(6, 10, '::1', '2023-12-24 18:10:27', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(7, 5, '::1', '2023-12-24 18:16:02', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(11, 5, '::1', '2023-12-24 18:28:18', 'Kullanıcı Yes, Your Grace oyununu satın aldı.', 'Desktop', 'Opera', '9819 8165 1651 9819', '56/16', '985'),
(12, 5, '::1', '2023-12-24 18:28:22', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(13, 5, '::1', '2023-12-25 07:43:49', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(14, 5, '::1', '2023-12-25 07:44:20', 'Kullanıcı Assassin’s Creed® Brotherhood oyununu satın aldı.', 'Desktop', 'Opera', '1599 8885 6666 8812', '12/28', '195'),
(15, 5, '::1', '2023-12-25 07:45:07', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(16, 5, '::1', '2023-12-25 08:09:02', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(17, 5, '::1', '2023-12-25 08:09:26', 'Kullanıcı Far Cry 6 oyununu satın aldı.', 'Desktop', 'Opera', '5319 8651 9865 1651', '65/16', '651'),
(18, 5, '::1', '2023-12-25 08:09:40', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(19, 3, '::1', '2023-12-25 08:10:46', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(20, 5, '::1', '2023-12-25 09:11:23', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(21, 5, '::1', '2023-12-25 09:12:07', 'Kullanıcı Outlast oyununu satın aldı.', 'Desktop', 'Opera', '6516 5165 1651 6516', '19/28', '199'),
(22, 5, '::1', '2023-12-25 09:12:21', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(23, 5, '::1', '2023-12-25 10:19:44', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(24, 5, '::1', '2023-12-25 10:19:51', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(25, 11, '::1', '2023-12-25 10:20:44', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(26, 11, '::1', '2023-12-25 12:04:55', 'Kullanıcı ELDEN RING oyununu satın aldı.', 'Desktop', 'Opera', '6651 5616 5165 1651', '18/24', '195'),
(27, 11, '::1', '2023-12-25 13:09:11', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(28, 5, '::1', '2023-12-25 13:17:55', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(29, 5, '::1', '2023-12-25 13:25:47', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(30, 5, '::1', '2023-12-25 13:26:46', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(31, 5, '::1', '2023-12-25 13:27:06', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(32, 5, '::1', '2023-12-25 13:27:35', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(33, 3, '::1', '2023-12-25 13:27:40', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(34, 3, '::1', '2023-12-25 14:40:47', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(35, 5, '::1', '2023-12-25 14:41:00', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(36, 5, '::1', '2023-12-25 17:01:28', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(37, 5, '::1', '2023-12-25 17:02:05', 'Kullanıcı Forza Horizon 4 oyununu satın aldı.', 'Desktop', 'Opera', '1234 5678 9321 5698', '12/35', '195'),
(38, 5, '::1', '2023-12-25 17:04:46', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(39, 5, '::1', '2023-12-25 17:18:10', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(40, 5, '::1', '2023-12-25 20:35:16', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(41, 12, '::1', '2023-12-26 09:36:17', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(42, 12, '::1', '2023-12-26 09:37:01', 'Kullanıcı ELDEN RING oyununu satın aldı.', 'Desktop', 'Opera', '6651 6516 5165 1651', '65/16', '165'),
(43, 12, '::1', '2023-12-26 09:37:13', 'Kullanıcı FC24 oyununu satın aldı.', 'Desktop', 'Opera', '6519 5616 5165 1651', '65/16', '651'),
(44, 12, '::1', '2023-12-26 09:37:28', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(45, 5, '::1', '2023-12-26 09:37:41', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(46, 5, '::1', '2023-12-26 09:37:50', 'Kullanıcı Red Dead Redemption 2 oyununu satın aldı.', 'Desktop', 'Opera', '6516 5165 1651 6189', '16/51', '651'),
(47, 5, '::1', '2023-12-26 09:38:08', 'Kullanıcı Cyberpunk 2077 oyununu satın aldı.', 'Desktop', 'Opera', '6516 5165 1981 6516', '16/51', '165'),
(48, 5, '::1', '2023-12-26 09:38:54', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(49, 5, '::1', '2023-12-26 09:39:37', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(50, 5, '::1', '2023-12-26 09:52:25', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(51, 5, '::1', '2023-12-26 09:52:39', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(52, 5, '::1', '2023-12-27 07:17:38', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(53, 5, '::1', '2023-12-27 07:17:40', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(54, 5, '::1', '2023-12-27 07:17:50', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(55, 5, '::1', '2023-12-27 07:51:12', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(56, 5, '::1', '2023-12-27 07:52:54', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(57, 5, '::1', '2023-12-27 07:54:38', 'Sisteme Giriş Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(58, 5, '::1', '2023-12-27 07:54:48', 'Sistemden Çıkış Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(59, 5, '::1', '2023-12-27 07:58:39', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(60, 5, '::1', '2023-12-27 07:58:48', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(61, 5, '::1', '2023-12-27 07:58:59', 'Sisteme Giriş Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(62, 5, '::1', '2023-12-27 08:01:30', 'Sistemden Çıkış Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(63, 5, '::1', '2023-12-27 08:01:46', 'Sisteme Giriş Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(64, 5, '::1', '2023-12-27 08:07:19', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(65, 5, '::1', '2023-12-28 11:42:27', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(66, 5, '::1', '2023-12-28 11:43:16', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(67, 5, '::1', '2023-12-28 11:44:37', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(68, 5, '::1', '2023-12-28 12:08:50', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(69, 5, '::1', '2023-12-28 16:58:59', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(70, 5, '::1', '2023-12-28 17:08:42', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(71, 5, '::1', '2023-12-28 17:08:48', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(72, 5, '::1', '2023-12-28 17:09:06', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(73, 5, '::1', '2023-12-28 17:09:12', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(74, 3, '::1', '2023-12-28 17:09:17', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(75, 5, '::1', '2023-12-28 17:19:50', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(76, 5, '::1', '2023-12-28 17:25:11', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(77, 3, '::1', '2023-12-28 17:25:17', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(78, 3, '::1', '2023-12-28 17:25:24', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(79, 3, '::1', '2023-12-28 17:25:46', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(80, 3, '::1', '2023-12-28 17:25:54', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(81, 5, '::1', '2023-12-28 17:25:59', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(82, 5, '::1', '2023-12-28 17:30:58', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(83, 5, '::1', '2023-12-28 17:32:50', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(84, 5, '::1', '2023-12-28 18:35:57', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(85, 5, '::1', '2023-12-28 18:36:01', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(86, 5, '::1', '2023-12-29 08:03:34', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(87, 5, '::1', '2023-12-29 08:03:51', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(88, 5, '::1', '2023-12-29 08:04:50', 'Kullanıcı DAVE THE DIVER oyununu satın aldı.', 'Desktop', 'Opera', '6156 1651 6516 5165', '32/16', '321'),
(89, 5, '::1', '2023-12-29 08:10:02', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(90, 5, '::1', '2023-12-29 08:10:06', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(91, 5, '::1', '2023-12-29 08:33:33', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(92, 5, '::1', '2023-12-29 10:05:36', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(93, 11, '::1', '2023-12-29 10:05:41', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(94, 11, '::1', '2023-12-29 10:05:54', 'Kullanıcı GTA V oyununu satın aldı.', 'Desktop', 'Opera', '9859 8419 8519 6519', '19/51', '198'),
(95, 5, '::1', '2023-12-29 11:12:49', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(96, 5, '::1', '2023-12-29 11:15:53', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(97, 5, '::1', '2023-12-29 11:15:57', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(98, 5, '::1', '2023-12-29 11:53:13', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(99, 5, '::1', '2023-12-29 11:55:35', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(100, 5, '::1', '2023-12-29 11:56:11', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(101, 11, '::1', '2023-12-29 12:51:31', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(102, 11, '::1', '2023-12-29 12:52:52', 'Kullanıcı FC24 oyununu satın aldı.', 'Desktop', 'Opera', '6541 6516 5165 1651', '65/16', '651'),
(103, 11, '::1', '2023-12-29 12:53:32', 'Kullanıcı Red Dead Redemption 2 oyununu satın aldı.', 'Desktop', 'Opera', '6156 5195 6198 1985', '98/19', '198'),
(104, 11, '::1', '2023-12-29 12:57:27', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(105, 3, '::1', '2023-12-29 12:57:32', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(106, 3, '::1', '2023-12-29 12:57:41', 'Kullanıcı Red Dead Redemption 2 oyununu satın aldı.', 'Desktop', 'Opera', '6516 5165 1651 6516', '16/51', '165'),
(107, 3, '::1', '2023-12-29 12:57:43', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(108, 10, '::1', '2023-12-29 12:57:47', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(109, 10, '::1', '2023-12-29 12:57:48', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(110, 10, '::1', '2023-12-29 12:57:52', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(111, 10, '::1', '2023-12-29 12:58:04', 'Kullanıcı Red Dead Redemption 2 oyununu satın aldı.', 'Desktop', 'Opera', '6516 5165 1651 651', '65/16', '165'),
(112, 10, '::1', '2023-12-29 13:00:44', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(113, 5, '::1', '2023-12-29 13:00:49', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(114, 5, '::1', '2023-12-29 13:04:19', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(115, 5, '::1', '2023-12-29 13:05:57', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(116, 5, '::1', '2023-12-29 13:06:27', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(117, 5, '::1', '2023-12-29 13:06:46', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(118, 5, '::1', '2023-12-29 13:31:03', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(119, 5, '::1', '2023-12-29 13:31:58', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(120, 5, '::1', '2023-12-29 13:32:11', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(121, 5, '::1', '2023-12-29 14:01:58', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(122, 5, '::1', '2023-12-29 14:24:27', 'Kullanıcı ELDEN RING oyununu satın aldı.', 'Desktop', 'Opera', '4184 8714 5148 5454', '81/84', '187'),
(123, 5, '::1', '2023-12-29 14:32:48', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(124, 5, '::1', '2023-12-29 14:35:24', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(125, 3, '::1', '2023-12-29 14:35:29', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(126, 3, '::1', '2023-12-29 14:47:14', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(127, 3, '::1', '2023-12-29 14:52:51', 'Kullanıcı Outlast oyununu satın aldı.', 'Desktop', 'Opera', '4165 1651 6516 5165', '65/16', '516'),
(128, 3, '::1', '2023-12-29 14:53:44', 'Kullanıcı ELDEN RING oyununu satın aldı.', 'Desktop', 'Opera', '5616 5165 1651 65', '16/51', '651'),
(129, 3, '::1', '2023-12-29 14:54:16', 'Kullanıcı Far Cry 6 oyununu satın aldı.', 'Desktop', 'Opera', '6541 5616 5165 1651', '65/16', '651'),
(130, 3, '::1', '2023-12-29 14:54:22', 'Kullanıcı Risk Of Rain 2 oyununu satın aldı.', 'Desktop', 'Opera', '9845 9814 9819 8519', '98/19', '198'),
(131, 3, '::1', '2023-12-29 14:57:30', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(132, 5, '::1', '2023-12-29 14:58:33', 'Sisteme Giriş Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(133, 5, '::1', '2023-12-29 15:04:37', 'Sistemden Çıkış Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(134, 5, '::1', '2023-12-29 15:05:57', 'Sisteme Giriş Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(135, 5, '::1', '2023-12-29 15:07:40', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(136, 5, '::1', '2023-12-29 15:09:07', 'Sistemden Çıkış Yaptı', 'Desktop', 'Chrome', NULL, NULL, NULL),
(137, 5, '::1', '2023-12-29 15:17:08', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(138, 3, '::1', '2023-12-29 15:17:11', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(139, 3, '::1', '2023-12-29 15:17:39', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(140, 5, '::1', '2023-12-29 15:17:43', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(141, 5, '::1', '2023-12-29 15:18:59', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(142, 3, '::1', '2023-12-29 15:19:03', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(143, 3, '::1', '2023-12-29 15:19:08', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(144, 5, '::1', '2023-12-29 15:19:11', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(145, 5, '::1', '2023-12-29 16:24:53', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(146, 5, '::1', '2023-12-29 16:24:56', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(147, 5, '::1', '2023-12-29 16:27:55', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(148, 5, '::1', '2023-12-29 16:27:58', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(149, 5, '::1', '2023-12-29 16:32:23', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(150, 5, '::1', '2023-12-29 16:32:29', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(151, 5, '::1', '2023-12-29 16:41:06', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(152, 5, '::1', '2023-12-29 16:41:10', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(153, 5, '::1', '2023-12-29 16:41:43', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(154, 5, '::1', '2023-12-29 16:41:48', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(155, 5, '::1', '2023-12-29 16:42:39', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(156, 5, '::1', '2023-12-29 16:42:43', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(157, 5, '::1', '2023-12-29 16:43:19', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(158, 5, '::1', '2023-12-29 16:43:22', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(159, 5, '::1', '2023-12-29 16:43:50', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(160, 5, '::1', '2023-12-29 16:43:53', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(161, 5, '::1', '2023-12-29 16:44:53', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(162, 3, '::1', '2023-12-29 16:44:58', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(163, 3, '::1', '2023-12-29 16:45:28', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(164, 5, '::1', '2023-12-29 16:45:32', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(165, 5, '::1', '2023-12-29 16:48:49', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(166, 5, '::1', '2023-12-29 16:48:50', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(169, 3, '::1', '2023-12-30 09:45:37', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(170, 5, '::1', '2023-12-30 09:46:18', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(171, 5, '::1', '2023-12-30 10:57:39', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(172, 5, '::1', '2023-12-30 19:09:07', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(173, 3, '::1', '2023-12-30 19:33:12', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(174, 5, '::1', '2023-12-30 19:35:19', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(175, 5, '::1', '2023-12-30 19:35:29', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(176, 11, '::1', '2023-12-30 19:36:43', 'ID\'si 11 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(177, 5, '::1', '2023-12-30 19:39:44', 'ID\'si 9 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(178, 5, '::1', '2023-12-30 19:39:56', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(179, 5, '::1', '2023-12-30 19:40:36', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(180, 5, '::1', '2023-12-30 19:42:27', 'ID\'si 4 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(181, 5, '::1', '2023-12-30 19:42:33', 'ID\'si 12 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(182, 5, '::1', '2023-12-30 19:42:37', 'ID\'si 12 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(183, 5, '::1', '2023-12-30 19:42:42', 'ID\'si 9 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(184, 5, '::1', '2023-12-30 19:42:47', 'ID\'si 9 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(185, 5, '::1', '2023-12-30 19:42:52', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(186, 5, '::1', '2023-12-30 19:43:02', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(187, 5, '::1', '2023-12-30 19:43:21', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(188, 5, '::1', '2023-12-30 19:43:25', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(189, 5, '::1', '2023-12-30 21:33:43', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(190, 5, '::1', '2023-12-30 21:34:50', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(191, 5, '::1', '2023-12-30 21:38:58', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(192, 5, '::1', '2023-12-31 10:17:43', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(193, 4, '162.231.30.119', '2023-12-15 10:53:26', 'Sisteme Giriş Yaptı', 'Tablet', 'Edge', NULL, NULL, NULL),
(194, 4, '162.231.30.119', '2023-12-15 11:06:26', 'Sistemden Çıkış Yaptı', 'Tablet', 'Edge', NULL, NULL, NULL),
(195, 11, '73.143.115.9', '2023-12-28 02:13:51', 'Sisteme Giriş Yaptı', 'Tablet', 'FireFox', NULL, NULL, NULL),
(196, 11, '73.143.115.9', '2023-12-28 12:44:51', 'Sistemden Çıkış Yaptı', 'Tablet', 'FireFox', NULL, NULL, NULL),
(197, 9, '220.166.215.26', '2023-12-12 11:48:48', 'Sisteme Giriş Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(198, 9, '220.166.215.26', '2023-12-12 17:07:48', 'Sistemden Çıkış Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(199, 4, '162.231.30.119', '2023-12-31 10:44:47', 'Sisteme Giriş Yaptı', 'Tablet', 'Safari', NULL, NULL, NULL),
(200, 4, '162.231.30.119', '2023-12-31 15:01:47', 'Sistemden Çıkış Yaptı', 'Tablet', 'Safari', NULL, NULL, NULL),
(201, 12, '169.141.212.169', '2023-12-08 18:30:37', 'Sisteme Giriş Yaptı', 'Tablet', 'FireFox', NULL, NULL, NULL),
(202, 12, '169.141.212.169', '2023-12-09 05:05:37', 'Sistemden Çıkış Yaptı', 'Tablet', 'FireFox', NULL, NULL, NULL),
(203, 4, '162.231.30.119', '2023-12-20 11:48:09', 'Sisteme Giriş Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(204, 4, '162.231.30.119', '2023-12-20 17:01:09', 'Sistemden Çıkış Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(205, 3, '124.152.128.216', '2023-12-16 06:43:22', 'Sisteme Giriş Yaptı', 'Mobile', 'Safari', NULL, NULL, NULL),
(206, 3, '124.152.128.216', '2023-12-16 09:43:22', 'Sistemden Çıkış Yaptı', 'Mobile', 'Safari', NULL, NULL, NULL),
(207, 5, '44.4.226.229', '2023-12-08 07:14:32', 'Sisteme Giriş Yaptı', 'Tablet', 'Opera', NULL, NULL, NULL),
(208, 5, '44.4.226.229', '2023-12-08 07:18:32', 'Sistemden Çıkış Yaptı', 'Tablet', 'Opera', NULL, NULL, NULL),
(209, 5, '::1', '2023-12-31 10:31:24', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(210, 5, '::1', '2023-12-31 10:31:30', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(211, 11, '73.143.115.9', '2023-12-22 05:53:10', 'Sisteme Giriş Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(212, 11, '73.143.115.9', '2023-12-23 04:32:10', 'Sistemden Çıkış Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(213, 9, '220.166.215.26', '2023-12-24 23:16:19', 'Sisteme Giriş Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(214, 9, '220.166.215.26', '2023-12-25 16:22:19', 'Sistemden Çıkış Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(215, 4, '162.231.30.119', '2023-12-08 12:09:36', 'Sisteme Giriş Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(216, 4, '162.231.30.119', '2023-12-09 08:28:36', 'Sistemden Çıkış Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(217, 4, '162.231.30.119', '2023-12-06 09:43:40', 'Sisteme Giriş Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(218, 4, '162.231.30.119', '2023-12-07 01:26:40', 'Sistemden Çıkış Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(219, 10, '156.18.44.19', '2023-12-30 08:34:36', 'Sisteme Giriş Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(220, 10, '156.18.44.19', '2023-12-31 08:10:36', 'Sistemden Çıkış Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(221, 5, '44.4.226.229', '2023-12-31 15:52:04', 'Sisteme Giriş Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(222, 5, '44.4.226.229', '2024-01-01 09:27:04', 'Sistemden Çıkış Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(223, 12, '169.141.212.169', '2024-01-01 00:28:59', 'Sisteme Giriş Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(224, 12, '169.141.212.169', '2024-01-01 10:06:59', 'Sistemden Çıkış Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(225, 12, '169.141.212.169', '2023-12-17 15:42:12', 'Sisteme Giriş Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(226, 12, '169.141.212.169', '2023-12-18 07:07:12', 'Sistemden Çıkış Yaptı', 'Mobile', 'Opera', NULL, NULL, NULL),
(227, 10, '156.18.44.19', '2023-12-07 05:12:04', 'Sisteme Giriş Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(228, 10, '156.18.44.19', '2023-12-07 10:23:04', 'Sistemden Çıkış Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(229, 11, '73.143.115.9', '2023-12-20 05:45:06', 'Sisteme Giriş Yaptı', 'Mobile', 'Safari', NULL, NULL, NULL),
(230, 11, '73.143.115.9', '2023-12-20 22:49:06', 'Sistemden Çıkış Yaptı', 'Mobile', 'Safari', NULL, NULL, NULL),
(231, 9, '220.166.215.26', '2023-12-13 14:20:18', 'Sisteme Giriş Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(232, 9, '220.166.215.26', '2023-12-13 19:26:18', 'Sistemden Çıkış Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(233, 10, '156.18.44.19', '2023-12-26 02:28:43', 'Sisteme Giriş Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(234, 10, '156.18.44.19', '2023-12-26 05:32:43', 'Sistemden Çıkış Yaptı', 'Mobile', 'Chrome', NULL, NULL, NULL),
(235, 9, '220.166.215.26', '2023-12-06 10:25:54', 'Sisteme Giriş Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(236, 9, '220.166.215.26', '2023-12-07 05:47:54', 'Sistemden Çıkış Yaptı', 'Mobile', 'FireFox', NULL, NULL, NULL),
(237, 10, '156.18.44.19', '2023-12-29 17:17:33', 'Sisteme Giriş Yaptı', 'Mobile', 'Safari', NULL, NULL, NULL),
(238, 10, '156.18.44.19', '2023-12-30 14:42:33', 'Sistemden Çıkış Yaptı', 'Mobile', 'Safari', NULL, NULL, NULL),
(239, 5, '44.4.226.229', '2023-12-29 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(240, 9, '220.166.215.26', '2023-12-31 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(241, 11, '73.143.115.9', '2023-12-27 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(242, 4, '162.231.30.119', '2023-12-31 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(243, 10, '156.18.44.19', '2023-12-27 16:45:30', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Safari', NULL, NULL, NULL),
(244, 9, '220.166.215.26', '2023-12-28 16:39:11', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(245, 10, '156.18.44.19', '2023-12-29 23:43:12', 'Anasayfayı Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(246, 4, '162.231.30.119', '2023-12-31 03:51:38', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(247, 12, '169.141.212.169', '2023-12-30 21:37:54', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(248, 5, '44.4.226.229', '2023-12-28 18:05:02', 'Oyunlar Sayfasını Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(249, 4, '162.231.30.119', '2023-12-30 12:23:50', 'Şirketler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(250, 9, '220.166.215.26', '2023-12-29 07:42:02', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Tablet', 'Opera', NULL, NULL, NULL),
(251, 3, '124.152.128.216', '2023-12-30 11:01:25', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Opera', NULL, NULL, NULL),
(252, 5, '44.4.226.229', '2023-12-29 21:25:57', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Edge', NULL, NULL, NULL),
(253, 5, '44.4.226.229', '2023-12-31 19:18:17', 'Şirketler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(254, 3, '44.4.226.229', '2023-12-28 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(255, 4, '220.166.215.26', '2023-12-27 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(256, 10, '73.143.115.9', '2023-12-31 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(257, 12, '162.231.30.119', '2024-01-01 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(258, 5, '44.4.226.229', '2023-12-28 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(259, 3, '220.166.215.26', '2023-12-27 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(260, 11, '73.143.115.9', '2023-12-31 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(261, 10, '162.231.30.119', '2024-01-01 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(262, 12, '44.4.226.229', '2023-12-28 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(263, 10, '220.166.215.26', '2023-12-27 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(264, 5, '73.143.115.9', '2023-12-31 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(265, 3, '162.231.30.119', '2024-01-01 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(266, 11, '44.4.226.229', '2023-12-28 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(267, 12, '220.166.215.26', '2023-12-27 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(268, 3, '73.143.115.9', '2023-12-31 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(269, 5, '162.231.30.119', '2024-01-01 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(270, 9, '44.4.226.229', '2023-12-28 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(271, 9, '220.166.215.26', '2023-12-27 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(272, 9, '73.143.115.9', '2023-12-31 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(273, 9, '162.231.30.119', '2024-01-01 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(274, 9, '44.4.226.229', '2023-12-28 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(275, 3, '220.166.215.26', '2023-12-27 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(276, 3, '73.143.115.9', '2023-12-31 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(277, 5, '162.231.30.119', '2024-01-01 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(278, 5, '44.4.226.229', '2023-12-28 13:47:19', 'Anasayfayı Ziyaret Etti', 'Tablet', 'FireFox', NULL, NULL, NULL),
(279, 5, '220.166.215.26', '2023-12-27 08:35:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(280, 5, '73.143.115.9', '2023-12-31 23:06:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(281, 5, '162.231.30.119', '2024-01-01 22:58:39', 'Şirketler Sayfasını Ziyaret Etti', 'Tablet', 'Safari', NULL, NULL, NULL),
(282, 5, '::1', '2023-12-31 12:02:37', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(283, 5, '::1', '2023-12-31 12:03:00', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(284, 5, '::1', '2023-12-31 12:04:05', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(285, 5, '::1', '2023-12-31 12:05:55', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(286, 5, '::1', '2023-12-31 12:05:57', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(287, 5, '::1', '2023-12-31 12:05:59', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(288, 5, '::1', '2023-12-31 12:06:00', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(289, 5, '44.4.226.229', '2023-12-27 19:23:04', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(290, 11, '73.143.115.9', '2023-12-27 17:19:47', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(291, 11, '73.143.115.9', '2023-12-27 15:38:34', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Opera', NULL, NULL, NULL),
(292, 4, '162.231.30.119', '2023-12-27 23:26:08', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(293, 5, '44.4.226.229', '2023-12-27 19:23:04', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(294, 11, '73.143.115.9', '2023-12-27 17:19:47', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(295, 12, '73.143.115.9', '2023-12-27 15:38:34', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Opera', NULL, NULL, NULL),
(296, 5, '162.231.30.119', '2023-12-27 22:26:08', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(297, 5, '44.4.226.229', '2023-12-27 18:23:04', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(298, 11, '73.143.115.9', '2023-12-27 16:19:47', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(299, 11, '73.143.115.9', '2023-12-27 15:38:34', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Opera', NULL, NULL, NULL),
(300, 4, '162.231.30.119', '2023-12-27 17:26:08', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(301, 5, '44.4.226.229', '2023-12-27 19:23:04', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Chrome', NULL, NULL, NULL),
(302, 11, '73.143.115.9', '2023-12-27 17:19:47', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(303, 12, '73.143.115.9', '2023-12-27 15:38:34', 'Anasayfayı Ziyaret Etti', 'Mobile', 'Opera', NULL, NULL, NULL),
(304, 4, '162.231.30.119', '2023-12-27 12:26:08', 'Anasayfayı Ziyaret Etti', 'Mobile', 'FireFox', NULL, NULL, NULL),
(305, 5, '::1', '2023-12-31 12:08:16', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(306, 5, '::1', '2023-12-31 12:08:37', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(307, 5, '::1', '2023-12-31 12:09:57', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(308, 5, '::1', '2023-12-31 12:10:01', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(309, 5, '::1', '2023-12-31 12:10:01', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(310, 5, '::1', '2023-12-31 12:10:03', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(311, 5, '::1', '2023-12-31 12:10:15', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(312, 5, '::1', '2023-12-31 12:14:01', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(313, 5, '::1', '2023-12-31 12:14:05', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(314, 3, '::1', '2023-12-31 12:14:10', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(315, 3, '::1', '2023-12-31 12:14:10', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(316, 3, '::1', '2023-12-31 12:14:11', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(317, 3, '::1', '2023-12-31 12:14:15', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(318, 3, '::1', '2023-12-31 12:14:16', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(319, 3, '::1', '2023-12-31 12:14:20', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(320, 3, '::1', '2023-12-31 12:14:24', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(321, 5, '::1', '2023-12-31 12:14:56', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(322, 5, '::1', '2023-12-31 12:14:56', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(323, 5, '::1', '2023-12-31 12:14:58', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(324, 5, '::1', '2023-12-31 12:15:03', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(325, 3, '::1', '2023-12-31 12:15:09', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(326, 3, '::1', '2023-12-31 12:15:09', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(327, 3, '::1', '2023-12-31 12:15:11', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(328, 3, '::1', '2023-12-31 12:15:27', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(329, 5, '::1', '2023-12-31 12:17:28', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(330, 5, '::1', '2023-12-31 12:17:28', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(331, 5, '::1', '2023-12-31 12:17:32', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(332, 5, '::1', '2023-12-31 12:17:40', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(333, 5, '::1', '2023-12-31 12:23:11', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(334, 5, '::1', '2023-12-31 12:23:15', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(335, 5, '::1', '2023-12-31 12:23:32', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(336, 5, '::1', '2023-12-31 12:28:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(337, 5, '::1', '2023-12-31 12:28:35', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(338, 5, '::1', '2023-12-31 12:34:02', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(339, 5, '::1', '2023-12-31 12:34:50', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(340, 5, '::1', '2023-12-31 12:34:56', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(341, 5, '::1', '2023-12-31 12:34:58', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(342, 5, '::1', '2023-12-31 12:35:32', 'ID\'si 2 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(343, 5, '::1', '2023-12-31 12:35:32', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(344, 5, '::1', '2023-12-31 12:35:47', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(345, 5, '::1', '2023-12-31 12:35:54', 'ID\'si 4 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(346, 5, '::1', '2023-12-31 12:35:54', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(347, 5, '::1', '2023-12-31 12:36:33', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(348, 5, '::1', '2023-12-31 14:31:31', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(349, 5, '::1', '2023-12-31 14:31:31', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(350, 5, '::1', '2023-12-31 14:31:34', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(351, 5, '::1', '2023-12-31 14:31:37', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(352, 5, '::1', '2023-12-31 14:31:39', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(353, 5, '::1', '2023-12-31 14:31:40', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(354, 5, '::1', '2023-12-31 14:31:40', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(355, 5, '::1', '2023-12-31 14:31:43', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(356, 5, '::1', '2023-12-31 14:31:45', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(357, 5, '::1', '2023-12-31 14:31:46', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(358, 5, '::1', '2023-12-31 14:32:01', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(359, 5, '::1', '2023-12-31 14:32:02', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(360, 5, '::1', '2023-12-31 14:32:10', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(361, 5, '::1', '2023-12-31 14:34:11', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(362, 5, '::1', '2023-12-31 14:35:49', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(363, 5, '::1', '2023-12-31 14:35:52', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(364, 5, '::1', '2023-12-31 14:41:07', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(365, 5, '::1', '2023-12-31 14:42:10', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(366, 5, '::1', '2023-12-31 14:43:45', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(367, 3, '::1', '2023-12-31 14:43:49', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(368, 3, '::1', '2023-12-31 14:43:49', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(369, 3, '::1', '2023-12-31 14:43:51', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(370, 3, '::1', '2023-12-31 14:43:53', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(371, 3, '::1', '2023-12-31 14:43:56', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(372, 3, '::1', '2023-12-31 14:43:58', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(373, 5, '::1', '2023-12-31 14:44:40', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(374, 5, '::1', '2023-12-31 14:44:40', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(375, 5, '::1', '2023-12-31 14:44:42', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(376, 5, '::1', '2023-12-31 14:45:19', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(377, 5, '::1', '2023-12-31 14:45:37', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(378, 5, '::1', '2023-12-31 14:45:40', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(379, 5, '::1', '2023-12-31 14:54:32', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(380, 5, '::1', '2023-12-31 14:54:38', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(381, 5, '::1', '2023-12-31 14:54:41', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(382, 5, '::1', '2023-12-31 14:54:43', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(383, 5, '::1', '2023-12-31 14:55:14', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(384, 5, '::1', '2023-12-31 14:55:19', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(385, 5, '::1', '2023-12-31 14:55:23', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(386, 5, '::1', '2023-12-31 14:55:35', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(387, 5, '::1', '2023-12-31 14:55:39', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(388, 5, '::1', '2023-12-31 14:56:02', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(389, 5, '::1', '2023-12-31 14:56:06', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(390, 5, '::1', '2023-12-31 14:56:06', 'ID\'si 3 olan şirketin bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(391, 5, '::1', '2023-12-31 14:56:09', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(392, 5, '::1', '2023-12-31 15:13:08', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(393, 5, '::1', '2023-12-31 15:13:30', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(394, 5, '::1', '2023-12-31 15:14:06', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(395, 5, '::1', '2023-12-31 15:14:39', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(396, 5, '::1', '2023-12-31 15:14:44', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(397, 5, '::1', '2023-12-31 15:15:32', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(398, 5, '::1', '2023-12-31 15:15:39', 'ID\'si 3 olan şirketin bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(399, 5, '::1', '2023-12-31 15:15:39', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(400, 5, '::1', '2023-12-31 15:15:44', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(401, 5, '::1', '2023-12-31 15:21:47', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(402, 5, '::1', '2023-12-31 15:21:56', 'ID\'si 54 olan geliştiricinin bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(403, 5, '::1', '2023-12-31 15:21:56', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(404, 5, '::1', '2023-12-31 15:22:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(405, 5, '::1', '2023-12-31 15:22:27', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(406, 5, '::1', '2023-12-31 15:22:37', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(407, 5, '::1', '2023-12-31 17:21:12', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(408, 5, '::1', '2023-12-31 17:21:12', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(409, 5, '::1', '2023-12-31 17:21:20', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(410, 5, '::1', '2023-12-31 17:21:21', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(411, 5, '::1', '2023-12-31 17:21:24', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(412, 5, '::1', '2023-12-31 18:20:57', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(413, 5, '::1', '2023-12-31 18:21:08', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(414, 5, '::1', '2023-12-31 18:21:20', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(415, 5, '::1', '2023-12-31 18:21:24', 'PlayStation dağıtıcısını sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(416, 5, '::1', '2023-12-31 18:21:24', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(417, 5, '::1', '2023-12-31 18:21:27', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(418, 5, '::1', '2023-12-31 18:21:41', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(419, 5, '::1', '2023-12-31 18:21:48', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(420, 5, '::1', '2023-12-31 18:22:02', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(421, 5, '::1', '2023-12-31 18:22:05', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(422, 5, '::1', '2023-12-31 18:22:08', 'Rust oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(423, 5, '::1', '2023-12-31 18:22:08', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(424, 5, '::1', '2023-12-31 18:22:11', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(425, 5, '::1', '2023-12-31 18:22:22', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(426, 5, '::1', '2023-12-31 18:52:23', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(427, 5, '::1', '2023-12-31 18:52:39', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(428, 5, '::1', '2023-12-31 18:52:44', 'Fallout 76 oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(429, 5, '::1', '2023-12-31 18:52:44', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(430, 5, '::1', '2023-12-31 18:57:27', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(431, 5, '::1', '2023-12-31 18:57:31', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(432, 5, '::1', '2023-12-31 18:57:31', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(433, 5, '::1', '2023-12-31 18:58:15', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(434, 5, '::1', '2023-12-31 18:58:16', '505 Games geliştiricisini sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(435, 5, '::1', '2023-12-31 18:58:16', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(436, 5, '::1', '2023-12-31 19:00:21', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(437, 5, '::1', '2023-12-31 19:00:23', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(438, 5, '::1', '2023-12-31 19:00:24', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(439, 5, '::1', '2023-12-31 19:00:33', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(440, 5, '::1', '2023-12-31 19:46:23', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(441, 5, '::1', '2023-12-31 19:48:29', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(442, 5, '::1', '2023-12-31 19:48:56', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(443, 5, '::1', '2023-12-31 19:49:08', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(444, 5, '::1', '2023-12-31 19:49:08', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(445, 5, '::1', '2023-12-31 19:49:12', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(446, 5, '::1', '2023-12-31 19:50:15', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(447, 5, '::1', '2023-12-31 19:50:15', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(448, 5, '::1', '2023-12-31 19:50:25', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(449, 5, '::1', '2023-12-31 19:50:25', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(450, 5, '::1', '2023-12-31 19:52:52', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(451, 5, '::1', '2023-12-31 19:53:00', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(452, 5, '::1', '2023-12-31 19:53:21', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(453, 5, '::1', '2023-12-31 19:53:29', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(454, 5, '::1', '2023-12-31 19:55:02', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(455, 5, '::1', '2023-12-31 19:55:11', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(456, 5, '::1', '2023-12-31 19:56:10', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(457, 5, '::1', '2023-12-31 19:56:18', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(458, 5, '::1', '2023-12-31 19:56:31', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(459, 5, '::1', '2023-12-31 19:56:31', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(460, 5, '::1', '2023-12-31 19:56:41', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL);
INSERT INTO `log_kayit` (`Log_ID`, `Kullanici_ID`, `K_IP`, `Tarih`, `Islem`, `Cihaz`, `Tarayici`, `card_num`, `card_tarih`, `CV2`) VALUES
(461, 5, '::1', '2023-12-31 19:59:02', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(462, 5, '::1', '2023-12-31 19:59:03', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(463, 5, '::1', '2023-12-31 19:59:05', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(464, 5, '::1', '2023-12-31 19:59:10', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(465, 5, '::1', '2023-12-31 20:00:43', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(466, 5, '::1', '2023-12-31 20:00:52', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(467, 5, '::1', '2023-12-31 20:00:52', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(468, 5, '::1', '2023-12-31 20:03:59', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(469, 5, '::1', '2023-12-31 20:04:05', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(470, 5, '::1', '2023-12-31 20:04:05', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(471, 5, '::1', '2023-12-31 20:05:11', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(472, 5, '::1', '2023-12-31 20:52:53', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(473, 5, '::1', '2023-12-31 20:52:55', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(474, 5, '::1', '2023-12-31 20:53:08', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(475, 5, '::1', '2023-12-31 20:53:08', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(476, 5, '::1', '2023-12-31 20:53:22', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(477, 5, '::1', '2023-12-31 20:53:44', 'ID\'si 4 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(478, 5, '::1', '2023-12-31 20:53:44', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(479, 5, '::1', '2023-12-31 20:53:58', 'Tom Clancy’s Rainbow Six® Extraction oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(480, 5, '::1', '2023-12-31 20:53:58', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(481, 5, '::1', '2023-12-31 20:54:47', 'Vampire Survivors oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(482, 5, '::1', '2023-12-31 20:54:47', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(483, 5, '::1', '2023-12-31 20:54:56', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(484, 5, '::1', '2023-12-31 20:55:19', 'ID\'si 3 olan şirketin bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(485, 5, '::1', '2023-12-31 20:55:19', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(486, 5, '::1', '2023-12-31 20:55:25', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(487, 5, '::1', '2023-12-31 20:55:30', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(488, 5, '::1', '2023-12-31 20:55:38', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(489, 5, '::1', '2023-12-31 20:55:42', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(490, 5, '::1', '2023-12-31 20:55:47', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(491, 5, '::1', '2023-12-31 20:55:57', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(492, 5, '::1', '2023-12-31 20:56:02', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(493, 5, '::1', '2023-12-31 20:56:03', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(494, 5, '::1', '2023-12-31 20:56:11', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(495, 5, '::1', '2023-12-31 20:56:15', '2K geliştiricisini sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(496, 5, '::1', '2023-12-31 20:56:15', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(497, 5, '::1', '2023-12-31 20:56:18', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(498, 5, '::1', '2023-12-31 20:56:31', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(499, 5, '::1', '2023-12-31 20:57:01', 'ID\'si 9 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(500, 5, '::1', '2023-12-31 20:57:07', 'ID\'si 9 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(501, 5, '::1', '2023-12-31 20:58:26', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(502, 5, '::1', '2023-12-31 21:00:11', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(503, 5, '::1', '2023-12-31 21:00:17', 'DAVE THE DIVER oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(504, 5, '::1', '2023-12-31 21:00:17', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(505, 5, '::1', '2023-12-31 21:00:36', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(506, 5, '::1', '2023-12-31 21:01:23', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(507, 5, '::1', '2023-12-31 21:01:30', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(508, 5, '::1', '2023-12-31 21:01:30', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(509, 5, '::1', '2023-12-31 21:01:49', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(510, 5, '::1', '2023-12-31 21:01:56', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(511, 5, '::1', '2023-12-31 21:01:56', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(512, 5, '::1', '2023-12-31 21:02:12', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(513, 3, '::1', '2023-12-31 21:02:41', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(514, 3, '::1', '2023-12-31 21:02:41', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(515, 3, '::1', '2023-12-31 21:02:48', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(516, 3, '::1', '2023-12-31 21:02:51', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(517, 3, '::1', '2023-12-31 21:02:57', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(518, 3, '::1', '2023-12-31 21:05:06', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(519, 3, '::1', '2023-12-31 21:05:47', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(520, 3, '::1', '2023-12-31 21:05:54', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(521, 3, '::1', '2023-12-31 21:06:04', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(522, 3, '::1', '2023-12-31 21:06:06', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(523, 5, '::1', '2024-01-02 08:16:25', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(524, 5, '::1', '2024-01-02 08:16:25', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(525, 5, '::1', '2024-01-02 08:16:59', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(526, 5, '::1', '2024-01-02 08:17:04', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(527, 5, '::1', '2024-01-02 08:17:04', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(528, 5, '::1', '2024-01-02 08:17:18', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(529, 3, '::1', '2024-01-02 08:17:22', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(530, 3, '::1', '2024-01-02 08:17:22', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(531, 3, '::1', '2024-01-02 08:18:21', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(532, 3, '::1', '2024-01-02 08:18:33', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(533, 3, '::1', '2024-01-02 08:18:57', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(534, 3, '::1', '2024-01-02 08:19:06', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(535, 3, '::1', '2024-01-02 08:19:17', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(536, 3, '::1', '2024-01-02 08:19:27', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(537, 3, '::1', '2024-01-02 08:20:31', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(538, 3, '::1', '2024-01-02 08:20:39', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(539, 3, '::1', '2024-01-02 08:20:39', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(540, 3, '::1', '2024-01-02 08:20:55', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(541, 5, '::1', '2024-01-02 08:21:00', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(542, 5, '::1', '2024-01-02 08:21:01', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(543, 5, '::1', '2024-01-02 08:21:06', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(544, 5, '::1', '2024-01-02 08:22:58', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(545, 5, '::1', '2024-01-02 08:23:06', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(546, 5, '::1', '2024-01-02 10:45:36', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(547, 5, '::1', '2024-01-02 10:45:36', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(548, 5, '::1', '2024-01-02 10:46:02', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(549, 5, '::1', '2024-01-02 10:47:00', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(550, 5, '::1', '2024-01-02 10:47:14', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(551, 5, '::1', '2024-01-02 10:47:19', 'Yes, Your Grace oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(552, 5, '::1', '2024-01-02 10:47:19', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(553, 5, '::1', '2024-01-02 10:47:27', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(554, 5, '::1', '2024-01-02 10:47:44', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(555, 5, '::1', '2024-01-02 10:47:53', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(556, 5, '::1', '2024-01-02 10:47:58', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(557, 5, '::1', '2024-01-02 10:48:38', 'ID\'si 11 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(558, 5, '::1', '2024-01-02 10:50:43', 'ID\'si 11 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(559, 5, '::1', '2024-01-02 10:50:54', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(560, 3, '::1', '2024-01-02 10:51:04', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(561, 3, '::1', '2024-01-02 10:51:04', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(562, 3, '::1', '2024-01-02 10:51:09', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(563, 3, '::1', '2024-01-02 10:51:12', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(564, 3, '::1', '2024-01-02 10:51:15', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(565, 3, '::1', '2024-01-02 10:51:24', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(566, 3, '::1', '2024-01-02 10:51:24', 'Kullanıcı ELDEN RING oyununu satın aldı.', 'Desktop', 'Opera', '3156 5651 6516 5165', '16/51', '165'),
(567, 3, '::1', '2024-01-02 10:51:28', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(568, 3, '::1', '2024-01-02 10:51:37', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(569, 3, '::1', '2024-01-02 10:51:40', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(570, 5, '::1', '2024-01-02 10:51:44', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(571, 5, '::1', '2024-01-02 10:51:44', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(572, 5, '::1', '2024-01-02 10:53:47', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(573, 5, '::1', '2024-01-02 10:54:00', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(574, 5, '::1', '2024-01-02 10:54:05', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(575, 5, '::1', '2024-01-02 10:54:05', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(576, 5, '::1', '2024-01-02 10:54:13', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(577, 5, '::1', '2024-01-02 13:27:50', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(578, 5, '::1', '2024-01-02 13:27:50', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(579, 5, '::1', '2024-01-02 13:27:58', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(580, 5, '::1', '2024-01-02 13:28:01', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(581, 3, '::1', '2024-01-02 13:28:04', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(582, 3, '::1', '2024-01-02 13:28:04', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(583, 3, '::1', '2024-01-02 13:28:07', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(584, 3, '::1', '2024-01-02 13:28:48', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(585, 5, '::1', '2024-01-02 14:25:46', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(586, 5, '::1', '2024-01-02 14:25:46', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(587, 5, '::1', '2024-01-02 14:25:52', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(588, 5, '::1', '2024-01-02 14:25:55', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(589, 5, '::1', '2024-01-02 14:25:57', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(590, 5, '::1', '2024-01-02 14:26:06', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(591, 5, '::1', '2024-01-02 14:27:12', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(592, 5, '::1', '2024-01-02 14:27:12', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(593, 5, '::1', '2024-01-02 14:27:17', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(594, 5, '::1', '2024-01-02 14:28:10', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(595, 5, '::1', '2024-01-02 14:28:13', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(596, 5, '::1', '2024-01-02 14:28:17', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(597, 5, '::1', '2024-01-02 14:28:28', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(598, 5, '::1', '2024-01-02 14:28:43', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(599, 5, '::1', '2024-01-02 14:28:49', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(600, 5, '::1', '2024-01-02 14:28:49', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(601, 5, '::1', '2024-01-02 14:28:57', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(602, 5, '::1', '2024-01-02 14:29:02', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(603, 5, '::1', '2024-01-02 14:29:02', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(604, 5, '::1', '2024-01-02 14:29:18', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(605, 5, '::1', '2024-01-02 14:29:21', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(606, 5, '::1', '2024-01-02 14:29:23', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(607, 5, '::1', '2024-01-02 14:29:25', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(608, 5, '::1', '2024-01-02 14:29:26', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(609, 5, '::1', '2024-01-02 14:29:27', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(610, 5, '::1', '2024-01-02 14:29:42', 'ID\'si 12 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(611, 5, '::1', '2024-01-02 14:29:55', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(612, 5, '::1', '2024-01-02 14:29:57', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(613, 5, '::1', '2024-01-02 14:29:58', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(614, 5, '::1', '2024-01-02 14:30:00', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(615, 5, '::1', '2024-01-02 14:30:01', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(616, 5, '::1', '2024-01-02 14:30:03', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(617, 5, '::1', '2024-01-02 14:30:06', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(618, 5, '::1', '2024-01-02 14:30:08', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(619, 5, '::1', '2024-01-02 14:30:09', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(620, 5, '::1', '2024-01-02 14:30:10', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(621, 5, '::1', '2024-01-02 14:30:18', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(622, 5, '::1', '2024-01-02 14:30:19', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(623, 5, '::1', '2024-01-02 14:30:21', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(624, 5, '::1', '2024-01-02 14:30:22', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(625, 5, '::1', '2024-01-02 14:30:31', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(626, 5, '::1', '2024-01-02 14:30:32', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(627, 5, '::1', '2024-01-02 14:30:33', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(628, 5, '::1', '2024-01-02 14:30:35', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(629, 5, '::1', '2024-01-02 14:30:36', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(630, 5, '::1', '2024-01-02 14:30:38', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(631, 5, '::1', '2024-01-02 14:30:39', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(632, 5, '::1', '2024-01-02 14:30:40', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(633, 5, '::1', '2024-01-02 14:30:41', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(634, 5, '::1', '2024-01-02 14:30:42', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(635, 5, '::1', '2024-01-02 17:54:58', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(636, 5, '::1', '2024-01-02 17:54:58', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(637, 5, '::1', '2024-01-02 17:55:01', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(638, 14, '::1', '2024-01-02 17:57:53', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(639, 14, '::1', '2024-01-02 17:57:53', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(640, 14, '::1', '2024-01-02 17:58:59', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(641, 14, '::1', '2024-01-02 18:00:28', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(642, 14, '::1', '2024-01-02 18:00:28', 'Kullanıcı FC24 oyununu satın aldı.', 'Desktop', 'Opera', '6516 5165 1651 6516', '23/65', '651'),
(643, 14, '::1', '2024-01-02 18:00:32', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(644, 14, '::1', '2024-01-02 18:00:53', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(645, 14, '::1', '2024-01-02 18:04:19', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(646, 14, '::1', '2024-01-02 18:05:42', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(647, 14, '::1', '2024-01-02 18:07:13', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(648, 14, '::1', '2024-01-02 18:07:25', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(649, 14, '::1', '2024-01-02 18:07:45', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(650, 14, '::1', '2024-01-02 18:07:45', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(651, 14, '::1', '2024-01-02 18:07:58', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(652, 5, '::1', '2024-01-02 18:08:02', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(653, 5, '::1', '2024-01-02 18:08:02', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(654, 5, '::1', '2024-01-02 18:08:08', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(655, 5, '::1', '2024-01-02 18:09:28', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(656, 5, '::1', '2024-01-02 18:10:01', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(657, 5, '::1', '2024-01-02 18:10:09', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(658, 5, '::1', '2024-01-02 18:10:14', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(659, 5, '::1', '2024-01-02 18:10:34', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(660, 5, '::1', '2024-01-02 18:10:34', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(661, 5, '::1', '2024-01-02 18:10:44', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(662, 5, '::1', '2024-01-02 18:10:44', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(663, 5, '::1', '2024-01-02 18:10:55', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(664, 5, '::1', '2024-01-02 18:11:22', 'ID\'si 3 olan şirketin bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(665, 5, '::1', '2024-01-02 18:11:22', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(666, 5, '::1', '2024-01-02 18:11:31', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(667, 5, '::1', '2024-01-02 18:12:01', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(668, 5, '::1', '2024-01-02 18:12:11', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(669, 5, '::1', '2024-01-02 18:15:40', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(670, 4, '::1', '2024-01-03 09:40:58', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(671, 4, '::1', '2024-01-03 09:40:58', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(672, 4, '::1', '2024-01-03 09:41:23', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(673, 4, '::1', '2024-01-03 09:41:37', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(674, 4, '::1', '2024-01-03 09:43:40', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(675, 4, '::1', '2024-01-03 09:44:28', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(676, 4, '::1', '2024-01-03 09:45:40', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(677, 4, '::1', '2024-01-03 09:47:03', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(678, 4, '::1', '2024-01-03 09:47:13', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(679, 4, '::1', '2024-01-03 09:47:13', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(680, 4, '::1', '2024-01-03 09:47:32', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(681, 5, '::1', '2024-01-03 09:47:38', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(682, 5, '::1', '2024-01-03 09:47:38', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(683, 5, '::1', '2024-01-03 09:47:46', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(684, 5, '::1', '2024-01-03 09:47:56', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(685, 3, '::1', '2024-01-03 09:48:00', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(686, 3, '::1', '2024-01-03 09:48:00', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(687, 3, '::1', '2024-01-03 09:48:02', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(688, 3, '::1', '2024-01-03 09:48:09', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(689, 3, '::1', '2024-01-03 09:48:25', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(690, 3, '::1', '2024-01-03 09:48:32', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(691, 3, '::1', '2024-01-03 09:48:44', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(692, 5, '::1', '2024-01-03 09:48:48', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(693, 5, '::1', '2024-01-03 09:48:48', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(694, 5, '::1', '2024-01-03 09:48:55', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(695, 5, '::1', '2024-01-03 11:38:21', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(696, 5, '::1', '2024-01-03 11:38:21', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(697, 5, '::1', '2024-01-03 11:38:47', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(698, 5, '::1', '2024-01-03 11:39:22', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(699, 5, '::1', '2024-01-03 11:39:23', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(700, 5, '::1', '2024-01-03 11:40:01', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(701, 5, '::1', '2024-01-03 11:40:37', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(702, 5, '::1', '2024-01-03 11:42:33', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(703, 3, '::1', '2024-01-03 11:42:38', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(704, 3, '::1', '2024-01-03 11:42:38', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(705, 3, '::1', '2024-01-03 11:42:42', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(706, 3, '::1', '2024-01-03 11:42:54', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(707, 3, '::1', '2024-01-03 11:51:46', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(708, 3, '::1', '2024-01-03 11:51:49', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(709, 5, '::1', '2024-01-03 11:51:54', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(710, 5, '::1', '2024-01-03 11:51:54', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(711, 5, '::1', '2024-01-03 11:52:12', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(712, 5, '::1', '2024-01-03 11:52:49', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(713, 5, '::1', '2024-01-03 11:52:49', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(714, 5, '::1', '2024-01-03 11:52:52', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(715, 5, '::1', '2024-01-03 11:54:06', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(716, 5, '::1', '2024-01-03 11:54:33', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(717, 5, '::1', '2024-01-03 11:55:11', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(718, 5, '::1', '2024-01-03 11:56:11', 'ID\'si 14 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(719, 5, '::1', '2024-01-03 11:56:46', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(720, 5, '::1', '2024-01-03 11:56:55', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(721, 5, '::1', '2024-01-03 11:56:55', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(722, 5, '::1', '2024-01-03 11:57:06', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(723, 5, '::1', '2024-01-03 12:00:11', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(724, 5, '::1', '2024-01-03 12:00:11', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(725, 5, '::1', '2024-01-03 12:01:09', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(726, 5, '::1', '2024-01-03 12:01:27', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(727, 5, '::1', '2024-01-03 12:01:27', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(728, 5, '::1', '2024-01-03 12:05:30', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(729, 3, '::1', '2024-01-03 12:05:55', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(730, 3, '::1', '2024-01-03 12:05:55', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(731, 3, '::1', '2024-01-03 12:06:04', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(732, 3, '::1', '2024-01-03 12:06:05', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(733, 3, '::1', '2024-01-03 12:06:10', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(734, 3, '::1', '2024-01-03 12:06:10', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(735, 3, '::1', '2024-01-03 12:06:15', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(736, 3, '::1', '2024-01-03 12:06:41', 'Kullanıcı ELDEN RING oyununu satın aldı.', 'Desktop', 'Opera', '5258 2852 8528 5285', '85/28', '852'),
(737, 3, '::1', '2024-01-03 12:06:41', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(738, 3, '::1', '2024-01-03 12:06:57', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(739, 3, '::1', '2024-01-03 12:07:02', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(740, 5, '::1', '2024-01-03 12:07:06', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(741, 5, '::1', '2024-01-03 12:07:06', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(742, 5, '::1', '2024-01-03 12:07:32', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(743, 5, '::1', '2024-01-03 12:07:59', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(744, 5, '::1', '2024-01-03 12:17:02', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(745, 5, '::1', '2024-01-03 12:17:02', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(746, 5, '::1', '2024-01-03 12:17:21', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(747, 5, '::1', '2024-01-03 12:17:35', 'Far Cry 6 oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(748, 5, '::1', '2024-01-03 12:17:35', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(749, 5, '::1', '2024-01-03 12:18:25', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(750, 5, '::1', '2024-01-03 12:19:13', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(751, 5, '::1', '2024-01-03 12:20:05', 'ID\'si 14 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(752, 5, '::1', '2024-01-03 12:22:22', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(753, 5, '::1', '2024-01-03 12:22:32', 'Kendi Bilgilerini Güncelledi', 'Desktop', 'Opera', NULL, NULL, NULL),
(754, 5, '::1', '2024-01-03 12:22:42', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(755, 5, '::1', '2024-01-03 12:22:42', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(756, 5, '::1', '2024-01-03 12:22:55', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(757, 5, '::1', '2024-01-03 12:30:32', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(758, 5, '::1', '2024-01-03 12:30:32', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(759, 5, '::1', '2024-01-03 12:31:06', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(760, 5, '::1', '2024-01-03 12:31:48', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(761, 5, '::1', '2024-01-03 12:33:01', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(762, 3, '::1', '2024-01-03 12:33:05', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(763, 3, '::1', '2024-01-03 12:33:05', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(764, 3, '::1', '2024-01-03 12:33:11', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(765, 3, '::1', '2024-01-03 12:33:27', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(766, 3, '::1', '2024-01-03 12:33:38', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(767, 5, '::1', '2024-01-03 12:35:04', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(768, 5, '::1', '2024-01-03 12:35:04', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(769, 5, '::1', '2024-01-03 12:35:36', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(770, 5, '::1', '2024-01-03 12:36:00', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(771, 5, '::1', '2024-01-03 12:36:00', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(772, 5, '::1', '2024-01-03 12:36:43', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(773, 5, '::1', '2024-01-03 12:37:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(774, 5, '::1', '2024-01-03 12:39:35', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(775, 3, '::1', '2024-01-03 12:39:41', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(776, 3, '::1', '2024-01-03 12:39:41', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(777, 3, '::1', '2024-01-03 12:39:45', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(778, 3, '::1', '2024-01-03 12:39:50', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(779, 3, '::1', '2024-01-03 12:39:50', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(780, 3, '::1', '2024-01-03 12:39:53', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(781, 3, '::1', '2024-01-03 12:40:12', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(782, 3, '::1', '2024-01-03 12:40:30', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(783, 3, '::1', '2024-01-03 12:40:31', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(784, 5, '::1', '2024-01-03 12:52:48', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(785, 5, '::1', '2024-01-03 12:52:48', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(786, 5, '::1', '2024-01-03 12:53:17', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(787, 5, '::1', '2024-01-03 12:55:07', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(788, 5, '::1', '2024-01-03 13:35:12', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(789, 5, '::1', '2024-01-03 13:35:12', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(790, 5, '::1', '2024-01-03 13:36:04', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(791, 5, '::1', '2024-01-03 13:36:30', 'Dying Light 2 oyununu sildi', 'Desktop', 'Opera', NULL, NULL, NULL),
(792, 5, '::1', '2024-01-03 13:36:30', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(793, 5, '::1', '2024-01-03 13:36:40', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(794, 5, '::1', '2024-01-03 13:36:40', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(795, 5, '::1', '2024-01-03 13:37:12', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(796, 5, '::1', '2024-01-03 13:37:34', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(797, 5, '::1', '2024-01-03 13:38:49', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(798, 5, '::1', '2024-01-03 13:43:59', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(799, 5, '::1', '2024-01-03 13:43:59', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(800, 5, '::1', '2024-01-03 13:44:30', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(801, 5, '::1', '2024-01-03 13:44:40', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(802, 5, '::1', '2024-01-03 13:44:40', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(803, 5, '::1', '2024-01-03 13:47:29', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(804, 5, '::1', '2024-01-03 14:09:38', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(805, 5, '::1', '2024-01-03 14:09:38', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(806, 5, '::1', '2024-01-03 14:09:45', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(807, 5, '::1', '2024-01-04 19:14:42', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(808, 5, '::1', '2024-01-05 08:17:50', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(809, 5, '::1', '2024-01-05 08:17:51', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(810, 5, '::1', '2024-01-05 08:29:00', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(811, 5, '::1', '2024-01-05 08:29:08', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(812, 5, '::1', '2024-01-05 10:47:29', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(813, 5, '::1', '2024-01-05 10:47:29', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(814, 5, '::1', '2024-01-05 10:47:46', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(815, 5, '::1', '2024-01-05 10:48:01', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(816, 5, '::1', '2024-01-05 10:48:01', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(817, 5, '::1', '2024-01-05 10:48:03', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(818, 5, '::1', '2024-01-05 10:48:54', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(819, 5, '::1', '2024-01-05 10:49:23', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(820, 5, '::1', '2024-01-05 10:51:05', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(821, 5, '::1', '2024-01-05 10:51:08', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(822, 3, '::1', '2024-01-05 12:52:13', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(823, 3, '::1', '2024-01-05 12:52:13', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(824, 3, '::1', '2024-01-05 12:52:41', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(825, 3, '::1', '2024-01-05 12:52:59', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(826, 3, '::1', '2024-01-05 12:53:29', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(827, 3, '::1', '2024-01-05 12:53:29', 'Kullanıcı ELDEN RING oyununu satın aldı.', 'Desktop', 'Opera', '5466 6456 5465 6456', '75/87', '786'),
(828, 3, '::1', '2024-01-05 12:53:36', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(829, 3, '::1', '2024-01-05 12:55:47', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(830, 3, '::1', '2024-01-05 12:56:53', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(831, 3, '::1', '2024-01-05 12:57:39', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(832, 5, '::1', '2024-01-05 12:57:53', 'Sisteme Giriş Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL),
(833, 5, '::1', '2024-01-05 12:57:53', 'Anasayfayı Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(834, 5, '::1', '2024-01-05 12:58:18', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(835, 5, '::1', '2024-01-05 12:58:52', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(836, 5, '::1', '2024-01-05 12:58:52', 'ID\'si 1 olan oyunun bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(837, 5, '::1', '2024-01-05 12:58:56', 'Oyunlar Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(838, 5, '::1', '2024-01-05 12:59:10', 'Şirketler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(839, 5, '::1', '2024-01-05 12:59:16', 'Geliştiriciler Sayfasını Ziyaret Etti', 'Desktop', 'Opera', NULL, NULL, NULL),
(840, 5, '::1', '2024-01-05 12:59:57', 'ID\'si 3 olan kullanıcının bilgilerini güncelledi.', 'Desktop', 'Opera', NULL, NULL, NULL),
(841, 5, '::1', '2024-01-05 13:08:33', 'Sistemden Çıkış Yaptı', 'Desktop', 'Opera', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oyun`
--

CREATE TABLE `oyun` (
  `Oyun_ID` int(11) NOT NULL,
  `Oyun_adi` varchar(50) NOT NULL,
  `Gelistirici_ID` int(11) NOT NULL,
  `dagitici_ID` int(11) NOT NULL,
  `Kategori_ID` int(11) NOT NULL,
  `Oyun_fiyati` float NOT NULL,
  `cikis_tarihi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `oyun`
--

INSERT INTO `oyun` (`Oyun_ID`, `Oyun_adi`, `Gelistirici_ID`, `dagitici_ID`, `Kategori_ID`, `Oyun_fiyati`, `cikis_tarihi`) VALUES
(1, 'ELDEN RING', 3, 1, 18, 49.99, '2022-02-25'),
(3, 'Risk Of Rain 2', 20, 2, 1, 12.49, '2019-03-28'),
(4, 'Sekiro', 3, 1, 18, 65.55, '2019-03-22'),
(5, 'The Elder Scrolls V Skyrim', 2, 1, 9, 23.99, '2011-11-11'),
(6, 'FC24', 15, 5, 20, 69.99, '2023-09-29'),
(8, 'Far Cry 6', 16, 3, 16, 47.99, '2021-10-07'),
(9, 'Outlast', 29, 1, 4, 10.49, '2013-09-04'),
(10, 'Red Dead Redemption 2', 14, 1, 22, 59.99, '2018-10-26'),
(11, 'Dying Light 2', 22, 2, 16, 39.99, '2022-02-04'),
(12, 'Assassins Creed Valhalla', 16, 3, 9, 47.99, '2020-11-10'),
(13, 'Assassins Creed Odyssey', 16, 3, 9, 47.99, '2018-11-02'),
(14, 'Assassins Creed Origins', 16, 3, 9, 47.99, '2017-11-27'),
(15, 'Sea of Thieves', 23, 1, 10, 39.99, '2018-03-20'),
(16, 'NARUTO SHIPPUDEN Ultimate Ninja STORM 4', 30, 1, 19, 12.99, '2015-12-17'),
(17, 'Forza Horizon 4', 25, 1, 21, 19.99, '2018-09-28'),
(18, 'Cyberpunk 2077', 19, 1, 9, 44.99, '2020-12-10'),
(19, 'Need for Speed Unbound', 15, 5, 21, 69.99, '2022-11-29'),
(20, 'Darkest Dungeon', 37, 2, 12, 12.49, '2015-02-03'),
(23, 'Assassin\'s Creed Unity', 16, 3, 1, 23.99, '2014-11-11'),
(24, 'Assassin’s Creed® Rogue', 16, 3, 1, 15.99, '2014-11-11'),
(25, 'Assassin\'s Creed® Syndicate', 16, 3, 16, 23.99, '2015-11-23'),
(26, 'Assassin\'s Creed Black Flag', 16, 3, 16, 31.99, '2013-10-19'),
(27, 'Assassin\'s Creed Director\'s Cut Edition', 16, 3, 16, 15.99, '2008-04-20'),
(28, 'Assassin\'s Creed 2', 16, 3, 22, 15.99, '2009-10-17'),
(29, 'Assassin\'s Creed® III Remastered', 16, 3, 1, 31.99, '2012-10-30'),
(30, 'Assassin\'s Creed Freedom Cry', 16, 3, 1, 11.99, '2013-12-17'),
(31, 'Assassin’s Creed® Brotherhood', 16, 3, 16, 15.99, '2010-10-16'),
(32, 'Assassin\'s Creed® Revelations', 16, 3, 22, 15.99, '2011-10-15'),
(33, 'Assassin’s Creed® Liberation HD', 16, 3, 2, 15.99, '2012-10-30'),
(35, 'JoJo\'s Bizarre Adventure All-Star Battle R', 27, 2, 19, 32.99, '2022-09-01'),
(36, 'Valheim', 28, 2, 5, 19.99, '2021-02-02'),
(37, 'The Outlast Trials', 29, 2, 4, 14.99, '2023-03-18'),
(38, 'Forza Horizon 5', 25, 1, 21, 32.78, '2021-11-01'),
(40, 'MONSTER HUNTER RISE', 30, 2, 9, 29.99, '2021-03-26'),
(41, 'Dead by Daylight', 38, 1, 4, 10.49, '2016-06-14'),
(42, 'PAYDAY 3', 32, 1, 3, 29.99, '2023-09-25'),
(44, 'Football Manager 2024', 33, 1, 3, 39.99, '2023-11-06'),
(45, 'Baldur\'s Gate 3', 34, 1, 9, 34.99, '2023-08-03'),
(46, 'Ready or Not', 35, 1, 3, 28.99, '2021-12-17'),
(48, 'Resident Evil 4', 30, 2, 7, 44.99, '2023-03-23'),
(50, 'Six Days in Fallujah', 40, 2, 6, 11.99, '2023-07-07'),
(51, 'Planet Zoo', 41, 1, 3, 20.99, '2019-11-05'),
(52, 'Cities Skylines II', 42, 2, 3, 29.99, '2023-10-17'),
(53, 'Deep Rock Galactic', 43, 1, 2, 29.99, '2018-02-28'),
(54, 'Wartales', 44, 2, 12, 17.99, '2021-12-01'),
(56, 'Sons Of The Forest', 45, 1, 5, 14.99, '2023-02-23'),
(57, 'Ghostrunner 2', 46, 2, 2, 18.99, '2023-10-26'),
(58, 'Pathfinder Wrath of the Righteous - Enhanced Edit', 47, 2, 11, 19.99, '2022-07-29'),
(59, 'DayZ', 48, 1, 10, 44.99, '2013-02-16'),
(60, 'Hearts of Iron IV', 49, 1, 11, 23.99, '2016-06-08'),
(61, 'OCTOPATH TRAVELER II', 17, 2, 1, 59.99, '2023-02-24'),
(62, 'TEKKEN 8', 24, 1, 19, 44.99, '2023-01-08'),
(63, 'Diablo® IV', 51, 4, 10, 69.99, '2023-06-05'),
(64, 'Hogwarts Legacy', 52, 2, 16, 59.99, '2023-02-16'),
(65, 'FINAL FANTASY XV WINDOWS EDITION', 17, 2, 13, 27.99, '2016-10-26'),
(66, 'SCUM', 53, 1, 5, 23.99, '2018-08-29'),
(67, 'GTFO', 54, 2, 4, 14.99, '2019-12-09'),
(68, 'Age of Empires IV Anniversary Edition', 55, 1, 11, 39.99, '2021-10-26'),
(69, 'RimWorld', 6, 1, 11, 17.99, '2013-11-04'),
(70, 'Raft', 57, 1, 5, 19.99, '2018-05-13'),
(71, 'Darkest Dungeon® II', 37, 2, 12, 18.99, '2021-10-27'),
(72, 'Lies of P', 58, 1, 18, 35.99, '2023-09-18'),
(73, 'Stellaris', 49, 1, 11, 23.99, '2016-05-09'),
(74, 'Resident Evil 7 Biohazard', 30, 1, 6, 14.99, '2017-01-17'),
(75, 'The Binding of Isaac Rebirth', 59, 1, 1, 14.99, '2014-11-04'),
(76, 'Total War WARHAMMER III', 60, 2, 11, 49.99, '2022-02-17'),
(77, 'Resident Evil Village', 30, 1, 6, 29.99, '2021-05-07'),
(78, 'NBA 2K24', 11, 1, 20, 59.99, '2023-09-08'),
(79, 'Crusader Kings III', 49, 1, 11, 29.99, '2020-09-01'),
(80, 'Sid Meier’s Civilization® VI', 62, 2, 12, 59.99, '2016-10-21'),
(81, 'Starfield', 2, 1, 16, 41.99, '2023-09-06'),
(82, 'Atomic Heart', 63, 2, 2, 39.99, '2023-06-21'),
(83, 'Resident Evil 2', 30, 1, 7, 29.99, '2019-01-28'),
(84, 'Forza Motorsport', 25, 1, 21, 35.23, '2019-01-25'),
(85, 'The Talos Principle 2', 65, 1, 17, 14.99, '2023-11-02'),
(86, 'Don\'t Starve Together', 66, 1, 5, 7.99, '2014-12-15'),
(87, 'ARK Survival Evolved', 67, 1, 1, 14.99, '2015-07-02'),
(88, 'Age of Empires II Definitive Edition', 68, 2, 11, 19.99, '2019-11-14'),
(89, 'Barotrauma', 69, 1, 17, 17.99, '2019-06-05'),
(90, 'Europa Universalis IV', 49, 2, 11, 23.99, '2013-08-13'),
(91, 'Slay the Spire', 70, 1, 17, 11.49, '2017-10-14'),
(92, 'Beat Saber', 71, 1, 3, 14.99, '2018-05-01'),
(93, 'Squad', 72, 1, 6, 49.99, '2015-12-14'),
(94, 'The Long Dark', 73, 1, 1, 10.49, '2014-09-22'),
(95, 'Insurgency Sandstorm', 74, 1, 6, 20.99, '2018-12-12'),
(96, 'Risk of Rain Returns', 75, 1, 14, 7.99, '2023-11-08'),
(97, 'Tom Clancy’s The Division® 2', 16, 3, 7, 23.99, '2019-03-01'),
(98, '7 Days to Die', 77, 1, 5, 24.99, '2013-12-13'),
(99, 'Cities Skylines', 42, 2, 3, 17.99, '2015-05-10'),
(100, 'Stray', 79, 2, 1, 13.99, '2022-07-19'),
(101, 'RoboCop Rogue City', 80, 2, 2, 24.99, '2023-11-02'),
(102, 'STAR WARS Jedi Survivor™', 15, 5, 22, 69.99, '2023-04-28'),
(104, 'Satisfactory', 82, 2, 3, 29.99, '2019-05-19'),
(105, 'Total War PHARAOH', 60, 2, 11, 24.99, '2023-09-29');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oyun_kutuphane`
--

CREATE TABLE `oyun_kutuphane` (
  `Oyun_ID` int(11) NOT NULL,
  `Kutuphane_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `oyun_kutuphane`
--

INSERT INTO `oyun_kutuphane` (`Oyun_ID`, `Kutuphane_ID`) VALUES
(5, 5),
(6, 4),
(3, 4),
(9, 4),
(1, 4),
(3, 4),
(4, 4),
(1, 4),
(6, 4),
(10, 4),
(3, 5),
(4, 3),
(5, 3),
(42, 3),
(4, 5),
(6, 5),
(20, 5),
(31, 5),
(8, 5),
(9, 5),
(1, 11),
(17, 5),
(1, 12),
(6, 12),
(10, 5),
(18, 5),
(6, 11),
(10, 11),
(10, 3),
(10, 10),
(8, 3),
(3, 3),
(1, 3);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cinsiyet`
--
ALTER TABLE `cinsiyet`
  ADD PRIMARY KEY (`Cinsiyet_ID`);

--
-- Tablo için indeksler `dagitici`
--
ALTER TABLE `dagitici`
  ADD PRIMARY KEY (`dagitici_ID`);

--
-- Tablo için indeksler `gelistirici`
--
ALTER TABLE `gelistirici`
  ADD PRIMARY KEY (`Gelistirici_ID`);

--
-- Tablo için indeksler `gelistirici_dagitici`
--
ALTER TABLE `gelistirici_dagitici`
  ADD KEY `dagitici_ID` (`dagitici_ID`),
  ADD KEY `Gelistirici_ID` (`Gelistirici_ID`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Kategori_ID`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`Kullanici_ID`),
  ADD KEY `Cinsiyet_ID` (`Cinsiyet_ID`),
  ADD KEY `k_tip` (`k_tip`);

--
-- Tablo için indeksler `kullanici_tipi`
--
ALTER TABLE `kullanici_tipi`
  ADD PRIMARY KEY (`k_tip`);

--
-- Tablo için indeksler `log_kayit`
--
ALTER TABLE `log_kayit`
  ADD PRIMARY KEY (`Log_ID`),
  ADD KEY `Kullanici_ID` (`Kullanici_ID`);

--
-- Tablo için indeksler `oyun`
--
ALTER TABLE `oyun`
  ADD PRIMARY KEY (`Oyun_ID`),
  ADD KEY `Kategori_ID` (`Kategori_ID`),
  ADD KEY `Gelistirici_ID` (`Gelistirici_ID`),
  ADD KEY `oyun_ibfk_3` (`dagitici_ID`);

--
-- Tablo için indeksler `oyun_kutuphane`
--
ALTER TABLE `oyun_kutuphane`
  ADD KEY `Oyun_ID` (`Oyun_ID`),
  ADD KEY `Kutuphane_ID` (`Kutuphane_ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cinsiyet`
--
ALTER TABLE `cinsiyet`
  MODIFY `Cinsiyet_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `dagitici`
--
ALTER TABLE `dagitici`
  MODIFY `dagitici_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `gelistirici`
--
ALTER TABLE `gelistirici`
  MODIFY `Gelistirici_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `Kategori_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `Kullanici_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici_tipi`
--
ALTER TABLE `kullanici_tipi`
  MODIFY `k_tip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `log_kayit`
--
ALTER TABLE `log_kayit`
  MODIFY `Log_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=842;

--
-- Tablo için AUTO_INCREMENT değeri `oyun`
--
ALTER TABLE `oyun`
  MODIFY `Oyun_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `kullanici`
--
ALTER TABLE `kullanici`
  ADD CONSTRAINT `kullanici_ibfk_1` FOREIGN KEY (`Cinsiyet_ID`) REFERENCES `cinsiyet` (`Cinsiyet_ID`),
  ADD CONSTRAINT `kullanici_ibfk_2` FOREIGN KEY (`k_tip`) REFERENCES `kullanici_tipi` (`k_tip`);

--
-- Tablo kısıtlamaları `oyun_kutuphane`
--
ALTER TABLE `oyun_kutuphane`
  ADD CONSTRAINT `oyun_kutuphane_ibfk_1` FOREIGN KEY (`Kutuphane_ID`) REFERENCES `kullanici` (`Kullanici_ID`),
  ADD CONSTRAINT `oyun_kutuphane_ibfk_2` FOREIGN KEY (`Oyun_ID`) REFERENCES `oyun` (`Oyun_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
