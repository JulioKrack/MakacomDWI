-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2024 a las 07:14:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `makacom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `banner_img` text DEFAULT NULL,
  `referencia_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `banner_img`, `referencia_img`) VALUES
(3, 'Teclados', 'teclados mecanicos', '../images/Categorias/banners/TecladosBanner.webp', '../images/Categorias/imgs/Teclado.webp'),
(4, 'mouse', 'movilidad y velocidad ', '../images/Categorias/banners/mousebanner.jpg', '../images/Categorias/imgs/mouse.webp'),
(5, 'Audifonos', 'fuerza de sonido , calidad y precio', '../images/Categorias/banners/audifonobanner.jpg', '../images/Categorias/imgs/audifonos.png'),
(6, 'Laptop', 'facil manejo y manejo de datos', '../images/Categorias/banners/laptopbanner.jpg', '../images/Categorias/imgs/laptop.webp'),
(7, 'parlantes', 'fuerza de sonido', '../images/Categorias/banners/bannerparlante.jpg', '../images/Categorias/imgs/parlante.png'),
(8, 'microfonos', 'algo bueno', '../images/Categorias/banners/microfonobanner.jpg', '../images/Categorias/imgs/microfono.jpg'),
(9, 'compus', 'compusssss', '../images/Categorias/banners/LaptopsBanner.webp', '../images/Categorias/imgs/Laptop.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `usuario_id` bigint(20) NOT NULL,
  `telefono` char(9) NOT NULL,
  `puntos` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`usuario_id`, `telefono`, `puntos`) VALUES
(3, '926782775', 0),
(4, '123456789', 0),
(5, '987655432', 0),
(6, '987655432', 0),
(7, '987655432', 0),
(27, '43223423', 0),
(28, '123219831', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combos`
--

CREATE TABLE `combos` (
  `id` bigint(20) NOT NULL,
  `promocion_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `producto_id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `comentario` text NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) NOT NULL,
  `transaccion` varchar(255) DEFAULT NULL,
  `fecha` varchar(50) DEFAULT NULL,
  `hora` varchar(50) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `proveedor_id` bigint(20) NOT NULL,
  `marca_id` bigint(20) NOT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  `producto_id` bigint(20) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `transaccion`, `fecha`, `hora`, `monto`, `proveedor_id`, `marca_id`, `metodo_pago`, `producto_id`, `Cantidad`) VALUES
(7, 'GMS8O8UNUDDW4K0F', '2024-06-30', '23:47', 150.00, 34, 5, 'Efectivo', 7, 15),
(8, '5JUPJB5H99VDI6G3', '2024-06-30', '23:56', 1600.00, 34, 5, 'Efectivo', 7, 15),
(9, 'JLAS3W5OKVHQJGOZ', '2024-07-01', '00:11', 600.00, 34, 5, 'Efectivo', 7, 15),
(10, 'S0M2ET0DSS41Y48X', '2024-07-01', '00:12', 1500.00, 33, 3, 'Efectivo', 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

CREATE TABLE `compra_detalle` (
  `id` bigint(20) NOT NULL,
  `compra_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `monto_unit` decimal(10,2) DEFAULT NULL,
  `desc_aplicado` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `banner_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descripcion`, `banner_img`) VALUES
(3, 'Alienware', 'Marcas', '../images/Marcas/HyperXBanner.webp'),
(4, 'Aorus', 'Marcas', '../images/Marcas/AorusBanner.webp'),
(5, 'Logitech', 'Marcas', '../images/Marcas/logitechsymbol.webp'),
(6, 'razerrrrrrrrr', 'dsadasda', '../images/Marcas/MSIBanner.webp'),
(7, 'preubaaaa', 'fdksfjlds', '../images/Marcas/NewCanvas1.jpg'),
(8, 'pro1', '213123', '../images/Marcas/NewCanvas1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `marca_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `especificaciones` text NOT NULL,
  `img` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `marca_id`, `categoria_id`, `especificaciones`, `img`, `cantidad`, `descuento`, `estado`) VALUES
(3, 'Teclado Alienware', 'dhfhdhdhdhdhdh', 200.00, 3, 3, '-afgagagagagagaaggag -sgagagagfjfjfj -dhddhdhhdhd -agagagaggaga', '../images/Productos/keyboard-alienware-aw920k-black-gallery-1.png', 12, 0.10, 'Habilitado'),
(4, 'Monitor Aorus', 'agagagag', 100.00, 4, 3, '-sgshshsh -dhddhdhdhh', '../images/Productos/400 (5).webp', 8, 0.00, 'Habilitado'),
(5, 'Teclado micronics', 'buen teclado', 150.00, 3, 3, '-fgdfgd', '../images/Productos/teclado dumar.png', 2, 0.50, 'Habilitado'),
(7, 'Teclado logitech', 'teclado logitech dos', 2.00, 5, 3, '-teclado-gamer', '../images/Productos/logitechsymbol.webp', 30, 0.00, 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `proveedor_id` bigint(20) NOT NULL,
  `marca_id` bigint(20) NOT NULL,
  `telefono` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`proveedor_id`, `marca_id`, `telefono`) VALUES
(32, 4, '123412343'),
(33, 3, '987656643'),
(34, 5, '328138211');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `rol` varchar(100) NOT NULL,
  `visita` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `email`, `contraseña`, `rol`, `visita`) VALUES
(3, 'julio', 'ruiz', 'julio@paragon.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador', 0),
(4, 'Julio', 'Ruiz', 'julio@gmail.com', '655e786674d9d3e77bc05ed1de37b4b6bc89f788829f9f3c679e7687b410c89b', 'cliente', 0),
(5, 'admin2', 'admin', 'admin2@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador', 0),
(6, 'prueba4', 'prueba4', 'prueba4@utp.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'cliente', 0),
(7, 'admin3', 'admin', 'admin3@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador', 1),
(8, 'God', 'god', 'god@god.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador', 45),
(9, 'Fernan', 'fernan', 'fernan@gmail.com', '123', 'proveedor', 0),
(12, 'pro2', 'pro2', 'prov2@pro.com', NULL, 'proveedor', 0),
(14, 'pro3', 'pro3', 'prov3@pro.com', '123', 'proveedor', 0),
(24, 'pro12', 'pro12', 'prov12@prov.com', '123', 'proveedor', 0),
(26, 'pro2', 'pro22', 'prov1@prov.com', NULL, 'proveedor', 0),
(27, 'cli1', 'cli1', 'cli@cli.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'cliente', 6),
(28, 'clie2', 'clie2', 'clie2@cli.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'cliente', 2),
(29, 'empl1', 'empl1', 'empl1@emp.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'trabajador', 4),
(30, 'Fernando', 'pppp', 'fern@utp.com', '123', 'proveedor', 0),
(31, 'jota', 'jota', 'jota@alienware.com', '123', 'proveedor', 0),
(32, 'abc', 'abc', 'abc@aorus.com', '123', 'proveedor', 0),
(33, 'khan', 'shao', 'khan@alienware.com', '123', 'proveedor', 0),
(34, 'logi', 'logi', 'logi@logitech.com', '123', 'proveedor', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) NOT NULL,
  `transaccion` varchar(255) DEFAULT NULL,
  `fecha` varchar(50) NOT NULL,
  `hora` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descuento_total` decimal(10,2) DEFAULT NULL,
  `cliente_nom` varchar(200) NOT NULL,
  `cliente_correo` varchar(200) NOT NULL,
  `cliente_telefono` varchar(200) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `fecha`, `hora`, `monto`, `descuento_total`, `cliente_nom`, `cliente_correo`, `cliente_telefono`, `cliente_id`, `metodo_pago`) VALUES
(1, '9M571898T5587421T', '20-11-2023', '10:37:23', 20.00, 0.00, 'MarcoNose', '123@paragon.com', '5154588', NULL, 'PAYPAL'),
(5, 'SIN TRANSACCIÓN', '17-05-2024', '15:24:56', 280.00, 20.00, 'cli1 cli1', 'cli@cli.com', '43223423', 27, 'OTROS'),
(6, 'SIN TRANSACCIÓN', '18-06-2024', '20:03:23', 200.00, 0.00, 'dsadsadasdasdas', 'dsadasda@cliente.com', '213321', NULL, 'OTROS'),
(7, 'Y8OARYIUQKKNBN4J', '29-06-2024', '23:47:32', 180.00, 20.00, 'cli1 cli1', 'clie2@cli.com', '123219831', 27, 'OTROS'),
(8, 'BGG3WZJL81W1EVWH', '29-06-2024', '23:48:20', 100.00, 0.00, 'cli1 cli1', 'clie2@cli.com', '123219831', 27, 'OTROS'),
(9, '4SG67139BF815574X', '29-06-2024', '23:53:50', 180.00, 20.00, 'cli1 cli1', 'clie2@cli.com', '123219831', 27, 'PAYPAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `id` bigint(20) NOT NULL,
  `venta_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `monto_unit` decimal(10,2) NOT NULL,
  `desc_aplicado` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`id`, `venta_id`, `producto_id`, `cantidad`, `monto_unit`, `desc_aplicado`, `subtotal`) VALUES
(5, 5, 3, 1, 200.00, 20.00, 180.00),
(6, 5, 4, 1, 100.00, 0.00, 100.00),
(7, 6, 3, 1, 200.00, 0.00, 200.00),
(8, 7, 3, 1, 200.00, 20.00, 180.00),
(9, 8, 4, 1, 100.00, 0.00, 100.00),
(10, 9, 3, 1, 200.00, 20.00, 180.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_combo_producto` (`producto_id`),
  ADD KEY `FK_combo_promo` (`promocion_id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD KEY `FK_coment_producto` (`producto_id`),
  ADD KEY `FK_coment_cliente` (`cliente_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_producto_marca` (`marca_id`),
  ADD KEY `FK_producto_categoria` (`categoria_id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`proveedor_id`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `marcaId` (`marca_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_email_unico` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ventas_cliente` (`cliente_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vDetalle_producto` (`producto_id`),
  ADD KEY `FK_vDetalle_venta` (`venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `combos`
--
ALTER TABLE `combos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FK_clie_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `combos`
--
ALTER TABLE `combos`
  ADD CONSTRAINT `FK_combo_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `FK_combo_promo` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_coment_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`usuario_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_coment_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_producto_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK_ventas_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`usuario_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `FK_vDetalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_vDetalle_venta` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
