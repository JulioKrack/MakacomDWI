-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2024 at 11:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `makacom`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `banner_img` text DEFAULT NULL,
  `referencia_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `banner_img`, `referencia_img`) VALUES
(3, 'Teclados', 'teclados mecanicos', '../images/Categorias/banners/TecladosBanner.webp', '../images/Categorias/imgs/Teclado.webp'),
(4, 'mouse', 'movilidad y velocidad ', '../images/Categorias/banners/mousebanner.jpg', '../images/Categorias/imgs/mouse.webp'),
(5, 'Audifonos', 'fuerza de sonido , calidad y precio', '../images/Categorias/banners/audifonobanner.jpg', '../images/Categorias/imgs/audifonos.png'),
(6, 'Laptop', 'facil manejo y manejo de datos', '../images/Categorias/banners/laptopbanner.jpg', '../images/Categorias/imgs/laptop.webp'),
(7, 'parlantes', 'fuerza de sonido', '../images/Categorias/banners/bannerparlante.jpg', '../images/Categorias/imgs/parlante.png'),
(8, 'microfonos', 'algo bueno', '../images/Categorias/banners/microfonobanner.jpg', '../images/Categorias/imgs/microfono.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `usuario_id` bigint(20) NOT NULL,
  `telefono` char(9) NOT NULL,
  `puntos` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`usuario_id`, `telefono`, `puntos`) VALUES
(2, '995468795', 0),
(3, '926782775', 0),
(4, '123456789', 0),
(5, '987655432', 0),
(6, '987655432', 0),
(7, '987655432', 0),
(27, '43223423', 0);

-- --------------------------------------------------------

--
-- Table structure for table `combos`
--

CREATE TABLE `combos` (
  `id` bigint(20) NOT NULL,
  `promocion_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
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
-- Table structure for table `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) NOT NULL,
  `transaccion` varchar(255) DEFAULT NULL,
  `fecha` varchar(50) DEFAULT NULL,
  `hora` varchar(50) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `proveedor_nombre` varchar(200) DEFAULT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  `Producto` varchar(255) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `compras`
--

INSERT INTO `compras` (`id`, `transaccion`, `fecha`, `hora`, `monto`, `proveedor_nombre`, `metodo_pago`, `Producto`, `Cantidad`) VALUES
(1, 'compra tecla', 'hoy', '14:00', 1532.00, 'Fernan', 'efectivo', '', 0),
(2, 'Comprar pantalla', '17/07/2024', '5:00', 150.00, 'Fernan', 'Paypal', '', 0),
(3, 'Compra fuente de poder', '15/03/2024', '4:03', 1600.00, 'Frank', 'fuente de poder gold', 'Efectivo', 5);

-- --------------------------------------------------------

--
-- Table structure for table `compra_detalle`
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
-- Table structure for table `kardex`
--

CREATE TABLE `kardex` (
  `Id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `banner_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descripcion`, `banner_img`) VALUES
(3, 'Alienware', 'Marcas', '../images/Marcas/HyperXBanner.webp'),
(4, 'Aorus', 'Marcas', '../images/Marcas/AorusBanner.webp'),
(5, 'Logitech', 'Marcas', '../images/Marcas/logitechsymbol.webp');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
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
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `marca_id`, `categoria_id`, `especificaciones`, `img`, `cantidad`, `descuento`, `estado`) VALUES
(3, 'Teclado Alienware', 'dhfhdhdhdhdhdh', 200.00, 3, 3, '-afgagagagagagaaggag -sgagagagfjfjfj -dhddhdhhdhd -agagagaggaga', '../images/Productos/Teclado.webp', 5, 0.10, 'Habilitado'),
(4, 'Monitor Aorus', 'agagagag', 100.00, 4, 3, '-sgshshsh -dhddhdhdhh', '../images/Productos/Monitor.png', 9, 0.00, 'Habilitado'),
(5, 'Teclado micronics', 'buen teclado', 150.00, 3, 3, '-fgdfgd', '../images/Productos/teclado dumar.png', 2, 0.50, 'Habilitado'),
(7, 'Teclado logitech', 'teclado logitech dos', 2.00, 5, 3, '-teclado-gamer', '../images/Productos/logitechsymbol.webp', 3, 0.00, 'Habilitado');

-- --------------------------------------------------------

--
-- Table structure for table `promociones`
--

CREATE TABLE `promociones` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `proveedor_id` bigint(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `telefono` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`proveedor_id`, `marca`, `telefono`) VALUES
(9, 'alienware', '432432567'),
(26, 'aorus', '333333');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `email`, `contraseña`, `rol`) VALUES
(1, 'Admin Nombres', 'Admin Apellidos', 'admin@paragon.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador'),
(2, 'Eddie', 'Hermoza', 'eddie.ehc@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'cliente'),
(3, 'julio', 'ruiz', 'julio@paragon.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador'),
(4, 'Julio', 'Ruiz', 'julio@gmail.com', '655e786674d9d3e77bc05ed1de37b4b6bc89f788829f9f3c679e7687b410c89b', 'cliente'),
(5, 'admin2', 'admin', 'admin2@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador'),
(6, 'prueba4', 'prueba4', 'prueba4@utp.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'cliente'),
(7, 'admin3', 'admin', 'admin3@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador'),
(8, 'God', 'god', 'god@god.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'administrador'),
(9, 'Fernan', 'fernan', 'fernan@gmail.com', '123', 'proveedor'),
(10, 'pro1', 'pro', 'prov@pro.com', NULL, 'proveedor'),
(12, 'pro2', 'pro2', 'prov2@pro.com', NULL, 'proveedor'),
(14, 'pro3', 'pro3', 'prov3@pro.com', '123', 'proveedor'),
(15, 'pro4', 'pro4', 'prov4@pro.com', '123', 'proveedor'),
(16, 'pro5', 'pro5', 'prov5@pro.com', '123', 'proveedor'),
(17, 'pro6', 'pro6', 'prov6@pro.com', '123', 'proveedor'),
(18, 'pro7', 'pro7', 'prov7@pro.com', '123', 'proveedor'),
(19, 'pro8', 'pro8', 'prov8@pro.com', '123', 'proveedor'),
(21, 'pro9', 'pro9', 'prov9@prov.com', '123', 'proveedor'),
(22, 'pro10', 'pro10', 'prov10@prov.com', '123', 'proveedor'),
(23, 'pro11', 'pro11', 'prov11@prov.com', '123', 'proveedor'),
(24, 'pro12', 'pro12', 'prov12@prov.com', '123', 'proveedor'),
(26, 'pro2', 'pro22', 'prov1@prov.com', NULL, 'proveedor'),
(27, 'cli1', 'cli1', 'cli@cli.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'cliente');

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
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
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `fecha`, `hora`, `monto`, `descuento_total`, `cliente_nom`, `cliente_correo`, `cliente_telefono`, `cliente_id`, `metodo_pago`) VALUES
(1, '9M571898T5587421T', '20-11-2023', '10:37:23', 20.00, 0.00, 'MarcoNose', '123@paragon.com', '5154588', NULL, 'PAYPAL'),
(2, '4DR212833A126410Y', '22-11-2023', '10:22:01', 540.00, 60.00, 'Eddie Hermoza', 'eddie.ehc@gmail.com', '995468795', 2, 'PAYPAL'),
(3, '1TY92294KS065552J', '22-11-2023', '10:28:03', 200.00, 0.00, 'Eddie Hermoza', 'eddie.ehc@gmail.com', '995468795', 2, 'PAYPAL'),
(4, 'SIN TRANSACCIÓN', '22-11-2023', '10:43:43', 225.00, 225.00, 'Eddie Hermoza', 'eddie.ehc@gmail.com', '995468795', 2, 'OTROS'),
(5, 'SIN TRANSACCIÓN', '17-05-2024', '15:24:56', 280.00, 20.00, 'cli1 cli1', 'cli@cli.com', '43223423', 27, 'OTROS');

-- --------------------------------------------------------

--
-- Table structure for table `venta_detalle`
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
-- Dumping data for table `venta_detalle`
--

INSERT INTO `venta_detalle` (`id`, `venta_id`, `producto_id`, `cantidad`, `monto_unit`, `desc_aplicado`, `subtotal`) VALUES
(2, 2, 3, 3, 200.00, 20.00, 540.00),
(3, 3, 4, 2, 100.00, 0.00, 200.00),
(4, 4, 5, 3, 150.00, 75.00, 225.00),
(5, 5, 3, 1, 200.00, 20.00, 180.00),
(6, 5, 4, 1, 100.00, 0.00, 100.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indexes for table `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_combo_producto` (`producto_id`),
  ADD KEY `FK_combo_promo` (`promocion_id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD KEY `FK_coment_producto` (`producto_id`),
  ADD KEY `FK_coment_cliente` (`cliente_id`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compra_detalle`
--
ALTER TABLE `compra_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_producto_marca` (`marca_id`),
  ADD KEY `FK_producto_categoria` (`categoria_id`);

--
-- Indexes for table `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`proveedor_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_email_unico` (`email`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ventas_cliente` (`cliente_id`);

--
-- Indexes for table `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vDetalle_producto` (`producto_id`),
  ADD KEY `FK_vDetalle_venta` (`venta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `combos`
--
ALTER TABLE `combos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `compra_detalle`
--
ALTER TABLE `compra_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kardex`
--
ALTER TABLE `kardex`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FK_clie_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `combos`
--
ALTER TABLE `combos`
  ADD CONSTRAINT `FK_combo_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `FK_combo_promo` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`);

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_coment_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`usuario_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_coment_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_producto_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK_ventas_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`usuario_id`) ON DELETE CASCADE;

--
-- Constraints for table `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `FK_vDetalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_vDetalle_venta` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
