-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2022 a las 00:39:26
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `CP` smallint(6) DEFAULT NULL,
  `RFC` decimal(4,0) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `payment` decimal(4,0) DEFAULT NULL,
  `tax` decimal(4,0) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CLIENTE_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cost` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL,
  `cost` decimal(4,0) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoice_cliente` (`CLIENTE_ID`);

--
-- Indices de la tabla `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`invoice_id`,`product_id`),
  ADD KEY `fk_invoicedetail_product` (`product_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_invoice_cliente` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `fk_invoicedetail_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_invoicedetail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
