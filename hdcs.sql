-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2021 a las 22:49:24
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hdcs`
--
CREATE DATABASE IF NOT EXISTS `hdcs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hdcs`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_actualizarAsignacionEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarAsignacionEquipo` (IN `_idAsignacion` INT, IN `_fechaAsignacion` DATE, IN `_codEquipo` VARCHAR(9), IN `_observacion` VARCHAR(50), IN `_fechaBaja` DATE, IN `_estado` TINYINT, IN `_idUsuario` INT)  BEGIN

	UPDATE asignacionequipo
    SET 	fechaAsignacion = _fechaAsignacion, 
            codEquipo = _codEquipo,
            observacion = _observacion,
            fechaBaja = _fechaBaja,
            estado = _estado,
            idUsuario = _idUsuario
     WHERE idAsignacionEquipo = _idAsignacion;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarBitacoraMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarBitacoraMantenimiento` (IN `_idBitacora` INT, IN `_fechaCambioEstado` DATE, IN `_idSolMant` INT, IN `_idEstadoCMant` INT)  BEGIN
	UPDATE bitacoramantenimiento
    SET 	fechaCambioEstado = _fechaCambioEstado, 
	idSolicitudMantenimiento = _idSolMant,
	idEstadoControlMantenimiento = _idEstadoCMant
     WHERE idBitacora = _idBitacora;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarCapacidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarCapacidad` (IN `_idCapacidad` INT, IN `_capacidad` VARCHAR(20))  BEGIN
	UPDATE capacidad
    SET capacidad = _capacidad
     WHERE idCapacidad = _idCapacidad;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarCargo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarCargo` (IN `_cargo` VARCHAR(30), IN `_idDepartamento` INT, IN `_idCargo` INT)  BEGIN
	UPDATE cargo
    SET cargo = _cargo,
    	idDepartamento = _idDepartamento
     WHERE idCargo = _idCargo;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarControlGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarControlGarantia` (IN `_idControlGarantia` INT, IN `_codEquipo` VARCHAR(9), IN `_fechaInicio` DATE, IN `_fechaVencimiento` DATE, IN `_estado` TINYINT, IN `_idEmpresa` INT, IN `_telefonoContacto` VARCHAR(9), IN `_correo` VARCHAR(40), IN `_idUsuario` INT)  BEGIN
	UPDATE controlgarantia
    SET 	codEquipo = _codEquipo, 
            fechaInicio = _fechaInicio,
            fechaVencimiento = _fechaVencimiento,
            estado = _estado,
            idEmpresa = _idEmpresa,
            telefonoContacto = _telefonoContacto,
            correoElectronico = _correo,
            idUsuario = _idUsuario
     WHERE idControlGarantia = _idControlGarantia;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarControlMantenimiento` (IN `_idControlMant` INT, IN `_fechaControlMant` DATE, IN `_usuario` INT(11), IN `_tipoMant` INT, IN `_idSolMant` INT, IN `_observacion` VARCHAR(100), IN `_estadoControlMant` INT)  BEGIN
	UPDATE controlmantenimiento
    SET 	fechaControlMantenimiento = _fechaControlMant, 
	idUsuario = _usuario,
	idTipoMantenimiento = _tipoMant,
	idSolicitudMantenimiento = _idSolMant,
	observacion = _observacion,
	idEstadoControlMantenimiento = _estadoControlMant
     WHERE idControlMantenimiento = _idControlMant;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarDepartamento` (IN `_idDepartamento` INT, IN `_departamento` VARCHAR(40))  BEGIN
	UPDATE departamento
    SET departamento = _departamento
     WHERE idDepartamento = _idDepartamento;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarDetalleEquipoC`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarDetalleEquipoC` (IN `_codEquipo` VARCHAR(9), IN `_idTipoRam` INT, IN `_idCapacidadRam` INT, IN `_idVelocidadRam` INT, IN `_idTipoDisco` INT, IN `_idCapacidadDisco` INT)  BEGIN
	UPDATE detequipocomputadora
    SET 	idTipoRam = _idTipoRam,
	idCapacidad = _idCapacidadRam,
	idVelocidadRam = _idVelocidadRam,
	idTipoDisco = _idTipoDisco,
	idCapacidadDisco = _idCapacidadDisco
     WHERE CodEquipo = _codEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEmpleado` (IN `_codEmpleado` INT(10), IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_telefono` VARCHAR(9), IN `_celular` VARCHAR(9), IN `_extension` VARCHAR(9), IN `_idSexo` INT, IN `_idCargo` INT, IN `_eMail` VARCHAR(40), IN `_estado` TINYINT)  BEGIN
	UPDATE empleado
    SET 	nombres = _nombres, 
	apellidos = _apellidos,
	telefono = _telefono,
	celular = _celular,
	extension = _extension,
	idSexo = _idSexo,
	idCargo = _idCargo,
	correoElectronico = _eMail,
	estado = _estado
     WHERE codEmpleado = _codEmpleado;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarEmpresaGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEmpresaGarantia` (IN `_idEmpresa` INT, IN `_nombreEmpresa` VARCHAR(50))  BEGIN
	UPDATE empresagarantia
    SET nombreEmpresa = _nombreEmpresa
     WHERE idEmpresa = _idEmpresa;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEquipo` (IN `_codEquipo` VARCHAR(9), IN `_numInventario` VARCHAR(8), IN `_idTipoEquipo` INT, IN `_idModelo` INT, IN `_serie` VARCHAR(20), IN `_serviceTag` VARCHAR(30), IN `_descripcionEquipo` VARCHAR(50))  BEGIN
	UPDATE equipo  SET  numInventario = _numInventario,
    		idTipoEquipo = _idTipoEquipo,
          idModelo = _idModelo,
          serie = _serie,
          serviceTag= _serviceTag,
         descripcionEquipo= _descripcionEquipo
                 WHERE codEquipo = _codEquipo ;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarEstadoControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEstadoControlMantenimiento` (IN `_id` INT, IN `_estadoControlMantenimiento` VARCHAR(50))  BEGIN
	UPDATE estadoControlMantenimiento
    SET estadoControlMantenimiento = _estadoControlMantenimiento
     WHERE idEstadoControlMantenimiento = _id;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarMarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarMarca` (IN `_idMarca` INT, IN `_marca` VARCHAR(20))  BEGIN
	UPDATE marca
    SET marca = _marca
     WHERE idMarca = _idMarca;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarModelo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarModelo` (IN `_modelo` VARCHAR(20), IN `_idMarca` INT, IN `_idModelo` INT)  BEGIN
	UPDATE modelo  SET modelo = _modelo, idMarca = _idMarca
                 WHERE idModelo = _idModelo;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarSolicitudM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarSolicitudM` (IN `_fechaSM` DATE, IN `_codEquipo` VARCHAR(9), IN `_preDiagnostico` VARCHAR(100), IN `_idSM` INT)  BEGIN
	UPDATE solicitudmantenimiento
    SET fechaSolicitudMantenimiento = _fechaSM,
    	codEquipo = _codEquipo, 
	preDiagnostico = _preDiagnostico
     WHERE idSolicitudMantenimiento = _idSM;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarTipoDisco`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoDisco` (IN `_idTipoDisco` INT, IN `_TipoDisco` VARCHAR(10))  BEGIN
	UPDATE tipoDisco
    SET tipoDisco = _TipoDisco
     WHERE idTipoDisco = _idTipoDisco;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarTipoEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoEquipo` (IN `_idTipoEquipo` INT, IN `_TipoEquipo` VARCHAR(30))  BEGIN
	UPDATE tipoEquipo
    SET tipoEquipo = _TipoEquipo
     WHERE idTipoEquipo = _idTipoEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarTipoMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoMantenimiento` (IN `_idTipoMantenimiento` INT, IN `_TipoMantenimiento` VARCHAR(10))  BEGIN
	UPDATE tipoMantenimiento
    SET tipoMantenimiento = _TipoMantenimiento
     WHERE idTipoMantenimiento = _idTipoMantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarTipoRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoRam` (IN `_idTipoRam` INT, IN `_tipoRam` VARCHAR(20))  BEGIN
	UPDATE tipoRam
    SET tipoRam = _tipoRam
     WHERE idTipoRam = _idTipoRam;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarUsuario` (IN `_idUsuario` INT, IN `_userName` VARCHAR(20), IN `_password` VARCHAR(20), IN `_fechaB` DATE, IN `_estado` TINYINT)  BEGIN
	UPDATE usuario  SET userName = _userName,
          password = _password,
          fechaBaja= _fechaB,
         estado= _estado 
                 WHERE idUsuario = _idUsuario;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizarVelocidadRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarVelocidadRam` (IN `_idVelocidadRam` INT, IN `_velocidadRam` VARCHAR(20))  BEGIN
	UPDATE velocidadram
    SET velocidadRam = _velocidadRam
     WHERE idVelocidadRam = _idVelocidadRam;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarAsignacionEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarAsignacionEquipo` (IN `_idAsignacionEquipo` INT)  BEGIN
	DELETE FROM asignacionequipo WHERE idAsignacionEquipo = _idAsignacionEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarBitacoraMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarBitacoraMantenimiento` (IN `_idBitacoraMant` INT)  BEGIN
	DELETE FROM bitacoramantenimiento WHERE idBitacora = _idBitacoraMant;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarCapacidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarCapacidad` (IN `_idCapacidad` INT)  BEGIN
	DELETE FROM capacidad WHERE idCapacidad = _idCapacidad;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarCargo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarCargo` (IN `_idCargo` INT)  BEGIN
	DELETE FROM cargo WHERE idCargo=_idCargo;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarControlGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarControlGarantia` (IN `_idControlGarantia` INT)  BEGIN
	DELETE FROM controlgarantia WHERE idControlGarantia = _idControlGarantia;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarControlMantenimiento` (IN `_idControlMant` INT)  BEGIN
	DELETE FROM controlmantenimiento WHERE idControlMantenimiento = _idControlMant;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarDepartamento` (IN `_idDepartamento` INT)  BEGIN
	DELETE FROM departamento WHERE idDepartamento = _idDepartamento;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarDetalleEquipoC`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarDetalleEquipoC` (IN `_codEquipo` VARCHAR(9))  BEGIN
	DELETE FROM detequipocomputadora WHERE codEquipo = _codEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEmpleado` (IN `_codEmpleado` INT(10))  BEGIN
	DELETE FROM empleado WHERE codEmpleado = _codEmpleado;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarEmpresaGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEmpresaGarantia` (IN `_idEmpresa` INT)  BEGIN
	DELETE FROM empresagarantia 
	WHERE idEmpresa = _idEmpresa;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEquipo` (IN `_codEquipo` INT)  BEGIN
	DELETE FROM equipo WHERE codEquipo=_codEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarEstadoControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEstadoControlMantenimiento` (IN `_id` INT)  BEGIN
	DELETE FROM estadoControlMantenimiento WHERE idEstadoControlMantenimiento = _id;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarMarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarMarca` (IN `_idMarca` INT)  BEGIN
	DELETE FROM marca WHERE idMarca = _idMarca;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarModelo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarModelo` (IN `_idModelo` INT)  BEGIN
	DELETE FROM modelo WHERE idModelo=_idModelo;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarSolicitudM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarSolicitudM` (IN `_idSolicitud` INT)  BEGIN
	DELETE FROM solicitudmantenimiento WHERE idSolicitudMantenimiento = _idSolicitud;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarTipoDisco`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoDisco` (IN `_idTipoDisco` INT)  BEGIN
	DELETE FROM tipoDisco WHERE idTipoDisco = _idTipoDisco;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarTipoEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoEquipo` (IN `_idTipoEquipo` INT)  BEGIN
	DELETE FROM tipoEquipo WHERE idTipoEquipo = _idTipoEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarTipoMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoMantenimiento` (IN `_idTipoMantenimiento` INT)  BEGIN
	DELETE FROM tipoMantenimiento WHERE idTipoMantenimiento = _idTipoMantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarTipoRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoRam` (IN `_idTipoRam` INT)  BEGIN
	DELETE FROM tiporam WHERE idTipoRam = _idTipoRam;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarUsuario` (IN `_idUsuario` INT)  BEGIN
	DELETE FROM usuario WHERE idUsuario=_idUsuario;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminarVelocidadRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarVelocidadRam` (IN `_idVelocidadRam` INT)  BEGIN
	DELETE FROM velocidadram WHERE idVelocidadRam = _idVelocidadRam;
END$$

DROP PROCEDURE IF EXISTS `sp_existeCapacidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCapacidad` (IN `_capacidad` VARCHAR(20))  BEGIN
    SELECT count(*) from capacidad 
    WHERE capacidad = _capacidad;
END$$

DROP PROCEDURE IF EXISTS `sp_existeCargo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCargo` (IN `_cargo` VARCHAR(30))  BEGIN
    SELECT count(*) from cargo 
    WHERE cargo = _cargo;
END$$

DROP PROCEDURE IF EXISTS `sp_existeCodEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCodEquipo` (IN `_codigo` VARCHAR(9))  BEGIN
    SELECT count(*) 
    from asignacionequipo 
    WHERE codEquipo = _codigo;
END$$

DROP PROCEDURE IF EXISTS `sp_existeCodigoEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCodigoEquipo` (IN `_codigo` VARCHAR(20))  BEGIN
    SELECT count(*) from equipo 
    WHERE codEquipo = _codigo;
END$$

DROP PROCEDURE IF EXISTS `sp_existeControlGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeControlGarantia` (IN `_codEquipo` VARCHAR(9))  BEGIN
    SELECT count(*) 
    from controlgarantia 
    WHERE codEquipo = _codEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_existeDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeDepartamento` (IN `_departamento` VARCHAR(40))  BEGIN
    SELECT count(*) from departamento 
    WHERE departamento = _departamento;
END$$

DROP PROCEDURE IF EXISTS `sp_existeDetCodigoEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeDetCodigoEquipo` (IN `_codigo` VARCHAR(9))  BEGIN
    SELECT count(*) from detequipocomputadora 
    WHERE codEquipo = _codigo;
END$$

DROP PROCEDURE IF EXISTS `sp_existeEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEmpleado` (IN `_codEmpleado` INT(10))  BEGIN
    SELECT count(*) from empleado 
    WHERE codEmpleado = _codEmpleado;
END$$

DROP PROCEDURE IF EXISTS `sp_existeEmpleadoUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEmpleadoUsuario` (IN `_codEmpleado` INT(10))  BEGIN
    SELECT count(*) from usuario 
    WHERE codEmpleado = _codEmpleado;
END$$

DROP PROCEDURE IF EXISTS `sp_existeEmpresaGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEmpresaGarantia` (IN `_nombreEmpresa` VARCHAR(50))  BEGIN
    SELECT count(*) from empresagarantia 
    WHERE nombreEmpresa = _nombreEmpresa;
END$$

DROP PROCEDURE IF EXISTS `sp_existeEstadoControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEstadoControlMantenimiento` (IN `_estadoControlMantenimiento` VARCHAR(50))  BEGIN
    SELECT count(*) from estadocontrolmantenimiento 
    WHERE estadoControlMantenimiento = _estadoControlMantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_existeIdSolMant`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeIdSolMant` (IN `_idSolMant` INT)  BEGIN
    SELECT count(*) 
    from controlmantenimiento 
    WHERE idSolicitudMantenimiento = _idSolMant;
END$$

DROP PROCEDURE IF EXISTS `sp_existeMarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeMarca` (IN `_marca` VARCHAR(20))  BEGIN
    SELECT count(*) from marca 
    WHERE marca = _marca;
END$$

DROP PROCEDURE IF EXISTS `sp_existeModelo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeModelo` (IN `_modelo` VARCHAR(20))  BEGIN
    SELECT count(*) from modelo 
    WHERE modelo = _modelo;
END$$

DROP PROCEDURE IF EXISTS `sp_existeSerie`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeSerie` (IN `_serie` VARCHAR(20))  BEGIN
    SELECT count(*) from equipo 
    WHERE serie = _serie;
END$$

DROP PROCEDURE IF EXISTS `sp_existeServiceTag`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeServiceTag` (IN `_serviceTag` VARCHAR(30))  BEGIN
    SELECT count(*) from equipo 
    WHERE serviceTag = _serviceTag;
END$$

DROP PROCEDURE IF EXISTS `sp_existeTipoDisco`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoDisco` (IN `_tipoDisco` VARCHAR(10))  BEGIN
    SELECT count(*) from tipodisco 
    WHERE tipoDisco = _tipoDisco;
END$$

DROP PROCEDURE IF EXISTS `sp_existeTipoEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoEquipo` (IN `_tipoEquipo` VARCHAR(30))  BEGIN
    SELECT count(*) from tipoequipo 
    WHERE tipoEquipo = _tipoEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_existeTipoMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoMantenimiento` (IN `_tipoMantenimiento` VARCHAR(10))  BEGIN
    SELECT count(*) from tipomantenimiento 
    WHERE tipoMantenimiento = _tipoMantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_existeTipoRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoRam` (IN `_tipoRam` VARCHAR(20))  BEGIN
    SELECT count(*) from tiporam 
    WHERE tipoRam = _tipoRam;
END$$

DROP PROCEDURE IF EXISTS `sp_existeUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeUsuario` (IN `_userName` VARCHAR(20))  BEGIN
    SELECT count(*) as cantidad from usuario 
    WHERE userName = _userName;
END$$

DROP PROCEDURE IF EXISTS `sp_existeVelocidadRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeVelocidadRam` (IN `_velocidadRam` VARCHAR(20))  BEGIN
    SELECT count(*) from velocidadram 
    WHERE velocidadRam = _velocidadRam;
END$$

DROP PROCEDURE IF EXISTS `sp_insertarAsignacionEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarAsignacionEquipo` (IN `_fechaAsignacion` DATE, IN `_codEquipo` VARCHAR(9), IN `_observacion` VARCHAR(50), IN `_fechaBaja` DATE, IN `_idUsuario` INT)  BEGIN
	INSERT INTO asignacionequipo (fechaAsignacion, codEquipo, observacion, fechaBaja, idUsuario) 
    	VALUES(_fechaAsignacion, _codEquipo, _observacion, _fechaBaja, _idUsuario);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarBitacoraMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarBitacoraMantenimiento` (IN `_fechaCambioEstado` DATE, IN `_solicitudMant` INT, IN `_estadoControlMant` INT)  BEGIN
	INSERT INTO bitacoramantenimiento (fechaCambioEstado, idSolicitudMantenimiento, idEstadoControlMantenimiento) VALUES( _fechaCambioEstado, _solicitudMant,  _estadoControlMant);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarCapacidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarCapacidad` (IN `_capacidad` VARCHAR(20))  BEGIN
	INSERT INTO capacidad (capacidad) VALUES(_capacidad);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarCargo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarCargo` (IN `cargo` VARCHAR(30), IN `idDepartamento` INT)  BEGIN
	INSERT INTO cargo (cargo, idDepartamento ) VALUES(cargo, idDepartamento );
END$$

DROP PROCEDURE IF EXISTS `sp_insertarControlGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarControlGarantia` (IN `_codEquipo` VARCHAR(9), IN `_fechaInicio` DATE, IN `_fechaVencimiento` DATE, IN `_idEmpresa` INT, IN `_telefono` VARCHAR(9), IN `_correo` VARCHAR(40), IN `_idUsuario` INT)  BEGIN
	INSERT INTO controlgarantia (codEquipo, fechaInicio, fechaVencimiento, idEmpresa, telefonoContacto, correoElectronico, idUsuario) 
    	VALUES(_codEquipo, _fechaInicio,  _fechaVencimiento, _idEmpresa, _telefono, _correo, _idUsuario);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarControlMantenimiento` (IN `_fechaControlMant` DATE, IN `_usuario` INT(11), IN `_tipoMant` INT, IN `_idSolMant` INT, IN `_observacion` VARCHAR(100), IN `_idEstadoControlMant` INT)  BEGIN
	INSERT INTO controlmantenimiento (fechaControlMantenimiento, idUsuario, idTipoMantenimiento, idSolicitudMantenimiento, observacion, idEstadoControlMantenimiento) 
    	VALUES( _fechaControlMant, _usuario,  _tipoMant, _idSolMant, _observacion, _idEstadoControlMant);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarDepartamento` (IN `_departamento` VARCHAR(40))  BEGIN
	INSERT INTO departamento (departamento) VALUES(_departamento);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarDetalleEquipoC`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarDetalleEquipoC` (IN `_codEquipo` VARCHAR(9), IN `_idTipoRam` INT, IN `_idCapacidadRam` INT, IN `_idVelocidadRam` INT, IN `_idTipoDisco` INT, IN `_idCapacidadDisco` INT)  BEGIN
	INSERT INTO detequipocomputadora (codEquipo, idTipoRam, idCapacidad, idVelocidadRam, idTipoDisco, idCapacidadDisco)  VALUES( _codEquipo,  _idTipoRam,  _idCapacidadRam, _idVelocidadRam, _idTipoDisco, _idCapacidadDisco);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEmpleado` (IN `_codEmpleado` INT(10), IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_telefono` VARCHAR(9), IN `_celular` VARCHAR(9), IN `_extension` VARCHAR(9), IN `_select_Sexo` INT, IN `_select_Cargo` INT, IN `_eMail` VARCHAR(40))  BEGIN
	INSERT INTO empleado (codEmpleado, nombres, apellidos, telefono, celular, extension,  idSexo, idCargo, correoElectronico) VALUES(_codEmpleado, _nombres, _apellidos, _telefono, _celular, _extension,  _select_Sexo, _select_Cargo, _eMail);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarEmpresaGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEmpresaGarantia` (IN `_nombreEmpresa` VARCHAR(50))  BEGIN
	INSERT INTO empresagarantia (nombreEmpresa) VALUES(_nombreEmpresa);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEquipo` (IN `_codEquipo` VARCHAR(9), IN `_numInventario` VARCHAR(8), IN `_idTipoEquipo` INT, IN `_idModelo` INT, IN `_serie` VARCHAR(20), IN `_serviceTag` VARCHAR(30), IN `_descripcionEquipo` VARCHAR(50))  BEGIN
         INSERT INTO equipo (codEquipo, numInventario, idTipoEquipo, idModelo, serie, serviceTag, descripcionEquipo) VALUES(_codEquipo, _numInventario,  _idTipoEquipo, _idModelo, _serie, _serviceTag, _descripcionEquipo);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarEstadoControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEstadoControlMantenimiento` (IN `_estadoControlMantenimiento` VARCHAR(50))  BEGIN
	INSERT INTO estadoControlMantenimiento (estadoControlMantenimiento) VALUES(_estadoControlMantenimiento);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarMarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarMarca` (IN `_marca` VARCHAR(20))  BEGIN
	INSERT INTO marca (marca) VALUES(_marca);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarModelo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarModelo` (IN `_modelo` VARCHAR(20), IN `_idMarca` INT)  BEGIN
	INSERT INTO modelo (modelo, idMarca ) VALUES(_modelo, _idMarca);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarSolicitudM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarSolicitudM` (IN `_fechaSolicitudMantenimiento` DATE, IN `_codEquipo` VARCHAR(9), IN `_preDiagnostico` VARCHAR(100), IN `_idUsuario` INT)  BEGIN
	INSERT INTO solicitudmantenimiento (fechaSolicitudMantenimiento, codEquipo, preDiagnostico, idUsuario ) VALUES(_fechaSolicitudMantenimiento, _codEquipo, _preDiagnostico, _idUsuario );
END$$

DROP PROCEDURE IF EXISTS `sp_insertarTipoDisco`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoDisco` (IN `_tipoDisco` VARCHAR(10))  BEGIN
	INSERT INTO tipoDisco (tipoDisco) VALUES(_tipoDisco);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarTipoEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoEquipo` (IN `_tipoEquipo` VARCHAR(30))  BEGIN
	INSERT INTO tipoEquipo (tipoEquipo) VALUES(_tipoEquipo);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarTipoMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoMantenimiento` (IN `_tipoMantenimiento` VARCHAR(10))  BEGIN
	INSERT INTO tipoMantenimiento (tipoMantenimiento) VALUES(_tipoMantenimiento);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarTipoRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoRam` (IN `_tipoRam` VARCHAR(20))  BEGIN
	INSERT INTO tipoRam (tipoRam) VALUES(_tipoRam);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarUsuario` (IN `_codEmpleado` INT(10), IN `_fechaC` DATETIME, IN `_userName` VARCHAR(20), IN `_password` VARCHAR(20), IN `_fechaB` DATETIME)  BEGIN
         INSERT INTO usuario (codEmpleado, fechaCreacion, userName, password, fechaBaja) VALUES(_codEmpleado, _fechaC, _userName, _password, _fechaB);
END$$

DROP PROCEDURE IF EXISTS `sp_insertarVelocidadRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarVelocidadRam` (IN `_velocidadRam` VARCHAR(20))  BEGIN
	INSERT INTO velocidadram (velocidadRam) VALUES(_velocidadRam);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarAsignacionEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarAsignacionEquipo` ()  BEGIN
	SELECT asignacionequipo.idAsignacionEquipo, equipo.codEquipo, equipo.descripcionEquipo, tipoequipo.tipoEquipo, modelo.modelo, equipo.serviceTag,
    	asignacionequipo.fechaAsignacion, asignacionequipo.fechaBaja, asignacionequipo.observacion, CASE asignacionequipo.estado WHEN 0 THEN 'INACTIVO'    
WHEN 1 THEN 'ACTIVO' 
END AS estado, concat(empleado.nombres, ' ', empleado.apellidos) as empleado
FROM asignacionequipo  INNER JOIN equipo 
						   ON asignacionequipo.codEquipo = equipo.codEquipo
                      INNER JOIN tipoequipo
                      	   ON equipo.idTipoEquipo = tipoequipo.idTipoEquipo
                      INNER JOIN modelo
                      	   ON equipo.idModelo = modelo.idModelo
                      INNER JOIN usuario
                      	   ON asignacionequipo.idUsuario = usuario.idUsuario
                      INNER JOIN empleado
                      	   ON usuario.codEmpleado = empleado.codEmpleado;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarAudiLog`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarAudiLog` ()  BEGIN
	SELECT audilog.idAudiLog, audiLog.fechaEvento, usuario.userName, tipotransaccion.tipoTransaccion, audiLog.descripcion FROM audilog INNER JOIN usuario  USING (idUsuario) INNER JOIN tipotransaccion USING(idTipoTransaccion);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarBitacoraMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarBitacoraMantenimiento` ()  BEGIN
	SELECT bitacoramantenimiento.idBitacora, bitacoramantenimiento.fechaCambioEstado, solicitudmantenimiento.fechaSolicitudMantenimiento, estadocontrolmantenimiento.estadoControlMantenimiento FROM bitacoramantenimiento INNER JOIN estadocontrolmantenimiento  USING (idEstadoControlMantenimiento) INNER JOIN solicitudmantenimiento USING (idSolicitudMantenimiento);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarCapacidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarCapacidad` ()  BEGIN
	SELECT * FROM capacidad;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarCargo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarCargo` ()  BEGIN
	SELECT cargo.idCargo, cargo.cargo, departamento.departamento FROM cargo  INNER JOIN departamento  USING (idDepartamento);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarControlGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarControlGarantia` ()  BEGIN
	SELECT controlgarantia.idControlGarantia, equipo.codEquipo, equipo.descripcionEquipo, tipoequipo.tipoEquipo, modelo.modelo, equipo.serviceTag,
    		controlgarantia.fechaInicio, controlgarantia.fechaVencimiento, CASE controlgarantia.estado WHEN 0 THEN 'INACTIVO'    
WHEN 1 THEN 'ACTIVO' 
END AS estado, 
            empresagarantia.idEmpresa, empresagarantia.nombreEmpresa, controlgarantia.telefonoContacto, controlgarantia.correoElectronico, usuario.userName
FROM controlgarantia  INNER JOIN equipo 
						   ON controlgarantia.codEquipo = equipo.codEquipo
                      INNER JOIN tipoequipo
                      	   ON equipo.idTipoEquipo = tipoequipo.idTipoEquipo
                      INNER JOIN modelo
                      	   ON equipo.idModelo = modelo.idModelo
                      INNER JOIN empresagarantia
                      	   ON controlgarantia.idEmpresa = empresagarantia.idEmpresa
                      INNER JOIN usuario
                      	   ON controlgarantia.idUsuario = usuario.idUsuario;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarControlMantenimiento` ()  BEGIN
	SELECT controlmantenimiento.idControlMantenimiento, solicitudmantenimiento.idSolicitudMantenimiento, controlmantenimiento.fechaControlMantenimiento, equipo.codEquipo, equipo.descripcionEquipo, tipomantenimiento.tipoMantenimiento, 	 
    		solicitudmantenimiento.fechaSolicitudMantenimiento,controlmantenimiento.observacion, estadocontrolmantenimiento.estadoControlMantenimiento, concat(empleado.nombres, ' ', empleado.apellidos) as empleado
FROM controlmantenimiento  INNER JOIN solicitudmantenimiento 
						   ON controlmantenimiento.idSolicitudMantenimiento = solicitudmantenimiento.idSolicitudMantenimiento
                           INNER JOIN equipo
                           ON solicitudmantenimiento.codEquipo = equipo.codEquipo
                           INNER JOIN tipomantenimiento
                           ON controlmantenimiento.idTipoMantenimiento = tipomantenimiento.idTipoMantenimiento
                           INNER JOIN  usuario
                           ON controlmantenimiento.idUsuario = usuario.idUsuario
                           INNER JOIN empleado
                           ON usuario.codEmpleado = empleado.codEmpleado
                           INNER JOIN estadocontrolmantenimiento
                           ON controlmantenimiento.idEstadoControlMantenimiento = estadocontrolmantenimiento.idEstadoControlMantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarDepartamento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarDepartamento` ()  BEGIN
	SELECT * FROM departamento;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarDetalleEquipoC`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarDetalleEquipoC` ()  BEGIN
	SELECT detequipocomputadora.codEquipo, tiporam.tipoRam, capacidad.capacidad, velocidadram.velocidadRam, tipodisco.tipoDisco, capacidad.capacidad FROM detequipocomputadora INNER JOIN velocidadram  USING (idVelocidadRam) INNER JOIN capacidad USING (idCapacidad)  INNER JOIN tipodisco USING (idTipoDisco)  INNER JOIN tiporam USING (idTipoRam) INNER JOIN equipo USING (codEquipo);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEmpleado` ()  BEGIN
	SELECT empleado.codEmpleado, empleado.nombres, empleado.apellidos,  empleado.telefono, empleado.celular, empleado.extension, sexo.sexo, cargo.cargo, empleado.correoElectronico,  CASE empleado.estado WHEN 0 THEN 'INACTIVO'                                                                                                                                                                   WHEN 1 THEN 'ACTIVO'                                                                                                                                        END AS estado
FROM empleado INNER JOIN cargo  USING (idCargo) INNER JOIN sexo USING (idSexo);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEmpleado1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEmpleado1` ()  BEGIN
	SELECT empleado.codEmpleado, concat(empleado.nombres, ' ', empleado.apellidos) as empleado, empleado.telefono, empleado.celular, sexo.sexo, cargo.cargo, empleado.estado FROM empleado INNER JOIN cargo  USING (idCargo) INNER JOIN sexo USING (idSexo);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEmpresaGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEmpresaGarantia` ()  BEGIN
	SELECT * FROM empresagarantia;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEquipo` ()  BEGIN
	SELECT equipo.codEquipo, tipoequipo.tipoEquipo, equipo.descripcionEquipo, equipo.serie, equipo.serviceTag, modelo.modelo FROM equipo  INNER JOIN tipoequipo  USING (idTipoEquipo) INNER JOIN modelo USING (idModelo);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEquipo1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEquipo1` ()  BEGIN
	SELECT equipo.codEquipo, equipo.numInventario, tipoequipo.tipoEquipo, modelo.modelo, equipo.serie, equipo.serviceTag, equipo.descripcionEquipo 
    FROM equipo  INNER JOIN tipoequipo USING (idTipoEquipo) 
    			 INNER JOIN modelo USING(idModelo) ;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEquipoSolicitud`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEquipoSolicitud` (IN `_idUsuario` INT)  BEGIN
    SELECT equipo.codEquipo, tipoequipo.tipoEquipo, equipo.descripcionEquipo, 					
    		equipo.serie, equipo.serviceTag, modelo.modelo 
    FROM equipo  INNER JOIN tipoequipo  
    				USING (idTipoEquipo) 
                INNER JOIN modelo
                	USING (idModelo)
                 INNER JOIN asignacionequipo
                 USING (codEquipo)
   WHERE asignacionequipo.idUsuario = _idUsuario;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEstadoControlMant`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEstadoControlMant` ()  BEGIN
	SELECT idEstadoControlMantenimiento, estadoControlMantenimiento FROM estadocontrolmantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarEstadoControlMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEstadoControlMantenimiento` ()  BEGIN
	SELECT * FROM estadoControlMantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarMarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarMarca` ()  BEGIN
	SELECT * FROM marca;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarModelo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarModelo` ()  BEGIN
	SELECT modelo.idModelo, modelo.modelo, marca.marca FROM modelo  INNER JOIN marca  USING (idMarca);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarModeloSelect`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarModeloSelect` (IN `_marca` INT)  BEGIN
	SELECT modelo.idModelo, modelo.modelo, marca.marca FROM modelo  INNER JOIN marca  USING (idMarca)
WHERE modelo.idMarca = _marca;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarSexo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarSexo` ()  BEGIN
	SELECT idSexo, sexo FROM sexo ORDER BY sexo ASC;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarSolicitudM`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarSolicitudM` (IN `_idUsuario` INT)  BEGIN
	SELECT solicitudmantenimiento.idSolicitudMantenimiento, solicitudmantenimiento.fechaSolicitudMantenimiento, equipo.codEquipo, equipo.descripcionEquipo, tipoequipo.tipoEquipo, modelo.modelo, equipo.serviceTag, solicitudMantenimiento.preDiagnostico, usuario.userName 
    FROM solicitudmantenimiento  INNER JOIN equipo  
                                       ON solicitudmantenimiento.codEquipo = equipo.codEquipo
                                  INNER JOIN tipoequipo
                                       ON equipo.idTipoEquipo = tipoequipo.idTipoEquipo
                                  INNER JOIN modelo
                                       ON equipo.idModelo = modelo.idModelo
                                  INNER JOIN usuario
                                       ON solicitudmantenimiento.idUsuario = usuario.idUsuario
  	WHERE solicitudmantenimiento.idUsuario = _idUsuario;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarSolicitudMControl`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarSolicitudMControl` ()  BEGIN
	SELECT solicitudmantenimiento.idSolicitudMantenimiento, solicitudmantenimiento.fechaSolicitudMantenimiento, equipo.descripcionEquipo, solicitudMantenimiento.preDiagnostico, concat(empleado.nombres, ' ', empleado.apellidos) as empleado
    FROM solicitudmantenimiento  INNER JOIN equipo  USING (codEquipo)
    							INNER JOIN usuario USING (idUsuario)
                                INNER JOIN empleado USING(codEmpleado);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarTipoDisco`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoDisco` ()  BEGIN
	SELECT * FROM tipoDisco;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarTipoEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoEquipo` ()  BEGIN
	SELECT * FROM tipoEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarTipoMantenimiento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoMantenimiento` ()  BEGIN
	SELECT * FROM tipoMantenimiento;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarTipoRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoRam` ()  BEGIN
	SELECT * FROM tiporam;
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarUsuario` ()  BEGIN
	SELECT usuario.idUsuario, concat(empleado.nombres, ' ', empleado.apellidos) as empleado, usuario.fechaCreacion, usuario.userName, usuario.password, usuario.fechaBaja, CASE usuario.estado WHEN 0 THEN 'INACTIVO'                                                                                                                                                                   WHEN 1 THEN 'ACTIVO'                                                                                                                                        END AS estado
FROM usuario  INNER JOIN empleado  USING (codEmpleado);END$$

DROP PROCEDURE IF EXISTS `sp_mostrarUsuario1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarUsuario1` ()  BEGIN
	SELECT usuario.idUsuario, concat(empleado.nombres, ' ', empleado.apellidos) as empleado, usuario.fechaCreacion, usuario.userName, usuario.password, usuario.fechaBaja, usuario.estado  FROM usuario  INNER JOIN empleado  USING (codEmpleado);
END$$

DROP PROCEDURE IF EXISTS `sp_mostrarVelocidadRam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarVelocidadRam` ()  BEGIN
	SELECT * FROM velocidadram;
END$$

DROP PROCEDURE IF EXISTS `sp_obtenerCorreoEmpleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleado` (IN `_codEmpleado` VARCHAR(10))  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN solicitudmantenimiento USING(idUsuario)
    							INNER JOIN empleado USING(codEmpleado)
    WHERE codEmpleado = _codEmpleado;
END$$

DROP PROCEDURE IF EXISTS `sp_obtenerCorreoEmpleadoAsigEquipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleadoAsigEquipo` (IN `_idUsuario` INT)  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN asignacionequipo USING(idUsuario)
    							INNER JOIN empleado USING(codEmpleado)
    WHERE idUsuario = _idUsuario;
END$$

DROP PROCEDURE IF EXISTS `sp_obtenerCorreoEmpleadoControlGarantia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleadoControlGarantia` (IN `_codEquipo` VARCHAR(9))  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN asignacionequipo USING(idUsuario)
    			INNER JOIN empleado USING(codEmpleado)
               	INNER JOIN equipo USING(codEquipo)
    WHERE codEquipo = _codEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_obtenerCorreoEmpleadoControlMant`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleadoControlMant` (IN `_codEquipo` VARCHAR(9))  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN asignacionequipo USING(idUsuario)
    							INNER JOIN empleado USING(codEmpleado)
    WHERE codEquipo = _codEquipo;
END$$

DROP PROCEDURE IF EXISTS `sp_obtenerEmpresa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerEmpresa` (IN `_idEmpresa` INT)  BEGIN
	SELECT nombreEmpresa 
	from empresagarantia
    WHERE idEmpresa = _idEmpresa;
END$$

DROP PROCEDURE IF EXISTS `sp_obtenerUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerUsuario` (IN `_usuario` VARCHAR(20), IN `_contraseña` VARCHAR(20))  BEGIN
    SELECT  *  from usuario 
    WHERE userName = _usuario  AND password = _contraseña ;
END$$

DROP PROCEDURE IF EXISTS `sp_obtenerUsuarioLogeado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerUsuarioLogeado` (IN `_userName` VARCHAR(20))  BEGIN
	select idUsuario, userName 
	FROM usuario
	WHERE userName = _userName;
	
END$$

DROP PROCEDURE IF EXISTS `sp_verificarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verificarUsuario` (IN `_usuario` VARCHAR(20), IN `_contraseña` VARCHAR(20))  BEGIN
    SELECT  usuario.idUsuario, empleado.codEmpleado, usuario.estado, concat(empleado.nombres, '  ' ,empleado.apellidos) as empleado  
from usuario INNER JOIN empleado USING(codEmpleado)
    WHERE userName = _usuario  AND password = _contraseña  AND usuario.estado = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionequipo`
--

DROP TABLE IF EXISTS `asignacionequipo`;
CREATE TABLE `asignacionequipo` (
  `idAsignacionEquipo` int(11) NOT NULL,
  `fechaAsignacion` date NOT NULL,
  `codEquipo` varchar(9) NOT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  `fechaBaja` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignacionequipo`
--

INSERT INTO `asignacionequipo` (`idAsignacionEquipo`, `fechaAsignacion`, `codEquipo`, `observacion`, `fechaBaja`, `estado`, `idUsuario`) VALUES
(5, '2021-02-11', '031', 'laptop reciente', NULL, 1, 116),
(14, '2021-02-09', '1998', 'hjfgj', '0000-00-00', 1, 116),
(15, '2021-02-10', '123456', 'dfs', '0000-00-00', 1, 117),
(16, '2021-03-10', '789', 'Se asigno con un peque;o detalle en su case', '0000-00-00', 1, 116);

--
-- Disparadores `asignacionequipo`
--
DROP TRIGGER IF EXISTS `tx_actualizarAsignacionEquipo`;
DELIMITER $$
CREATE TRIGGER `tx_actualizarAsignacionEquipo` AFTER UPDATE ON `asignacionequipo` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    
    SET idUser = new.idUsuario;
    SET idRegistro = old.idAsignacionEquipo;
    
    SET descrip = CONCAT('Se actualizó el registro en asignacionequipo con Id', ' ', idRegistro);
    
	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip , 2);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tx_eliminarAsignacionEquipo`;
DELIMITER $$
CREATE TRIGGER `tx_eliminarAsignacionEquipo` AFTER DELETE ON `asignacionequipo` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    
    SET idUser = old.idUsuario;
    SET idRegistro = old.idAsignacionEquipo;
    SET descrip = CONCAT('Se eliminó el registro en asignacionequipo con Id', ' ', idRegistro);

	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip, 3);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tx_insertarAsignacionEquipo`;
DELIMITER $$
CREATE TRIGGER `tx_insertarAsignacionEquipo` AFTER INSERT ON `asignacionequipo` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    
    SET idUser = new.idUsuario;
    SET idRegistro = new.idAsignacionEquipo;
    
    SET descrip = CONCAT('Se insertó el registro en asignacionequipo con Id', ' ', idRegistro);

	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip, 1);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audilog`
--

DROP TABLE IF EXISTS `audilog`;
CREATE TABLE `audilog` (
  `idAudiLog` int(11) NOT NULL,
  `fechaEvento` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `audilog`
--

INSERT INTO `audilog` (`idAudiLog`, `fechaEvento`, `idUsuario`, `descripcion`, `idTipoTransaccion`) VALUES
(68, '2021-02-13 16:28:41', 116, 'Se insertó el registro en solicitudmantenimiento con Id 123', 1),
(69, '2021-02-13 16:44:01', 116, 'Se insertó el registro en asignacionequipo con Id 5', 1),
(70, '2021-02-13 16:50:21', 116, 'Se insertó el registro en asignacionequipo con Id 6', 1),
(71, '2021-02-15 17:22:32', 116, 'Se insertó el registro en controlmantenimiento con Id 9', 1),
(72, '2021-02-15 17:50:42', 116, 'Se eliminó el registro en controlmantenimiento con Id 9', 3),
(73, '2021-02-15 17:51:22', 117, 'Se insertó el registro en controlmantenimiento con Id 10', 1),
(74, '2021-02-15 23:07:20', 117, 'Se insertó el registro en asignacionequipo con Id 7', 1),
(75, '2021-02-15 23:48:02', 117, 'Se insertó el registro en controlmantenimiento con Id 17', 1),
(76, '2021-02-16 11:13:56', 117, 'Se insertó el registro en controlmantenimiento con Id 18', 1),
(77, '2021-02-16 11:25:46', 117, 'Se insertó el registro en controlmantenimiento con Id 19', 1),
(78, '2021-02-16 11:28:02', 117, 'Se actualizó el registro en controlmantenimiento con Id 19', 2),
(79, '2021-02-16 12:00:28', 117, 'Se actualizó el registro en controlmantenimiento con Id 10', 2),
(80, '2021-02-16 12:06:50', 117, 'Se actualizó el registro en controlmantenimiento con Id 19', 2),
(81, '2021-02-18 13:51:29', 117, 'Se insertó el registro en asignacionequipo con Id 8', 1),
(82, '2021-02-18 14:24:43', 117, 'Se actualizó el registro en asignacionequipo con Id 8', 2),
(83, '2021-02-18 14:24:53', 117, 'Se eliminó el registro en asignacionequipo con Id 8', 3),
(84, '2021-02-22 09:38:12', 117, 'Se insertó el registro en solicitudmantenimiento con Id 124', 1),
(85, '2021-02-22 09:39:37', 116, 'Se eliminó el registro en solicitudmantenimiento con Id 123', 3),
(86, '2021-02-22 09:40:36', 117, 'Se insertó el registro en solicitudmantenimiento con Id 125', 1),
(87, '2021-02-22 14:15:27', 117, 'Se insertó el registro en controlmantenimiento con Id 20', 1),
(88, '2021-02-22 14:51:55', 117, 'Se insertó el registro en asignacionequipo con Id 9', 1),
(89, '2021-02-22 14:58:03', 117, 'Se eliminó el registro en asignacionequipo con Id 9', 3),
(90, '2021-02-22 15:00:15', 117, 'Se actualizó el registro en asignacionequipo con Id 7', 2),
(91, '2021-02-25 10:24:23', 117, 'Se insertó el registro en solicitudmantenimiento con Id 126', 1),
(92, '2021-02-25 10:38:47', 117, 'Se insertó el registro en solicitudmantenimiento con Id 127', 1),
(93, '2021-02-25 11:33:40', 117, 'Se actualizó el registro en solicitudmantenimiento con Id 127', 2),
(94, '2021-02-25 11:35:32', 117, 'Se insertó el registro en asignacionequipo con Id 10', 1),
(95, '2021-02-25 13:49:23', 117, 'Se insertó el registro en asignacionequipo con Id 11', 1),
(96, '2021-02-25 13:54:06', 117, 'Se insertó el registro en controlmantenimiento con Id 21', 1),
(97, '2021-02-25 14:23:59', 117, 'Se insertó el registro en controlmantenimiento con Id 22', 1),
(98, '2021-02-25 14:24:39', 117, 'Se insertó el registro en controlmantenimiento con Id 23', 1),
(99, '2021-02-25 14:30:41', 117, 'Se eliminó el registro en controlmantenimiento con Id 23', 3),
(100, '2021-02-25 14:30:48', 117, 'Se eliminó el registro en controlmantenimiento con Id 21', 3),
(101, '2021-02-25 14:31:16', 117, 'Se insertó el registro en controlmantenimiento con Id 24', 1),
(102, '2021-02-25 15:18:50', 116, 'Se insertó el registro en asignacionequipo con Id 12', 1),
(103, '2021-02-25 15:19:35', 116, 'Se eliminó el registro en asignacionequipo con Id 12', 3),
(104, '2021-02-25 15:19:37', 117, 'Se eliminó el registro en asignacionequipo con Id 11', 3),
(105, '2021-02-25 15:19:39', 117, 'Se eliminó el registro en asignacionequipo con Id 10', 3),
(106, '2021-02-25 15:19:41', 117, 'Se eliminó el registro en asignacionequipo con Id 7', 3),
(107, '2021-02-25 15:19:43', 116, 'Se eliminó el registro en asignacionequipo con Id 6', 3),
(108, '2021-02-25 15:30:35', 117, 'Se insertó el registro en asignacionequipo con Id 13', 1),
(133, '2021-02-25 15:34:23', 117, 'Se actualizó el registro en asignacionequipo con Id 13', 2),
(134, '2021-02-26 17:32:38', 116, 'Se insertó el registro en asignacionequipo con Id 14', 1),
(135, '2021-02-26 17:35:37', 116, 'Se insertó el registro en asignacionequipo con Id 15', 1),
(136, '2021-03-10 15:23:46', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 125', 3),
(137, '2021-03-10 15:23:58', 117, 'Se insertó el registro en solicitudmantenimiento con Id 128', 1),
(138, '2021-03-10 15:26:42', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 128', 3),
(139, '2021-03-10 15:27:05', 117, 'Se insertó el registro en solicitudmantenimiento con Id 129', 1),
(140, '2021-03-10 15:28:46', 117, 'Se insertó el registro en solicitudmantenimiento con Id 130', 1),
(141, '2021-03-10 15:29:23', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 130', 3),
(142, '2021-03-10 15:32:32', 117, 'Se insertó el registro en solicitudmantenimiento con Id 131', 1),
(143, '2021-03-10 15:34:28', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 131', 3),
(144, '2021-03-10 15:34:39', 117, 'Se insertó el registro en solicitudmantenimiento con Id 132', 1),
(145, '2021-03-10 15:46:15', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 132', 3),
(146, '2021-03-10 15:46:24', 117, 'Se insertó el registro en solicitudmantenimiento con Id 133', 1),
(147, '2021-03-10 15:49:35', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 133', 3),
(148, '2021-03-10 15:49:46', 117, 'Se insertó el registro en solicitudmantenimiento con Id 134', 1),
(149, '2021-03-10 15:59:33', 117, 'Se insertó el registro en solicitudmantenimiento con Id 135', 1),
(150, '2021-03-10 16:04:02', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 135', 3),
(151, '2021-03-10 16:04:04', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 134', 3),
(152, '2021-03-10 16:04:17', 117, 'Se insertó el registro en solicitudmantenimiento con Id 136', 1),
(153, '2021-03-10 16:05:14', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 136', 3),
(154, '2021-03-10 16:05:16', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 129', 3),
(155, '2021-03-10 16:05:18', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 127', 3),
(156, '2021-03-10 16:05:20', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 126', 3),
(157, '2021-03-10 16:05:33', 117, 'Se insertó el registro en solicitudmantenimiento con Id 137', 1),
(158, '2021-03-10 16:06:39', 117, 'Se insertó el registro en solicitudmantenimiento con Id 138', 1),
(159, '2021-03-10 16:12:59', 117, 'Se insertó el registro en solicitudmantenimiento con Id 139', 1),
(160, '2021-03-10 16:14:38', 117, 'Se insertó el registro en solicitudmantenimiento con Id 140', 1),
(161, '2021-03-10 16:16:27', 117, 'Se insertó el registro en solicitudmantenimiento con Id 141', 1),
(162, '2021-03-10 16:18:44', 117, 'Se insertó el registro en solicitudmantenimiento con Id 142', 1),
(163, '2021-03-10 16:20:12', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 142', 3),
(164, '2021-03-10 16:20:15', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 141', 3),
(165, '2021-03-10 16:20:17', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 140', 3),
(166, '2021-03-10 16:20:18', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 139', 3),
(167, '2021-03-10 16:20:20', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 138', 3),
(168, '2021-03-10 16:20:22', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 137', 3),
(169, '2021-03-10 16:20:41', 117, 'Se insertó el registro en solicitudmantenimiento con Id 143', 1),
(170, '2021-03-10 16:24:27', 117, 'Se insertó el registro en solicitudmantenimiento con Id 144', 1),
(171, '2021-03-10 16:27:21', 117, 'Se insertó el registro en solicitudmantenimiento con Id 145', 1),
(172, '2021-03-10 16:28:30', 117, 'Se insertó el registro en solicitudmantenimiento con Id 146', 1),
(173, '2021-03-10 16:29:30', 117, 'Se insertó el registro en solicitudmantenimiento con Id 147', 1),
(174, '2021-03-10 16:32:04', 117, 'Se insertó el registro en solicitudmantenimiento con Id 148', 1),
(175, '2021-03-10 16:33:36', 117, 'Se insertó el registro en solicitudmantenimiento con Id 149', 1),
(176, '2021-03-10 16:34:49', 117, 'Se insertó el registro en solicitudmantenimiento con Id 150', 1),
(177, '2021-03-10 16:41:39', 117, 'Se insertó el registro en solicitudmantenimiento con Id 151', 1),
(178, '2021-03-10 16:52:16', 117, 'Se insertó el registro en solicitudmantenimiento con Id 152', 1),
(179, '2021-03-10 17:55:41', 117, 'Se actualizó el registro en asignacionequipo con Id 15', 2),
(180, '2021-03-10 18:04:21', 116, 'Se insertó el registro en solicitudmantenimiento con Id 153', 1),
(181, '2021-03-10 18:06:13', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 151', 3),
(182, '2021-03-10 18:06:14', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 152', 3),
(183, '2021-03-10 18:06:16', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 150', 3),
(184, '2021-03-10 18:06:18', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 149', 3),
(185, '2021-03-10 18:06:20', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 148', 3),
(186, '2021-03-10 18:06:22', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 147', 3),
(187, '2021-03-10 18:06:24', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 146', 3),
(188, '2021-03-10 18:06:27', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 145', 3),
(189, '2021-03-10 18:06:28', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 144', 3),
(190, '2021-03-10 18:06:30', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 143', 3),
(191, '2021-03-10 18:06:31', 117, 'Se eliminó el registro en solicitudmantenimiento con Id 124', 3),
(192, '2021-03-10 18:06:42', 117, 'Se insertó el registro en solicitudmantenimiento con Id 154', 1),
(193, '2021-03-10 19:18:54', 116, 'Se insertó el registro en asignacionequipo con Id 16', 1),
(194, '2021-03-10 19:23:42', 117, 'Se actualizó el registro en asignacionequipo con Id 14', 2),
(195, '2021-03-10 19:25:50', 116, 'Se actualizó el registro en asignacionequipo con Id 14', 2),
(196, '2021-03-10 21:06:20', 117, 'Se insertó el registro en controlmantenimiento con Id 25', 1),
(197, '2021-03-10 23:11:15', 117, 'Se eliminó el registro en controlmantenimiento con Id 25', 3),
(198, '2021-03-10 23:18:22', 116, 'Se insertó el registro en controlmantenimiento con Id 26', 1),
(199, '2021-03-11 14:10:33', 116, 'Se insertó el registro en solicitudmantenimiento con Id 155', 1),
(200, '2021-03-11 15:04:54', 116, 'Se insertó el registro en controlmantenimiento con Id 27', 1),
(201, '2021-03-11 15:14:29', 117, 'Se insertó el registro en controlmantenimiento con Id 28', 1),
(202, '2021-03-11 15:18:08', 117, 'Se eliminó el registro en controlmantenimiento con Id 28', 3),
(203, '2021-03-11 15:18:10', 116, 'Se eliminó el registro en controlmantenimiento con Id 27', 3),
(204, '2021-03-11 15:18:55', 117, 'Se insertó el registro en controlmantenimiento con Id 29', 1),
(205, '2021-03-11 15:21:53', 117, 'Se eliminó el registro en controlmantenimiento con Id 29', 3),
(206, '2021-03-11 15:23:18', 116, 'Se insertó el registro en controlmantenimiento con Id 30', 1),
(207, '2021-03-11 15:27:11', 116, 'Se insertó el registro en controlmantenimiento con Id 31', 1),
(208, '2021-03-11 15:28:16', 116, 'Se eliminó el registro en controlmantenimiento con Id 31', 3),
(209, '2021-03-11 15:28:18', 116, 'Se eliminó el registro en controlmantenimiento con Id 30', 3),
(210, '2021-03-11 15:28:20', 116, 'Se eliminó el registro en controlmantenimiento con Id 26', 3),
(211, '2021-03-11 15:28:57', 116, 'Se insertó el registro en controlmantenimiento con Id 32', 1),
(212, '2021-03-11 15:33:02', 116, 'Se insertó el registro en controlmantenimiento con Id 33', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoramantenimiento`
--

DROP TABLE IF EXISTS `bitacoramantenimiento`;
CREATE TABLE `bitacoramantenimiento` (
  `idBitacora` int(11) NOT NULL,
  `fechaCambioEstado` date NOT NULL,
  `idSolicitudMantenimiento` int(11) NOT NULL,
  `idEstadoControlMantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidad`
--

DROP TABLE IF EXISTS `capacidad`;
CREATE TABLE `capacidad` (
  `idCapacidad` int(11) NOT NULL,
  `capacidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capacidad`
--

INSERT INTO `capacidad` (`idCapacidad`, `capacidad`) VALUES
(2, '256gb'),
(5, '48gb'),
(1, '512gb'),
(3, '64gb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `cargo`, `idDepartamento`) VALUES
(1, 'admin', 1),
(2, 'asistente', 2),
(4, 'tercero', 1),
(5, 'Gerent', 2),
(13, 'contadora', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlgarantia`
--

DROP TABLE IF EXISTS `controlgarantia`;
CREATE TABLE `controlgarantia` (
  `idControlGarantia` int(11) NOT NULL,
  `codEquipo` varchar(9) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `idEmpresa` int(11) NOT NULL,
  `telefonoContacto` varchar(9) NOT NULL,
  `correoElectronico` varchar(40) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `controlgarantia`
--

INSERT INTO `controlgarantia` (`idControlGarantia`, `codEquipo`, `fechaInicio`, `fechaVencimiento`, `estado`, `idEmpresa`, `telefonoContacto`, `correoElectronico`, `idUsuario`) VALUES
(43, '031', '2021-02-18', '2021-02-19', 1, 1, '', '', 117),
(53, '123456', '2021-03-11', '2021-04-08', 1, 1, '', '', 117),
(54, '789', '2021-03-08', '2021-03-26', 1, 1, '', '', 117),
(58, '1998', '2021-03-05', '2021-03-30', 1, 1, '', '', 117);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlmantenimiento`
--

DROP TABLE IF EXISTS `controlmantenimiento`;
CREATE TABLE `controlmantenimiento` (
  `idControlMantenimiento` int(11) NOT NULL,
  `fechaControlMantenimiento` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idTipoMantenimiento` int(11) NOT NULL,
  `idSolicitudMantenimiento` int(11) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  `idEstadoControlMantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `controlmantenimiento`
--

INSERT INTO `controlmantenimiento` (`idControlMantenimiento`, `fechaControlMantenimiento`, `idUsuario`, `idTipoMantenimiento`, `idSolicitudMantenimiento`, `observacion`, `idEstadoControlMantenimiento`) VALUES
(32, '2021-03-10', 116, 2, 153, 'dfgfd', 1),
(33, '2021-03-20', 116, 1, 155, 'chcgf', 2);

--
-- Disparadores `controlmantenimiento`
--
DROP TRIGGER IF EXISTS `tx_actualizarControlMantenimiento`;
DELIMITER $$
CREATE TRIGGER `tx_actualizarControlMantenimiento` AFTER UPDATE ON `controlmantenimiento` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    
    SET idUser = new.idUsuario;
    SET idRegistro = old.idControlMantenimiento;
    
    SET descrip = CONCAT('Se actualizó el registro en controlmantenimiento con Id', ' ', idRegistro);
    
	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip , 2);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tx_eliminarControlMantenimiento`;
DELIMITER $$
CREATE TRIGGER `tx_eliminarControlMantenimiento` AFTER DELETE ON `controlmantenimiento` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    
    SET idUser = old.idUsuario;
    SET idRegistro = old.idControlMantenimiento;
    SET descrip = CONCAT('Se eliminó el registro en controlmantenimiento con Id', ' ', idRegistro);

	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip, 3);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tx_insertarControlMantenimiento`;
DELIMITER $$
CREATE TRIGGER `tx_insertarControlMantenimiento` AFTER INSERT ON `controlmantenimiento` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    
    SET idUser = new.idUsuario;
    SET idRegistro = new.idControlMantenimiento;
    
    SET descrip = CONCAT('Se insertó el registro en controlmantenimiento con Id', ' ', idRegistro);

	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip, 1);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `departamento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `departamento`) VALUES
(1, 'admin'),
(2, 'gerencia.'),
(3, 'IT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detequipocomputadora`
--

DROP TABLE IF EXISTS `detequipocomputadora`;
CREATE TABLE `detequipocomputadora` (
  `codEquipo` varchar(9) NOT NULL,
  `idTipoRam` int(11) NOT NULL,
  `idCapacidad` int(11) NOT NULL,
  `idVelocidadRam` int(11) NOT NULL,
  `idTipoDisco` int(11) NOT NULL,
  `idCapacidadDisco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detequipocomputadora`
--

INSERT INTO `detequipocomputadora` (`codEquipo`, `idTipoRam`, `idCapacidad`, `idVelocidadRam`, `idTipoDisco`, `idCapacidadDisco`) VALUES
('1998', 1, 1, 1, 3, 5),
('789', 1, 1, 1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `codEmpleado` int(10) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `celular` varchar(9) DEFAULT NULL,
  `extension` varchar(9) NOT NULL,
  `idSexo` int(11) NOT NULL,
  `idCargo` int(11) NOT NULL,
  `correoElectronico` varchar(40) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`codEmpleado`, `nombres`, `apellidos`, `telefono`, `celular`, `extension`, `idSexo`, `idCargo`, `correoElectronico`, `estado`) VALUES
(1998, 'Angel', 'mendoza', '2782-4403', '3394-7239', '', 1, 1, 'joseangel.mendoza98@gmail.com', 1),
(2222, 'Ramon', 'Lopez', '2780-5014', '9988-7766', '200-032', 1, 1, 'wilson.villanueva@unah.edu.hn', 1),
(12281, 'wilson', 'villanueva', '2780-4250', '', '200-031', 1, 1, 'joseangel.mendoza98@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresagarantia`
--

DROP TABLE IF EXISTS `empresagarantia`;
CREATE TABLE `empresagarantia` (
  `idEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresagarantia`
--

INSERT INTO `empresagarantia` (`idEmpresa`, `nombreEmpresa`) VALUES
(1, 'Jestereo'),
(4, 'Tropigas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE `equipo` (
  `codEquipo` varchar(9) NOT NULL,
  `numInventario` varchar(8) NOT NULL,
  `idTipoEquipo` int(11) NOT NULL,
  `idModelo` int(11) NOT NULL,
  `serie` varchar(20) NOT NULL,
  `serviceTag` varchar(30) DEFAULT NULL,
  `descripcionEquipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`codEquipo`, `numInventario`, `idTipoEquipo`, `idModelo`, `serie`, `serviceTag`, `descripcionEquipo`) VALUES
('.63.66', '', 3, 7, '.63.', '.3.3', '.63.3.'),
('031', '', 3, 1, '255', '780', 'sd'),
('123', '', 1, 5, '987', '789', 'Adquisición'),
('123456', '', 4, 8, 'huhuuuh55', '', 'no funciona'),
('1998', '', 3, 5, '789', '987', 'Laptop en buen estado'),
('789', 'V-2113', 3, 1, '849', '874', 'escritorio'),
('hp1220', '', 3, 1, '655656156', '62156165', 'jnfnjn');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocontrolmantenimiento`
--

DROP TABLE IF EXISTS `estadocontrolmantenimiento`;
CREATE TABLE `estadocontrolmantenimiento` (
  `idEstadoControlMantenimiento` int(11) NOT NULL,
  `estadoControlMantenimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estadocontrolmantenimiento`
--

INSERT INTO `estadocontrolmantenimiento` (`idEstadoControlMantenimiento`, `estadoControlMantenimiento`) VALUES
(1, 'Diagnosticado'),
(2, 'En reparación'),
(3, 'Finalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `marca`) VALUES
(2, 'dell'),
(1, 'hp'),
(4, 'Lenovo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

DROP TABLE IF EXISTS `modelo`;
CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `idMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`idModelo`, `modelo`, `idMarca`) VALUES
(1, 'G7', 2),
(5, 'G5', 2),
(6, 'Xr', 1),
(7, 'Xrr', 1),
(8, 'l1', 4),
(9, 'l2', 4),
(10, 'ss', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

DROP TABLE IF EXISTS `sexo`;
CREATE TABLE `sexo` (
  `idSexo` int(11) NOT NULL,
  `sexo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`idSexo`, `sexo`) VALUES
(2, 'femenino'),
(1, 'masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudmantenimiento`
--

DROP TABLE IF EXISTS `solicitudmantenimiento`;
CREATE TABLE `solicitudmantenimiento` (
  `idSolicitudMantenimiento` int(11) NOT NULL,
  `fechaSolicitudMantenimiento` date NOT NULL,
  `codEquipo` varchar(9) NOT NULL,
  `preDiagnostico` varchar(100) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitudmantenimiento`
--

INSERT INTO `solicitudmantenimiento` (`idSolicitudMantenimiento`, `fechaSolicitudMantenimiento`, `codEquipo`, `preDiagnostico`, `idUsuario`) VALUES
(153, '2021-03-10', '1998', 'dsfdf', 116),
(154, '2021-03-10', '123456', 'vb', 117),
(155, '2021-03-27', '789', 'sfdnbd', 116);

--
-- Disparadores `solicitudmantenimiento`
--
DROP TRIGGER IF EXISTS `tx_actualizarSolicitudMantenimiento`;
DELIMITER $$
CREATE TRIGGER `tx_actualizarSolicitudMantenimiento` AFTER UPDATE ON `solicitudmantenimiento` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    SET idUser = new.idUsuario;
    
    SET idRegistro = old.idSolicitudMantenimiento;
    SET descrip = CONCAT('Se actualizó el registro en solicitudmantenimiento con Id', ' ', idRegistro);
	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip , 2);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tx_eliminarSolicitudMantenimiento`;
DELIMITER $$
CREATE TRIGGER `tx_eliminarSolicitudMantenimiento` AFTER DELETE ON `solicitudmantenimiento` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    
    SET idUser = old.idUsuario;
    SET idRegistro = old.idSolicitudMantenimiento;
    SET descrip = CONCAT('Se eliminó el registro en solicitudmantenimiento con Id', ' ', idRegistro);

	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip, 3);
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tx_insertarSolicitudMantenimiento`;
DELIMITER $$
CREATE TRIGGER `tx_insertarSolicitudMantenimiento` AFTER INSERT ON `solicitudmantenimiento` FOR EACH ROW BEGIN
	DECLARE idUser INTEGER;
	DECLARE idRegistro INTEGER;
    DECLARE descrip VARCHAR(100);
    SET idUser = new.idUsuario;
    
    SET idRegistro = new.idSolicitudMantenimiento;
    SET descrip = CONCAT('Se insertó el registro en solicitudmantenimiento con Id', ' ', idRegistro);

	INSERT INTO audilog(fechaEvento, idUsuario, descripcion, idTipoTransaccion)
	VALUES (NOW(), idUser, descrip, 1);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodisco`
--

DROP TABLE IF EXISTS `tipodisco`;
CREATE TABLE `tipodisco` (
  `idTipoDisco` int(11) NOT NULL,
  `tipoDisco` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipodisco`
--

INSERT INTO `tipodisco` (`idTipoDisco`, `tipoDisco`) VALUES
(2, 'HDD'),
(3, 'SSD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoequipo`
--

DROP TABLE IF EXISTS `tipoequipo`;
CREATE TABLE `tipoequipo` (
  `idTipoEquipo` int(11) NOT NULL,
  `tipoEquipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipoequipo`
--

INSERT INTO `tipoequipo` (`idTipoEquipo`, `tipoEquipo`) VALUES
(3, 'Computadora'),
(1, 'Impresora'),
(4, 'UPS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomantenimiento`
--

DROP TABLE IF EXISTS `tipomantenimiento`;
CREATE TABLE `tipomantenimiento` (
  `idTipoMantenimiento` int(11) NOT NULL,
  `tipoMantenimiento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipomantenimiento`
--

INSERT INTO `tipomantenimiento` (`idTipoMantenimiento`, `tipoMantenimiento`) VALUES
(2, 'Correctivo'),
(1, 'Preventivo'),
(3, 'rutinajhj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporam`
--

DROP TABLE IF EXISTS `tiporam`;
CREATE TABLE `tiporam` (
  `idTipoRam` int(11) NOT NULL,
  `tipoRam` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiporam`
--

INSERT INTO `tiporam` (`idTipoRam`, `tipoRam`) VALUES
(3, 'ddr2'),
(1, 'ddr3'),
(2, 'ddr4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotransaccion`
--

DROP TABLE IF EXISTS `tipotransaccion`;
CREATE TABLE `tipotransaccion` (
  `idTipoTransaccion` int(11) NOT NULL,
  `tipoTransaccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipotransaccion`
--

INSERT INTO `tipotransaccion` (`idTipoTransaccion`, `tipoTransaccion`) VALUES
(2, 'Actualización'),
(3, 'Eliminación'),
(1, 'Inserción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `codEmpleado` int(10) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fechaBaja` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `codEmpleado`, `fechaCreacion`, `userName`, `password`, `fechaBaja`, `estado`) VALUES
(116, 1998, '2021-01-31', 'angel', '159939c8d73fcfdf9b17', '0000-00-00', 1),
(117, 12281, '2021-02-11', 'wilson', 'abd7372bba5557759073', '0000-00-00', 1),
(118, 2222, '2021-03-10', 'ramon', '266575d3c2b8a34f8381', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `velocidadram`
--

DROP TABLE IF EXISTS `velocidadram`;
CREATE TABLE `velocidadram` (
  `idVelocidadRam` int(11) NOT NULL,
  `velocidadRam` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `velocidadram`
--

INSERT INTO `velocidadram` (`idVelocidadRam`, `velocidadRam`) VALUES
(2, '4gb'),
(3, '512rpm'),
(1, '8gb');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacionequipo`
--
ALTER TABLE `asignacionequipo`
  ADD PRIMARY KEY (`idAsignacionEquipo`),
  ADD KEY `codEquipo` (`codEquipo`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `audilog`
--
ALTER TABLE `audilog`
  ADD PRIMARY KEY (`idAudiLog`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idTipoTransaccion` (`idTipoTransaccion`);

--
-- Indices de la tabla `bitacoramantenimiento`
--
ALTER TABLE `bitacoramantenimiento`
  ADD PRIMARY KEY (`idBitacora`),
  ADD KEY `idEstadoControlMantenimiento` (`idEstadoControlMantenimiento`),
  ADD KEY `idSolicitudMantenimiento` (`idSolicitudMantenimiento`);

--
-- Indices de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  ADD PRIMARY KEY (`idCapacidad`),
  ADD UNIQUE KEY `capacidad` (`capacidad`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`),
  ADD UNIQUE KEY `cargo` (`cargo`),
  ADD KEY `idDepartamento` (`idDepartamento`);

--
-- Indices de la tabla `controlgarantia`
--
ALTER TABLE `controlgarantia`
  ADD PRIMARY KEY (`idControlGarantia`),
  ADD KEY `codEquipo` (`codEquipo`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  ADD PRIMARY KEY (`idControlMantenimiento`),
  ADD KEY `idSolicitudMantenimiento` (`idSolicitudMantenimiento`),
  ADD KEY `idTipoMantenimiento` (`idTipoMantenimiento`),
  ADD KEY `idEstadoControlMantenimiento` (`idEstadoControlMantenimiento`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD UNIQUE KEY `departamento` (`departamento`);

--
-- Indices de la tabla `detequipocomputadora`
--
ALTER TABLE `detequipocomputadora`
  ADD PRIMARY KEY (`codEquipo`) USING BTREE,
  ADD KEY `idVelocidadRam` (`idVelocidadRam`),
  ADD KEY `idCapacidadRam` (`idCapacidad`),
  ADD KEY `idCapacidadDisco` (`idCapacidadDisco`),
  ADD KEY `idTipoDisco` (`idTipoDisco`),
  ADD KEY `idTipoRam` (`idTipoRam`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codEmpleado`),
  ADD KEY `idCargo` (`idCargo`),
  ADD KEY `idSexo` (`idSexo`);

--
-- Indices de la tabla `empresagarantia`
--
ALTER TABLE `empresagarantia`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`codEquipo`),
  ADD KEY `idTipoEquipo` (`idTipoEquipo`),
  ADD KEY `idModelo` (`idModelo`);

--
-- Indices de la tabla `estadocontrolmantenimiento`
--
ALTER TABLE `estadocontrolmantenimiento`
  ADD PRIMARY KEY (`idEstadoControlMantenimiento`),
  ADD UNIQUE KEY `estadoControlMantenimiento` (`estadoControlMantenimiento`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`),
  ADD UNIQUE KEY `marca_UNIQUE` (`marca`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idModelo`),
  ADD UNIQUE KEY `modelo` (`modelo`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`idSexo`),
  ADD UNIQUE KEY `sexo` (`sexo`);

--
-- Indices de la tabla `solicitudmantenimiento`
--
ALTER TABLE `solicitudmantenimiento`
  ADD PRIMARY KEY (`idSolicitudMantenimiento`),
  ADD KEY `codEquipo` (`codEquipo`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `tipodisco`
--
ALTER TABLE `tipodisco`
  ADD PRIMARY KEY (`idTipoDisco`),
  ADD UNIQUE KEY `tipoDisco` (`tipoDisco`);

--
-- Indices de la tabla `tipoequipo`
--
ALTER TABLE `tipoequipo`
  ADD PRIMARY KEY (`idTipoEquipo`),
  ADD UNIQUE KEY `tipoEquipo` (`tipoEquipo`);

--
-- Indices de la tabla `tipomantenimiento`
--
ALTER TABLE `tipomantenimiento`
  ADD PRIMARY KEY (`idTipoMantenimiento`),
  ADD UNIQUE KEY `tipoMantenimiento` (`tipoMantenimiento`);

--
-- Indices de la tabla `tiporam`
--
ALTER TABLE `tiporam`
  ADD PRIMARY KEY (`idTipoRam`),
  ADD UNIQUE KEY `tipoRam` (`tipoRam`);

--
-- Indices de la tabla `tipotransaccion`
--
ALTER TABLE `tipotransaccion`
  ADD PRIMARY KEY (`idTipoTransaccion`),
  ADD UNIQUE KEY `tipoTransaccion` (`tipoTransaccion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `codEmpleado` (`codEmpleado`);

--
-- Indices de la tabla `velocidadram`
--
ALTER TABLE `velocidadram`
  ADD PRIMARY KEY (`idVelocidadRam`),
  ADD UNIQUE KEY `velocidadRam` (`velocidadRam`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacionequipo`
--
ALTER TABLE `asignacionequipo`
  MODIFY `idAsignacionEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `audilog`
--
ALTER TABLE `audilog`
  MODIFY `idAudiLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT de la tabla `bitacoramantenimiento`
--
ALTER TABLE `bitacoramantenimiento`
  MODIFY `idBitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  MODIFY `idCapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `controlgarantia`
--
ALTER TABLE `controlgarantia`
  MODIFY `idControlGarantia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  MODIFY `idControlMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empresagarantia`
--
ALTER TABLE `empresagarantia`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estadocontrolmantenimiento`
--
ALTER TABLE `estadocontrolmantenimiento`
  MODIFY `idEstadoControlMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `idModelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `idSexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitudmantenimiento`
--
ALTER TABLE `solicitudmantenimiento`
  MODIFY `idSolicitudMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `tipodisco`
--
ALTER TABLE `tipodisco`
  MODIFY `idTipoDisco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipoequipo`
--
ALTER TABLE `tipoequipo`
  MODIFY `idTipoEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipomantenimiento`
--
ALTER TABLE `tipomantenimiento`
  MODIFY `idTipoMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tiporam`
--
ALTER TABLE `tiporam`
  MODIFY `idTipoRam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipotransaccion`
--
ALTER TABLE `tipotransaccion`
  MODIFY `idTipoTransaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de la tabla `velocidadram`
--
ALTER TABLE `velocidadram`
  MODIFY `idVelocidadRam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacionequipo`
--
ALTER TABLE `asignacionequipo`
  ADD CONSTRAINT `asignacionequipo_ibfk_2` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asignacionequipo_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `audilog`
--
ALTER TABLE `audilog`
  ADD CONSTRAINT `audilog_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audilog_ibfk_2` FOREIGN KEY (`idTipoTransaccion`) REFERENCES `tipotransaccion` (`idTipoTransaccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `controlgarantia`
--
ALTER TABLE `controlgarantia`
  ADD CONSTRAINT `controlgarantia_ibfk_2` FOREIGN KEY (`idEmpresa`) REFERENCES `empresagarantia` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlgarantia_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlgarantia_ibfk_4` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  ADD CONSTRAINT `controlmantenimiento_ibfk_1` FOREIGN KEY (`idSolicitudMantenimiento`) REFERENCES `solicitudmantenimiento` (`idSolicitudMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_2` FOREIGN KEY (`idTipoMantenimiento`) REFERENCES `tipomantenimiento` (`idTipoMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_4` FOREIGN KEY (`idEstadoControlMantenimiento`) REFERENCES `estadocontrolmantenimiento` (`idEstadoControlMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_5` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detequipocomputadora`
--
ALTER TABLE `detequipocomputadora`
  ADD CONSTRAINT `detequipocomputadora_ibfk_1` FOREIGN KEY (`idTipoDisco`) REFERENCES `tipodisco` (`idTipoDisco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_2` FOREIGN KEY (`idTipoRam`) REFERENCES `tiporam` (`idTipoRam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_3` FOREIGN KEY (`idVelocidadRam`) REFERENCES `velocidadram` (`idVelocidadRam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_6` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_7` FOREIGN KEY (`idCapacidad`) REFERENCES `capacidad` (`idCapacidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_8` FOREIGN KEY (`idCapacidadDisco`) REFERENCES `capacidad` (`idCapacidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idSexo`) REFERENCES `sexo` (`idSexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`idTipoEquipo`) REFERENCES `tipoequipo` (`idTipoEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudmantenimiento`
--
ALTER TABLE `solicitudmantenimiento`
  ADD CONSTRAINT `solicitudmantenimiento_ibfk_1` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudmantenimiento_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codEmpleado`) REFERENCES `empleado` (`codEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
