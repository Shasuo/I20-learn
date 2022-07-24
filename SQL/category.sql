-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 24 2022 г., 15:25
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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8001;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
