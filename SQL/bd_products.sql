-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 24 2022 г., 15:29
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bd_products`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `ID` int NOT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Category` int NOT NULL,
  `id_IMG` int DEFAULT NULL,
  `productActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`ID`, `Product_Name`, `Category`, `id_IMG`, `productActive`) VALUES
(1001, 'Игрушка Акула (Синяя)', 5, 5, 1),
(1002, 'Игрушка Акула (Голубая)', 5, 5, 1),
(1237, 'Ведро', 1, 2, 1),
(2001, 'Золотое кольцо для женщин', 4, 6, 1),
(2002, 'Золотое кольцо, женское (со сколом)', 4, 6, 1),
(2811, 'Другая консоль ps5(лучший ddr)', 2, 3, 1),
(2877, 'Швабра', 1, 1, 1),
(2878, 'Другая швабра', 1, 1, 1),
(3749, 'Консоль ps3 (в идеальном состоянии)', 2, 4, 1),
(6666, 'Консоль ps5', 2, 3, 1),
(7856, 'Консоль ps3 с небольшими царапинами на корпусе', 2, 4, 1),
(8000, 'Серьги', 4, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id_IMG` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id_IMG`, `name`) VALUES
(1, 'швабра'),
(2, 'ведро'),
(3, 'PS5'),
(4, 'PS3'),
(5, 'Акула из Икеи'),
(6, 'Кольцо');

-- --------------------------------------------------------

--
-- Структура таблицы `links_img`
--

CREATE TABLE `links_img` (
  `ID` int NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `links_img`
--

INSERT INTO `links_img` (`ID`, `link`) VALUES
(1, 'img/shvabra.png'),
(2, 'img/vedro.png'),
(3, 'img/PS5'),
(4, 'img/PS3'),
(5, 'img/shark.png'),
(6, 'img/ring.png');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `ID_Product` int NOT NULL,
  `Category` int NOT NULL,
  `id_IMG` int DEFAULT NULL,
  `Headline` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IMGoptional` varchar(100) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `PriceDiscount` int DEFAULT NULL,
  `PricePromo` int DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `productActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`ID_Product`, `Category`, `id_IMG`, `Headline`, `IMGoptional`, `Price`, `PriceDiscount`, `PricePromo`, `Description`, `productActive`) VALUES
(1001, 5, 5, 'Игрушка Акулы (Синяя)', NULL, 3434, 123, 42, 'Игрушка Акулы (Синяя)', 1),
(1002, 5, 5, 'Игрушка Акулы (голубая)', NULL, 213, 21, 234, 'Игрушка Акулы (голубая)', 1),
(1237, 1, 2, 'Ведро', NULL, 324324, 1331, 32423, 'Емкое ведро', 1),
(2001, 4, 6, 'Золотое кольцо', NULL, NULL, NULL, NULL, 'Золотое кольцо, для женщин', NULL),
(2002, 4, 6, 'Кольцо золотое (со сколом)', NULL, NULL, NULL, NULL, 'Золотое кольцо со сколом', 1),
(2811, 2, 3, 'Другая консоль ps5', NULL, 432432, 123123, 4324, 'Консоль с улучшенной ddr', 1),
(2877, 1, 1, 'Швабра', NULL, 12312, 123, 4124, 'Удобная деревянная швабра', 1),
(2878, 1, 1, 'Другая швабра', NULL, 123214, 3243, 234123, 'Так же швабра, но чуть короче. Картинку не меняем', 1),
(3749, 2, 4, 'Консоль ps3 (в идеальном состоянии)', NULL, 123213, 3234, 324123, 'Консоль ps3 (в идеальном состоянии), только с завода', 1),
(6666, 2, 3, 'Консоль ps5', NULL, 123124, 412312, 1234, 'Консоль игровая PS5', 1),
(7856, 2, 4, 'PS3 подержканая', NULL, 32423, 123213, 32432, 'Игровая консоль ps3 (с небольшими царапинами)', 1),
(8000, 4, NULL, 'Серьги', NULL, 213123, 12312, 213, 'Серьги для ушей', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `productscategory`
--

CREATE TABLE `productscategory` (
  `ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `count_` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `productscategory`
--

INSERT INTO `productscategory` (`ID`, `Name`, `count_`) VALUES
(1, 'Товары для дома', 56),
(2, 'Консоли', 123),
(3, 'Мебель', 99),
(4, 'Украшения', 457),
(5, 'Мягкие игрушки', 900);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_IMG` (`id_IMG`),
  ADD KEY `Category` (`Category`) USING BTREE;

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_IMG`);

--
-- Индексы таблицы `links_img`
--
ALTER TABLE `links_img`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID_Product`),
  ADD KEY `id_IMG` (`id_IMG`),
  ADD KEY `Category` (`Category`);

--
-- Индексы таблицы `productscategory`
--
ALTER TABLE `productscategory`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8001;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id_IMG` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `links_img`
--
ALTER TABLE `links_img`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `ID_Product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8001;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_IMG`) REFERENCES `images` (`id_IMG`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`Category`) REFERENCES `productscategory` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_ibfk_3` FOREIGN KEY (`ID`) REFERENCES `products` (`ID_Product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`id_IMG`) REFERENCES `links_img` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_IMG`) REFERENCES `images` (`id_IMG`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`Category`) REFERENCES `productscategory` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
