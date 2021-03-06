-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 25 2022 г., 17:41
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

create database IF NOT exists `db_products` default character SET utf8mb4 collate utf8mb4_unicode_ci;
USE `db_products`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bd_product`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `ID_category` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`ID_category`, `name`, `description`) VALUES
(1, 'Товары для дома', 'В этом разделе представлены товары для дома (по типу швабры, ведра и тд.)'),
(2, 'Игровые консоли', 'В этом разделе представлены актуальные игровые консоли'),
(3, 'Мебель', 'В этом разделе представлена вся мебель');

-- --------------------------------------------------------

--
-- Структура таблицы `img`
--

CREATE TABLE `img` (
  `ID_IMG` int NOT NULL,
  `link` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ALT` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `img`
--

INSERT INTO `img` (`ID_IMG`, `link`, `name`, `ALT`) VALUES
(1, 'img/ps3.jpg', 'Консоль ps3 (черная)', 'Тут должна быть картинка консоли'),
(2, 'img/ps4.jpg', 'Консоль ps4 (белая)', 'Тут должна быть картинка консоли'),
(3, 'img/vedro.png', 'Ведро', 'Тут должна быть картинка ведра'),
(4, 'img/shvabra.jpg', 'швабра', 'Тут должна быть картинка швабры'),
(5, 'img/sofa.png', 'диван', 'Тут должна быть картинка дивана'),
(6, 'img/table.png', 'Столик кофейный', 'Тут должна быть картинка столика');

-- --------------------------------------------------------

--
-- Структура таблицы `productcategory`
--

CREATE TABLE `productcategory` (
  `ID_category` int NOT NULL,
  `ID_product` int NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `productcategory`
--

INSERT INTO `productcategory` (`ID_category`, `ID_product`, `description`) VALUES
(1, 2345, 'Ведро (увеличенной емкости)'),
(2, 2672, 'Игровая консоль play station 3'),
(3, 3847, 'Диван (подержаный)'),
(2, 4356, 'Игровая консоль play station 4'),
(1, 4536, 'Ведро (уменьшенной емкости)'),
(2, 6790, 'Игровая консоль play station 3 (уменьшенный объем)'),
(3, 7637, 'Кресло (красное)'),
(2, 7653, 'Игровая консоль play station 3 (увеличенный)'),
(3, 8475, 'Стол кофейный'),
(1, 9874, 'Ведро для дома'),
(3, 43567, 'Диван');

-- --------------------------------------------------------

--
-- Структура таблицы `productimg`
--

CREATE TABLE `productimg` (
  `ID_product` int NOT NULL,
  `ID_IMG` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `productimg`
--

INSERT INTO `productimg` (`ID_product`, `ID_IMG`) VALUES
(2672, 1),
(4356, 2),
(4356, 2),
(9874, 4),
(453, 4),
(4536, 3),
(2345, 3),
(6790, 1),
(7653, 1),
(43567, 5),
(3847, 5),
(8475, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `ID_product` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `main_IMG` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `price_discount` int DEFAULT NULL,
  `price_promo` int DEFAULT NULL,
  `category` int NOT NULL,
  `amount` int DEFAULT NULL,
  `prductActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`ID_product`, `name`, `main_IMG`, `price`, `price_discount`, `price_promo`, `category`, `amount`, `prductActive`) VALUES
(453, 'Швабра (удлиненная)', 4, 300, 200, 200, 1, 987, 1),
(2345, 'Ведро (увеличенной емкости)', 3, 300, 280, 280, 1, 78, 1),
(2672, 'ps3', 1, NULL, NULL, NULL, 2, 56, 1),
(3847, 'Диван (подержанный)', 5, 324432, 32432, 2345, 3, 56, 1),
(4356, 'Play Station 4', 2, 25000, 22000, 19000, 2, 40, 1),
(4536, 'Ведро (уменьшенной емкости)', 3, 100, 80, 80, 1, 570, 1),
(6790, 'Play staion 3 (м)', 1, 1000, 400, 600, 2, 40, 1),
(7637, 'Кресло (красное)', NULL, 213234, 4342, 52234, 3, 56, 1),
(7653, 'Play station 3', 1, 6000, 5678, 3005, 2, 40, 1),
(8475, 'Стол (кофейный)', 6, 213321, 321321, 32133, 3, 78, 1),
(9874, 'Ведро', 3, 213, 199, 190, 1, 78, 1),
(43567, 'Диван', 5, 30000, 234324, 2345, 3, 56, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_category`);

--
-- Индексы таблицы `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`ID_IMG`);

--
-- Индексы таблицы `productcategory`
--
ALTER TABLE `productcategory`
  ADD UNIQUE KEY `ID_product` (`ID_product`) USING BTREE,
  ADD KEY `ID_category` (`ID_category`) USING BTREE;

--
-- Индексы таблицы `productimg`
--
ALTER TABLE `productimg`
  ADD KEY `ID_IMG` (`ID_IMG`),
  ADD KEY `ID_product` (`ID_product`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID_product`),
  ADD KEY `category` (`category`),
  ADD KEY `main_IMG` (`main_IMG`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `ID_category` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `img`
--
ALTER TABLE `img`
  MODIFY `ID_IMG` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `ID_category` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `ID_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43568;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `productcategory`
--
ALTER TABLE `productcategory`
  ADD CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`ID_category`) REFERENCES `category` (`ID_category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productcategory_ibfk_2` FOREIGN KEY (`ID_product`) REFERENCES `products` (`ID_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `productimg`
--
ALTER TABLE `productimg`
  ADD CONSTRAINT `productimg_ibfk_1` FOREIGN KEY (`ID_IMG`) REFERENCES `img` (`ID_IMG`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `productimg_ibfk_2` FOREIGN KEY (`ID_product`) REFERENCES `products` (`ID_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`ID_category`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`main_IMG`) REFERENCES `img` (`ID_IMG`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
