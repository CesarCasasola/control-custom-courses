
Create database admaptec_jmln2

use admaptec_jmln2;

CREATE TABLE  `cmb_alumno` 
(
  `idalumno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `FECHA_NACIMIENTO` DATE,
  `PADRE` VARCHAR(50),	
  `TELEFONO` INT,
  `COMPANIA` VARCHAR(10),
  `TEL2` INT NULL,
  `COMP2`VARCHAR(10) NULL,
  `OBSERVACIONES` VARCHAR(250) NULL,
  `ACTIVO` BIT,
   PRIMARY KEY (`idalumno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


CREATE TABLE IF NOT EXISTS `admaptec_jmln2`.`cmb_catedratico` (
  `idcatedratico` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `FECHA_NACIMIENTO` DATE NULL,
  `PROFESION` VARCHAR(100) NULL,
  `telefono` VARCHAR(45) NULL,
  `compania` VARCHAR(45) NOT NULL,
  `USUARIO` VARCHAR(20) NOT NULL,
  `PASSWORD` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idcatedratico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


CREATE TABLE IF NOT EXISTS `admaptec_jmln2`.`cmb_curso` (
  `idcurso` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL,
  `descripcion` VARCHAR(45) NULL,
  `activo` BIT, 
  PRIMARY KEY (`idcurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


CREATE TABLE IF NOT EXISTS `admaptec_jmln2`.`cmb_asignacion`(
  `IDCURSO` INT NOT NULL,
  `IDCATEDRATICO` INT NOT NULL,
  `IDALUMNO` INT NOT NULL,
  `HORARIO` VARCHAR(15),
  `DIA`     VARCHAR(15),
  `ANIO`    INT,  
  `PRECIO` DECIMAL(5, 2) NOT NULL,
  `CATEGORIA` VARCHAR(25),
  `ACTIVO` BIT,
  PRIMARY KEY( `IDCURSO`,  `IDCATEDRATICO`,  `IDALUMNO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE TABLE IF NOT EXISTS `admaptec_jmln2`.`cmb_pago`(
  `IDALUMNO`  INT NOT NULL,
  `FECHA`     DATE NOT NULL,
  `NO_CUOTAS` INT NOT NULL,
  `TOTAL`     INT NOT NULL,
  `DESCRIPCION` VARCHAR(70) NULL,
  `NO_RECIBO`   INT NOT NULL,
  PRIMARY KEY( `NO_RECIBO`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;

CREATE TABLE IF NOT EXISTS `admaptec_jmln2`.`cmb_pagoenmes`(
  `ID_PAGO` INT NOT NULL,
  `IDALUMNO` INT NOT NULL,
  `MES`      INT NOT NULL,
  `ANIO`     INT  NOT NULL,
  `NO_RECIBO` INT NOT NULL,
  PRIMARY KEY(`ID_PAGO`))
  
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-----Volcado de Datos Currencies---
INSERT INTO `currencies` (`id`, `name`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `code`) VALUES
(18, 'Quetzal Guatemalteco', 'Q', '2', ',', '.', 'GTQ');


CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE IF NOT EXISTS `facturas` (
  `id_factura` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_venta` varchar(20) NOT NULL,
  `estado_factura` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre_empresa` varchar(150) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `impuesto` int(2) NOT NULL,
  `moneda` varchar(6) NOT NULL,
  `logo_url` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `tmp` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Indices de la tabla `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `numero_cotizacion` (`numero_factura`,`id_producto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `numero_cotizacion` (`numero_factura`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`);


ALTER TABLE `currencies`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;

ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
