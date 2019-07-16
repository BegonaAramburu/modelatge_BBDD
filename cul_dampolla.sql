-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2019 a las 10:50:48
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_dampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(5) NOT NULL,
  `nombre_cl` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cp_cl` int(5) NOT NULL,
  `tf_cl` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `email_cl` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fechaReg_cl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `clRecomendado_cl` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cl`, `cp_cl`, `tf_cl`, `email_cl`, `fechaReg_cl`, `clRecomendado_cl`) VALUES
(5, 'Julián López Jarama', 8022, '654092837', 'julian.lopez@gmail.com', '2019-07-13 22:00:00', NULL),
(6, 'María Jover Pla', 8006, '670125342', 'maria.j.p@gmail.com', '2019-07-14 22:00:00', 5),
(7, 'Carlos Mayor Leal', 8003, '666903951', 'carlos.mayor@gmail.com', '2019-07-10 22:00:00', NULL),
(8, 'Ana Soberas Gatra', 8022, '646394230', 'anaSoberasGatra@hotmail.com', '2019-07-14 22:00:00', 7),
(9, 'Fátima Lorenzo Mejillas', 8015, '621009934', 'fatima.lorenzo@hotmail.com', '2019-07-14 22:00:00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cristales`
--

CREATE TABLE `cristales` (
  `id_cristales` int(5) NOT NULL,
  `graduacionD_cr` float(4,2) NOT NULL,
  `graduacionI_cr` float(4,2) NOT NULL,
  `color_cr` enum('azul','marron','degradado azul','degradado marron','transparente') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cristales`
--

INSERT INTO `cristales` (`id_cristales`, `graduacionD_cr`, `graduacionI_cr`, `color_cr`) VALUES
(5, 1.75, 2.00, 'azul'),
(6, 0.50, 1.00, 'transparente'),
(7, 3.50, 4.25, 'degradado marron'),
(8, 3.00, 3.00, 'transparente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(5) NOT NULL,
  `nombre_emp` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre_emp`) VALUES
(1, 'Pedro Romero Sánchez'),
(2, 'Marta Rodriguez Salero'),
(3, 'Aina López Lumbi'),
(4, 'Carla Ruin Trapero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gafas`
--

CREATE TABLE `gafas` (
  `id_gafas` int(5) NOT NULL,
  `marca_ga` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `precio_ga` float(6,2) NOT NULL,
  `proveedor_id` int(5) NOT NULL,
  `cliente_id` int(5) NOT NULL,
  `empleado_id` int(5) NOT NULL,
  `cristales_id` int(5) NOT NULL,
  `montura_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gafas`
--

INSERT INTO `gafas` (`id_gafas`, `marca_ga`, `precio_ga`, `proveedor_id`, `cliente_id`, `empleado_id`, `cristales_id`, `montura_id`) VALUES
(1, 'TOUS', 450.35, 1, 8, 4, 7, 1),
(2, 'RAVES', 55.30, 4, 7, 2, 5, 1),
(3, 'VOGUE', 530.00, 3, 5, 3, 7, 6),
(4, 'TOUS', 300.00, 1, 6, 4, 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `montura`
--

CREATE TABLE `montura` (
  `id_montura` int(5) NOT NULL,
  `tipo_mo` enum('flotante','pasta','metalica') COLLATE utf8_spanish_ci NOT NULL,
  `color_mo` enum('dorado','plateado','madera','solido') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `montura`
--

INSERT INTO `montura` (`id_montura`, `tipo_mo`, `color_mo`) VALUES
(1, 'flotante', 'plateado'),
(2, 'flotante', 'dorado'),
(3, 'metalica', 'dorado'),
(4, 'metalica', 'plateado'),
(5, 'pasta', 'solido'),
(6, 'pasta', 'madera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(5) NOT NULL,
  `nombre_pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `calle_pro` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cp_pro` int(5) NOT NULL,
  `pais_pro` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `tf_pro` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `nif_pro` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `fax_pro` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_pro`, `calle_pro`, `cp_pro`, `pais_pro`, `tf_pro`, `nif_pro`, `fax_pro`) VALUES
(1, 'Glasses.sl', 'C/Balmes 237', 8035, 'España', '932115342', 'S75332098', NULL),
(2, 'LoVeoTodo', 'C/Roger de Flor 54', 8002, 'España', '934286777', 'P83343206', 934181626),
(3, 'Ya lo Veo', 'Pza. Catalunya 42', 8001, 'España', '934955623', 'L86677433', NULL),
(4, 'Gafas Pablos', 'C/ Carmen 431', 8033, 'España', '934458768', 'A87556333', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email_cl` (`email_cl`),
  ADD KEY `clRecomendado_cl` (`clRecomendado_cl`);

--
-- Indices de la tabla `cristales`
--
ALTER TABLE `cristales`
  ADD PRIMARY KEY (`id_cristales`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD PRIMARY KEY (`id_gafas`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `cristales_id` (`empleado_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `cristales_id_2` (`cristales_id`),
  ADD KEY `montura_id` (`montura_id`);

--
-- Indices de la tabla `montura`
--
ALTER TABLE `montura`
  ADD PRIMARY KEY (`id_montura`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `nif_pro` (`nif_pro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cristales`
--
ALTER TABLE `cristales`
  MODIFY `id_cristales` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `gafas`
--
ALTER TABLE `gafas`
  MODIFY `id_gafas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `montura`
--
ALTER TABLE `montura`
  MODIFY `id_montura` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`clRecomendado_cl`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD CONSTRAINT `gafas_ibfk_3` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `gafas_ibfk_4` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id_empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `gafas_ibfk_5` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `gafas_ibfk_6` FOREIGN KEY (`montura_id`) REFERENCES `montura` (`id_montura`),
  ADD CONSTRAINT `gafas_ibfk_7` FOREIGN KEY (`cristales_id`) REFERENCES `cristales` (`id_cristales`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
