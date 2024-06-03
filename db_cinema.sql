-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 03, 2024 lúc 08:04 AM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_cinema`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cinema`
--

CREATE TABLE `cinema` (
  `cinema_id` int NOT NULL,
  `cinema_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cinema_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sdt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cinema`
--

INSERT INTO `cinema` (`cinema_id`, `cinema_name`, `address`, `cinema_img`, `sdt`) VALUES
(1, 'Cinema Quang Trung', 'Lầu 3, TTTM CoopMart Foodcosa số 304A, Quang Trung, P.11, Q. Gò Vấp, Tp.HCM', 'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-quang-trung-2_1557133786398.jpg', '1900 2224'),
(2, 'Cinema Tân Bình', '246 Nguyễn Hồng Đào, Q.TB, Tp.HCM', 'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-tan-binh-1_1557134148145.jpg', '1900 2224'),
(3, 'Cinema Đà Nẵng', 'Tầng 3, TTTM Coop Mart, 478 Điện Biên Phủ, Quận Thanh Khê, Đà Nẵng', 'https://cdn.galaxycine.vn/media/2023/10/23/galaxy-da-nang-5_1698052220835.jpg', '1900 2224'),
(4, 'Cinema Nguyễn Du', '116 Nguyễn Du, Quận 1, Tp.HCM', 'https://cdn.galaxycine.vn/media/2023/10/23/galaxy-nguyen-du-1_1698051240852.jpg', '1900 2224'),
(5, 'Cinema Mipec Long Biên', 'Tầng 6, TTTM Mipec Long Biên, Số 2, Phố Long Biên 2, Ngọc Lâm, Long Biên, Hà Nội', 'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-mipec-long-bien-1_1698745465411.jpg', '1900 2224'),
(6, 'Cinema Hải Phòng', 'Lầu 7, TTTM Nguyễn Kim - Sài Gòn Mall, số 104 Lương Khánh Thiện.', 'https://cdn.galaxycine.vn/media/2023/10/23/galaxy-hai-phong-3_1698055542021.jpg', '1900 2224');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cinema_room`
--

CREATE TABLE `cinema_room` (
  `room_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  `room_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cinema_room`
--

INSERT INTO `cinema_room` (`room_id`, `cinema_id`, `room_name`) VALUES
(1, 1, 'L1'),
(2, 1, 'L2'),
(3, 1, 'L3'),
(4, 1, 'L4'),
(5, 2, 'H1'),
(6, 2, 'H2'),
(7, 2, 'H3'),
(8, 2, 'H4'),
(9, 3, 'K1'),
(10, 3, 'K2'),
(11, 3, 'K3'),
(12, 3, 'K4'),
(13, 4, 'M1'),
(14, 4, 'M2'),
(15, 4, 'M3'),
(16, 4, 'M4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie`
--

CREATE TABLE `movie` (
  `movie_id` int NOT NULL,
  `movie_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `movie_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duration` int NOT NULL,
  `actors` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `directors` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `release_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trailer` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_name`, `status`, `movie_img`, `duration`, `actors`, `directors`, `release_date`, `description`, `trailer`) VALUES
(1, 'Dune', 1, 'https://i.pinimg.com/736x/12/3f/4c/123f4ca3e5ba509241ecc351a1f5b753.jpg', 166, 'Timothée Chalamet, Zendaya, Rebecca Ferguson, Javier Bardem, Josh Brolin, Austin Butler', 'Denis Villeneuve', '28/02/2024', 'Following the fall of House Atreides in Dune (2021), exiled Duke Paul Atreides continues his journey of enlightenment in the barren deserts of Arrakis. Soon, the noble son embraces the ways of the blue-eyed Fremen warriors, unaware that rumours about the prophesied Dune Messiah divide the tribe. After all, the suffocating grip of House Harkonnen tightens by the minute, ushering in a brutal era of war over the control of the planet and its vast spice-rich fields. But above all else, water is life. As shrewd machinators plot destruction and death, the volatile future demands the emergence of a new leader. Now caught between personal hopes and the aspirations of others, will Paul become the fighter he always wanted to be?', 'p5BxPH6PXl0'),
(2, 'Interstella', 1, 'https://i.pinimg.com/564x/d2/70/89/d270896d9bfbc63513d1090224070e8b.jpg', 169, 'Matthew McConaughey, Anne Hathaway, Jessica Chastain, Mackenzie Foy', 'Christopher Nolan', '26/10/2014', 'Earth\'s future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind\'s survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.', 'QqSp_dwslro'),
(3, 'Teeth', 1, 'https://i.pinimg.com/564x/f8/df/d7/f8dfd77aebf20a6f06722e6b349f439b.jpg', 94, 'Jess Weixler, John Hensley, Josh Pais, Hale Appleman, Lenny Von Dohlen', 'MitchellLichtenstein', '18/01/2008', 'Still a stranger to her own body, a high school student discovers she has a physical advantage when she becomes the object of male violence.', 'YNbWcOcVgQ8'),
(4, 'Rivers', 1, 'https://i.pinimg.com/564x/f6/65/ac/f665ac5c9f6888d4608fa0ed20c70923.jpg', 75, 'River Phoenix', 'Joseph Nizeti', '21/04/2023', 'An exploration of the timeless relationship between human civilization and Earth\'s rivers. Spanning six continents, this visual and musical tour-de-force is by turns celebratory, cautionary, and ultimately hopeful that we are beginning to understand rivers in all their complexity and fragility. Narrated by Oscar Nominee Willem Dafoe. With music by the Australian Chamber Orchestra and Radiohead.', 'VCTtLVw0RxE'),
(5, 'The Call Of The Wild', 1, 'https://i.pinimg.com/736x/c9/d9/11/c9d9118099b6b899f62ba3ffa82903ee.jpg', 100, 'Harrison Ford,Omar Sy,Cara Gee', ' Chris Sanders', '21/02/2020', 'Buck is a big-hearted dog whose blissful domestic life gets turned upside down when he is suddenly uprooted from his California home and transplanted to the exotic wilds of the Alaskan Yukon in the 1890s. As the newest rookie on a mail-delivery dog sled team, Buck experiences the adventure of a lifetime as he ultimately finds his true place in the world', '5P8R2zAhEwg'),
(6, 'Parasite', 1, 'https://i.pinimg.com/564x/5e/24/ca/5e24ca5266644f92d331fc6e88930b85.jpg', 132, 'Song Kang-hoLee,Sun-kyunCho,Yeo-jeong', 'Bong Joon Ho', '21/06/2019', 'Greed and class discrimination threaten the newly-formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 'SEUXfv87Wpk'),
(7, 'Bird Box', 1, 'https://i.pinimg.com/564x/32/c5/96/32c5966ffd0c9f4fb1f4075d560ac420.jpg', 124, 'Sandra Bullock, Trevante Rhodes, John Malkovich', 'Susanne Bier', '21/12/2018', 'Five years after an ominous unseen presence drives most of society to suicide, a mother and her two children make a desperate bid to reach safety.', 'o2AsIXSh2xo'),
(8, 'The Witch', 1, 'https://i.pinimg.com/736x/f4/f0/4a/f4f04a43138524a907289e5cd87750f0.jpg', 92, 'Anya Taylor-Joy,Ralph Ineson,Kate Dickie\r\n', 'Robert Eggers', '19/02/2016', 'A family in 1630s New England is torn apart by the forces of witchcraft, black magic and possession.', 'iQXmlf3Sefg'),
(9, 'Room', 1, 'https://i.pinimg.com/564x/30/59/c1/3059c11e43be0b0e68e8d0c049017fc9.jpg', 118, 'Brie Larson,Jacob Tremblay', ' Lenny Abrahamson', '22/01/2016', 'ROOM tells the extraordinary story of Jack, a spirited 5-year-old who is looked after by his loving and devoted mother. Like any good mother, Ma dedicates herself to keeping Jack happy and safe, nurturing him with warmth and love and doing typical things like playing games and telling stories.', 'E_Ci-pAL4eE'),
(10, 'Stranger Things', 0, 'https://i.pinimg.com/736x/68/46/5a/68465aaec5f8632d0103c938ec5f3425.jpg', 780, 'Caleb McLaughlin,Joe Keery', ' Matt Duffer', '15/07/2016', 'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.', 'yXnk3n-qNrI'),
(11, 'The Shawshank', 0, 'https://i.pinimg.com/564x/08/6f/fe/086ffeccab22baa2b4d49ab8787f9b90.jpg', 142, 'Tim Robbins, Morgan Freeman', 'Frank Darabont', '14/09/1994', 'Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.', 'PLl99DlL6b4'),
(12, 'The Godfather ', 0, 'https://i.pinimg.com/564x/11/99/dc/1199dc6273680f175fd9b06c9c36d08a.jpg', 175, 'Marlon Brando, Al Pacino', 'Francis Ford Coppola', '24/03/1972', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'UaVTIH8mujA'),
(13, 'The Dark Knight ', 0, 'https://i.pinimg.com/564x/ea/a2/6e/eaa26e2c3bfa234c3cdd3c4d9fabad35.jpg', 152, 'Christian Bale, Heath Ledger, Michael Caine', 'Christopher Nolan', '18/07/2008', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'EXeTwQWrcwY'),
(14, 'The Return of King', 0, 'https://i.pinimg.com/564x/16/45/9b/16459b5858edf81a707da0161d8eaea1.jpg', 201, 'Elijah Wood, Ian McKellen', 'Peter Jackson', '17/12/2003', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'TPBq1khnb-w'),
(15, 'Pulp Fiction', 0, 'https://i.pinimg.com/564x/89/41/e7/8941e71464be8fe81ade92a86817338e.jpg', 154, 'John Travolta, Samuel L. Jackson', 'Quentin Tarantino', '21/09/1994', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', '5ZAhzsi1ybM'),
(16, 'Schindler\'s List ', 1, 'https://i.pinimg.com/564x/8b/64/83/8b648309a99984686519314731b56ea1.jpg', 192, 'Liam Neeson, Ralph Fiennes', 'Steven Spielberg', '20/12/1993', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 'gG22XNhtnoY');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_show`
--

CREATE TABLE `movie_show` (
  `show_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `room_id` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movie_show`
--

INSERT INTO `movie_show` (`show_id`, `cinema_id`, `movie_id`, `room_id`, `start_time`, `end_time`) VALUES
(1, 1, 1, 1, '08:00:00', '10:45:00'),
(2, 1, 2, 1, '11:00:00', '12:50:00'),
(3, 1, 3, 1, '13:00:00', '14:35:00'),
(4, 1, 4, 1, '14:50:00', '15:05:00'),
(5, 1, 5, 1, '15:20:00', '17:00:00'),
(6, 1, 6, 1, '17:15:00', '19:30:00'),
(7, 1, 7, 1, '19:15:00', '21:20:00'),
(8, 1, 8, 2, '08:00:00', '09:15:00'),
(9, 1, 9, 2, '09:30:00', '11:30:00'),
(10, 1, 1, 2, '11:45:00', '14:35:00'),
(11, 1, 2, 2, '14:50:00', '17:40:00'),
(13, 1, 3, 2, '18:00:00', '19:35:00'),
(14, 1, 4, 2, '19:35:00', '20:50:00'),
(15, 1, 5, 2, '21:00:00', '22:40:00'),
(16, 1, 6, 3, '08:00:00', '10:15:00'),
(17, 1, 7, 3, '10:30:00', '12:35:00'),
(18, 1, 8, 3, '12:50:00', '14:05:00'),
(19, 1, 9, 3, '14:20:00', '16:20:00'),
(20, 1, 1, 3, '16:40:00', '19:25:00'),
(21, 1, 2, 3, '19:40:00', '21:00:00'),
(22, 1, 3, 3, '21:15:00', '23:00:00'),
(23, 1, 4, 4, '08:00:00', '09:15:00'),
(24, 1, 5, 4, '09:30:00', '11:10:00'),
(25, 1, 6, 4, '11:30:00', '13:45:00'),
(26, 1, 7, 4, '14:00:00', '16:35:00'),
(27, 1, 8, 4, '16:50:00', '18:05:00'),
(28, 1, 9, 4, '18:20:00', '20:20:00'),
(29, 1, 1, 4, '20:40:00', '23:25:00'),
(30, 2, 1, 5, '08:00:00', '10:45:00'),
(31, 2, 2, 5, '11:00:00', '12:50:00'),
(32, 2, 3, 5, '13:00:00', '14:35:00'),
(33, 2, 4, 5, '14:50:00', '15:05:00'),
(34, 2, 5, 5, '15:20:00', '17:00:00'),
(35, 2, 6, 5, '17:15:00', '19:30:00'),
(36, 2, 7, 5, '19:15:00', '21:20:00'),
(37, 2, 8, 6, '08:00:00', '09:15:00'),
(38, 2, 9, 6, '09:30:00', '11:30:00'),
(39, 2, 1, 6, '11:45:00', '14:35:00'),
(40, 2, 2, 6, '14:50:00', '17:40:00'),
(41, 2, 3, 6, '18:00:00', '19:35:00'),
(42, 2, 4, 6, '19:35:00', '20:50:00'),
(43, 2, 5, 6, '21:00:00', '22:40:00'),
(44, 2, 6, 7, '08:00:00', '10:15:00'),
(45, 2, 7, 7, '10:30:00', '12:35:00'),
(46, 2, 8, 7, '12:50:00', '14:05:00'),
(47, 2, 9, 7, '14:20:00', '16:20:00'),
(48, 2, 1, 7, '16:40:00', '19:25:00'),
(49, 2, 2, 7, '19:40:00', '21:00:00'),
(50, 2, 3, 7, '21:15:00', '23:00:00'),
(51, 2, 4, 8, '08:00:00', '09:15:00'),
(52, 2, 5, 8, '09:30:00', '11:10:00'),
(53, 2, 6, 8, '11:30:00', '13:45:00'),
(54, 2, 7, 8, '14:00:00', '16:35:00'),
(55, 2, 8, 8, '16:50:00', '18:05:00'),
(56, 2, 9, 8, '18:20:00', '20:20:00'),
(57, 2, 1, 8, '20:40:00', '23:25:00'),
(58, 3, 1, 9, '08:00:00', '10:45:00'),
(59, 3, 2, 9, '11:00:00', '12:50:00'),
(60, 3, 3, 9, '13:00:00', '14:35:00'),
(61, 3, 4, 9, '14:50:00', '15:05:00'),
(62, 3, 5, 9, '15:20:00', '17:00:00'),
(63, 3, 6, 9, '17:15:00', '19:30:00'),
(64, 3, 7, 9, '19:15:00', '21:20:00'),
(65, 3, 8, 10, '08:00:00', '09:15:00'),
(66, 3, 9, 10, '09:30:00', '11:30:00'),
(67, 3, 1, 10, '11:45:00', '14:35:00'),
(68, 3, 2, 10, '14:50:00', '17:40:00'),
(69, 3, 3, 10, '18:00:00', '19:35:00'),
(70, 3, 4, 10, '19:35:00', '20:50:00'),
(71, 3, 5, 10, '21:00:00', '22:40:00'),
(72, 3, 6, 11, '08:00:00', '10:15:00'),
(73, 3, 7, 11, '10:30:00', '12:35:00'),
(74, 3, 8, 11, '12:50:00', '14:05:00'),
(75, 3, 9, 11, '14:20:00', '16:20:00'),
(76, 3, 1, 11, '16:40:00', '19:25:00'),
(77, 3, 2, 11, '19:40:00', '21:00:00'),
(78, 3, 3, 11, '21:15:00', '23:00:00'),
(79, 3, 4, 12, '08:00:00', '09:15:00'),
(80, 3, 5, 12, '09:30:00', '11:10:00'),
(81, 3, 6, 12, '11:30:00', '13:45:00'),
(82, 3, 7, 12, '14:00:00', '16:35:00'),
(83, 3, 8, 12, '16:50:00', '18:05:00'),
(84, 3, 9, 12, '18:20:00', '20:20:00'),
(85, 3, 1, 12, '20:40:00', '23:25:00'),
(86, 4, 1, 13, '08:00:00', '10:45:00'),
(87, 4, 2, 13, '11:00:00', '12:50:00'),
(88, 4, 3, 13, '13:00:00', '14:35:00'),
(89, 4, 4, 13, '14:50:00', '15:05:00'),
(90, 4, 5, 13, '15:20:00', '17:00:00'),
(91, 4, 6, 13, '17:15:00', '19:30:00'),
(92, 4, 7, 13, '19:15:00', '21:20:00'),
(93, 4, 8, 14, '08:00:00', '09:15:00'),
(94, 4, 9, 14, '09:30:00', '11:30:00'),
(95, 4, 1, 14, '11:45:00', '14:35:00'),
(96, 4, 2, 14, '14:50:00', '17:40:00'),
(97, 4, 3, 14, '18:00:00', '19:35:00'),
(98, 4, 4, 14, '19:35:00', '20:50:00'),
(99, 4, 5, 14, '21:00:00', '22:40:00'),
(100, 4, 6, 15, '08:00:00', '10:15:00'),
(101, 4, 7, 15, '10:30:00', '12:35:00'),
(102, 4, 8, 15, '12:50:00', '14:05:00'),
(103, 4, 9, 15, '14:20:00', '16:20:00'),
(104, 4, 1, 15, '16:40:00', '19:25:00'),
(105, 4, 2, 15, '19:40:00', '21:00:00'),
(106, 4, 3, 15, '21:15:00', '23:00:00'),
(107, 4, 4, 16, '08:00:00', '09:15:00'),
(108, 4, 5, 16, '09:30:00', '11:10:00'),
(109, 4, 6, 16, '11:30:00', '13:45:00'),
(110, 4, 7, 16, '14:00:00', '16:35:00'),
(112, 4, 8, 16, '16:50:00', '18:05:00'),
(113, 4, 9, 16, '18:20:00', '20:20:00'),
(114, 4, 1, 16, '20:40:00', '23:25:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` int NOT NULL,
  `total_ticket` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`payment_id`, `user_id`, `amount`, `total_ticket`, `date`) VALUES
(46, 1, 140000, 2, '2024-05-27 14:30:00'),
(48, 1, 70000, 1, '2024-05-27 14:32:00'),
(49, 1, 140000, 2, '2024-05-28 09:20:00'),
(53, 1, 560000, 8, '2024-06-02 12:13:00'),
(54, 1, 700000, 18, '2024-06-02 12:14:00'),
(55, 1, 140000, 2, '2024-06-02 12:32:00'),
(56, 1, 140000, 2, '2024-06-02 12:33:00'),
(57, 10, 140000, 2, '2024-06-02 13:17:00'),
(58, 10, 140000, 2, '2024-06-03 13:32:00'),
(59, 10, 140000, 2, '2024-06-03 13:33:00'),
(60, 10, 70000, 1, '2024-06-03 13:37:00'),
(61, 10, 70000, 1, '2024-06-03 14:15:00'),
(62, 13, 70000, 1, '2024-06-03 14:48:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_seat`
--

CREATE TABLE `room_seat` (
  `seat_id` int NOT NULL,
  `room_id` int NOT NULL,
  `seat_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seat_status` tinyint(1) NOT NULL,
  `price` int NOT NULL DEFAULT '70000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_seat`
--

INSERT INTO `room_seat` (`seat_id`, `room_id`, `seat_name`, `seat_status`, `price`) VALUES
(1, 1, 'A', 1, 70000),
(2, 1, 'B', 1, 70000),
(3, 1, 'C', 0, 70000),
(4, 1, 'D', 1, 70000),
(5, 1, 'E', 1, 70000),
(6, 1, 'F', 1, 70000),
(7, 1, 'G', 1, 70000),
(8, 1, 'H', 0, 70000),
(9, 1, 'I', 0, 70000),
(10, 1, 'K', 0, 70000),
(11, 1, 'L', 0, 70000),
(12, 1, 'M', 0, 70000),
(13, 1, 'N', 0, 70000),
(14, 1, 'O', 0, 70000),
(15, 1, 'P', 0, 70000),
(16, 1, 'Q', 0, 70000),
(17, 1, 'R', 0, 70000),
(18, 1, 'S', 0, 70000),
(19, 1, 'T', 0, 70000),
(20, 1, 'U', 0, 70000),
(21, 1, 'V', 0, 70000),
(22, 1, 'X', 0, 70000),
(23, 1, 'Y', 0, 70000),
(24, 1, 'AA', 0, 70000),
(25, 1, 'AB', 1, 70000),
(26, 1, 'AC', 1, 70000),
(27, 1, 'AD', 1, 70000),
(28, 1, 'AE', 1, 70000),
(29, 1, 'AF', 0, 70000),
(30, 1, 'AG', 0, 70000),
(31, 1, 'AH', 0, 70000),
(32, 1, 'AI', 0, 70000),
(33, 1, 'AK', 0, 70000),
(34, 1, 'AL', 0, 70000),
(35, 1, 'AM', 1, 70000),
(36, 1, 'AN', 1, 70000),
(37, 1, 'AO', 1, 70000),
(38, 1, 'AP', 1, 70000),
(39, 1, 'AQ', 0, 70000),
(40, 1, 'AR', 0, 70000),
(41, 1, 'AS', 0, 70000),
(42, 1, 'AT', 0, 70000),
(43, 1, 'AU', 1, 70000),
(44, 1, 'AV', 1, 70000),
(45, 1, 'AX', 1, 70000),
(46, 1, 'BD', 0, 70000),
(47, 1, 'AY', 0, 70000),
(48, 1, 'BA', 0, 70000),
(49, 1, 'BB', 0, 70000),
(50, 1, 'BC', 0, 70000),
(51, 2, 'A', 0, 70000),
(52, 2, 'B', 0, 70000),
(53, 2, 'C', 0, 70000),
(54, 2, 'D', 0, 70000),
(55, 2, 'E', 0, 70000),
(56, 2, 'F', 1, 70000),
(57, 2, 'G', 0, 70000),
(58, 2, 'H', 0, 70000),
(59, 2, 'I', 0, 70000),
(60, 2, 'K', 0, 70000),
(61, 2, 'L', 0, 70000),
(62, 2, 'M', 0, 70000),
(63, 2, 'N', 0, 70000),
(64, 2, 'O', 1, 70000),
(65, 2, 'P', 1, 70000),
(66, 2, 'Q', 0, 70000),
(67, 2, 'R', 1, 70000),
(68, 2, 'S', 1, 70000),
(69, 2, 'T', 0, 70000),
(70, 2, 'U', 0, 70000),
(71, 2, 'V', 0, 70000),
(72, 2, 'X', 0, 70000),
(73, 2, 'Y', 0, 70000),
(74, 2, 'AA', 1, 70000),
(75, 2, 'AB', 1, 70000),
(76, 2, 'AC', 0, 70000),
(77, 2, 'AD', 1, 70000),
(78, 2, 'AE', 1, 70000),
(79, 2, 'AF', 0, 70000),
(80, 2, 'AG', 0, 70000),
(81, 2, 'AH', 0, 70000),
(82, 2, 'AI', 0, 70000),
(83, 2, 'AK', 0, 70000),
(84, 2, 'AL', 0, 70000),
(85, 2, 'AM', 1, 70000),
(86, 2, 'AN', 1, 70000),
(87, 2, 'AO', 0, 70000),
(88, 2, 'AP', 0, 70000),
(89, 2, 'AQ', 0, 70000),
(90, 2, 'AR', 0, 70000),
(91, 2, 'AS', 0, 70000),
(92, 2, 'AT', 0, 70000),
(93, 2, 'AU', 0, 70000),
(94, 2, 'AV', 0, 70000),
(95, 2, 'AX', 1, 70000),
(96, 2, 'AY', 1, 70000),
(97, 2, 'BA', 0, 70000),
(98, 2, 'BB', 0, 70000),
(99, 2, 'BC', 0, 70000),
(100, 2, 'BD', 0, 70000),
(101, 3, 'A', 0, 70000),
(102, 3, 'B', 0, 70000),
(103, 3, 'C', 0, 70000),
(104, 3, 'D', 0, 70000),
(105, 3, 'E', 0, 70000),
(106, 3, 'F', 0, 70000),
(107, 3, 'G', 0, 70000),
(108, 3, 'H', 0, 70000),
(109, 3, 'I', 0, 70000),
(110, 3, 'K', 0, 70000),
(111, 3, 'L', 0, 70000),
(112, 3, 'M', 0, 70000),
(113, 3, 'N', 0, 70000),
(114, 3, 'O', 0, 70000),
(115, 3, 'P', 0, 70000),
(116, 3, 'Q', 0, 70000),
(117, 3, 'R', 0, 70000),
(118, 3, 'S', 0, 70000),
(119, 3, 'T', 0, 70000),
(120, 3, 'U', 0, 70000),
(121, 3, 'V', 0, 70000),
(122, 3, 'X', 0, 70000),
(123, 3, 'Y', 0, 70000),
(124, 3, 'AA', 0, 70000),
(125, 3, 'AB', 0, 70000),
(126, 3, 'AC', 0, 70000),
(127, 3, 'AD', 0, 70000),
(128, 3, 'AE', 0, 70000),
(129, 3, 'AF', 0, 70000),
(130, 3, 'AG', 0, 70000),
(131, 3, 'AH', 0, 70000),
(132, 3, 'AI', 0, 70000),
(133, 3, 'AK', 0, 70000),
(134, 3, 'AL', 0, 70000),
(135, 3, 'AM', 0, 70000),
(136, 3, 'AN', 0, 70000),
(137, 3, 'AO', 0, 70000),
(138, 3, 'AP', 0, 70000),
(139, 3, 'AQ', 0, 70000),
(140, 3, 'AR', 0, 70000),
(141, 3, 'AS', 0, 70000),
(142, 3, 'AT', 0, 70000),
(143, 3, 'AU', 0, 70000),
(144, 3, 'AV', 0, 70000),
(145, 3, 'AX', 0, 70000),
(146, 3, 'AY', 0, 70000),
(147, 3, 'BA', 0, 70000),
(148, 3, 'BB', 0, 70000),
(149, 3, 'BC', 0, 70000),
(150, 3, 'BD', 1, 70000),
(151, 4, 'A', 0, 70000),
(152, 4, 'B', 0, 70000),
(153, 4, 'C', 0, 70000),
(154, 4, 'D', 0, 70000),
(155, 4, 'E', 0, 70000),
(156, 4, 'F', 0, 70000),
(157, 4, 'G', 0, 70000),
(158, 4, 'H', 0, 70000),
(159, 4, 'I', 0, 70000),
(160, 4, 'K', 0, 70000),
(161, 4, 'L', 0, 70000),
(162, 4, 'M', 0, 70000),
(163, 4, 'N', 0, 70000),
(164, 4, 'O', 0, 70000),
(165, 4, 'P', 0, 70000),
(166, 4, 'Q', 0, 70000),
(167, 4, 'R', 0, 70000),
(168, 4, 'S', 0, 70000),
(169, 4, 'T', 0, 70000),
(170, 4, 'U', 0, 70000),
(171, 4, 'V', 0, 70000),
(172, 4, 'X', 0, 70000),
(173, 4, 'Y', 0, 70000),
(174, 4, 'AA', 0, 70000),
(175, 4, 'AB', 0, 70000),
(176, 4, 'AC', 0, 70000),
(177, 4, 'AD', 0, 70000),
(178, 4, 'AE', 0, 70000),
(179, 4, 'AF', 0, 70000),
(180, 4, 'AG', 0, 70000),
(181, 4, 'AH', 0, 70000),
(182, 4, 'AI', 0, 70000),
(183, 4, 'AK', 0, 70000),
(184, 4, 'AL', 0, 70000),
(185, 4, 'AM', 0, 70000),
(186, 4, 'AN', 0, 70000),
(187, 4, 'AO', 0, 70000),
(188, 4, 'AP', 0, 70000),
(189, 4, 'AQ', 0, 70000),
(190, 4, 'AR', 0, 70000),
(191, 4, 'AS', 0, 70000),
(192, 4, 'AT', 0, 70000),
(193, 4, 'AU', 0, 70000),
(194, 4, 'AV', 0, 70000),
(195, 4, 'AX', 0, 70000),
(196, 4, 'AY', 0, 70000),
(197, 4, 'BA', 0, 70000),
(198, 4, 'BB', 0, 70000),
(199, 4, 'BC', 0, 70000),
(200, 4, 'BD', 0, 70000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `show_id` int NOT NULL,
  `ticket_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiry_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `user_id`, `seat_id`, `payment_id`, `show_id`, `ticket_name`, `expiry_date`) VALUES
(46, 1, 64, 53, 10, 'Dune', '14:35 02-06-2024'),
(47, 1, 65, 53, 10, 'Dune', '14:35 02-06-2024'),
(48, 1, 85, 53, 10, 'Dune', '14:35 02-06-2024'),
(49, 1, 86, 53, 10, 'Dune', '14:35 02-06-2024'),
(50, 1, 77, 53, 10, 'Dune', '14:35 02-06-2024'),
(51, 1, 78, 53, 10, 'Dune', '14:35 02-06-2024'),
(52, 1, 67, 53, 10, 'Dune', '14:35 02-06-2024'),
(53, 1, 68, 53, 10, 'Dune', '14:35 02-06-2024'),
(72, 1, 74, 55, 10, 'Dune', '14:35 02-06-2024'),
(73, 1, 75, 55, 10, 'Dune', '14:35 02-06-2024'),
(74, 1, 95, 56, 10, 'Dune', '14:35 02-06-2024'),
(75, 1, 96, 56, 10, 'Dune', '14:35 02-06-2024'),
(76, 10, 1, 57, 1, 'Dune', '10:45 02-06-2024'),
(77, 10, 2, 57, 1, 'Dune', '10:45 02-06-2024'),
(78, 10, 6, 58, 1, 'Dune', '10:45 03-06-2024'),
(79, 10, 7, 58, 1, 'Dune', '10:45 03-06-2024'),
(80, 10, 43, 59, 2, 'Interstella', '12:50 03-06-2024'),
(81, 10, 44, 59, 2, 'Interstella', '12:50 03-06-2024'),
(82, 10, 56, 60, 13, 'Teeth', '19:35 03-06-2024'),
(83, 10, 45, 61, 1, 'Dune', '10:45 03-06-2024'),
(84, 13, 150, 62, 21, 'Interstella', '21:00 03-06-2024');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `fullname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `fullname`, `username`, `password`, `email`, `gender`) VALUES
(1, 'Nguyễn Đình Hoàng', 'abc123', 'abc123', 'abc@gmail.com', 0),
(10, 'Dinh Hoang', 'hoang123', '0994319247pj', 'buichuong2005@gmail.com', 0),
(12, 'abbfhh', 'abcabc', '1234567890', 'buichuong2005@gmail.com', 0),
(13, 'abvbac', 'abcabcb', '1234567890', 'buichuong2005@gmail.com', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`cinema_id`);

--
-- Chỉ mục cho bảng `cinema_room`
--
ALTER TABLE `cinema_room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Chỉ mục cho bảng `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Chỉ mục cho bảng `movie_show`
--
ALTER TABLE `movie_show`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `cinema_id` (`cinema_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_ibfk_1` (`user_id`);

--
-- Chỉ mục cho bảng `room_seat`
--
ALTER TABLE `room_seat`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `seat_id` (`seat_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cinema`
--
ALTER TABLE `cinema`
  MODIFY `cinema_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cinema_room`
--
ALTER TABLE `cinema_room`
  MODIFY `room_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `movie_show`
--
ALTER TABLE `movie_show`
  MODIFY `show_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `room_seat`
--
ALTER TABLE `room_seat`
  MODIFY `seat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cinema_room`
--
ALTER TABLE `cinema_room`
  ADD CONSTRAINT `cinema_room_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `movie_show`
--
ALTER TABLE `movie_show`
  ADD CONSTRAINT `movie_show_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_show_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_show_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `cinema_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `room_seat`
--
ALTER TABLE `room_seat`
  ADD CONSTRAINT `room_seat_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `cinema_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `room_seat` (`seat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`show_id`) REFERENCES `movie_show` (`show_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
