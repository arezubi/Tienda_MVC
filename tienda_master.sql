-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-04-2023 a las 10:05:07
-- Versión del servidor: 5.7.36
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_master`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Manga corta'),
(2, 'Tirantes'),
(3, 'Manga larga'),
(4, 'Sudaderas'),
(5, 'Cuerdas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_pedidos`
--

DROP TABLE IF EXISTS `lineas_pedidos`;
CREATE TABLE IF NOT EXISTS `lineas_pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(255) NOT NULL,
  `producto_id` int(255) NOT NULL,
  `unidades` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_linea_pedido` (`pedido_id`),
  KEY `fk_linea_producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lineas_pedidos`
--

INSERT INTO `lineas_pedidos` (`id`, `pedido_id`, `producto_id`, `unidades`) VALUES
(4, 10, 1, 1),
(5, 10, 11, 2),
(6, 11, 1, 1),
(7, 11, 11, 2),
(8, 12, 1, 1),
(9, 12, 11, 2),
(10, 13, 1, 1),
(11, 13, 11, 2),
(12, 14, 11, 1),
(13, 15, 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `coste` float(100,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `provincia`, `localidad`, `direccion`, `coste`, `estado`, `fecha`, `hora`) VALUES
(10, 10, 'Madrid', 'Colmenar Viejo', 'Remedios 31 3A', 165.99, 'corfirm', '2023-02-11', '21:00:22'),
(11, 10, 'Valencia', 'Sagunto', 'Remedios 31', 165.99, 'corfirm', '2023-02-11', '21:08:47'),
(12, 10, 'Madrid', 'Colmenar', 'remedios', 165.99, 'corfirm', '2023-02-13', '11:41:25'),
(13, 10, 'colmear', 'madir', 'remedios', 165.99, 'corfirm', '2023-02-14', '09:03:28'),
(14, 11, 'madrid', 'madrid', 'madrids', 30.00, 'corfirm', '2023-03-08', '18:57:44'),
(15, 11, 'madrid', 'madridd', 'dsdsa', 30.00, 'preparation', '2023-03-08', '19:28:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` float(100,2) NOT NULL,
  `stock` int(255) NOT NULL,
  `oferta` varchar(2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `nombre`, `descripcion`, `precio`, `stock`, `oferta`, `fecha`, `imagen`) VALUES
(1, 5, 'Petzl Club 10mm x 70m', 'Petzl Club 10mm x 70m', 105.99, 20, NULL, '2023-02-07', NULL),
(5, 5, 'bolsa magnesio', 'Bolsa para llevar magnesio', 30.00, 50, NULL, '2023-02-08', NULL),
(11, 5, 'Bolsa Magnesio', 'Bolsa de magnesio con foto', 30.00, 2, NULL, '2023-02-08', 'bolsa.jpeg'),
(12, 5, 'Bolsa ', 'Bolsa de magnesio con foto', 30.00, 2, NULL, '2023-02-08', 'bolsa.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `rol`, `imagen`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', 'contraseña', 'admin', NULL),
(2, 'dfsdfdsf', 'asdfasdf', 'sdsada@gmail.com', '$2y$10$cady56zrxKvpnicoGH4LAeyH3172aJllT5bjWbDvKsus6v9HoKFbC', 'user', NULL),
(6, 'dasdsad', 'asdasd', 'asda@gmail.com', '$2y$10$Xx30q9DAETgjg2qIaviZiOOpUvGuhamaOJU2AvYEV7tW5loLjQnQ6', 'user', NULL),
(7, 'pdfpdf', 'dofksdfo', 'sdsad@gdsd.com', '$2y$10$z25p8jx2JVuLB6SdUA8pVOGywbdoJIKkdj26vrgv2QaiKqvSlC1jG', 'user', NULL),
(8, 'Javier', 'Reyes', 'reyes@reyes.com', '$2y$10$8iYut1E7VFJi5hrG9AY6w.1Gh6RPKY2H7m0U88VHep8DaECKyLms6', 'user', NULL),
(9, '5646546', '654654', 'sfdsdfasf@gmail.com', '$2y$10$nGJss22OgUVZe.5LH4.d9O8LRXd2ateVCfVYiMSeYzBBNfyZXA4be', 'user', NULL),
(10, 'Andrés', 'Reyes', 'arezubi@gmail.com', '$2y$10$dLg/GanTVqIlKWA7GYbPEuCiy88hnZ64gD0udlxyRUC7uIxbAydUC', 'user', NULL),
(11, 'Cristina', 'Cancela', 'cancela.cristina@gmail.com', '$2y$04$TAAJom1LFg/fabhgRsD7Q.jr4.iRh0LHImvSOlcQZ4kDBnqlHntR2', 'admin', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  ADD CONSTRAINT `fk_linea_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
