CREATE DATABASE  IF NOT EXISTS `hosteria`
USE `hosteria`;

DROP TABLE IF EXISTS `adhabitaciones`;

CREATE TABLE `adhabitaciones` (
  `idhabitaciones` int NOT NULL,
  `idAdicionales` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `adhabitaciones` WRITE;
INSERT INTO `adhabitaciones` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(6,3),(6,4),(6,5),(6,6),(6,7),(8,3),(8,4),(8,5),(8,6),(8,7),(9,3),(9,4),(9,5),(9,6),(9,7),(11,3),(11,4),(11,5),(11,6),(11,7),(13,3),(13,4),(13,5),(13,6),(13,7),(14,3),(14,4),(14,5),(14,6),(14,7);
UNLOCK TABLES;



DROP TABLE IF EXISTS `adicionales`;

CREATE TABLE `adicionales` (
  `idAdicionales` int NOT NULL AUTO_INCREMENT,
  `descripcionAdicional` varchar(45) NOT NULL,
  PRIMARY KEY (`idAdicionales`),
  UNIQUE KEY `idadicionales_UNIQUE` (`idAdicionales`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `adicionales` WRITE;
INSERT INTO `adicionales` VALUES (1,'TV'),(2,'Calefaccion'),(3,'Wifi'),(4,'Acceso a pileta'),(5,'Estacionamiento'),(6,'Desayuno incluido'),(7,'Servicio recepcion'),(8,'Baño privado');
UNLOCK TABLES;



DROP TABLE IF EXISTS `estadohabitacion`;

CREATE TABLE `estadohabitacion` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `descripcionEstado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstado`),
  UNIQUE KEY `idTipo_UNIQUE` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `estadohabitacion` WRITE;

INSERT INTO `estadohabitacion` VALUES (1,'Disponible'),(2,'Ocupada'),(3,'Mantenimiento'),(4,'No disponible');

UNLOCK TABLES;

DROP TABLE IF EXISTS `estadohuesped`;

CREATE TABLE `estadohuesped` (
  `idestadoHuesped` int NOT NULL AUTO_INCREMENT,
  `descripcionHuesped` varchar(45) NOT NULL,
  PRIMARY KEY (`idestadoHuesped`),
  UNIQUE KEY `idestadoHuesped_UNIQUE` (`idestadoHuesped`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `estadohuesped` WRITE;
INSERT INTO `estadohuesped` VALUES (1,'Reservado'),(2,'Activo'),(3,'Inactivo');
UNLOCK TABLES;

DROP TABLE IF EXISTS `habitaciones`;

CREATE TABLE `habitaciones` (
  `idhabitaciones` int NOT NULL AUTO_INCREMENT,
  `idTipo` varchar(45) NOT NULL,
  `idEstado` varchar(45) NOT NULL,
  `idHuesped` varchar(45) NOT NULL,
  PRIMARY KEY (`idhabitaciones`),
  UNIQUE KEY `idhabitaciones_UNIQUE` (`idhabitaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `habitaciones` WRITE;

INSERT INTO `habitaciones` VALUES (1,'1','1',''),(2,'1','2','1'),(3,'1','1',''),(4,'1','1',''),(5,'4','2','2'),(6,'3','1',''),(7,'2','4',''),(8,'2','2','3'),(9,'2','3',''),(10,'4','4',''),(11,'3','1',''),(12,'2','4',''),(13,'3','1',''),(14,'2','1',''),(15,'2','4','');

UNLOCK TABLES;


DROP TABLE IF EXISTS `huesped`;
CREATE TABLE `huesped` (
  `idHuesped` int NOT NULL AUTO_INCREMENT,
  `dniHuesped` varchar(45) NOT NULL,
  `apellidoHuesped` varchar(45) NOT NULL,
  `nombreHuesped` varchar(45) NOT NULL,
  `emailHuesped` varchar(45) NOT NULL,
  `telefHuesped` varchar(45) NOT NULL,
  `idestadoHuesped` varchar(45) NOT NULL,
  PRIMARY KEY (`idHuesped`),
  UNIQUE KEY `idHuesped_UNIQUE` (`idHuesped`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `huesped` WRITE;

INSERT INTO `huesped` VALUES (1,'34244245','Villanueva','Hugo','hugo@gmail,com','3875882084','1'),(2,'43836389','Copa','Abigail','aby@gmail.com','3875100345','3'),(3,'41567345','Rodriguez','Leonel','leo@gmail.com','3872345678','2');

UNLOCK TABLES;

DROP TABLE IF EXISTS `nuevareserva`;
CREATE TABLE `nuevareserva` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `idhabitaciones` int NOT NULL,
  `fechaIngreso` date NOT NULL,
  `fechaEgreso` date NOT NULL,
  `idUsuarios` int NOT NULL,
  `idHuesped` int NOT NULL,
  PRIMARY KEY (`idReserva`),
  UNIQUE KEY `idReserva_UNIQUE` (`idReserva`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `nuevareserva` WRITE;

INSERT INTO `nuevareserva` VALUES (1,2,'2025-06-11','2025-06-13',1,1),(2,5,'2025-06-12','2025-06-13',3,2),(3,8,'2025-06-12','2025-06-15',2,3);
UNLOCK TABLES;

DROP TABLE IF EXISTS `tiposhabitaciones`;

CREATE TABLE `tiposhabitaciones` (
  `idTipo` int NOT NULL AUTO_INCREMENT,
  `descripcionTipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo`),
  UNIQUE KEY `idTipo_UNIQUE` (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tiposhabitaciones` WRITE;
INSERT INTO `tiposhabitaciones` VALUES (1,'Matrimonial'),(2,'Doble'),(3,'Triple'),(4,'Cuadruple'),(5,'Simple');
UNLOCK TABLES;


DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `dniUsuarios` varchar(45) NOT NULL,
  `nombreUsuarios` varchar(45) NOT NULL,
  `apellidoUsuarios` varchar(45) NOT NULL,
  `rolUsuarios` varchar(45) NOT NULL,
  `passUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  UNIQUE KEY `idUsuarios_UNIQUE` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `usuarios` WRITE;
INSERT INTO `usuarios` VALUES (1,'43836389','Karen','Mamani','Administrador','12345678'),(2,'41455686','Franco','Viveros','Recepcionista','12345678'),(3,'42244245','Talia','Figueroa','Recepcionista','12345678'),(4,'24708635','Vilma','Aramayo','Limpieza','12345678'),(5,'22567834','Margarita','Sanchez','Limpieza','12345678');
UNLOCK TABLES;

