-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-11-2024 a las 19:54:16
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE IF NOT EXISTS `autor` (
  `cod_autor` int NOT NULL,
  `au_nombre` varchar(25) DEFAULT NULL,
  `au_apellido` varchar(25) DEFAULT NULL,
  `imagen_thumbnail` varchar(255) DEFAULT NULL,
  `imagen_original` varchar(255) DEFAULT NULL,
  `imagen_formato` varchar(50) DEFAULT NULL,
  `imagen_ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod_autor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cip` varchar(20) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sucursal_id` int DEFAULT '1',
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cip` (`cip`),
  KEY `sucursal_id` (`sucursal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `cip`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `sucursal_id`, `usuario`, `correo`, `contraseña`) VALUES
(1, '8-1004-2420', 'Leonor', 'Alicia', 'Pérez', 'Mendoza', '2004-01-29', 2, 'LeonorP', 'leonor@gmail.com', '$2y$10$a8pOO.jMwugKrUKWHLgc9ugknGgLJoam88JW4zyzBNzlwZMENNV9K'),
(2, '8-789-856', 'Ana', 'Michelle', 'Pérez', 'Mendoza', '2002-08-08', 1, 'AnaP', 'ana@gmail.com', '$2y$10$2vqfnCxddGhQamk5QbbdOO.5Fw9hlGeY3982na3mFoyohozsVAU.m'),
(3, '8-7849-8781', 'María', 'Michelle', 'Sanchez', 'Mendoza', '2004-08-10', 2, 'MaraS', 'ana@gmail.com', '$2y$10$WpliZCL7nJTOR3Ykp77mT.sVoxby439OhpaU4cLqPsxtQRiKMcVAm'),
(4, '8-9745-8975', 'Pedro', 'Pablo', 'Sanchez', 'Gomez', '1998-10-24', 2, 'PedroS', 'pedro@gmail.com', '$2y$10$NgebD3Lc4qqjRMcw2szgI.GQS3kENp1yTKPIjgy1Vg5b6MNnoEJhG'),
(5, '8-7899-8754', 'Alma', 'Marta', 'Ramirez', 'Lomelí', '2009-01-08', 1, 'AlmaR', 'alma@gmail.com', '$2y$10$6wVTtPqDfSCjdmWfUx//puG7Liy3Xo39XrRFPT6zfkquqp1gBbdE.'),
(12, '8-995-2383', 'Julissa', 'Mileydis', 'Morales', 'Magallon', '2002-07-01', NULL, 'JulyM', 'july@gmail.com', '$2y$10$jvuKXkOux4xsFYry54Vaqui6iEwRmH8yXKw1UuwvOCrq32q5SS5p2'),
(11, '8-1002-814', 'Alder', 'Elian', 'Somoza', 'Gaitan', '2003-10-16', NULL, 'Alderesg', 'alderelian24@gmail.com', '$2y$10$4LAwPUNypj5pkGZPLoHlD.c3j/ngsPAQ/KxzPSmCPsoNYUIJAy3LW');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `libro_id` int NOT NULL,
  `sucursal_id` int NOT NULL,
  `fecha_compra` datetime DEFAULT CURRENT_TIMESTAMP,
  `cantidad` int NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `cliente_id` (`cliente_id`),
  KEY `libro_id` (`libro_id`),
  KEY `sucursal_id` (`sucursal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `cliente_id`, `libro_id`, `sucursal_id`, `fecha_compra`, `cantidad`, `precio_total`) VALUES
(1, 1, 1, 1, '2024-11-01 10:00:00', 2, 39.98),
(2, 2, 3, 2, '2024-11-02 15:30:00', 1, 19.99),
(3, 3, 4, 2, '2024-11-03 18:45:00', 3, 59.97),
(4, 1, 2, 1, '2024-11-04 12:00:00', 1, 14.99),
(5, 4, 5, 1, '2024-11-05 14:20:00', 5, 124.95),
(6, 1, 1, 1, '2024-11-01 10:00:00', 2, 39.98),
(7, 2, 3, 2, '2024-11-02 15:30:00', 1, 19.99),
(8, 3, 4, 2, '2024-11-03 18:45:00', 3, 59.97),
(9, 1, 2, 1, '2024-11-04 12:00:00', 1, 14.99),
(10, 4, 5, 1, '2024-11-05 14:20:00', 5, 124.95),
(11, 1, 1, 1, '2024-11-01 10:00:00', 2, 39.98),
(12, 2, 3, 2, '2024-11-02 15:30:00', 1, 19.99),
(13, 3, 4, 2, '2024-11-03 18:45:00', 3, 59.97),
(14, 1, 2, 1, '2024-11-04 12:00:00', 1, 14.99),
(15, 4, 5, 1, '2024-11-05 14:20:00', 5, 124.95),
(16, 1, 1, 1, '2024-11-01 10:00:00', 2, 39.98),
(17, 2, 3, 2, '2024-11-02 15:30:00', 1, 19.99),
(18, 3, 4, 2, '2024-11-03 18:45:00', 3, 59.97),
(19, 1, 2, 1, '2024-11-04 12:00:00', 1, 14.99),
(20, 4, 5, 1, '2024-11-05 14:20:00', 5, 124.95),
(21, 0, 0, 0, '2024-11-26 04:17:56', 1, 0.00),
(22, 0, 2, 0, '2024-11-26 04:17:56', 2, 0.00),
(23, 0, 3, 0, '2024-11-26 04:17:56', 1, 0.00),
(24, 0, 4, 0, '2024-11-26 04:17:56', 2, 0.00),
(25, 0, 5, 0, '2024-11-26 04:22:20', 1, 0.00),
(26, 0, 17, 0, '2024-11-26 04:48:58', 1, 0.00),
(27, 0, 10, 0, '2024-11-26 04:54:30', 1, 0.00),
(28, 0, 9, 1, '2024-11-26 05:36:50', 1, 14.99),
(29, 0, 8, 1, '2024-11-26 05:39:21', 1, 12.49),
(30, 0, 9, 1, '2024-11-26 19:47:00', 2, 29.98),
(31, 0, 34, 1, '2024-11-26 19:47:00', 1, 15.49),
(32, 1, 13, 1, '2024-11-26 20:33:20', 1, 13.99),
(33, 1, 14, 1, '2024-11-26 20:33:20', 1, 15.49),
(34, 1, 6, 1, '2024-11-26 20:39:50', 1, 8.99),
(35, 11, 2, 1, '2024-11-27 18:29:42', 2, 29.98),
(36, 12, 14, 2, '2024-11-27 19:16:20', 2, 30.98);

--
-- Disparadores `compras`

DROP TRIGGER IF EXISTS transferir_compra_a_venta;

CREATE TRIGGER transferir_compra_a_venta AFTER INSERT ON compras
FOR EACH ROW 
BEGIN
    INSERT INTO ventas (
        cliente_id, 
        libro_id, 
        sucursal_id, 
        fecha_venta, 
        cantidad
    ) 
    VALUES (
        NEW.cliente_id, 
        NEW.libro_id, 
        NEW.sucursal_id, 
        NEW.fecha_compra, 
        NEW.cantidad
    );
END



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_libro` int NOT NULL,
  `sucursal_id` int NOT NULL,
  `cantidad_disponible` int DEFAULT '0',
  `estado` enum('Normal','Bajo') DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `id_libro` (`id_libro`),
  KEY `sucursal_id` (`sucursal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `id_libro`, `sucursal_id`, `cantidad_disponible`, `estado`) VALUES
(1, 1, 1, 1, 'Bajo'),
(2, 2, 1, 30, NULL),
(3, 3, 2, 20, NULL),
(4, 4, 2, 10, NULL),
(5, 5, 1, 100, NULL),
(6, 36, 1, 20, 'Normal'),
(7, 37, 1, 10, 'Normal'),
(8, 38, 2, 15, 'Normal'),
(9, 39, 2, 5, 'Bajo');

--
-- Disparadores `inventario`
--
DROP TRIGGER IF EXISTS `actualizar_estado_inventario`;
DELIMITER $$
CREATE TRIGGER `actualizar_estado_inventario` BEFORE UPDATE ON `inventario` FOR EACH ROW BEGIN
    IF NEW.cantidad_disponible < 10 THEN
        SET NEW.estado = 'Bajo';
    ELSE
        SET NEW.estado = 'Normal';
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `actualizar_estado_inventario_insert`;
DELIMITER $$
CREATE TRIGGER `actualizar_estado_inventario_insert` BEFORE INSERT ON `inventario` FOR EACH ROW BEGIN
    IF NEW.cantidad_disponible < 10 THEN
        SET NEW.estado = 'Bajo';
    ELSE
        SET NEW.estado = 'Normal';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `autor` varchar(255) NOT NULL,
  `categoria` enum('fantasia','terror','novela','no-ficcion') NOT NULL,
  `cantidad_disponible` int DEFAULT '0',
  `precio` decimal(10,2) NOT NULL,
  `imagen_thumbnail` varchar(255) DEFAULT NULL,
  `imagen_original` varchar(255) DEFAULT NULL,
  `imagen_formato` varchar(50) DEFAULT NULL,
  `imagen_ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `codigo`, `nombre`, `descripcion`, `autor`, `categoria`, `cantidad_disponible`, `precio`, `imagen_thumbnail`, `imagen_original`, `imagen_formato`, `imagen_ubicacion`) VALUES
(1, 'GM01', 'Cien años de soledad', 'Historia épica de la familia Buendía en Macondo', 'Gabriel García Márquez', 'terror', 20, 14.99, 'cien anos de soledad.jpg', 'cien anos de soledad.jpg', 'jpg', '../../Public/Imagenes/Gabriel/'),
(2, 'GM02', 'El amor en los tiempos del cólera', 'Historia de un amor que desafía el tiempo y las circunstancias', 'Gabriel García Márquez', 'novela', 18, 14.99, 'el amor en tiempos de colera.jpeg', 'el amor en tiempos de colera.jpeg', 'jpeg', '../../Public/Imagenes/Gabriel/'),
(3, 'GM03', 'El coronel no tiene quien le escriba', 'Relato sobre la pobreza y la dignidad en tiempos de guerra', 'Gabriel García Márquez', 'novela', 15, 12.49, 'el coronel no tiene.jpg', 'el coronel no tiene.jpg', 'jpg', '../../Public/Imagenes/Gabriel/'),
(4, 'GM04', 'Crónica de una muerte anunciada', 'Relato de un asesinato anunciado y sus consecuencias en la comunidad', 'Gabriel García Márquez', 'novela', 17, 11.99, 'cronicas de una muerte.jpeg', 'cronicas de una muerte.jpeg', 'jpeg', '../../Public/Imagenes/Gabriel/'),
(5, 'GM05', 'Los funerales de la Mamá Grande', 'Colección de cuentos sobre el realismo mágico en Latinoamérica', 'Gabriel García Márquez', 'novela', 12, 9.99, 'los funerales de la mama.jpeg', 'los funerales de la mama.jpeg', 'jpeg', '../../Public/Imagenes/Gabriel/'),
(6, 'GM06', 'Ojos de perro azul', 'Colección de cuentos que exploran el amor y la soledad', 'Gabriel García Márquez', 'novela', 14, 8.99, 'ojos de perro azul.jpg', 'ojos de perro azul.jpg', 'jpg', '../../Public/Imagenes/Gabriel/'),
(7, 'GM07', 'La hojarasca', 'Historia sobre el conflicto generacional y la sociedad', 'Gabriel García Márquez', 'novela', 10, 10.49, 'la hojarsca.jpg', 'la hojarsca.jpg', 'jpg', '../../Public/Imagenes/Gabriel/'),
(8, 'GM08', 'Relatos sobrenaturales', 'Historias que exploran lo fantástico y lo mágico', 'Gabriel García Márquez', 'novela', 9, 12.49, 'relatos sobrenaturales.jpeg', 'relatos sobrenaturales.jpeg', 'jpeg', '../../Public/Imagenes/Gabriel/'),
(9, 'GM09', 'El otoño del patriarca', 'Reflexión sobre el poder absoluto y la soledad', 'Gabriel García Márquez', 'novela', 11, 14.99, 'el otono del patrarca.jpeg', 'el otono del patrarca.jpeg', 'jpeg', '../../Public/Imagenes/Gabriel/'),
(10, 'GM10', 'Memoria de mis putas tristes', 'Relato sobre el amor y la soledad en la vejez', 'Gabriel García Márquez', 'novela', 13, 13.49, 'memorias de mi.jpg', 'memorias de mi.jpg', 'jpg', '../../Public/Imagenes/Gabriel/'),
(11, 'IA01', 'La casa de los espíritus', 'Relato que combina realismo mágico y la historia de una familia chilena', 'Isabel Allende', 'novela', 25, 16.99, 'casa_de_espiritus_thumbnail.jpg', 'casa de los espiritus.jpg', 'jpg', '../../Public/Imagenes/Isabel/'),
(12, 'IA02', 'De amor y de sombra', 'Historia de amor ambientada en el contexto de la represión política en Chile', 'Isabel Allende', 'novela', 20, 14.99, 'de_amor_sombra_thumbnail.jpg', 'de amor y de sombra.jpg', 'jpg', '../../Public/Imagenes/Isabel/'),
(13, 'IA03', 'Eva Luna', 'Relato de una joven que cuenta historias y vive la transformación social de su país', 'Isabel Allende', 'novela', 18, 13.99, 'eva_luna_thumbnail.jpg', 'eva luna.jpg', 'jpg', '../../Public/Imagenes/Isabel/'),
(14, 'IA04', 'Paula', 'Memorias personales narradas como una carta a su hija', 'Isabel Allende', 'no-ficcion', 22, 15.49, 'paula_thumbnail.jpg', 'paula.jpg', 'jpg', '../../Public/Imagenes/Isabel/'),
(15, 'IA05', 'Afrodita', 'Una mezcla de recetas y relatos sobre el amor y la comida', 'Isabel Allende', 'no-ficcion', 15, 12.49, 'afrodita_thumbnail.jpg', 'afrodita.jpg', 'jpg', '../../Public/Imagenes/Isabel/'),
(16, 'MV01', 'La ciudad y los perros', 'Relato sobre la vida de unos cadetes en una escuela militar, explorando la violencia y la amistad', 'Mario Vargas Llosa', 'novela', 30, 17.99, 'la_ciudad_y_los_perros_thumbnail.jpg', 'la ciudad y los perros.jpeg', 'jpeg', '../../Public/Imagenes/Mario/'),
(17, 'MV02', 'La casa verde', 'Historia que mezcla el realismo social y lo mítico en la selva peruana', 'Mario Vargas Llosa', 'novela', 28, 16.49, 'la_casa_verde_thumbnail.jpg', 'la casa verde.jpeg', 'jpeg', '../../Public/Imagenes/Mario/'),
(18, 'MV03', 'Conversación en la catedral', 'Reflexión sobre la corrupción y la situación política de Perú en los años 50', 'Mario Vargas Llosa', 'novela', 22, 15.49, 'conversacion_en_la_catedral_thumbnail.jpg', 'conversacion en la catedral.jpg', 'jpg', '../../Public/Imagenes/Mario/'),
(19, 'MV04', 'Pantaleón y las visitadoras', 'Historia humorística sobre la corrupción y la moral en el ejército peruano', 'Mario Vargas Llosa', 'novela', 25, 14.99, 'pantaleon_y_las_visitadoras_thumbnail.jpg', 'pantaleon y las visitadoras.jpg', 'jpg', '../../Public/Imagenes/Mario/'),
(20, 'MV05', 'La tía Tula', 'Relato sobre una mujer que se convierte en figura materna para su familia', 'Mario Vargas Llosa', 'novela', 18, 13.99, 'la_tia_tula_thumbnail.jpg', 'la tia Julia y el escribidor.jpg', 'jpg', '../../Public/Imagenes/Mario/'),
(21, 'MV06', 'La guerra del fin del mundo', 'Narración sobre la guerra en Canudos en Brasil y su relación con las ideologías', 'Mario Vargas Llosa', 'novela', 20, 18.49, 'la_guerra_del_fin_del_mundo_thumbnail.jpg', 'la guerra del fin del mundo.jpg', 'jpg', '../../Public/Imagenes/Mario/'),
(22, 'MV07', 'El pez en el agua', 'Memorias de Vargas Llosa sobre su vida, su carrera política y su compromiso con la democracia', 'Mario Vargas Llosa', 'no-ficcion', 15, 12.99, 'el_pez_en_el_agua_thumbnail.jpg', 'El pez en el agua.jpg', 'jpg', '../../Public/Imagenes/Mario/'),
(23, 'MV08', 'Lituma en los Andes', 'Historia sobre la vida de un soldado peruano en la época de terrorismo en los Andes', 'Mario Vargas Llosa', 'novela', 17, 14.99, 'lituma_en_los_andes_thumbnail.jpg', 'Lituma en los andes.jpg', 'jpg', '../../Public/Imagenes/Mario/'),
(38, 'GHD45', 'Los Reales', 'Libro, inspirado por leyendas del pais', 'Alexis Lopez', 'novela', 15, 15.99, '../../Public/Imagenes/nuevo_autor/icons8-registro-30_thumb.png', 'icons8-registro-30.png', 'png', '../../Public/Imagenes/nuevo_autor/'),
(25, 'MV10', 'El sueño del celta', 'Relato histórico sobre la vida del aventurero Roger Casement en el Congo y la Amazonía', 'Mario Vargas Llosa', 'novela', 14, 15.99, 'el_sueno_del_celta_thumbnail.jpg', 'El sueno del celta.jpg', 'jpg', '../../Public/Imagenes/Mario/'),
(26, 'CRZ01', 'La sombra del viento', 'Un joven descubre un libro en un lugar misterioso y se ve envuelto en una trama literaria fascinante', 'Carlos Ruiz Zafón', 'novela', 20, 18.99, 'la_sombra_del_viento_thumbnail.jpg', 'La sombra del viento.jpg', 'jpg', '../../Public/Imagenes/Carlos/'),
(27, 'CRZ02', 'El juego del ángel', 'Relato que sigue a un escritor que se ve envuelto en oscuros secretos literarios en la Barcelona de los años 1920', 'Carlos Ruiz Zafón', 'novela', 18, 16.99, 'el_juego_del_angel_thumbnail.jpg', 'El juego del angel.jpg', 'jpg', '../../Public/Imagenes/Carlos/'),
(28, 'CRZ03', 'El prisionero del cielo', 'Secuela de \"La sombra del viento\", que profundiza en la historia de los personajes de la saga', 'Carlos Ruiz Zafón', 'novela', 22, 17.49, 'el_prisionero_del_cielo_thumbnail.jpg', 'El prisionero del cielo.jpg', 'jpg', '../../Public/Imagenes/Carlos/'),
(29, 'CRZ04', 'El laberinto de los espíritus', 'La cuarta entrega de la saga de Zafón que cierra la historia de la familia Sempere', 'Carlos Ruiz Zafón', 'novela', 25, 19.99, 'el_laberinto_de_los_espiritus_thumbnail.jpg', 'El laberinto de los espiritus.jpg', 'jpg', '../../Public/Imagenes/Carlos/'),
(30, 'CRZ06', 'Marina', 'Narrativa de un romance misterioso y trágico en la Barcelona de los años 1980', 'Carlos Ruiz Zafón', 'novela', 20, 15.99, 'marina_thumbnail.jpg', 'Marina.jpg', 'jpg', '../../Public/Imagenes/Carlos/'),
(31, 'PC01', 'El alquimista', 'Historia de un joven pastor que busca un tesoro en el desierto, siguiendo su leyenda personal', 'Paulo Coelho', 'novela', 30, 12.99, 'el_alquimista_thumbnail.jpg', 'El alquimista.jpg', 'jpg', '../../Public/Imagenes/Paulo/'),
(32, 'PC02', 'El peregrino de Compostela', 'Relato sobre el camino hacia Santiago y las lecciones de vida que se aprenden en el viaje', 'Paulo Coelho', 'novela', 25, 14.99, 'el_peregrino_de_compostela_thumbnail.jpg', 'El peregrino de Compostela.jpg', 'jpg', '../../Public/Imagenes/Paulo/'),
(33, 'PC03', 'Brida', 'Narrativa de una joven que busca su destino y su conexión con la magia y la espiritualidad', 'Paulo Coelho', 'novela', 18, 13.99, 'brida_thumbnail.jpg', 'Brida.jpg', 'jpg', '../../Public/Imagenes/Paulo/'),
(34, 'PC04', 'Verónika decide morir', 'Relato sobre una joven que decide suicidarse pero acaba encontrando una nueva perspectiva de vida', 'Paulo Coelho', 'novela', 20, 15.49, 'veronika_decide_morir_thumbnail.jpg', 'Veronika decide morir.jpg', 'jpg', '../../Public/Imagenes/Paulo/'),
(35, 'PC05', 'El Maktub', 'Un conjunto de reflexiones y enseñanzas para vivir de manera plena y espiritual', 'Paulo Coelho', 'novela', 22, 11.99, 'el_maktub_thumbnail.jpg', 'El Maktub.jpg', 'jpg', '../../Public/Imagenes/Paulo/'),
(39, 'mv09', 'las alcaldezas', 'libro folklorico', 'maria ferrer', 'novela', 5, 20.00, '../../Public/Imagenes/nuevo_autor/icons8-registro-30_thumb.png', 'icons8-registro-30.png', 'png', '../../Public/Imagenes/nuevo_autor/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE IF NOT EXISTS `solicitudes` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `nombre_libro` varchar(255) NOT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `categoria` enum('fantasia','terror','novela','no-ficcion') DEFAULT NULL,
  `estado_solicitud` enum('pendiente','procesada') DEFAULT 'pendiente',
  PRIMARY KEY (`id_solicitud`),
  KEY `cliente_id` (`cliente_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id_solicitud`, `cliente_id`, `nombre_libro`, `autor`, `categoria`, `estado_solicitud`) VALUES
(1, 1, 'Cien años de soledad', 'Gabriel García Márquez', 'novela', 'pendiente'),
(2, 2, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'fantasia', 'procesada'),
(3, 3, 'El coronel no tiene quien le escriba', 'Gabriel García Márquez', 'terror', 'pendiente'),
(4, 4, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 'no-ficcion', 'pendiente'),
(5, 5, 'Los funerales de la Mamá Grande', 'Gabriel García Márquez', 'novela', 'procesada'),
(6, 1, 'Cien años de soledad', 'Gabriel García Márquez', 'novela', 'pendiente'),
(7, 2, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'fantasia', 'procesada'),
(8, 3, 'El coronel no tiene quien le escriba', 'Gabriel García Márquez', 'terror', 'pendiente'),
(9, 4, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 'no-ficcion', 'pendiente'),
(10, 5, 'Los funerales de la Mamá Grande', 'Gabriel García Márquez', 'novela', 'procesada'),
(11, 1, 'Cien años de soledad', 'Gabriel García Márquez', 'novela', 'pendiente'),
(12, 2, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'fantasia', 'procesada'),
(13, 3, 'El coronel no tiene quien le escriba', 'Gabriel García Márquez', 'terror', 'pendiente'),
(14, 4, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 'no-ficcion', 'pendiente'),
(15, 5, 'Los funerales de la Mamá Grande', 'Gabriel García Márquez', 'novela', 'procesada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE IF NOT EXISTS `sucursales` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id_sucursal`, `nombre`, `codigo`, `correo`) VALUES
(1, 'Central', '001', 'central@librepraesto.com'),
(2, 'Este', '002', 'este@librepraesto.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `sucursal_id` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `sucursal_id` (`sucursal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo`, `contraseña`, `estado`, `sucursal_id`) VALUES
(1, 'Leonor', 'leonor@gmail.com', '$2y$10$tCbmtTH1Gl8uXJHaycXzd.2tRG89fY.XlucPmsvZRqc0nj10dymxK', 'activo', 2),
(2, 'Ana', 'ana@gmail.com', '$2y$10$DevD9z.0y7xEnYKSGomrGOIyOpBUIp/fMVk5mcOkHp61zLj1iyHxa', 'inactivo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `libro_id` int NOT NULL,
  `sucursal_id` int NOT NULL,
  `fecha_venta` datetime DEFAULT CURRENT_TIMESTAMP,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `cliente_id` (`cliente_id`),
  KEY `libro_id` (`libro_id`),
  KEY `sucursal_id` (`sucursal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `cliente_id`, `libro_id`, `sucursal_id`, `fecha_venta`, `cantidad`) VALUES
(1, 1, 1, 1, '2024-11-01 10:00:00', 2),
(2, 2, 3, 2, '2024-11-02 15:30:00', 1),
(3, 3, 4, 2, '2024-11-03 18:45:00', 3),
(4, 1, 2, 1, '2024-11-04 12:00:00', 1),
(5, 4, 5, 1, '2024-11-05 14:20:00', 5),
(6, 1, 1, 1, '2024-11-01 10:00:00', 2),
(7, 2, 3, 2, '2024-11-02 15:30:00', 1),
(8, 3, 4, 2, '2024-11-03 18:45:00', 3),
(9, 1, 2, 1, '2024-11-04 12:00:00', 1),
(10, 4, 5, 1, '2024-11-05 14:20:00', 5),
(11, 1, 1, 1, '2024-11-01 10:00:00', 2),
(12, 2, 3, 2, '2024-11-02 15:30:00', 1),
(13, 3, 4, 2, '2024-11-03 18:45:00', 3),
(14, 1, 2, 1, '2024-11-04 12:00:00', 1),
(15, 4, 5, 1, '2024-11-05 14:20:00', 5),
(16, 1, 1, 1, '2024-11-01 10:00:00', 2),
(17, 2, 3, 2, '2024-11-02 15:30:00', 1),
(18, 3, 4, 2, '2024-11-03 18:45:00', 3),
(19, 1, 2, 1, '2024-11-04 12:00:00', 1),
(20, 4, 5, 1, '2024-11-05 14:20:00', 5),
(21, 1, 1, 1, '2024-11-01 10:00:00', 2),
(22, 2, 3, 2, '2024-11-02 15:30:00', 1),
(23, 3, 4, 2, '2024-11-03 18:45:00', 3),
(24, 1, 2, 1, '2024-11-04 12:00:00', 1),
(25, 4, 5, 1, '2024-11-05 14:20:00', 5),
(26, 11, 2, 1, '2024-11-27 18:29:42', 2),
(27, 12, 14, 2, '2024-11-27 19:16:20', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
