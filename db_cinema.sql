-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 13, 2024 lúc 04:34 PM
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
  `cinema_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `cinema_img` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `sdt` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
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
  `room_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
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
(8, 2, 'H4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie`
--

CREATE TABLE `movie` (
  `movie_id` int NOT NULL,
  `movie_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `movie_img` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `duration` int NOT NULL,
  `actors` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `directors` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `release_date` text COLLATE utf8mb4_general_ci,
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_name`, `status`, `movie_img`, `duration`, `actors`, `directors`, `release_date`, `description`) VALUES
(1, 'Dune', 1, 'https://i.pinimg.com/736x/12/3f/4c/123f4ca3e5ba509241ecc351a1f5b753.jpg', 166, 'Timothée Chalamet, Zendaya, Rebecca Ferguson, Javier Bardem, Josh Brolin, Austin Butler', 'Denis Villeneuve', '28/02/2024', 'Following the fall of House Atreides in Dune (2021), exiled Duke Paul Atreides continues his journey of enlightenment in the barren deserts of Arrakis. Soon, the noble son embraces the ways of the blue-eyed Fremen warriors, unaware that rumours about the prophesied Dune Messiah divide the tribe. After all, the suffocating grip of House Harkonnen tightens by the minute, ushering in a brutal era of war over the control of the planet and its vast spice-rich fields. But above all else, water is life. As shrewd machinators plot destruction and death, the volatile future demands the emergence of a new leader. Now caught between personal hopes and the aspirations of others, will Paul become the fighter he always wanted to be?'),
(2, 'Interstella', 1, 'https://i.pinimg.com/564x/d2/70/89/d270896d9bfbc63513d1090224070e8b.jpg', 169, 'Matthew McConaughey, Anne Hathaway, Jessica Chastain, Mackenzie Foy', 'Christopher Nolan', '26/10/2014', 'Earth\'s future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind\'s survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.'),
(3, 'Teeth', 1, 'https://i.pinimg.com/564x/f8/df/d7/f8dfd77aebf20a6f06722e6b349f439b.jpg', 0, NULL, NULL, NULL, 'ấdfasdfasdf'),
(4, 'Rivers', 1, 'https://i.pinimg.com/564x/f6/65/ac/f665ac5c9f6888d4608fa0ed20c70923.jpg', 0, NULL, NULL, NULL, 'a'),
(5, 'The Call Of The Wild', 1, 'https://i.pinimg.com/736x/c9/d9/11/c9d9118099b6b899f62ba3ffa82903ee.jpg', 0, NULL, NULL, NULL, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqq'),
(6, 'Parasite', 1, 'https://i.pinimg.com/564x/5e/24/ca/5e24ca5266644f92d331fc6e88930b85.jpg', 0, NULL, NULL, NULL, 'wwwwwwwwwwwwwwwwwww'),
(7, 'Bird Box', 1, 'https://i.pinimg.com/564x/32/c5/96/32c5966ffd0c9f4fb1f4075d560ac420.jpg', 0, NULL, NULL, NULL, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
(8, 'The Witch', 1, 'https://i.pinimg.com/736x/f4/f0/4a/f4f04a43138524a907289e5cd87750f0.jpg', 0, NULL, NULL, NULL, 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'),
(9, 'Room', 1, 'https://i.pinimg.com/564x/30/59/c1/3059c11e43be0b0e68e8d0c049017fc9.jpg', 0, NULL, NULL, NULL, 'ggggggggggggggggggggggggggggggg'),
(10, 'Stranger Things', 0, 'https://i.pinimg.com/736x/68/46/5a/68465aaec5f8632d0103c938ec5f3425.jpg', 0, NULL, NULL, NULL, 'ghhhhhhhhhhhhhhhhhh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_show`
--

CREATE TABLE `movie_show` (
  `show_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `room_id` int NOT NULL,
  `start_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `movie_show`
--

INSERT INTO `movie_show` (`show_id`, `cinema_id`, `movie_id`, `room_id`, `start_time`) VALUES
(1, 1, 1, 1, '13:00:00'),
(2, 1, 1, 2, '16:00:00'),
(3, 1, 1, 3, '18:00:00'),
(4, 1, 1, 4, '21:00:00'),
(43, 1, 2, 1, '08:00:00'),
(44, 1, 2, 2, '09:00:00'),
(45, 1, 2, 3, '10:00:00'),
(46, 1, 2, 4, '12:00:00'),
(51, 2, 2, 1, '08:00:00'),
(52, 2, 2, 2, '09:00:00'),
(53, 2, 2, 3, '10:00:00'),
(54, 2, 2, 4, '12:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_seat`
--

CREATE TABLE `room_seat` (
  `seat_id` int NOT NULL,
  `room_id` int NOT NULL,
  `seat_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `seat_status` tinyint(1) NOT NULL,
  `price` int NOT NULL DEFAULT '70000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_seat`
--

INSERT INTO `room_seat` (`seat_id`, `room_id`, `seat_name`, `seat_status`, `price`) VALUES
(1, 1, 'A', 0, 70000),
(2, 1, 'B', 0, 70000),
(3, 1, 'C', 0, 70000),
(4, 1, 'D', 0, 70000),
(5, 1, 'E', 0, 70000),
(6, 1, 'F', 0, 70000),
(7, 1, 'G', 1, 70000),
(8, 1, 'H', 1, 70000),
(9, 1, 'I', 1, 70000),
(10, 1, 'J', 1, 70000),
(11, 2, 'A', 1, 70000),
(12, 2, 'B', 0, 70000),
(13, 2, 'C', 0, 70000),
(14, 2, 'D', 0, 70000),
(15, 2, 'E', 1, 70000),
(16, 2, 'F', 0, 70000),
(17, 2, 'G', 0, 70000),
(18, 2, 'H', 1, 70000),
(19, 2, 'I', 1, 70000),
(20, 2, 'J', 1, 70000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`) VALUES
(1, 'abc123', 'abc123');

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
-- Chỉ mục cho bảng `room_seat`
--
ALTER TABLE `room_seat`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `room_id` (`room_id`);

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
  MODIFY `room_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `movie_show`
--
ALTER TABLE `movie_show`
  MODIFY `show_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `room_seat`
--
ALTER TABLE `room_seat`
  MODIFY `seat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Các ràng buộc cho bảng `room_seat`
--
ALTER TABLE `room_seat`
  ADD CONSTRAINT `room_seat_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `cinema_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
