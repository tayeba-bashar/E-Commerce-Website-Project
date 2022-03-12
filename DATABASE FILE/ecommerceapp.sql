-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 07:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(9, 'Faria', 'faria.ahmed@gmail.com', '$2y$10$hB7t72KXqI2kx6NE/OEvsuqRFNv0LAIaRa0zEalyCahdQ4WoAmKBO', '0'),
(10, 'Tayeba ', 'tayeba.bashar11@gmail.com', '$2y$10$3pm6BnVMrl12Bm2rt7y1pu/wLWyKWpJ1KRiomdIMR/Q.PJSDEiks2', '0'),
(11, 'Nibir', 'ikramnibir1998@gmail.com', '$2y$10$0Y5CQDyWmXMAk2I0JqxYkeeKUIwio5pj4nM2zTVVwZ37hGYLkeqp2', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Sony'),
(6, 'OnePlus+'),
(7, 'Excl'),
(8, 'Aduro'),
(9, 'Dr. Martens'),
(12, 'Fast Track'),
(13, 'Chanel'),
(14, 'Bell & Ross'),
(15, 'Maggi'),
(16, 'Knorr'),
(17, 'Wheel'),
(18, 'Diamond'),
(19, 'Gold'),
(20, 'Kitchen'),
(21, 'Infinity'),
(22, 'Local'),
(23, 'Sunsilk'),
(24, 'Beauty Glaze'),
(25, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 4, '::1', 4, 1),
(5, 10, '::1', 8, 1),
(6, 24, '::1', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Electronics'),
(3, 'Home & Kitchen'),
(6, 'Clothings'),
(12, 'Mobiles'),
(14, 'Toys'),
(15, 'Watch'),
(17, 'Jewellery'),
(18, 'Groceries'),
(19, 'Beauty Products');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 12, 2, 'Samsung Galaxy Z Fold 2', 249999, 5, 'Last yearâ€™s Galaxy Fold was a sort of experiment in the field of foldable phones. The idea was an innovative one but the phone faced a lot of durability issues. Its launch was postponed multiple times because of Samsungâ€™s inability to solve all the problems. Samsung will likely avoid those situations with its successor.', '1616500092_sm-zfold.jpg', 'samsung, mobile, galaxy fold'),
(2, 12, 3, 'Iphone 12 Pro Max', 187000, 7, '5G goes Pro. A14 Bionic rockets past every other smartphone chip. The Pro camera system takes low-light photography to the next level â€” with an even bigger jump on iPhone 12 Pro Max. And Ceramic Shield delivers four times better drop performance.', '1616499931_iph12pm.jpg', 'apple, iphone'),
(4, 12, 2, 'Samsung Galaxy S21 Ultra', 155000, 10, 'This is a demo', '1616492395_Samsung-Galaxy-S21-Ultra-1608287647-0-0.jpg', 'samsung, s21, s21 ultra'),
(5, 12, 6, 'OnePlus 8T', 86000, 13, 'On spec-sheet, the OnePlus 8T boasts plenty of improvements from its predecessor i.e. the OnePlus 8. For instance, its 6.55-inch 1080p OLED display now comes with a faster 120Hz refresh rate. In comparison, the OnePlus 8 had a 90Hz refresh rate. This upgrade seems huge. However, users will agree that you canâ€™t really find much of a difference between 90Hz to 120Hz on a smartphone screen.', '1616500410_OnePlus-8T-5G-Lunar-Silver-8GB-RAM-128GB-Storage-image-4.jpg', 'one plus, oneplus8'),
(10, 2, 8, 'Aduro Wireless Headphones', 4100, 6, 'Amazing Bluetooth headphones sound with aptX technology. High-quality built-in microphone with Bluetooth 5.0 technology', '1616502854_hdphn.jpg', 'headphone, aduro'),
(11, 6, 9, 'Dr. Martens Mens Patch', 16000, 3, 'Color: Grey/Charcoal/Dark Grey', '1616503181_Dr. Martens.jpg', 'dr martens, shoes'),
(19, 6, 7, 'Mens Hoodie', 3500, 4, 'Colors: Black/White/Maroon', '1616504885_menshoodie.jpg', 'hood, hoodie'),
(24, 15, 12, 'Sports Watch', 30000, 100, 'Sports watch- waterproof', '1646983623_sports-watch-500x500.jpg', 'watch, sports, waterproof'),
(25, 15, 13, 'Ladies Watch', 10000, 10, 'Ladies watch', '1646993275_Relogio-Feminino-Golden-Watch-Women-Gold-Diamond-Women-Luxury-Brand-Watch-2019-Stainless-Steel-Ladies-Wrist.jpg_640x640.jpg', 'watch'),
(29, 15, 14, 'Ladies Watch', 25000, 5, 'Watch', '1646993443_8f3f0c280ce325d8756d88d2d5792e0a95dce3c7_original.jpeg', 'watch'),
(30, 15, 12, 'Men Watch', 43000, 15, 'Watch', '1646993501_5cbf5a3efa99af28517a2af2.jpg', 'watch, sports, waterproof'),
(31, 15, 12, 'Men Watch', 55000, 3, 'watch', '1646993545_CURREN-Business-Men-Watch-Luxury-Brand-Stainless-Steel-Wrist-Watch-Chronograph-Army-Military-Quartz-Watches-Relogio.jpg_Q90.jpg_.jpg', 'watch'),
(32, 18, 17, 'Vim Liquid', 120, 200, 'Liquid dishwasher', '1646993792_001_3_2.jpg', 'dishwasher'),
(33, 18, 15, 'Maggi Noodles', 140, 250, '4 pack Maggi noodles', '1646993857_Nestle-MAGGI-Masala-Blast-Noodles.jpg', 'noodles'),
(34, 18, 16, 'Knorr Soup', 200, 300, 'soup', '1646993910_Knorr-Soup-Hot-and-Sour.jpg', 'soup'),
(35, 18, 17, 'Wheel Powder', 250, 200, 'Wheel 200gm', '1646993973_wheel-washing-powder-2in1-clean-fresh-500-gm.jpg', 'washing powder'),
(36, 18, 17, 'Washing Powder', 300, 240, 'Washing powder', '1646994031_surf-excel-washing-powder-500-gm.jpg', 'washing powder'),
(37, 17, 18, 'Diamond Neckless', 250000, 10, 'Neckless ', '1646994117_images.jpg', 'diamond'),
(38, 17, 18, 'Diamond Neckless', 300000, 10, 'Neckless ', '1646994144_RV_10-1100x734.jpg', 'diamond'),
(39, 17, 19, 'Gold Neckless', 356000, 4, 'Gold', '1646994204_buy_gold_necklace_set_online_at_krishna_jewellers_pearls_and_gems.jpg', 'neckless'),
(40, 17, 19, 'Gold Neckless', 456000, 4, 'Gold', '1646994227_imftfyhages.jpg', 'neckless'),
(41, 17, 19, 'Gold Neckless', 256000, 4, 'Gold', '1646994245_imsdfghages.jpg', 'neckless'),
(42, 17, 19, 'Gold Neckless', 1286000, 4, 'Gold', '1646994262_photo-1601121141461-9d6647bca1ed.jpg', 'neckless'),
(43, 2, 2, 'Earphone', 560, 300, 'Wired Earphone', '1647060224_9d01197eebf48e17cc8a07335e43f4b9ca90c3b9_original.jpeg', 'earphone'),
(44, 2, 1, 'Mouse', 3500, 300, 'Wireless Gaming Mouse', '1647060270_mars-gaming-mmw-3200-dpi-wireless-gaming-mouse.jpg', 'gaming mouse'),
(45, 2, 1, 'Pendrive', 1500, 450, 'Pendrive', '1647060318_78f37fc2a3f8468777129cf607ed5d04.jpg', 'pendrive'),
(46, 2, 4, 'Bluetooth Speaker', 5500, 450, 'Speaker', '1647060356_28e161c0a6138fce4f17e68a35193840bf20568d_405911.jpg', 'speaker'),
(47, 3, 20, 'Glass Set', 4500, 30, '4 piece glass set', '1647060970_downloasdfgad (1).jpg', 'glass'),
(48, 3, 20, 'Cup Set', 6500, 30, '4 piece cup set', '1647061005_81ea05379e9fbeb0b418c961d08b4c3b57486a72_original.jpeg', 'cup'),
(49, 3, 20, 'Spoon Set', 4500, 30, 'Spoon set', '1647061037_wood_box_spoon_set_24pcs.jpg', 'spoon'),
(50, 3, 20, 'Kitchen Rack', 3500, 30, 'Kitchen Rack', '1647061071_wholesale_stainless_steel_3_layers_kitchen_rack_kitchen_cabinet_dish_rack.jpg', 'rack'),
(51, 3, 20, 'Pillow Cover', 1200, 30, 'Pillow Cover', '1647061141_dodfghggwnload (1).jpg', 'Pillow, cover'),
(52, 6, 21, 'Mask', 450, 20, 'Mask', '1647061255_61a794e1b73fb-square.jpg', 'mask'),
(53, 6, 21, 'Mask', 450, 20, 'Mask', '1647061270_61a794e1b79dd-square.jpg', 'mask'),
(54, 6, 21, 'T-shirt', 1450, 20, 'T-shirt', '1647061315_61a794e19d4b4-square.jpg', 'T-shirt'),
(55, 6, 21, 'T-shirt', 1450, 20, 'T-shirt', '1647061331_61a794e1a5fec-square.jpg', 'T-shirt'),
(56, 6, 21, 'Trouser', 2450, 20, 'Trouser', '1647061366_61a794e174be7-square.jpg', 'Trouser'),
(57, 14, 22, 'Cricket Bat Set', 800, 111, 'Kids bat ball', '1647061534_61WIPVwt4yL._SL1468_.jpg', 'bat,ball'),
(58, 14, 22, 'Toy car', 1800, 111, 'Toy car', '1647061565_Lamborghini-Licensed-Ride-on-Car-Kids-Electric-Car-Toy-Car.jpg', 'Toy car'),
(59, 14, 22, 'Toy car', 500, 111, 'Toy car', '1647061583_5_900x.jpg', 'Toy car'),
(60, 14, 22, 'Toy train', 1800, 111, 'Toy train', '1647061613_sddefault.jpg', 'Toy train'),
(61, 14, 22, 'Drawing Book', 100, 111, 'Drawing Book', '1647061647_5e74eadec4854037011df357.jpg', 'Drawing Book'),
(62, 14, 22, 'Ball', 100, 111, 'Ball', '1647061679_OEM-Custom-PU-Foam-Football-Pressure-Ball-Souvenir-Mini-Soft-Football-for-Kids-Toy-Children-Toy-Baby-Toy.jpg', 'Ball'),
(63, 19, 23, 'Shampoo', 450, 100, 'Shampoo', '1647065690_smooth_&_manageable_shampoo_900ml-1135545-png.jpg', 'Shampoo'),
(64, 19, 25, 'Shampoo', 850, 100, 'Shampoo', '1647065723_head-shoulders-smooth-silky-anti-dandruff-shampoo-340-ml-2-20210727.jpg', 'Shampoo'),
(65, 19, 25, 'Shampoo', 850, 100, 'Shampoo', '1647065735_51ORiVjLPZL._SL1000_.jpg', 'Shampoo'),
(66, 19, 24, 'Foundation', 850, 100, 'Foundation', '1647065766_maybelline-foundation-fit-me-dewy-and-smooth-sun-beige-041554238761-c.jpg', 'Foundation'),
(67, 19, 24, 'Make Up Brush Set', 850, 100, 'Make Up Brush Set', '1647065803_dodfghwnload (1).jpg', 'Make Up Brush Set'),
(68, 19, 24, 'Facewash', 850, 100, 'Facewash', '1647065857_51AcOXDiwiL._SL1000_.jpg', 'Facewash');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(7, 'Tayeba', 'Bashar', 'tayeba.bashar11@gmail.com', 'cd2a27f00e988480d8efa1e042c0ae0e', '0171106323', 'no address', 'no no no'),
(8, 'Faria', 'Ahmed', 'faria.ahmed@gmail.com', '7357798f77d5aeef9204a7e598c1cd57', '0171106321', 'no address', 'Uttara'),
(9, 'Jul ', 'Ikram Nibir', 'ikramnbir1998@gmail.com', '3967da99e2c6bdefb349f5e96b8c3f35', '0131669567', 'Mohammadpur', 'Jahangirnag');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
