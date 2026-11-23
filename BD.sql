SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- puav_produccion.archivos definition

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL COMMENT 'Nombre del archivo',
  `descripcion` varchar(250) DEFAULT NULL COMMENT 'Descripción del archivo cargado',
  `contenido` blob COMMENT 'Archivo binario',
  `tipo` varchar(10) DEFAULT NULL COMMENT 'Extensión del archivo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


-- puav_produccion.codigos definition

CREATE TABLE `codigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica el codigo',
  `id_padre` int(11) DEFAULT NULL COMMENT 'Número consecutivo que identifica el código padre',
  `descripcion` varchar(255) NOT NULL COMMENT 'Descripción del código',
  `orden` int(11) DEFAULT NULL COMMENT 'Orden del código dentro del padre',
  `codigo_oficial` varchar(20) NOT NULL COMMENT 'Si la variable proviene de una codigicación oficial, en este campo se ingresa ese código',
  `estado` int(1) DEFAULT '1' COMMENT 'Determina si el código está o no activo (1 activo 0 inactivo)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_padre_orden` (`id`,`id_padre`)
) ENGINE=InnoDB AUTO_INCREMENT=4792 DEFAULT CHARSET=utf8 COMMENT='Tabla que administra los códigos de alternativas de respuesta';


-- puav_produccion.demandantes_bi_historico definition

CREATE TABLE `demandantes_bi_historico` (
  `id` int(11) NOT NULL COMMENT 'Consecutivo que identifica al demandante (empresas)',
  `idUsuario` int(11) NOT NULL COMMENT 'Consecutivo de usuario para la relación con la tabla de usuarios',
  `razon_social` varchar(255) DEFAULT NULL COMMENT 'Razón social',
  `nit` int(15) DEFAULT NULL COMMENT 'NIT',
  `representante_legal` varchar(255) DEFAULT NULL COMMENT 'Nombre del representante legal',
  `ciiu` int(11) DEFAULT NULL COMMENT 'Código CIIU Clase',
  `telefono` varchar(7) DEFAULT NULL COMMENT 'Teléfono de la empresa',
  `celular` varchar(10) DEFAULT NULL COMMENT 'Celular de la empresa',
  `direccion` varchar(250) DEFAULT NULL COMMENT 'Dirección de la empresa',
  `municipioCodigo` int(11) DEFAULT NULL COMMENT 'Municipio en el que se ubica la empresa',
  `url_web` varchar(250) DEFAULT NULL COMMENT 'URL de la WEB',
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en la que se hace la actualización de la información',
  KEY `FK_demandantehist01` (`idUsuario`),
  KEY `FK_demandantehist04` (`ciiu`),
  KEY `FK_demandantehist05` (`municipioCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información histórica de demandantes o empresas';


-- puav_produccion.menus definition

CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria',
  `etiqueta` varchar(250) NOT NULL COMMENT 'Cadena que se muestra en el menú',
  `url` varchar(250) NOT NULL COMMENT 'Almacena la ruta relativa que debe incluirse en la página',
  `librerias` varchar(4000) DEFAULT NULL COMMENT 'Almacena las librerías que se adicionan para este menú',
  `estilos` varchar(4000) DEFAULT NULL COMMENT 'Almacena link de estilos si es necesario agregarlos a la página',
  `estado` int(1) NOT NULL DEFAULT '1' COMMENT 'Almacena el estado del menú 0: Inactivo 1:Activo 2:Pruebas 3:Desarrollo',
  `target` varchar(20) DEFAULT '_SELF' COMMENT 'Dónde debe ser mostrada la página? En una nueva ventana? _BLANK o en la misma ventana? _SELF',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena las diferentes opciones del menú';


-- puav_produccion.oferentes_bi_historico definition

CREATE TABLE `oferentes_bi_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica al oferente (persona) de servicios',
  `idUsuario` int(11) NOT NULL COMMENT 'Consecutivo de usuario para la relación con la tabla de usuarios',
  `nombre1` varchar(20) NOT NULL COMMENT 'Primer nombre',
  `nombre2` varchar(20) DEFAULT NULL COMMENT 'Segundo nombre',
  `apellido1` varchar(20) NOT NULL COMMENT 'Primer apellido',
  `apellido2` varchar(20) DEFAULT NULL COMMENT 'Segundo apellido',
  `fechaNacimiento` date NOT NULL COMMENT 'Fecha de nacimiento',
  `telefono1` varchar(10) NOT NULL COMMENT 'Teléfono fijo',
  `telefono2` varchar(7) NOT NULL COMMENT 'Celular',
  `municipioNacimientoCodigo` varchar(5) NOT NULL COMMENT 'Municipio de nacimiento',
  `generoCodigo` int(11) NOT NULL COMMENT 'Género código',
  `sexoCodigo` int(11) NOT NULL COMMENT 'Sexo código ',
  `direccion` varchar(255) NOT NULL COMMENT 'Dirección de residencia',
  `municipioViviendaCodigo` int(11) NOT NULL COMMENT 'Departamento de nacimiento',
  `estadoCivilCodigo` int(11) NOT NULL COMMENT 'Código del Estado civil del oferente',
  `extranjeroCodigo` int(11) NOT NULL COMMENT 'Identifica si la persona es colombiana o extranjera, código padre',
  `paisCodigo` int(11) NOT NULL COMMENT 'Código del país de nacimiento del oferente',
  `libretaMilitar` int(11) DEFAULT NULL COMMENT 'No. de libreta militar',
  `etnia` int(11) DEFAULT '0' COMMENT 'Pertenencia étnica',
  `discapacidad` int(1) DEFAULT '0' COMMENT 'Pregunta si la persona está en condición de discapacidad',
  `discapacidadFisica` int(1) DEFAULT '0' COMMENT 'Si tiene discapacidad física',
  `discapacidadVisual` int(1) DEFAULT '0' COMMENT 'Tiene Si/No discapacidad visual',
  `discapacidadAuditiva` int(1) DEFAULT '0' COMMENT 'Tiene si/no discapacidad auditiva',
  `discapacidadVerbal` int(1) DEFAULT '0' COMMENT 'tiene si/no discapacidad verbal',
  `discapacidadIntelectual` int(1) DEFAULT '0' COMMENT 'tienen si/no discapacidad intelectual',
  `discapacidadPsicosocial` int(1) DEFAULT '0' COMMENT 'tienen si/no discapacidad psicosocial',
  `victimaConflicto` int(1) DEFAULT '0' COMMENT 'Víctima de conflicto armado si/no',
  `orientacionOcupacional` int(1) DEFAULT '0' COMMENT 'Determina si la persona fue atendida en orientación ocupacional',
  `personasCargo` int(2) DEFAULT '0' COMMENT 'cantidad de personas a cargo',
  `fechacambio` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en la que se hace la actualización de la información',
  KEY `FK_oferenteHistorico01` (`id`),
  KEY `FK_oferenteHistorico02` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información histórica de oferentes o personas';


-- puav_produccion.roles definition

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria',
  `nombre` varchar(250) NOT NULL COMMENT 'Nombre asignado al rol',
  `descripcion` varchar(512) NOT NULL COMMENT 'Descripción breve del rol',
  `estado` int(1) NOT NULL DEFAULT '1' COMMENT 'Almacena el estado del rol 0: Inactivo 1:Activo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Tabla que almacena los diferentes roles creados';


-- puav_produccion.rel_menusByRol definition

CREATE TABLE `rel_menusByRol` (
  `idRol` int(11) NOT NULL COMMENT 'Identificador único del rol que se está definiendo',
  `idMenu` int(11) NOT NULL COMMENT 'Identificador único del menú relaiconado al rol',
  `orden` int(11) DEFAULT NULL COMMENT 'Esta información permite ordenar adecuadamente el menú a desplegar',
  PRIMARY KEY (`idRol`,`idMenu`),
  KEY `FK_menusByRol_002` (`idMenu`),
  CONSTRAINT `FK_menusByRol_001` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_menusByRol_002` FOREIGN KEY (`idMenu`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena la relación entre un rol y los menú asociados al mismo';


-- puav_produccion.usuarios definition

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica al usuario',
  `tipo_doc` int(11) NOT NULL COMMENT 'Tipo de documento del usuario',
  `username` varchar(37) NOT NULL COMMENT 'Nombre de usuario para ingresar a la aplicación',
  `password` varchar(255) NOT NULL COMMENT 'Clave de acceso codificada',
  `email` varchar(250) NOT NULL COMMENT 'Correo electrónico del usuario de la aplicación',
  `confirmcode` varchar(255) NOT NULL COMMENT 'Código de confirmación',
  `estado` int(1) NOT NULL DEFAULT '0' COMMENT 'Estado del usuario de la aplicación',
  `tipo_usuario` int(11) NOT NULL COMMENT 'Código del tipo de usuario (empresa o persona)',
  `tratamiento_datos` int(1) NOT NULL DEFAULT '0' COMMENT 'Acepta o no expresamente la política de tratamiento de datos',
  `fecha_registro` datetime DEFAULT NULL COMMENT 'Fecha en la que el usuario se registra en la aplicación',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_username` (`username`,`tipo_usuario`),
  KEY `FK_usuarios_001` (`tipo_usuario`),
  CONSTRAINT `FK_usuarios_001` FOREIGN KEY (`tipo_usuario`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Tabla que administra la información de los usuarios de la aplicación';


-- puav_produccion.demandantes_bi definition

CREATE TABLE `demandantes_bi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica al demandante (empresas)',
  `idUsuario` int(11) NOT NULL COMMENT 'Consecutivo de usuario para la relación con la tabla de usuarios',
  `razon_social` varchar(255) DEFAULT NULL COMMENT 'Razón social',
  `nit` int(15) NOT NULL COMMENT 'NIT',
  `representante_legal` varchar(255) NOT NULL COMMENT 'Nombre del representante legal',
  `ciiu` int(11) NOT NULL COMMENT 'Código CIIU Clase',
  `telefono` varchar(7) NOT NULL COMMENT 'Teléfono de la empresa',
  `celular` varchar(10) DEFAULT NULL COMMENT 'Celular de la empresa',
  `direccion` varchar(250) NOT NULL COMMENT 'Dirección de la empresa',
  `municipioCodigo` int(11) NOT NULL COMMENT 'Municipio en el que se ubica la empresa',
  `url_web` varchar(250) NOT NULL COMMENT 'URL de la WEB',
  `check` tinyint(1) NOT NULL DEFAULT '0',
  `checkDate` date DEFAULT NULL,
  `checkBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_demandante01` (`idUsuario`),
  KEY `FK_demandante04` (`ciiu`),
  KEY `FK_demandante05` (`municipioCodigo`),
  CONSTRAINT `FK_demandante01` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_demandante04` FOREIGN KEY (`ciiu`) REFERENCES `codigos` (`id`),
  CONSTRAINT `FK_demandante05` FOREIGN KEY (`municipioCodigo`) REFERENCES `codigos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de demandantes o empresas';


-- puav_produccion.demandantes_vacantes definition

CREATE TABLE `demandantes_vacantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria',
  `idDemandante` int(11) NOT NULL COMMENT 'Identificación asociada a la empresa que demanda la vacante',
  `nombreCargo` varchar(150) NOT NULL COMMENT 'Nombre de la vacante según la empresa',
  `descripcion` mediumtext NOT NULL COMMENT 'Descripción general de la vacante',
  `salario` int(11) NOT NULL COMMENT 'Valor a pagar',
  `tipoContratoCodigo` int(11) NOT NULL COMMENT 'Determina si el salario incluye prestaciones o no - código padre',
  `mpioUbicacionCodigo` int(11) NOT NULL COMMENT 'Código padre del municipio para realizar el cargo',
  `numeroVacantes` int(11) NOT NULL COMMENT 'Número de vacantes disponibles',
  `funciones` mediumtext NOT NULL COMMENT 'Funciones a desarrollar en el cargo',
  `experienciaRequerida` mediumtext NOT NULL COMMENT 'Experiencia requerida para desarrollar el cargo',
  `fechaPublicacion` date DEFAULT NULL COMMENT 'Fecha a partir de la cual entra en vigencia la convocatoria',
  `fechaCierre` date NOT NULL COMMENT 'Fecha de cierre de la convocatoria',
  `idArchivo` int(11) DEFAULT NULL COMMENT 'Archivo de términos de referencia cuando aplique',
  PRIMARY KEY (`id`),
  KEY `id_demandante` (`idDemandante`),
  KEY `fk_demandantes_vacantes_002` (`idArchivo`),
  KEY `fk_demandantes_vacantes_003` (`tipoContratoCodigo`),
  KEY `fk_demandantes_vacantes_004` (`mpioUbicacionCodigo`),
  CONSTRAINT `fk_demandantes_vacantes_001` FOREIGN KEY (`idDemandante`) REFERENCES `demandantes_bi` (`id`),
  CONSTRAINT `fk_demandantes_vacantes_002` FOREIGN KEY (`idArchivo`) REFERENCES `archivos` (`id`),
  CONSTRAINT `fk_demandantes_vacantes_003` FOREIGN KEY (`tipoContratoCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_demandantes_vacantes_004` FOREIGN KEY (`mpioUbicacionCodigo`) REFERENCES `codigos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de vacantes de una empresa';


-- puav_produccion.log_in definition

CREATE TABLE `log_in` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL COMMENT 'Identificador del usuario',
  `username` varchar(250) DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_logoff` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `FK_login01` (`idUsuario`),
  CONSTRAINT `FK_login01` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COMMENT='Tabla que relaciona los accesos de los usuarios a la aplicación.';


-- puav_produccion.oferentes_bi definition

CREATE TABLE `oferentes_bi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica al oferente (persona) de servicios',
  `idUsuario` int(11) NOT NULL COMMENT 'Consecutivo de usuario para la relación con la tabla de usuarios',
  `nombre1` varchar(20) NOT NULL COMMENT 'Primer nombre',
  `nombre2` varchar(20) DEFAULT NULL COMMENT 'Segundo nombre',
  `apellido1` varchar(20) NOT NULL COMMENT 'Primer apellido',
  `apellido2` varchar(20) DEFAULT NULL COMMENT 'Segundo apellido',
  `fechaNacimiento` date NOT NULL COMMENT 'Fecha de nacimiento',
  `telefono1` varchar(10) NOT NULL COMMENT 'Teléfono fijo',
  `telefono2` varchar(7) NOT NULL COMMENT 'Celular',
  `municipioNacimientoCodigo` int(11) NOT NULL COMMENT 'Municipio de nacimiento',
  `generoCodigo` int(11) NOT NULL COMMENT 'Género código',
  `sexoCodigo` int(11) DEFAULT NULL COMMENT 'Sexo código ',
  `direccion` varchar(255) NOT NULL COMMENT 'Dirección de residencia',
  `municipioViviendaCodigo` int(11) NOT NULL COMMENT 'Departamento de nacimiento',
  `estadoCivilCodigo` int(11) NOT NULL COMMENT 'Código del Estado civil del oferente',
  `extranjeroCodigo` int(11) NOT NULL COMMENT 'Identifica si la persona es colombiana o extranjera, código padre',
  `paisCodigo` int(11) NOT NULL COMMENT 'Código del país de nacimiento del oferente',
  `libretaMilitar` int(11) DEFAULT NULL COMMENT 'No. de libreta militar',
  `etnia` int(11) DEFAULT '0' COMMENT 'Pertenencia étnica',
  `discapacidad` int(1) DEFAULT '0' COMMENT 'Pregunta si la persona está en condición de discapacidad',
  `discapacidadFisica` int(1) DEFAULT '0' COMMENT 'Si tiene discapacidad física',
  `discapacidadVisual` int(1) DEFAULT '0' COMMENT 'Tiene Si/No discapacidad visual',
  `discapacidadAuditiva` int(1) DEFAULT '0' COMMENT 'Tiene si/no discapacidad auditiva',
  `discapacidadVerbal` int(1) DEFAULT '0' COMMENT 'tiene si/no discapacidad verbal',
  `discapacidadIntelectual` int(1) DEFAULT '0' COMMENT 'tienen si/no discapacidad intelectual',
  `discapacidadPsicosocial` int(1) DEFAULT '0' COMMENT 'tienen si/no discapacidad psicosocial',
  `victimaConflicto` int(1) DEFAULT '0' COMMENT 'Víctima de conflicto armado si/no',
  `orientacionOcupacional` int(1) DEFAULT '0' COMMENT 'Determina si la persona fue atendida en orientación ocupacional',
  `personasCargo` int(2) DEFAULT '0' COMMENT 'cantidad de personas a cargo',
  `zonaCodigo` int(11) DEFAULT NULL COMMENT 'Zona de residencia',
  `estratoCodigo` int(11) DEFAULT NULL COMMENT 'Código de estrato socioeconómico',
  `tiempoBuscandoTrabajo` int(11) DEFAULT NULL COMMENT 'Tiempo que lleva buscando empleo',
  `rangoSueldoCodigo` int(11) DEFAULT NULL COMMENT 'Código de rango de sueldo al que aspira',
  `idArchivo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oferente01_idx` (`idUsuario`),
  KEY `fk_oferentes_bi_002` (`generoCodigo`),
  KEY `fk_oferentes_bi_003` (`sexoCodigo`),
  KEY `fk_oferentes_bi_004` (`municipioViviendaCodigo`),
  KEY `fk_oferentes_bi_005` (`estadoCivilCodigo`),
  KEY `fk_oferentes_bi_006` (`extranjeroCodigo`),
  KEY `fk_oferentes_bi_007` (`paisCodigo`),
  KEY `fk_oferentes_bi_008` (`etnia`),
  KEY `fk_oferentes_bi_009` (`victimaConflicto`),
  KEY `fk_oferentes_bi_010` (`orientacionOcupacional`),
  KEY `fk_oferentes_bi_011` (`zonaCodigo`),
  KEY `fk_oferentes_bi_012` (`estratoCodigo`),
  KEY `fk_oferentes_bi_013` (`rangoSueldoCodigo`),
  KEY `fk_oferentes_bi_001` (`municipioNacimientoCodigo`),
  CONSTRAINT `FK_oferente01` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_oferentes_bi_001` FOREIGN KEY (`municipioNacimientoCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_002` FOREIGN KEY (`generoCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_003` FOREIGN KEY (`sexoCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_004` FOREIGN KEY (`municipioViviendaCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_005` FOREIGN KEY (`estadoCivilCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_006` FOREIGN KEY (`extranjeroCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_007` FOREIGN KEY (`paisCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_008` FOREIGN KEY (`etnia`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_009` FOREIGN KEY (`victimaConflicto`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_010` FOREIGN KEY (`orientacionOcupacional`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_011` FOREIGN KEY (`zonaCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_012` FOREIGN KEY (`estratoCodigo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_bi_013` FOREIGN KEY (`rangoSueldoCodigo`) REFERENCES `codigos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de oferentes o personas';


-- puav_produccion.oferentes_educacion definition

CREATE TABLE `oferentes_educacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica un registro de educación del oferente',
  `idOferente` int(11) NOT NULL COMMENT 'Consecutivo de oferente para la relación con la tabla de oferentes',
  `capacitacionTrabajo` int(11) NOT NULL COMMENT 'Especifica si es capacitación para el trabajo Sí/No',
  `formal` int(11) NOT NULL COMMENT 'Educación formal Sí/No',
  `titulo` varchar(255) NOT NULL COMMENT 'Título obtendio',
  `institucion` varchar(255) NOT NULL COMMENT 'Institución',
  `presencialVirtual` char(1) NOT NULL DEFAULT 'P' COMMENT 'Determina fue presencial o virtual',
  `anoFinalizacion` int(4) NOT NULL COMMENT 'Año de finalización',
  `mesFinalizacion` int(2) NOT NULL COMMENT 'Mes de finalización',
  `termino` int(11) NOT NULL COMMENT 'Terminó Sí/No',
  `mesesEstudio` int(11) NOT NULL COMMENT 'Meses de estudio',
  `idArchivo` int(11) DEFAULT NULL COMMENT 'Archivo que da soporte del título reportado',
  PRIMARY KEY (`id`),
  KEY `fk_oferentes_educacion_001` (`idOferente`),
  KEY `fk_oferentes_educacion_002` (`idArchivo`),
  KEY `fk_oferentes_educacion_003` (`capacitacionTrabajo`),
  KEY `fk_oferentes_educacion_004` (`formal`),
  KEY `fk_oferentes_educacion_005` (`termino`),
  CONSTRAINT `fk_oferentes_educacion_001` FOREIGN KEY (`idOferente`) REFERENCES `oferentes_bi` (`id`),
  CONSTRAINT `fk_oferentes_educacion_002` FOREIGN KEY (`idArchivo`) REFERENCES `archivos` (`id`),
  CONSTRAINT `fk_oferentes_educacion_003` FOREIGN KEY (`capacitacionTrabajo`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_educacion_004` FOREIGN KEY (`formal`) REFERENCES `codigos` (`id`),
  CONSTRAINT `fk_oferentes_educacion_005` FOREIGN KEY (`termino`) REFERENCES `codigos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de educación del oferente';


-- puav_produccion.oferentes_experiencia definition

CREATE TABLE `oferentes_experiencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica la experiencia laborla del oferente',
  `idOferente` int(11) NOT NULL COMMENT 'Consecutivo de oferente para la relación con la tabla de oferentes',
  `empresa` varchar(255) NOT NULL COMMENT 'Nombre de la empresa donde trabaja o trabajó',
  `telefono` varchar(10) DEFAULT NULL,
  `municipio` int(11) DEFAULT NULL COMMENT 'Municipio en el que se ubica la empresa',
  `pasantia` int(11) NOT NULL COMMENT 'Especifica si es una pasantía o no',
  `fechaIngreso` date NOT NULL COMMENT 'Fecha de ingreso',
  `empleoActual` int(11) NOT NULL COMMENT 'Determina si es empleo actual o no',
  `fechaSalida` date DEFAULT NULL COMMENT 'Fecha de terminación de contrato',
  `ocupacion` int(11) DEFAULT NULL COMMENT 'Código de la clasificación nacional de ocupaciones CNO del SENA',
  `cargo` varchar(255) NOT NULL COMMENT 'Cargo principal realizado',
  `logros` varchar(2000) DEFAULT NULL COMMENT 'Logros alcanzados y sus responsabilidades en el cargo',
  `idArchivo` int(11) DEFAULT NULL COMMENT 'Ubicación del Certificado laboral escaneado',
  PRIMARY KEY (`id`),
  KEY `FK_oferentes_experiencia_001` (`ocupacion`),
  KEY `FK_oferentes_experiencia_002` (`idArchivo`),
  KEY `FK_oferentes_experiencia_003` (`municipio`),
  KEY `FK_oferentes_experiencia_004` (`idOferente`),
  KEY `FK_oferentes_experiencia_005` (`pasantia`),
  KEY `FK_oferentes_experiencia_006` (`empleoActual`),
  CONSTRAINT `FK_oferentes_experiencia_001` FOREIGN KEY (`ocupacion`) REFERENCES `codigos` (`id`),
  CONSTRAINT `FK_oferentes_experiencia_002` FOREIGN KEY (`idArchivo`) REFERENCES `archivos` (`id`),
  CONSTRAINT `FK_oferentes_experiencia_003` FOREIGN KEY (`municipio`) REFERENCES `codigos` (`id`),
  CONSTRAINT `FK_oferentes_experiencia_004` FOREIGN KEY (`idOferente`) REFERENCES `oferentes_bi` (`id`),
  CONSTRAINT `FK_oferentes_experiencia_005` FOREIGN KEY (`pasantia`) REFERENCES `codigos` (`id`),
  CONSTRAINT `FK_oferentes_experiencia_006` FOREIGN KEY (`empleoActual`) REFERENCES `codigos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de experiencia laboral';


-- puav_produccion.oferentes_interes_ocupacional definition

CREATE TABLE `oferentes_interes_ocupacional` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica el interes ocupacional delmoferente',
  `idOferente` int(11) NOT NULL COMMENT 'Consecutivo de oferente para la relación con la tabla de oferentes',
  `CNOCodigo` int(11) NOT NULL COMMENT 'Código de la clasificación nacional de ocupaciones CNO del SENA',
  PRIMARY KEY (`id`),
  KEY `fk_oferentes_interes_ocupacional_001` (`idOferente`),
  KEY `fk_oferentes_interes_ocupacional_002` (`CNOCodigo`),
  CONSTRAINT `fk_oferentes_interes_ocupacional_001` FOREIGN KEY (`idOferente`) REFERENCES `oferentes_bi` (`id`),
  CONSTRAINT `fk_oferentes_interes_ocupacional_002` FOREIGN KEY (`CNOCodigo`) REFERENCES `codigos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de intereses ocupacionales del oferente';


-- puav_produccion.oferentes_referencias definition

CREATE TABLE `oferentes_referencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica la referencia del oferente',
  `idOferente` int(11) NOT NULL COMMENT 'Consecutivo de oferente para la relación con la tabla de oferentes',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre de la persona de referencia',
  `tipoReferencia` int(11) NOT NULL COMMENT 'Tipo de referencia (personal o laboral)',
  `telefono` varchar(20) NOT NULL COMMENT 'Teléfono fijo',
  `celular` varchar(20) DEFAULT NULL COMMENT 'Celular',
  `direccion` varchar(255) DEFAULT NULL COMMENT 'Dirección de residencia',
  `ocupacion` varchar(255) NOT NULL COMMENT 'Ocupación de la persona de referencia',
  `idArchivo` int(11) DEFAULT NULL COMMENT 'Archivo de soporte en caso de que desee agregarlo',
  PRIMARY KEY (`id`),
  KEY `fk_oferentes_referencias_001` (`idOferente`),
  KEY `fk_oferentes_referencias_002` (`idArchivo`),
  KEY `fk_oferentes_referencias_003` (`tipoReferencia`),
  CONSTRAINT `fk_oferentes_referencias_001` FOREIGN KEY (`idOferente`) REFERENCES `oferentes_bi` (`id`),
  CONSTRAINT `fk_oferentes_referencias_002` FOREIGN KEY (`idArchivo`) REFERENCES `archivos` (`id`),
  CONSTRAINT `fk_oferentes_referencias_003` FOREIGN KEY (`tipoReferencia`) REFERENCES `codigos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la información de referencias de las personas';


-- puav_produccion.oferentes_vacantes definition

CREATE TABLE `oferentes_vacantes` (
  `id_oferente_vac` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo que identifica la aplicación a una vacante',
  `id_oferente` int(11) NOT NULL COMMENT 'Consecutivo de oferente para la relación con la tabla de oferentes',
  `id_vacante` int(11) NOT NULL COMMENT 'Consecutivo de vacante para la relación con la tabla de vacantes',
  `ranking` int(11) DEFAULT NULL COMMENT 'Grado de afinidad con la vacante del oferente',
  `revision_oferente` int(1) DEFAULT '2' COMMENT 'Certifica que los documentos e información del oferentes han sido revisados y son conformes con la convocatoria (0: No conforme, 1: Conforme, 2: Pendiente revisión)',
  `entrevista_oferente` int(1) DEFAULT '2' COMMENT 'Certifica que (F)EMPOWER ha realizado la entrevista al oferente que califica para la vacante (0: No conforme, 1: Conforme, 2: Pendiente revisión)',
  `clasificado_vacante` int(1) DEFAULT '3' COMMENT 'Certifica que el oferente ha sido seleccionado y se ha enviado su informción al demandante (0: No, 1: Si, 2: Clasificado no enviado, 3: Sin clasificar)',
  PRIMARY KEY (`id_oferente_vac`),
  KEY `fk_oferentes_vacantes_001` (`id_oferente`),
  KEY `fk_oferentes_vacantes_002` (`id_vacante`),
  CONSTRAINT `fk_oferentes_vacantes_001` FOREIGN KEY (`id_oferente`) REFERENCES `oferentes_bi` (`id`),
  CONSTRAINT `fk_oferentes_vacantes_002` FOREIGN KEY (`id_vacante`) REFERENCES `demandantes_vacantes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene la la relación de las vacantes en las que el PUAV relaciona a los oferentes';


-- -----------------------------------------------------
-- SEED DATA: Roles, Taxonomy Codes, Demo Users & Portfolios
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Roles
INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Demandante', 'Empresas y empleadores que publican vacantes laborales', 1),
(2, 'Administrador', 'Administrador del sistema de reclutamiento', 1),
(3, 'Oferente', 'Candidatas y personas en búsqueda de oportunidades de empleo', 1)
ON DUPLICATE KEY UPDATE `nombre` = VALUES(`nombre`);

-- 2. Codigos (Taxonomia y Categorias)
-- Documentos (id_padre = 18)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(18, NULL, 'TIPO DE DOCUMENTO', 1, 'DOC', 1),
(1, 18, 'Cédula de Ciudadanía', 1, 'CC', 1),
(2, 18, 'NIT', 2, 'NIT', 1),
(3, 18, 'Cédula de Extranjería', 3, 'CE', 1),
(4, 18, 'Tarjeta de Identidad', 4, 'TI', 1),
(5, 18, 'Pasaporte', 5, 'PAS', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Estados Civiles (id_padre = 2260)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(2260, NULL, 'ESTADO CIVIL', 2, 'EC', 1),
(2261, 2260, 'Soltero(a)', 1, 'SOL', 1),
(2262, 2260, 'Casado(a)', 2, 'CAS', 1),
(2263, 2260, 'Unión Libre', 3, 'UNL', 1),
(2264, 2260, 'Divorciado(a)', 4, 'DIV', 1),
(2265, 2260, 'Viudo(a)', 5, 'VIU', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Capacitacion y Opciones Si-No (id_padre = 2199)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(2199, NULL, 'CAPACITACION Y OPCIONES', 3, 'CAP', 1),
(2200, 2199, 'Sí', 1, 'SI', 1),
(2201, 2199, 'No', 2, 'NO', 1),
(2202, 2199, 'Curso Corto / Taller', 3, 'CCOR', 1),
(2203, 2199, 'Diplomado', 4, 'DIP', 1),
(2204, 2199, 'Certificación de Competencias Laborales', 5, 'CERT', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Niveles de Educacion (id_padre = 4504)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(4504, NULL, 'NIVEL EDUCATIVO', 4, 'EDU', 1),
(4505, 4504, 'Básica Primaria', 1, 'PRI', 1),
(4506, 4504, 'Bachillerato / Secundaria', 2, 'SEC', 1),
(4507, 4504, 'Técnico Laboral', 3, 'TEC', 1),
(4508, 4504, 'Tecnólogo', 4, 'TECN', 1),
(4509, 4504, 'Profesional Universitario', 5, 'UNIV', 1),
(4510, 4504, 'Especialización / Posgrado', 6, 'POS', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Tipos de Referencia (id_padre = 2219)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(2219, NULL, 'TIPO DE REFERENCIA', 5, 'REF', 1),
(2220, 2219, 'Laboral', 1, 'LAB', 1),
(2221, 2219, 'Personal', 2, 'PER', 1),
(2222, 2219, 'Familiar', 3, 'FAM', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Tipos de Contrato (id_padre = 3087)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(3087, NULL, 'TIPO DE CONTRATO', 6, 'CONTR', 1),
(3088, 3087, 'Término Fijo', 1, 'FIJO', 1),
(3089, 3087, 'Término Indefinido', 2, 'INDEF', 1),
(3090, 3087, 'Obra o Labor', 3, 'OBRA', 1),
(3091, 3087, 'Prestación de Servicios', 4, 'SERV', 1),
(3092, 3087, 'Contrato de Aprendizaje', 5, 'APREN', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Rangos Salariales (id_padre = 4788)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(4788, NULL, 'RANGO SALARIAL', 7, 'SAL', 1),
(4789, 4788, 'Menos de 1 SMMLV', 1, 'S1', 1),
(4790, 4788, '1 a 2 SMMLV', 2, 'S2', 1),
(4791, 4788, '2 a 4 SMMLV', 3, 'S3', 1),
(4792, 4788, '4 a 6 SMMLV', 4, 'S4', 1),
(4793, 4788, 'Más de 6 SMMLV', 5, 'S5', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Areas de Trabajo / Vacantes (id_padre = 2234)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(2234, NULL, 'AREA DE TRABAJO', 8, 'AREA', 1),
(2235, 2234, 'Administración y Operaciones de Oficina', 1, 'ADM', 1),
(2236, 2234, 'Construcción y Obras Civiles', 2, 'CONS', 1),
(2237, 2234, 'Mantenimiento e Instalaciones Eléctricas / Sanitarias', 3, 'MANT', 1),
(2238, 2234, 'Logística, Bodega y Despacho', 4, 'LOG', 1),
(2239, 2234, 'Servicios Generales, Limpieza y Mantenimiento Físico', 5, 'SG', 1),
(2240, 2234, 'Ventas, Comercial y Atención al Cliente', 6, 'COM', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Sectores Economicos CIIU (id_padre = 3884)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(3884, NULL, 'SECTOR ECONOMICO', 9, 'CIIU', 1),
(3885, 3884, 'Construcción de Edificaciones y Obras', 1, 'F4100', 1),
(3886, 3884, 'Cuidado Inmobiliario y Administración de Propiedad', 2, 'L6810', 1),
(3887, 3884, 'Comercio al por Mayor y al por Menor', 3, 'G4600', 1),
(3888, 3884, 'Servicios Administrativos y de Apoyo', 4, 'N8110', 1),
(3889, 3884, 'Industrias Manufactureras', 5, 'C1000', 1),
(3890, 3884, 'Información y Comunicaciones', 6, 'J6201', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- Ubicaciones Geograficas (DEPARTAMENTO id=100)
INSERT INTO `codigos` (`id`, `id_padre`, `descripcion`, `orden`, `codigo_oficial`, `estado`) VALUES
(100, NULL, 'DEPARTAMENTO', 10, 'DEP', 1),
-- Departamentos (id_padre=100)
(110, 100, 'BOGOTA D.C.', 1, '11', 1),
(111, 100, 'ANTIOQUIA', 2, '05', 1),
(112, 100, 'VALLE DEL CAUCA', 3, '76', 1),
(113, 100, 'CUNDINAMARCA', 4, '25', 1),
(114, 100, 'ATLANTICO', 5, '08', 1),
(115, 100, 'SANTANDER', 6, '68', 1),
(116, 100, 'BOLIVAR', 7, '13', 1),
-- Municipios (id_padre=depto)
(1101, 110, 'BOGOTA, D.C.', 1, '11001', 1),
(1111, 111, 'MEDELLIN', 1, '05001', 1),
(1112, 111, 'ENVIGADO', 2, '05266', 1),
(1113, 111, 'BELLO', 3, '05088', 1),
(1121, 112, 'CALI', 1, '76001', 1),
(1122, 112, 'PALMIRA', 2, '76520', 1),
(1131, 113, 'SOACHA', 1, '25754', 1),
(1132, 113, 'CHIA', 2, '25175', 1),
(1141, 114, 'BARRANQUILLA', 1, '08001', 1),
(1151, 115, 'BUCARAMANGA', 1, '68001', 1),
(1161, 116, 'CARTAGENA', 1, '13001', 1)
ON DUPLICATE KEY UPDATE `descripcion` = VALUES(`descripcion`);

-- 3. Usuarios Demo (password: admin123)
-- Hash: $2y$10$w8VIklR.UjGinLMo0oWwXOeopk6SAjm0fsY3qpeatVgns4Wx5UQDW
INSERT INTO `usuarios` (`id`, `tipo_doc`, `username`, `password`, `email`, `confirmcode`, `estado`, `tipo_usuario`, `tratamiento_datos`, `fecha_registro`) VALUES
(1, 2, 'empresa', '$2y$10$w8VIklR.UjGinLMo0oWwXOeopk6SAjm0fsY3qpeatVgns4Wx5UQDW', 'empresa@fempower.local', 'ACTIVO', 1, 1, 1, NOW()),
(2, 1, 'candidata', '$2y$10$w8VIklR.UjGinLMo0oWwXOeopk6SAjm0fsY3qpeatVgns4Wx5UQDW', 'candidata@fempower.local', 'ACTIVO', 1, 3, 1, NOW()),
(3, 1, 'admin', '$2y$10$w8VIklR.UjGinLMo0oWwXOeopk6SAjm0fsY3qpeatVgns4Wx5UQDW', 'admin@fempower.local', 'ACTIVO', 1, 2, 1, NOW())
ON DUPLICATE KEY UPDATE `username` = VALUES(`username`);

-- 4. Perfil Empresa (Demandante)
INSERT INTO `demandantes_bi` (`id`, `idUsuario`, `razon_social`, `nit`, `representante_legal`, `ciiu`, `telefono`, `celular`, `direccion`, `municipioCodigo`, `url_web`, `check`, `checkDate`, `checkBy`) VALUES
(1, 1, 'Construcciones y Soluciones Inmobiliarias SAS', 900123456, 'Carlos Mendoza Silva', 3885, '6012345', '3101234567', 'Carrera 7 # 72-10 Oficina 501', 1101, 'https://construcciones-demo.com', 1, NOW(), 'Sistema')
ON DUPLICATE KEY UPDATE `razon_social` = VALUES(`razon_social`);

-- 5. Vacantes Publicadas
INSERT INTO `demandantes_vacantes` (`id`, `idDemandante`, `nombreCargo`, `descripcion`, `salario`, `tipoContratoCodigo`, `mpioUbicacionCodigo`, `numeroVacantes`, `funciones`, `experienciaRequerida`, `fechaPublicacion`, `fechaCierre`, `idArchivo`) VALUES
(1, 1, 'Supervisora de Obra y Acabados Arquitectonicos', 'Supervision y control de calidad en acabados de edificaciones residenciales.', 4791, 3089, 1101, 2, 'Control de calidad, revision de protocolos tecnicos y coordinacion de cuadrillas.', 'Minimo 2 anos en obras civiles.', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 60 DAY), NULL),
(2, 1, 'Auxiliar de Mantenimiento y Cuadrilla Inmobiliaria', 'Mantenimiento locativo y adecuaciones fisicas de instalaciones corporativas.', 4790, 3090, 1101, 3, 'Reparaciones menores, pintura arquitectonica y apoyo en adecuaciones.', 'Minimo 1 ano en mantenimiento o servicios generales.', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 60 DAY), NULL)
ON DUPLICATE KEY UPDATE `nombreCargo` = VALUES(`nombreCargo`);

-- 6. Perfil Candidata (Oferente)
INSERT INTO `oferentes_bi` (`id`, `idUsuario`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `fechaNacimiento`, `telefono1`, `telefono2`, `municipioNacimientoCodigo`, `generoCodigo`, `sexoCodigo`, `direccion`, `municipioViviendaCodigo`, `estadoCivilCodigo`, `extranjeroCodigo`, `paisCodigo`, `discapacidad`) VALUES
(1, 2, 'Laura', 'Camila', 'Torres', 'Gomez', '1995-08-14', '3157891234', '6015555', 1101, 1, 1, 'Calle 53 # 14-25 Apto 302', 1101, 2261, 2201, 1, 0)
ON DUPLICATE KEY UPDATE `nombre1` = VALUES(`nombre1`);

-- 7. Educacion de la Candidata
INSERT INTO `oferentes_educacion` (`id`, `idOferente`, `capacitacionTrabajo`, `formal`, `titulo`, `institucion`, `presencialVirtual`, `anoFinalizacion`, `mesFinalizacion`, `termino`, `mesesEstudio`, `idArchivo`) VALUES
(1, 1, 2200, 2200, 'Tecnologa en Construccion y Gestion de Obras', 'SENA Centro de Tecnologias de la Construccion', 'P', 2018, 12, 2200, 24, NULL)
ON DUPLICATE KEY UPDATE `titulo` = VALUES(`titulo`);

-- 8. Experiencia Laboral de la Candidata
INSERT INTO `oferentes_experiencia` (`id`, `idOferente`, `empresa`, `telefono`, `municipio`, `pasantia`, `fechaIngreso`, `empleoActual`, `fechaSalida`, `ocupacion`, `cargo`, `logros`, `idArchivo`) VALUES
(1, 1, 'Constructora Bolivar', '6013334444', 1101, 2201, '2019-02-01', 2201, '2023-11-30', NULL, 'Auxiliar de Control de Obra', 'Supervision tecnica de acabados, entrega a satisfaccion de 84 apartamentos.', NULL)
ON DUPLICATE KEY UPDATE `empresa` = VALUES(`empresa`);

-- 9. Referencias de la Candidata
INSERT INTO `oferentes_referencias` (`id`, `idOferente`, `nombre`, `tipoReferencia`, `telefono`, `celular`, `direccion`, `ocupacion`, `idArchivo`) VALUES
(1, 1, 'Ing. Andres Felipe Morales', 2220, '6013334444', '3119876543', 'Calle 100 # 15-20', 'Director de Proyecto en Constructora Bolivar', NULL)
ON DUPLICATE KEY UPDATE `nombre` = VALUES(`nombre`);

SET FOREIGN_KEY_CHECKS = 1;
