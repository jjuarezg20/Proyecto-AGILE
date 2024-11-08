-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2024 a las 23:21:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE membershipdatabase;
USE membershipdatabase;
--
-- Base de datos: `membershipdatabase`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficiario`
--

CREATE TABLE `beneficiario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `updatedate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `beneficiario`
--

INSERT INTO `beneficiario` (`id`, `nombre`, `correo`, `telefono`, `id_estado`, `createdate`, `updatedate`, `deletedate`) VALUES
(1, 'Jorge Medina', 'jorge.medina@example.com', '555-6789', 5, '2024-11-06 14:45:33', '2024-11-06 14:45:33', NULL),
(2, 'Ana Morales', 'ana.morales@example.com', '555-2345', 5, '2024-11-06 14:45:33', '2024-11-06 14:45:33', NULL),
(3, 'Jorge Medina', 'jorge.medina@example.com', '555-6789', 5, '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(4, 'Ana Morales', 'ana.morales@example.com', '555-2345', 5, '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_membresia` int(11) DEFAULT NULL,
  `id_estado_membresia` int(11) DEFAULT NULL,
  `fecha_inicio_membresia` date DEFAULT NULL,
  `fecha_fin_membresia` date DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `updatedate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `correo`, `contrasena`, `telefono`, `id_estado`, `id_membresia`, `id_estado_membresia`, `fecha_inicio_membresia`, `fecha_fin_membresia`, `createdate`, `updatedate`, `deletedate`) VALUES
(1, 'Luis Torres', 'luis.torres@example.com', 'password123', '555-1234', 5, 1, 3, '2023-01-01', '2024-01-01', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(2, 'María López', 'maria.lopez@example.com', 'password456', '555-5678', 5, 2, 3, '2023-02-01', '2024-02-01', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(3, 'Pedro Sánchez', 'pedro.sanchez@example.com', 'password789', '555-9012', 5, 3, 3, '2023-03-01', '2024-03-01', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(4, 'Lucía Méndez', 'lucia.mendez@example.com', 'password321', '555-3456', 6, 1, 4, '2023-04-01', '2024-04-01', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(5, 'Luis Torres', 'luis.torres@example.com', 'password123', '555-1234', 5, 1, 3, '2023-01-01', '2024-01-01', '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(6, 'María López', 'maria.lopez@example.com', 'password456', '555-5678', 5, 2, 3, '2023-02-01', '2024-02-01', '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(7, 'Pedro Sánchez', 'pedro.sanchez@example.com', 'password789', '555-9012', 5, 3, 3, '2023-03-01', '2024-03-01', '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(8, 'Lucía Méndez', 'lucia.mendez@example.com', 'password321', '555-3456', 6, 1, 4, '2023-04-01', '2024-04-01', '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(16, 'Nahomi', '20235806@esen.edu.sv', '123', '7893947', NULL, NULL, NULL, NULL, NULL, '2024-11-06 15:20:47', '2024-11-06 15:20:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_beneficiarios`
--

CREATE TABLE `detalle_beneficiarios` (
  `id_cliente` int(11) NOT NULL,
  `id_beneficiario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_beneficiarios`
--

INSERT INTO `detalle_beneficiarios` (`id_cliente`, `id_beneficiario`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `updatedate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `cargo`, `id_estado`, `usuario`, `password`, `foto`, `ultimo_login`, `createdate`, `updatedate`, `deletedate`) VALUES
(1, 'Juan Pérez', 'admin', 1, 'juan', '$6$rounds=1000000$NJy4rIPjpOaU$k3w.GRHHuqvMzz65urHlpkJ0ATw1l3urCIQg/dqI.LubSycrK72iLDnjwDIlMWFnnq2fTfZp19jrIg7D1XmBu0', NULL, '2024-11-06 14:45:32', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(2, 'Ana Gómez', 'vendedor', 1, 'ana', '$6$rounds=1000000$NJy4rIPjpOaU$k3w.GRHHuqvMzz65urHlpkJ0ATw1l3urCIQg/dqI.LubSycrK72iLDnjwDIlMWFnnq2fTfZp19jrIg7D1XmBu0', NULL, '2024-11-06 14:45:32', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(3, 'Carlos Ruiz', 'vendedor', 2, 'carlos', '$6$rounds=1000000$NJy4rIPjpOaU$k3w.GRHHuqvMzz65urHlpkJ0ATw1l3urCIQg/dqI.LubSycrK72iLDnjwDIlMWFnnq2fTfZp19jrIg7D1XmBu0', NULL, '2024-11-06 14:45:32', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(4, 'James', 'admin', 1, 'james', 'James23', NULL, '2024-11-06 14:45:32', '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(5, 'Juan Pérez', 'admin', 1, 'juan', '$6$rounds=1000000$NJy4rIPjpOaU$k3w.GRHHuqvMzz65urHlpkJ0ATw1l3urCIQg/dqI.LubSycrK72iLDnjwDIlMWFnnq2fTfZp19jrIg7D1XmBu0', NULL, '2024-11-06 14:46:00', '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(6, 'Ana Gómez', 'vendedor', 1, 'ana', '$6$rounds=1000000$NJy4rIPjpOaU$k3w.GRHHuqvMzz65urHlpkJ0ATw1l3urCIQg/dqI.LubSycrK72iLDnjwDIlMWFnnq2fTfZp19jrIg7D1XmBu0', NULL, '2024-11-06 14:46:00', '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(7, 'Carlos Ruiz', 'vendedor', 2, 'carlos', '$6$rounds=1000000$NJy4rIPjpOaU$k3w.GRHHuqvMzz65urHlpkJ0ATw1l3urCIQg/dqI.LubSycrK72iLDnjwDIlMWFnnq2fTfZp19jrIg7D1XmBu0', NULL, '2024-11-06 14:46:00', '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `entidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `estado`, `entidad`) VALUES
(1, 'activo', 'empleado'),
(2, 'inactivo', 'empleado'),
(3, 'activo', 'membresia'),
(4, 'cancelado', 'membresia'),
(5, 'activo', 'cliente'),
(6, 'cancelado', 'cliente'),
(7, 'pendiente', 'cliente'),
(8, 'activo', 'empleado'),
(9, 'inactivo', 'empleado'),
(10, 'activo', 'membresia'),
(11, 'cancelado', 'membresia'),
(12, 'activo', 'cliente'),
(13, 'cancelado', 'cliente'),
(14, 'pendiente', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresia`
--

CREATE TABLE `membresia` (
  `id` int(11) NOT NULL,
  `membresia` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `beneficios` text DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `updatedate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresia`
--

INSERT INTO `membresia` (`id`, `membresia`, `precio`, `beneficios`, `id_estado`, `createdate`, `updatedate`, `deletedate`) VALUES
(1, 'Diamond', 100.00, '2 Members Max, Includes 2 cards, Access to all services', 3, '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(2, 'Platinum', 90.40, '2 Members Max, Includes 2 cards, Access to all services, 2% Rewards', 3, '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(3, 'Business', 115.00, 'Add up to 3 additional members, Includes 2 cards, Access to all services, Business services included', 3, '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(4, 'Business Platinum', 130.00, 'Add up to 3 additional members, Includes 2 cards, Access to all services, Business services and 2% rewards', 3, '2024-11-06 14:45:32', '2024-11-06 14:45:32', NULL),
(5, 'Diamond', 100.00, '2 Members Max, Includes 2 cards, Access to all services', 3, '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(6, 'Platinum', 90.40, '2 Members Max, Includes 2 cards, Access to all services, 2% Rewards', 3, '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(7, 'Business', 115.00, 'Add up to 3 additional members, Includes 2 cards, Access to all services, Business services included', 3, '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL),
(8, 'Business Platinum', 130.00, 'Add up to 3 additional members, Includes 2 cards, Access to all services, Business services and 2% rewards', 3, '2024-11-06 14:46:00', '2024-11-06 14:46:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_pago`
--

CREATE TABLE `registro_pago` (
  `id` int(11) NOT NULL,
  `numero_tarjeta` int(16) DEFAULT NULL,
  `nombre_tarjeta` varchar(100) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `security_code` int(3) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_membresia` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT current_timestamp(),
  `updatedate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_pago`
--

INSERT INTO `registro_pago` (`id`, `numero_tarjeta`, `nombre_tarjeta`, `expiration_date`, `security_code`, `id_cliente`, `id_estado`, `id_membresia`, `createdate`, `updatedate`, `deletedate`) VALUES
(1, 2147483647, 'Juan Perez', '2025-08-31', 123, 1, 1, 1, '2023-01-01 10:00:00', '2023-01-01 10:00:00', NULL),
(2, 2147483647, 'Maria Lopez', '2024-12-31', 456, 2, 2, 2, '2023-02-01 15:30:00', '2023-02-01 15:30:00', NULL),
(3, 2147483647, 'Carlos Martinez', '2026-07-31', 789, 3, 1, 3, '2023-03-01 12:45:00', '2023-03-01 12:45:00', NULL),
(4, 2147483647, 'Ana Gonzalez', '2025-11-30', 321, 4, 2, 1, '2023-04-01 08:20:00', '2023-04-01 08:20:00', NULL),
(5, 2147483647, 'Luis Ramirez', '2024-05-31', 654, 5, 1, 2, '2023-05-01 18:10:00', '2023-05-01 18:10:00', NULL),
(6, 2147483647, 'Nahomi Ortiz', '0000-00-00', 123, NULL, NULL, NULL, '2024-11-06 15:20:47', '2024-11-06 15:20:47', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_membresia` (`id_membresia`),
  ADD KEY `id_estado_membresia` (`id_estado_membresia`);

--
-- Indices de la tabla `detalle_beneficiarios`
--
ALTER TABLE `detalle_beneficiarios`
  ADD PRIMARY KEY (`id_cliente`,`id_beneficiario`),
  ADD KEY `id_beneficiario` (`id_beneficiario`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `registro_pago`
--
ALTER TABLE `registro_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_membresia` (`id_membresia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `membresia`
--
ALTER TABLE `membresia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `registro_pago`
--
ALTER TABLE `registro_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD CONSTRAINT `beneficiario_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`id_membresia`) REFERENCES `membresia` (`id`),
  ADD CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`id_estado_membresia`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `detalle_beneficiarios`
--
ALTER TABLE `detalle_beneficiarios`
  ADD CONSTRAINT `detalle_beneficiarios_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `detalle_beneficiarios_ibfk_2` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiario` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD CONSTRAINT `membresia_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `registro_pago`
--
ALTER TABLE `registro_pago`
  ADD CONSTRAINT `registro_pago_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `registro_pago_ibfk_2` FOREIGN KEY (`id_membresia`) REFERENCES `membresia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
