/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `dias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `descripcion` text,
  `disponibles` int DEFAULT NULL,
  `categoria_id` int NOT NULL,
  `dia_id` int NOT NULL,
  `hora_id` int NOT NULL,
  `ponente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventos_categorias_idx` (`categoria_id`),
  KEY `fk_eventos_dias1_idx` (`dia_id`),
  KEY `fk_eventos_horas1_idx` (`hora_id`),
  KEY `fk_eventos_ponentes1_idx` (`ponente_id`),
  CONSTRAINT `fk_eventos_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `fk_eventos_dias1` FOREIGN KEY (`dia_id`) REFERENCES `dias` (`id`),
  CONSTRAINT `fk_eventos_horas1` FOREIGN KEY (`hora_id`) REFERENCES `horas` (`id`),
  CONSTRAINT `fk_eventos_ponentes1` FOREIGN KEY (`ponente_id`) REFERENCES `ponentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `eventos_registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `evento_id` int DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evento_id` (`evento_id`),
  KEY `registro_id` (`registro_id`),
  CONSTRAINT `eventos_registros_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  CONSTRAINT `eventos_registros_ibfk_2` FOREIGN KEY (`registro_id`) REFERENCES `registros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `horas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `paquetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `ponentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `ciudad` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `imagen` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `tags` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `redes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `regalos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paquete_id` int DEFAULT NULL,
  `pago_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `token` varchar(8) DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuario_id`),
  KEY `paquete_id` (`paquete_id`),
  CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `registros_ibfk_2` FOREIGN KEY (`paquete_id`) REFERENCES `paquetes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Carpintería');
INSERT INTO `categorias` (`id`, `nombre`) VALUES
(2, 'Electricidad y cableado');
INSERT INTO `categorias` (`id`, `nombre`) VALUES
(3, 'Fontanería');
INSERT INTO `categorias` (`id`, `nombre`) VALUES
(4, 'Pintura y decoración'),
(5, 'Jardinería y paisajismo'),
(6, 'Reparaciones básicas del hogar'),
(7, 'Construcción de estructuras'),
(8, 'Restauración de muebles'),
(9, 'Trabajos en albañilería'),
(10, 'Técnicas de bricolaje avanzadas');

INSERT INTO `dias` (`id`, `nombre`) VALUES
(1, '18-JUL-23');
INSERT INTO `dias` (`id`, `nombre`) VALUES
(2, '24-JUL-23');
INSERT INTO `dias` (`id`, `nombre`) VALUES
(3, '27-JUL-23');
INSERT INTO `dias` (`id`, `nombre`) VALUES
(4, 'NO APLICA');

INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `disponibles`, `categoria_id`, `dia_id`, `hora_id`, `ponente_id`) VALUES
(39, 'Construcción de Mesas de Madera', 'Aprende carpintería construyendo una mesa', 10, 1, 1, 1, 5);
INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `disponibles`, `categoria_id`, `dia_id`, `hora_id`, `ponente_id`) VALUES
(40, 'Fabricación de Armarios Empotrados', 'Diseña y construye armarios a medida', 12, 1, 1, 1, 8);
INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `disponibles`, `categoria_id`, `dia_id`, `hora_id`, `ponente_id`) VALUES
(41, 'Taller de Tallado en Madera', 'Descubre el arte del tallado en madera', 15, 1, 1, 4, 3);
INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `disponibles`, `categoria_id`, `dia_id`, `hora_id`, `ponente_id`) VALUES
(42, 'Fundamentos de Electricidad', 'Aprende los conceptos básicos de electricidad', 8, 2, 1, 1, 12),
(43, 'Instalación de Sistemas Eléctricos', 'Aprende a instalar sistemas eléctricos', 10, 2, 1, 1, 10),
(44, 'Taller de Cableado de Iluminación', 'Aprende a cablear sistemas de iluminación', 12, 2, 1, 4, 7),
(45, 'Construcción de Mesas de Madera', 'Aprende carpintería construyendo una mesa', 10, 1, 1, 1, 5),
(46, 'Fabricación de Armarios Empotrados', 'Diseña y construye armarios a medida', 12, 1, 1, 1, 8),
(47, 'Taller de Tallado en Madera', 'Descubre el arte del tallado en madera', 15, 1, 1, 4, 3),
(48, 'Fundamentos de Electricidad', 'Aprende los conceptos básicos de electricidad', 8, 2, 1, 1, 12),
(49, 'Instalación de Sistemas Eléctricos', 'Aprende a instalar sistemas eléctricos', 10, 2, 1, 1, 10),
(50, 'Taller de Cableado de Iluminación', 'Aprende a cablear sistemas de iluminación', 12, 2, 1, 4, 7),
(51, 'Introducción a la Fontanería', 'Aprende los fundamentos de la fontanería', 8, 3, 1, 1, 9),
(52, 'Reparación de Fugas y Grifos', 'Aprende a reparar fugas y grifos', 10, 3, 1, 1, 4),
(53, 'Taller de Instalación de Tuberías', 'Aprende a instalar tuberías correctamente', 12, 3, 1, 4, 6),
(54, 'Técnicas de Pintura para Interiores', 'Aprende técnicas de pintura para interiores', 10, 4, 1, 1, 2),
(55, 'Pintura de Muebles y Objetos Decorativos', 'Aprende a pintar muebles y objetos decorativos', 12, 4, 1, 1, 11),
(56, 'Taller de Diseño de Interiores', 'Descubre cómo diseñar espacios interiores', 15, 4, 1, 4, 18),
(57, 'Diseño de Jardines y Planificación Paisajística', 'Aprende a diseñar y planificar jardines', 10, 5, 1, 1, 15),
(58, 'Cuidado de Plantas y Jardines', 'Aprende a cuidar plantas y jardines correctamente', 12, 5, 1, 1, 13),
(59, 'Taller de Paisajismo Urbano', 'Descubre cómo crear paisajes urbanos atractivos', 15, 5, 1, 4, 1),
(60, 'Reparación de Electrodomésticos', 'Aprende a reparar electrodomésticos comunes', 10, 6, 1, 1, 9),
(61, 'Fontanería Básica para el Hogar', 'Aprende a realizar reparaciones de fontanería en casa', 12, 6, 1, 1, 4),
(62, 'Taller de Reparación de Persianas', 'Descubre cómo reparar persianas y estores', 15, 6, 1, 4, 7),
(63, 'Fundamentos de Construcción', 'Aprende los principios básicos de la construcción', 10, 7, 1, 1, 2),
(64, 'Construcción de Paredes de Mampostería', 'Aprende a construir paredes de mampostería', 12, 7, 1, 1, 8),
(65, 'Taller de Construcción de Pérgolas', 'Descubre cómo construir pérgolas para exteriores', 15, 7, 1, 4, 3),
(66, 'Restauración de Muebles Antiguos', 'Aprende a restaurar muebles antiguos y darles nueva vida', 10, 8, 1, 1, 15),
(67, 'Pintura y Acabados en Muebles', 'Aprende técnicas de pintura y acabados para muebles', 12, 8, 1, 1, 11),
(68, 'Taller de Tapicería', 'Descubre cómo realizar la tapicería de muebles', 15, 8, 1, 4, 18),
(69, 'Revestimientos de Paredes', 'Aprende a realizar revestimientos de paredes', 10, 9, 1, 1, 13),
(70, 'Construcción de Chimeneas', 'Aprende a construir chimeneas y estufas de leña', 12, 9, 1, 1, 6),
(71, 'Taller de Instalación de Suelos', 'Descubre cómo instalar diferentes tipos de suelos', 15, 9, 1, 4, 10),
(72, 'Principios de Diseño de Interiores', 'Aprende los principios básicos del diseño de interiores', 10, 10, 1, 1, 12),
(73, 'Estilos de Decoración para el Hogar', 'Descubre diferentes estilos de decoración para el hogar', 12, 10, 1, 1, 5),
(74, 'Taller de Diseño de Espacios Pequeños', 'Aprende a diseñar espacios pequeños de forma eficiente', 15, 10, 1, 4, 9);



INSERT INTO `horas` (`id`, `hora`) VALUES
(1, '10:00 - 10:55');
INSERT INTO `horas` (`id`, `hora`) VALUES
(2, '11:00 - 11:55');
INSERT INTO `horas` (`id`, `hora`) VALUES
(3, '12:00 - 12:55');
INSERT INTO `horas` (`id`, `hora`) VALUES
(4, '13:00 - 13:55'),
(5, '16:00 - 16:55'),
(6, '17:00 - 17:55'),
(7, '18:00 - 18:55'),
(8, '19:00 - 19:55');

INSERT INTO `paquetes` (`id`, `nombre`) VALUES
(1, 'Presencial');
INSERT INTO `paquetes` (`id`, `nombre`) VALUES
(2, 'Virtual');
INSERT INTO `paquetes` (`id`, `nombre`) VALUES
(3, 'Gratis');

INSERT INTO `ponentes` (`id`, `nombre`, `apellido`, `ciudad`, `pais`, `imagen`, `tags`, `redes`) VALUES
(1, ' Julian', 'Muñoz', 'Madrid', 'España', '6764a74ccf2b4b5b74e333016c13388a', '5 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}');
INSERT INTO `ponentes` (`id`, `nombre`, `apellido`, `ciudad`, `pais`, `imagen`, `tags`, `redes`) VALUES
(2, ' Israel', 'González', 'CDMX', 'México', '6497c66bcc464e26871c046dd5bb86c8', '3 años con nosotros', '{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}');
INSERT INTO `ponentes` (`id`, `nombre`, `apellido`, `ciudad`, `pais`, `imagen`, `tags`, `redes`) VALUES
(3, ' Isabella', 'Tassis', 'Buenos Aires', 'Argentina', '55c7866df31370ec3299eed6eb63daa1', '5 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"\"}');
INSERT INTO `ponentes` (`id`, `nombre`, `apellido`, `ciudad`, `pais`, `imagen`, `tags`, `redes`) VALUES
(4, ' Jazmín', 'Hurtado', 'CDMX', 'México', 'de6e3fa0cde8402de4c28e6be0903ada', '4 años con nosotros', '{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(5, ' María Camila', 'Murillo', 'Guadalajara', 'México', 'cec8c9d7bcb4c19e87d1164bce8fe176', '5 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),
(6, ' Tomas', 'Aleman', 'Bogotá', 'Colombia', '5332118b8d7690a1b992431802eafab1', '2 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(7, ' Lucía', 'Velázquez', 'Buenos Aires', 'Argentina', '90956ece4adbd9f9ccb8f4ae80dc1537', '6 años con nosotros', '{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),
(8, ' Catarina', 'Pardo', 'Lima', 'Perú', '9886ffc0d31e4c20a04acc1464630527', '5 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"\"}'),
(9, ' Raquel', 'Ros', 'Madrid', 'España', 'd697f6c454c36252d70abacd7599566c', '5 años con nosotros', '{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(10, ' Sofía', 'Amengual', 'Santiago', 'Chile', '414ffd61380bbf0e9f45cbde4d0cbb7f', '3 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),
(11, ' María José', 'Leoz', 'NY', 'Estados Unidos', 'c8b3a77bce7a6efb6e6872db67cfa553', '5 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(12, ' Alexa', 'Mina', 'Bogotá', 'Colombia', '6eac63d88743bbb9ee0bfd8c60cf4186', '4 años con nosotros', '{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),
(13, ' Jesus', 'López', 'Madrid', 'España', 'e481bca0c512f5b4d8f76ccea2548f0d', '4 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"\"}'),
(14, ' Irene ', 'Dávalos', 'CDMX', 'México', '6727e8ee7f6c642026247fe0556d866d', '5 años con nosotros', '{\"facebook\":\"\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"\",\"github\":\"https://github.com/codigoconjuan\"}'),
(15, ' Brenda', ' Ocampo', 'Santiago', 'Chile', '40e01f5c023c7e74c9c372a8126edd97', '3 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),
(16, ' Julián ', 'Noboa', 'Las Vegas', 'EU', '6d4629dacbed2e4f5a344282ec2f4f76', '4 años con nosotros', '{\"facebook\":\"\",\"twitter\":\"\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"https://instagram.com/codigoconjuan\",\"tiktok\":\"https://tiktok.com/@codigoconjuan\",\"github\":\"https://github.com/codigoconjuan\"}'),
(17, ' Vicente ', 'Figueroa', 'CDMX', 'México', '2a41a781d8ae8f0f7a1969c766276b08', '5 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}'),
(18, ' Nico ', 'Fraga', 'Buenos Aires', 'Argentina', '222dc6502643afa2f4a55acaecd93221', '3 años con nosotros', '{\"facebook\":\"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628\",\"twitter\":\"https://twitter.com/codigoconjuan\",\"youtube\":\"https://youtube.com/codigoconjuan\",\"instagram\":\"\",\"tiktok\":\"\",\"github\":\"\"}');

INSERT INTO `regalos` (`id`, `nombre`) VALUES
(1, 'Paquete Stickers');
INSERT INTO `regalos` (`id`, `nombre`) VALUES
(2, 'Camisa Mujer - Chica');
INSERT INTO `regalos` (`id`, `nombre`) VALUES
(3, 'Camisa Mujer - Mediana');
INSERT INTO `regalos` (`id`, `nombre`) VALUES
(4, 'Camisa Mujer - Grande'),
(5, 'Camisa Mujer - XL'),
(6, 'Camisa Hombre - Chica'),
(7, 'Camisa Hombre - Mediana'),
(8, 'Camisa Hombre - Grande'),
(9, 'Camisa Hombre - XL');



INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `confirmado`, `token`, `admin`) VALUES
(10, ' Daniel', 'Jarquin', 'cs.danieljl@gmail.com', '$2y$10$BnHGPUtjMGg58CDHTWhrd.LwJv3l/v31ZXfm2731/Ta7Y6Ua7.WPy', 1, '6487cde70cbaf', 1);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;