-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2022 at 04:34 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart-watch`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `CartID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `WatchID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(1, 'Đồng hồ nam'),
(2, 'Đồng hồ nữ'),
(3, 'Đồng hồ trẻ em'),
(4, 'Đồng hồ đôi');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `MonthName` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`MonthName`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(12) NOT NULL,
  `TotalMoney` int(11) NOT NULL DEFAULT 0,
  `Payment` int(11) NOT NULL DEFAULT 0,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `Username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` varchar(12) NOT NULL,
  `WatchID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `SliderID` int(11) NOT NULL,
  `SliderName` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Thumbnail` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`SliderID`, `SliderName`, `Description`, `Thumbnail`, `Status`) VALUES
(1, 'Đồng hồ TiTan', 'Thời gian với sự hoàn hảo là phong cách trông thật phong cách', '/assets/slider/slider-1.jpg', 1),
(2, 'Thứ sáu giảm giá', 'Giảm giá thời trang vào tối thứ sáu', '/assets/slider/slider-2.jpg', 1),
(3, 'Đồng hồ nam', 'Đồng hồ tay thời trang độc quyền trường tồn dành cho nam giới', '/assets/slider/slider-3.jpg', 1),
(4, 'Đồng hồ thông minh', 'Bán đồng hồ thông minh độc quyền', '/assets/slider/slider-4.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 1,
  `Role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `Password`, `Fullname`, `Phone`, `Email`, `Status`, `Role`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', 'Quốc Hưng', '0123456789', 'lqh@gmail.com', 1, 1),
('user', '202cb962ac59075b964b07152d234b70', 'Người dùng mới', '0987654321', 'user@gmail.com', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `watches`
--

CREATE TABLE `watches` (
  `WatchID` int(11) NOT NULL,
  `WatchName` varchar(255) NOT NULL,
  `Thumbnail` varchar(255) DEFAULT NULL,
  `Description` text NOT NULL,
  `Price` int(11) NOT NULL,
  `Trademark` varchar(255) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `watches`
--

INSERT INTO `watches` (`WatchID`, `WatchName`, `Thumbnail`, `Description`, `Price`, `Trademark`, `CategoryID`) VALUES
(1, 'Đồng hồ định vị Wonlex GW400S', '/assets/product/dong-ho-thong-minh-Gw400S.jpg', 'Chưa có', 899000, 'Wonlex', 1),
(2, 'Đồng hồ Thụy Sỹ Tag Heuer', '/assets/product/dong-ho-noi-tieng-the-gioi-tag-heuer.jpg', 'Một trong những chiếc đồng hồ Thụy Sỹ danh giá, Tag Heuer nổi tiếng với công nghệ chế tác đồng hồ thể thao cực đỉnh. Thương hiệu nhanh chóng đẩy tên tuổi của mình khi kết hợp với các giải thể thao uy tín, đua xe và nhà sản xuất đua xe. Không chỉ dừng lại với đồng hồ đeo tay cổ điển, đồng hồ thông minh (smartwatch) Tag Heuer cũng dần chiếm được thị phần của riêng mình. Nam giới yêu thích đồng hồ nam với thiết kế khỏe khoắn không thể bỏ qua dòng Formula One, Aquaracer hay Grand Carrera từ Tag Heuer.', 34000000, 'Tag Heuer', 1),
(3, 'Đồng hồ nam Longines Master', '/assets/product/dong-ho-nam-longines-master.png', 'Đang cập nhật', 88464000, 'Longines Master', 1),
(4, 'Đồng hồ Casio 51 mm Nam', '/assets/product/casio-120w-2avdf-nam.jpg', 'Sở hữu đường kính mặt 51 mm cùng thiết kế màu xanh thanh lịch, trẻ trung cho các bạn nam yêu thích sự cá tính. Thời gian sử dụng pin thoải mái lên đến 10 năm.', 1579000, 'Casio', 1),
(5, 'Casio g-shock ga-900-4adr', '/assets/product/dong-ho-casio-ga-900-4adr_1608805186.jpg', 'Đèn LED (Chiếu sáng cực mạnh)\r\nThời lượng chiếu sáng có thể lựa chọn (1,5 hoặc 3 giây), phát sáng sau\r\nTính năng chuyển kim (Kim dịch chuyển qua một bên để không che kết quả hiển thị trên màn hình kỹ thuật số.)\r\nGiờ thế giới\r\n31 múi giờ (48 thành phố + giờ phối hợp quốc tế), bật/tắt tiết kiệm ánh sáng ban ngày, chuyển đổi Giờ địa phương/Giờ thế giới, Truy cập một chạm vào múi giờ UTC\r\nĐồng hồ bấm giờ 1/100 giây\r\nKhả năng đo: 23:59\'59.99\"\r\nChế độ đo: Thời gian đã trôi qua, ngắt giờ, thời gian về đích thứ nhất - thứ hai\r\nKhác: cảnh báo thời gian đích, bắt đầu định giờ trực tiếp từ chế độ hiển thị giờ hiện hành\r\nĐồng hồ đếm ngược\r\nĐơn vị đo: 1/10 giây\r\nKhoảng đếm ngược: 60 phút\r\nKhoảng cài đặt thời gian bắt đầu đếm ngược: 1 phút đến 60 phút (khoảng tăng 1 phút)\r\n5 chế độ báo thức hàng ngày (với 1 chế độ báo lặp)\r\nTín hiệu thời gian hàng giờ\r\nLịch hoàn toàn tự động (đến năm 2099)\r\nĐịnh dạng giờ 12/24\r\nBật/tắt âm nhấn nút\r\nGiờ hiện hành thông thường: Giờ, phút, giây, giờ chiều, tháng, ngày, thứ\r\nĐộ chính xác: ±15 giây một tháng\r\nTuổi thọ pin xấp xỉ: 7 năm đối với pin CR2016', 3848400, 'Casio', 1),
(6, 'Seiko 5 sports field quân đội srph33k1', '/assets/product/srph33k1_1647917498.jpg', 'Giới tính:Nam\r\nKiểu dáng:Mặt tròn\r\nLoại máy:Automatic (Máy cơ tự động)\r\nPhong cách:Quân đội\r\nMặt kính:Hardlex Crystal\r\nĐường kính:39.4mm\r\nChất liệu vỏ:Thép không gỉ mạ công nghệ PVD\r\nĐộ dày:13.2mm\r\nChất liệu dây:Dây dù\r\nĐộ chịu nước:100m\r\nTính năng khác:Lịch thứ, lịch ngày. Caliber 4R36, 24 chân kính, trữ cót 41h. Khối lượng 74g.\r\nMàu mặt:Đen', 7132500, 'Seiko', 1),
(7, 'Hamilton ventura elvis80 skeleton h24535331', '/assets/product/h24535331_1647486286.jpg', 'Loại máy:Automatic (Máy cơ tự động)\r\nPhong cách:Hiện đại\r\nMặt kính:Sapphire\r\nĐường kính:42.5mm - 44.6mm\r\nChất liệu vỏ:Thép không gỉ mạ công nghệ PVD\r\nChất liệu dây:Dây cao su\r\nSize dây:21.22mm\r\nĐộ chịu nước:50m\r\nTính năng khác:Caliber H-10-S, 25 chân kính, trữ cót 80h. Sapphire chống lóa.', 38709000, 'Hamilton', 1),
(8, 'Titoni space star 83638 sy-st-606', '/assets/product/dong-ho-titoni-83638-sy-st-606_1614152423.jpg', 'Kiểu dáng:Mặt tròn\r\nLoại máy:Automatic (Máy cơ tự động)\r\nPhong cách:Hiện đại\r\nMặt kính:Sapphire\r\nĐường kính:40mm\r\nChất liệu vỏ:Thép không gỉ mạ vàng công nghệ PVD\r\nĐộ dày:8.75mm\r\nChất liệu dây:Dây da\r\nSize dây:20.5mm\r\nĐộ chịu nước:50m\r\nTính năng khác:Lịch ngày. Caliber ETA 2895-2, 27 chân kính, trữ cót 44h. Sapphire chống lóa', 30292300, 'Titoni', 1),
(9, 'One Piece x G-Shock GA-110JOP-1A4 Phiên bản hợp tác siêu giới hạn', '/assets/product/can-canh-dong-ho-g-shock-phien-ban-one-piece-dao-hai-tac-dinh-dam-10.jpg', 'Các điểm nhấn đặc biệt trên One Piece x G-Shock GA-110JOP-1A4:\r\nTHIẾT KẾ MẶT ĐẶC BIỆT\r\nHÌNH ẢNH LUFFY TRÊN DÂY VỎ\r\nLOGO ONE PIECE TRÊN NẮP LƯNG\r\nĐÈN LED NÂU VÀNG RỰC RỠ\r\nTHIẾT KẾ HỘP ĐẶC BIỆT\r\nPhiên bản One Piece x G-Shock GA-110JOP-1A4 sẽ ra mắt chính thức vào tháng 8 chậm nhất là tháng 9 năm 2020 tại Việt Nam - ', 6580000, 'Casio', 1),
(10, 'Seiko 5 sports naruto limited edition srpf70k1', '/assets/product/srpf70k1_1616495509.jpg', 'NARUTO UZUMAKI SRPF70\n\n- Mặt số màu vàng tượng trưng cho trang phục của NARUTO. Jutsu (kỹ thuật Ninja) \"Rasengan\" mang tính biểu tượng của ông truyền cảm hứng cho mô hình xoắn ốc của mặt số. \n\n- Vành bezel và vỏ máy được thiết kế mờ giống sự ăn mòn phản ánh quá trình đào tạo khắc nghiệt cần thiết để trở thành Hokage, một danh hiệu được ban cho người lãnh đạo Làng Lá mà NARUTO là người con nơi này. Vành Bezel được thiết kế tượng trưng cho tấm bảo vệ trán của anh ấy, có khắc biểu tượng của làng anh ấy. \n\n- Chín cọc số màu cam gợi ý về Cửu Vĩ được phong ấn trong bản thân anh ấy, trong khi chỉ số ở vị trí 12 giờ đại diện cho mặt dây chuyền mà anh thừa kế từ Tsunade, một Hokage cao cấp của làng anh ấy. \n\n- Kamon của Gia tộc Uzumaki, hoặc biểu tượng của Nhật Bản được sử dụng để trang trí và xác định một cá nhân, gia đình hoặc tổ chức, được in trên đáy.  In số thứ tự từ 0001/6500 đến 6500/6500 trên đáy.', 11790000, 'Seiko', 1),
(11, 'Đồng hồ certina ds-8 lady moon phase c033.257.36.118.00', '/assets/product/certina-c033-257-36-118-00-nu1-org.jpg', 'Kiểu dáng:Mặt tròn\nLoại máy:Quartz Chronometer (Máy pin tự động chuẩn COSC)\nPhong cách:Sang trọng\nMặt kính:Sapphire\nĐường kính:32.5mm\nChất liệu vỏ:Thép không gỉ mạ vàng công nghệ PVD\nĐộ dày:9.15mm\nChất liệu dây:Dây da\nSize dây:16mm\nĐộ chịu nước:100m\nTính năng khác:Lịch ngày. Moonphase. EOL. PrecidriveTM. Sapphire chống lóa.Bảo hành chính hãng:2 năm quốc tế\nMàu mặt:Khảm trai', 12690000, 'Certina', 2),
(12, 'Mido rainflower blossom m043.236.11.101.00', '/assets/product/m0432361110100_1648626699.jpg', '', 26325000, 'Mido', 2),
(13, 'Doxa d168rwh – nữ – kính sapphire – quartz (pin) – dây kim loại', '/assets/product/80_D168RWH.jpg', 'Thương Hiệu: Doxa\r\nSố Hiệu Sản Phẩm: D168RWH\r\nXuất Xứ: Thụy Sỹ\r\nGiới Tính: Nữ\r\nKính: Sapphire (Kính Chống Trầy)\r\nMáy: Quartz (Pin)\r\nBảo Hành Quốc Tế: 2 Năm\r\nĐường Kính Mặt Số: 30 mm\r\nBề Dày Mặt Số: 6 mm\r\nNiềng: Thép Không Gỉ\r\nDây Đeo: Thép Không Gỉ\r\nMàu Mặt Số: Trắng\r\nChống Nước: 3 ATM\r\nChức Năng: Lịch Ngày\r\nTính Năng: Guilloché – Xà Cừ – 8 Viên Kim Cương Thật\r\nNơi sản xuất: Thụy Sỹ', 22860000, 'Doxa', 2),
(14, 'Saga 53555 svmwsv-2 – nữ – quartz (pin) – dây kim loại – mặt số 22.5mm', '/assets/product/3_53555-SVMWSV-2.jpg', 'Thương Hiệu: Saga\r\nSố Hiệu Sản Phẩm: 53555 SVMWSV-2\r\nXuất Xứ: Mỹ\r\nGiới Tính: Nữ\r\nKính: Mineral Crystal (Kính Cứng)\r\nMáy: Quartz (Pin)\r\nBảo Hành Quốc Tế: 2 Năm\r\nĐường Kính Mặt Số: 22.5 mm\r\nBề Dày Mặt Số:  mm\r\nNiềng: Thép Không Gỉ\r\nDây Đeo: Thép Không Gỉ\r\nMàu Mặt Số: Trắng Xà Cừ\r\nChống Nước: 3 ATM\r\nTính Năng: Đính Đá Swarovski\r\nNơi sản xuất (Tùy từng lô hàng): Trung Quốc', 5244000, 'Saga', 2),
(15, 'Casio she-3517sg-4audf – nữ – kính sapphire – quartz (pin)', '/assets/product/SHE-3517SG-4AUDF.jpg', 'Thương Hiệu: Casio\r\nSố Hiệu Sản Phẩm: SHE-3517SG-4AUDF\r\nXuất Xứ: Nhật Bản\r\nGiới Tính: Nữ\r\nKính: Sapphire (Kính Chống Trầy)\r\nMáy: Quartz (Pin)\r\nBảo Hành Quốc Tế: 1 Năm\r\nĐường Kính Mặt Số: 35 mm\r\nBề Dày Mặt Số: 8.1 mm\r\nMàu Mặt Số: Hồng\r\nChống Nước: 5 ATM\r\nChức Năng: Lịch Ngày – Lịch Thứ – Đồng Hồ 24 Giờ\r\nNơi sản xuất (Tùy từng lô hàng): Trung Quốc', 4590000, 'Casio', 2),
(16, 'Citizen em0502-86p – nữ – eco-drive (năng lượng ánh sáng) – dây kim loại', '/assets/product/EM0502-86P.jpg', 'Thương Hiệu: Citizen\r\nSố Hiệu Sản Phẩm: EM0502-86P\r\nXuất Xứ: Nhật Bản\r\nGiới Tính: Nữ\r\nKính: Mineral Crystal (Kính Cứng)\r\nMáy: Eco-Drive (Năng Lượng Ánh Sáng)\r\nBảo Hành Quốc Tế: 1 Năm\r\nĐường Kính Mặt Số: 32 mm\r\nBề Dày Mặt Số: 7 mm\r\nNiềng: Thép Không Gỉ\r\nDây Đeo: Thép Không Gỉ\r\nMàu Mặt Số: Vàng\r\nChống Nước: 5 ATM\r\nNơi sản xuất (Tùy từng lô hàng): Trung Quốc', 6090000, 'Citizen', 2),
(17, 'Calvin klein đôi – quartz (pin) – dây da (k7b216c6 – k7b236c6) – mặt số 42mm – 36mm', '/assets/product/2_K7B216C6-K7B236C6.jpg', '', 13540000, 'Calvin Klein', 4),
(18, 'Casio đôi – quartz (pin) – dây kim loại (mtp-v300g-7audf – ltp-v300g-7audf) – mặt số 38mm – 33mm', '/assets/product/9_MTP-V300G-7AUDF-LTP-V300G-7AUDF.jpg', '', 4146000, 'Casio', 4),
(19, 'Doxa đôi – kính sapphire – quartz (pin) – dây da (d155rbl – d156rbl) – mặt số 39mm – 29mm', '/assets/product/1_D155RBL-D156RBL.jpg', '', 36550000, 'Doxa', 4),
(20, 'Tissot đôi – kính sapphire – quartz (pin) – dây kim loại (t109.410.36.033.00 – t109.210.36.033.00) – mặt số 38mm – 30mm', '/assets/product/8_T109.410.36.033.00-T109.210.36.033.00.jpg', '', 36550000, 'Tissot', 4),
(21, 'Baby-g bga-195m-4adr – nữ – quartz (pin) – dây cao su', '/assets/product/161_BGA-195M-4ADR-1.jpg', 'Thương Hiệu\r\n 	\r\nCasio\r\nSố Hiệu Sản Phẩm\r\n 	BGA-195M-4ADR\r\nXuất Xứ\r\n 	\r\nNhật Bản\r\nGiới Tính\r\n 	\r\nNữ\r\nKính\r\n 	\r\nMineral Crystal (Kính Cứng)\r\nMáy\r\n 	\r\nQuartz (Pin)\r\nBảo Hành Quốc Tế\r\n 	\r\n5 Năm\r\n 	 \r\nĐường Kính Mặt Số\r\n 	\r\n48 mm x 44.3 mm\r\nBề Dày Mặt Số\r\n 	\r\n15.5 mm\r\nNiềng\r\n 	\r\nNhựa\r\nDây Đeo\r\n 	\r\nDây Cao Su\r\nMàu Mặt Số\r\n 	\r\nĐỏ\r\nChống Nước\r\n 	\r\n10 ATM\r\nChức Năng\r\n 	\r\nLịch – Bộ Bấm Giờ – Giờ Kép – Đèn Led – Vài Chức Năng Khác\r\nNơi sản xuất (Tùy từng lô hàng)\r\n 	\r\nTrung Quốc', 4343000, 'Casio', 3),
(22, 'Casio f-91wm-7adf – nam – kính nhựa – quartz (pin) – dây cao su – mặt số 35mm', '/assets/product/F-91WM-7ADF.jpg', '', 543000, 'Casio', 3),
(23, 'Casio nữ – quartz (pin) – kính nhựa – dây cao su (lw-200-2avdf)', '/assets/product/LW-200-2AVDF.jpg', '', 864000, 'Casio', 3),
(24, 'Casio lrw-200h-2e2vdr – nữ – kính nhựa – quartz (pin) – dây cao su – mặt số 32mm', '/assets/product/LRW-200H-2E2VDR_1.jpg', '', 815000, 'Casio', 3),
(25, 'Fossil es4571 – nữ – quartz (pin) – dây kim loại – mặt số 36mm', '/assets/product/75_ES4571.jpg', '', 3940000, 'Fossil', 2),
(26, 'Tissot t103.310.36.111.01 – nữ – kính sapphire – quartz (pin) – dây da', '/assets/product/T103.310.36.111.01.jpg', '', 11680000, 'Tissot', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `WatchID` (`WatchID`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `WatchID` (`WatchID`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`SliderID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `watches`
--
ALTER TABLE `watches`
  ADD PRIMARY KEY (`WatchID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `SliderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `watches`
--
ALTER TABLE `watches`
  MODIFY `WatchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`WatchID`) REFERENCES `watches` (`WatchID`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`WatchID`) REFERENCES `watches` (`WatchID`);

--
-- Constraints for table `watches`
--
ALTER TABLE `watches`
  ADD CONSTRAINT `watches_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
