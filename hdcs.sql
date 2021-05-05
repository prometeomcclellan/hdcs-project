-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2021 at 06:35 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hdcs`
--

DELIMITER $$
--
-- Procedures
--
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarBitacoraMantenimiento` (IN `_idBitacora` INT, IN `_fechaCambioEstado` DATE, IN `_idSolMant` INT, IN `_idEstadoCMant` INT)  BEGIN
	UPDATE bitacoramantenimiento
    SET 	fechaCambioEstado = _fechaCambioEstado, 
	idSolicitudMantenimiento = _idSolMant,
	idEstadoControlMantenimiento = _idEstadoCMant
     WHERE idBitacora = _idBitacora;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarCapacidad` (IN `_idCapacidad` INT, IN `_capacidad` VARCHAR(20))  BEGIN
	UPDATE capacidad
    SET capacidad = _capacidad
     WHERE idCapacidad = _idCapacidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarCargo` (IN `_cargo` VARCHAR(30), IN `_idDepartamento` INT, IN `_idCargo` INT)  BEGIN
	UPDATE cargo
    SET cargo = _cargo,
    	idDepartamento = _idDepartamento
     WHERE idCargo = _idCargo;
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarDepartamento` (IN `_idDepartamento` INT, IN `_departamento` VARCHAR(40))  BEGIN
	UPDATE departamento
    SET departamento = _departamento
     WHERE idDepartamento = _idDepartamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarDetalleEquipoC` (IN `_codEquipo` VARCHAR(9), IN `_idTipoRam` INT, IN `_idCapacidadRam` INT, IN `_idVelocidadRam` INT, IN `_idTipoDisco` INT, IN `_idCapacidadDisco` INT)  BEGIN
	UPDATE detequipocomputadora
    SET 	idTipoRam = _idTipoRam,
	idCapacidad = _idCapacidadRam,
	idVelocidadRam = _idVelocidadRam,
	idTipoDisco = _idTipoDisco,
	idCapacidadDisco = _idCapacidadDisco
     WHERE CodEquipo = _codEquipo;
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEmpresaGarantia` (IN `_idEmpresa` INT, IN `_nombreEmpresa` VARCHAR(50))  BEGIN
	UPDATE empresagarantia
    SET nombreEmpresa = _nombreEmpresa
     WHERE idEmpresa = _idEmpresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEquipo` (IN `_codEquipo` VARCHAR(9), IN `_numInventario` VARCHAR(8), IN `_idTipoEquipo` INT, IN `_idModelo` INT, IN `_serie` VARCHAR(20), IN `_serviceTag` VARCHAR(30), IN `_descripcionEquipo` VARCHAR(50))  BEGIN
	UPDATE equipo  SET  numInventario = _numInventario,
    		idTipoEquipo = _idTipoEquipo,
          idModelo = _idModelo,
          serie = _serie,
          serviceTag= _serviceTag,
         descripcionEquipo= _descripcionEquipo
                 WHERE codEquipo = _codEquipo ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarEstadoControlMantenimiento` (IN `_id` INT, IN `_estadoControlMantenimiento` VARCHAR(50))  BEGIN
	UPDATE estadoControlMantenimiento
    SET estadoControlMantenimiento = _estadoControlMantenimiento
     WHERE idEstadoControlMantenimiento = _id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarMarca` (IN `_idMarca` INT, IN `_marca` VARCHAR(20))  BEGIN
	UPDATE marca
    SET marca = _marca
     WHERE idMarca = _idMarca;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarModelo` (IN `_modelo` VARCHAR(20), IN `_idMarca` INT, IN `_idModelo` INT)  BEGIN
	UPDATE modelo  SET modelo = _modelo, idMarca = _idMarca
                 WHERE idModelo = _idModelo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarSolicitudM` (IN `_fechaSM` DATE, IN `_codEquipo` VARCHAR(9), IN `_preDiagnostico` VARCHAR(100), IN `_idSM` INT)  BEGIN
	UPDATE solicitudmantenimiento
    SET fechaSolicitudMantenimiento = _fechaSM,
    	codEquipo = _codEquipo, 
	preDiagnostico = _preDiagnostico
     WHERE idSolicitudMantenimiento = _idSM;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoDisco` (IN `_idTipoDisco` INT, IN `_TipoDisco` VARCHAR(10))  BEGIN
	UPDATE tipoDisco
    SET tipoDisco = _TipoDisco
     WHERE idTipoDisco = _idTipoDisco;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoEquipo` (IN `_idTipoEquipo` INT, IN `_TipoEquipo` VARCHAR(30))  BEGIN
	UPDATE tipoEquipo
    SET tipoEquipo = _TipoEquipo
     WHERE idTipoEquipo = _idTipoEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoMantenimiento` (IN `_idTipoMantenimiento` INT, IN `_TipoMantenimiento` VARCHAR(10))  BEGIN
	UPDATE tipoMantenimiento
    SET tipoMantenimiento = _TipoMantenimiento
     WHERE idTipoMantenimiento = _idTipoMantenimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarTipoRam` (IN `_idTipoRam` INT, IN `_tipoRam` VARCHAR(20))  BEGIN
	UPDATE tipoRam
    SET tipoRam = _tipoRam
     WHERE idTipoRam = _idTipoRam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarUsuario` (IN `_idUsuario` INT, IN `_userName` VARCHAR(20), IN `_password` VARCHAR(20), IN `_fechaB` DATE, IN `_estado` TINYINT)  BEGIN
	UPDATE usuario  SET userName = _userName,
          password = _password,
          fechaBaja= _fechaB,
         estado= _estado 
                 WHERE idUsuario = _idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarVelocidadRam` (IN `_idVelocidadRam` INT, IN `_velocidadRam` VARCHAR(20))  BEGIN
	UPDATE velocidadram
    SET velocidadRam = _velocidadRam
     WHERE idVelocidadRam = _idVelocidadRam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarAsignacionEquipo` (IN `_idAsignacionEquipo` INT)  BEGIN
	DELETE FROM asignacionequipo WHERE idAsignacionEquipo = _idAsignacionEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarBitacoraMantenimiento` (IN `_idBitacoraMant` INT)  BEGIN
	DELETE FROM bitacoramantenimiento WHERE idBitacora = _idBitacoraMant;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarCapacidad` (IN `_idCapacidad` INT)  BEGIN
	DELETE FROM capacidad WHERE idCapacidad = _idCapacidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarCargo` (IN `_idCargo` INT)  BEGIN
	DELETE FROM cargo WHERE idCargo=_idCargo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarControlGarantia` (IN `_idControlGarantia` INT)  BEGIN
	DELETE FROM controlgarantia WHERE idControlGarantia = _idControlGarantia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarControlMantenimiento` (IN `_idControlMant` INT)  BEGIN
	DELETE FROM controlmantenimiento WHERE idControlMantenimiento = _idControlMant;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarDepartamento` (IN `_idDepartamento` INT)  BEGIN
	DELETE FROM departamento WHERE idDepartamento = _idDepartamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarDetalleEquipoC` (IN `_codEquipo` VARCHAR(9))  BEGIN
	DELETE FROM detequipocomputadora WHERE codEquipo = _codEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEmpleado` (IN `_codEmpleado` INT(10))  BEGIN
	DELETE FROM empleado WHERE codEmpleado = _codEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEmpresaGarantia` (IN `_idEmpresa` INT)  BEGIN
	DELETE FROM empresagarantia 
	WHERE idEmpresa = _idEmpresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEquipo` (IN `_codEquipo` INT)  BEGIN
	DELETE FROM equipo WHERE codEquipo=_codEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarEstadoControlMantenimiento` (IN `_id` INT)  BEGIN
	DELETE FROM estadoControlMantenimiento WHERE idEstadoControlMantenimiento = _id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarMarca` (IN `_idMarca` INT)  BEGIN
	DELETE FROM marca WHERE idMarca = _idMarca;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarModelo` (IN `_idModelo` INT)  BEGIN
	DELETE FROM modelo WHERE idModelo=_idModelo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarSolicitudM` (IN `_idSolicitud` INT)  BEGIN
	DELETE FROM solicitudmantenimiento WHERE idSolicitudMantenimiento = _idSolicitud;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoDisco` (IN `_idTipoDisco` INT)  BEGIN
	DELETE FROM tipoDisco WHERE idTipoDisco = _idTipoDisco;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoEquipo` (IN `_idTipoEquipo` INT)  BEGIN
	DELETE FROM tipoEquipo WHERE idTipoEquipo = _idTipoEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoMantenimiento` (IN `_idTipoMantenimiento` INT)  BEGIN
	DELETE FROM tipoMantenimiento WHERE idTipoMantenimiento = _idTipoMantenimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarTipoRam` (IN `_idTipoRam` INT)  BEGIN
	DELETE FROM tiporam WHERE idTipoRam = _idTipoRam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarUsuario` (IN `_idUsuario` INT)  BEGIN
	DELETE FROM usuario WHERE idUsuario=_idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarVelocidadRam` (IN `_idVelocidadRam` INT)  BEGIN
	DELETE FROM velocidadram WHERE idVelocidadRam = _idVelocidadRam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCapacidad` (IN `_capacidad` VARCHAR(20))  BEGIN
    SELECT count(*) from capacidad 
    WHERE capacidad = _capacidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCargo` (IN `_cargo` VARCHAR(30))  BEGIN
    SELECT count(*) from cargo 
    WHERE cargo = _cargo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCodEquipo` (IN `_codigo` VARCHAR(9))  BEGIN
    SELECT count(*) 
    from asignacionequipo 
    WHERE codEquipo = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeCodigoEquipo` (IN `_codigo` VARCHAR(20))  BEGIN
    SELECT count(*) from equipo 
    WHERE codEquipo = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeControlGarantia` (IN `_codEquipo` VARCHAR(9))  BEGIN
    SELECT count(*) 
    from controlgarantia 
    WHERE codEquipo = _codEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeDepartamento` (IN `_departamento` VARCHAR(40))  BEGIN
    SELECT count(*) from departamento 
    WHERE departamento = _departamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeDetCodigoEquipo` (IN `_codigo` VARCHAR(9))  BEGIN
    SELECT count(*) from detequipocomputadora 
    WHERE codEquipo = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEmpleado` (IN `_codEmpleado` INT(10))  BEGIN
    SELECT count(*) from empleado 
    WHERE codEmpleado = _codEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEmpleadoUsuario` (IN `_codEmpleado` INT(10))  BEGIN
    SELECT count(*) from usuario 
    WHERE codEmpleado = _codEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEmpresaGarantia` (IN `_nombreEmpresa` VARCHAR(50))  BEGIN
    SELECT count(*) from empresagarantia 
    WHERE nombreEmpresa = _nombreEmpresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeEstadoControlMantenimiento` (IN `_estadoControlMantenimiento` VARCHAR(50))  BEGIN
    SELECT count(*) from estadocontrolmantenimiento 
    WHERE estadoControlMantenimiento = _estadoControlMantenimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeIdSolMant` (IN `_idSolMant` INT)  BEGIN
    SELECT count(*) 
    from controlmantenimiento 
    WHERE idSolicitudMantenimiento = _idSolMant;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeMarca` (IN `_marca` VARCHAR(20))  BEGIN
    SELECT count(*) from marca 
    WHERE marca = _marca;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeModelo` (IN `_modelo` VARCHAR(20))  BEGIN
    SELECT count(*) from modelo 
    WHERE modelo = _modelo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeSerie` (IN `_serie` VARCHAR(20))  BEGIN
    SELECT count(*) from equipo 
    WHERE serie = _serie;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeServiceTag` (IN `_serviceTag` VARCHAR(30))  BEGIN
    SELECT count(*) from equipo 
    WHERE serviceTag = _serviceTag;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoDisco` (IN `_tipoDisco` VARCHAR(10))  BEGIN
    SELECT count(*) from tipodisco 
    WHERE tipoDisco = _tipoDisco;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoEquipo` (IN `_tipoEquipo` VARCHAR(30))  BEGIN
    SELECT count(*) from tipoequipo 
    WHERE tipoEquipo = _tipoEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoMantenimiento` (IN `_tipoMantenimiento` VARCHAR(10))  BEGIN
    SELECT count(*) from tipomantenimiento 
    WHERE tipoMantenimiento = _tipoMantenimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeTipoRam` (IN `_tipoRam` VARCHAR(20))  BEGIN
    SELECT count(*) from tiporam 
    WHERE tipoRam = _tipoRam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeUsuario` (IN `_userName` VARCHAR(20))  BEGIN
    SELECT count(*) as cantidad from usuario 
    WHERE userName = _userName;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existeVelocidadRam` (IN `_velocidadRam` VARCHAR(20))  BEGIN
    SELECT count(*) from velocidadram 
    WHERE velocidadRam = _velocidadRam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarAsignacionEquipo` (IN `_fechaAsignacion` DATE, IN `_codEquipo` VARCHAR(9), IN `_observacion` VARCHAR(50), IN `_fechaBaja` DATE, IN `_idUsuario` INT)  BEGIN
	INSERT INTO asignacionequipo (fechaAsignacion, codEquipo, observacion, fechaBaja, idUsuario) 
    	VALUES(_fechaAsignacion, _codEquipo, _observacion, _fechaBaja, _idUsuario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarBitacoraMantenimiento` (IN `_fechaCambioEstado` DATE, IN `_solicitudMant` INT, IN `_estadoControlMant` INT)  BEGIN
	INSERT INTO bitacoramantenimiento (fechaCambioEstado, idSolicitudMantenimiento, idEstadoControlMantenimiento) VALUES( _fechaCambioEstado, _solicitudMant,  _estadoControlMant);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarCapacidad` (IN `_capacidad` VARCHAR(20))  BEGIN
	INSERT INTO capacidad (capacidad) VALUES(_capacidad);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarCargo` (IN `cargo` VARCHAR(30), IN `idDepartamento` INT)  BEGIN
	INSERT INTO cargo (cargo, idDepartamento ) VALUES(cargo, idDepartamento );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarControlGarantia` (IN `_codEquipo` VARCHAR(9), IN `_fechaInicio` DATE, IN `_fechaVencimiento` DATE, IN `_idEmpresa` INT, IN `_telefono` VARCHAR(9), IN `_correo` VARCHAR(40), IN `_idUsuario` INT)  BEGIN
	INSERT INTO controlgarantia (codEquipo, fechaInicio, fechaVencimiento, idEmpresa, telefonoContacto, correoElectronico, idUsuario) 
    	VALUES(_codEquipo, _fechaInicio,  _fechaVencimiento, _idEmpresa, _telefono, _correo, _idUsuario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarControlMantenimiento` (IN `_fechaControlMant` DATE, IN `_usuario` INT(11), IN `_tipoMant` INT, IN `_idSolMant` INT, IN `_observacion` VARCHAR(100), IN `_idEstadoControlMant` INT)  BEGIN
	INSERT INTO controlmantenimiento (fechaControlMantenimiento, idUsuario, idTipoMantenimiento, idSolicitudMantenimiento, observacion, idEstadoControlMantenimiento) 
    	VALUES( _fechaControlMant, _usuario,  _tipoMant, _idSolMant, _observacion, _idEstadoControlMant);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarDepartamento` (IN `_departamento` VARCHAR(40))  BEGIN
	INSERT INTO departamento (departamento) VALUES(_departamento);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarDetalleEquipoC` (IN `_codEquipo` VARCHAR(9), IN `_idTipoRam` INT, IN `_idCapacidadRam` INT, IN `_idVelocidadRam` INT, IN `_idTipoDisco` INT, IN `_idCapacidadDisco` INT)  BEGIN
	INSERT INTO detequipocomputadora (codEquipo, idTipoRam, idCapacidad, idVelocidadRam, idTipoDisco, idCapacidadDisco)  VALUES( _codEquipo,  _idTipoRam,  _idCapacidadRam, _idVelocidadRam, _idTipoDisco, _idCapacidadDisco);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEmpleado` (IN `_codEmpleado` INT(10), IN `_nombres` VARCHAR(50), IN `_apellidos` VARCHAR(50), IN `_telefono` VARCHAR(9), IN `_celular` VARCHAR(9), IN `_extension` VARCHAR(9), IN `_select_Sexo` INT, IN `_select_Cargo` INT, IN `_eMail` VARCHAR(40))  BEGIN
	INSERT INTO empleado (codEmpleado, nombres, apellidos, telefono, celular, extension,  idSexo, idCargo, correoElectronico) VALUES(_codEmpleado, _nombres, _apellidos, _telefono, _celular, _extension,  _select_Sexo, _select_Cargo, _eMail);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEmpresaGarantia` (IN `_nombreEmpresa` VARCHAR(50))  BEGIN
	INSERT INTO empresagarantia (nombreEmpresa) VALUES(_nombreEmpresa);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEquipo` (IN `_codEquipo` VARCHAR(9), IN `_numInventario` VARCHAR(8), IN `_idTipoEquipo` INT, IN `_idModelo` INT, IN `_serie` VARCHAR(20), IN `_serviceTag` VARCHAR(30), IN `_descripcionEquipo` VARCHAR(50))  BEGIN
         INSERT INTO equipo (codEquipo, numInventario, idTipoEquipo, idModelo, serie, serviceTag, descripcionEquipo) VALUES(_codEquipo, _numInventario,  _idTipoEquipo, _idModelo, _serie, _serviceTag, _descripcionEquipo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarEstadoControlMantenimiento` (IN `_estadoControlMantenimiento` VARCHAR(50))  BEGIN
	INSERT INTO estadoControlMantenimiento (estadoControlMantenimiento) VALUES(_estadoControlMantenimiento);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarMarca` (IN `_marca` VARCHAR(20))  BEGIN
	INSERT INTO marca (marca) VALUES(_marca);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarModelo` (IN `_modelo` VARCHAR(20), IN `_idMarca` INT)  BEGIN
	INSERT INTO modelo (modelo, idMarca ) VALUES(_modelo, _idMarca);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarSolicitudM` (IN `_fechaSolicitudMantenimiento` DATE, IN `_codEquipo` VARCHAR(9), IN `_preDiagnostico` VARCHAR(100), IN `_idUsuario` INT)  BEGIN
	INSERT INTO solicitudmantenimiento (fechaSolicitudMantenimiento, codEquipo, preDiagnostico, idUsuario ) VALUES(_fechaSolicitudMantenimiento, _codEquipo, _preDiagnostico, _idUsuario );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoDisco` (IN `_tipoDisco` VARCHAR(10))  BEGIN
	INSERT INTO tipoDisco (tipoDisco) VALUES(_tipoDisco);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoEquipo` (IN `_tipoEquipo` VARCHAR(30))  BEGIN
	INSERT INTO tipoEquipo (tipoEquipo) VALUES(_tipoEquipo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoMantenimiento` (IN `_tipoMantenimiento` VARCHAR(10))  BEGIN
	INSERT INTO tipoMantenimiento (tipoMantenimiento) VALUES(_tipoMantenimiento);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarTipoRam` (IN `_tipoRam` VARCHAR(20))  BEGIN
	INSERT INTO tipoRam (tipoRam) VALUES(_tipoRam);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarUsuario` (IN `_codEmpleado` INT(10), IN `_fechaC` DATETIME, IN `_userName` VARCHAR(20), IN `_password` VARCHAR(20), IN `_fechaB` DATETIME)  BEGIN
         INSERT INTO usuario (codEmpleado, fechaCreacion, userName, password, fechaBaja) VALUES(_codEmpleado, _fechaC, _userName, _password, _fechaB);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarVelocidadRam` (IN `_velocidadRam` VARCHAR(20))  BEGIN
	INSERT INTO velocidadram (velocidadRam) VALUES(_velocidadRam);
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarAudiLog` ()  BEGIN
	SELECT audilog.idAudiLog, audiLog.fechaEvento, usuario.userName, tipotransaccion.tipoTransaccion, audiLog.descripcion FROM audilog INNER JOIN usuario  USING (idUsuario) INNER JOIN tipotransaccion USING(idTipoTransaccion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarBitacoraMantenimiento` ()  BEGIN
	SELECT bitacoramantenimiento.idBitacora, bitacoramantenimiento.fechaCambioEstado, solicitudmantenimiento.fechaSolicitudMantenimiento, estadocontrolmantenimiento.estadoControlMantenimiento FROM bitacoramantenimiento INNER JOIN estadocontrolmantenimiento  USING (idEstadoControlMantenimiento) INNER JOIN solicitudmantenimiento USING (idSolicitudMantenimiento);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarCapacidad` ()  BEGIN
	SELECT * FROM capacidad;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarCargo` ()  BEGIN
	SELECT cargo.idCargo, cargo.cargo, departamento.departamento FROM cargo  INNER JOIN departamento  USING (idDepartamento);
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarControlMantenimiento` ()  BEGIN
	SELECT controlmantenimiento.idControlMantenimiento, solicitudmantenimiento.idSolicitudMantenimiento,
    controlmantenimiento.idDepartamento, controlmantenimiento.fechaControlMantenimiento, equipo.codEquipo, equipo.descripcionEquipo, tipomantenimiento.tipoMantenimiento, 	 
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
                           ON controlmantenimiento.idEstadoControlMantenimiento = estadocontrolmantenimiento.idEstadoControlMantenimiento
						ORDER BY solicitudmantenimiento.fechaSolicitudMantenimiento DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarControlMantenimientoActualizacion` (IN `_idUsuario` INT)  BEGIN
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
                           ON controlmantenimiento.idEstadoControlMantenimiento = estadocontrolmantenimiento.idEstadoControlMantenimiento
WHERE controlmantenimiento.idUsuario = _idUsuario
ORDER BY controlmantenimiento.idControlMantenimiento DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarControlMantenimientoActualizacionX` (IN `_idUsuario` INT)  BEGIN
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
                           ON controlmantenimiento.idEstadoControlMantenimiento = estadocontrolmantenimiento.idEstadoControlMantenimiento

WHERE controlmantenimiento.idUsuario = _idUsuario
ORDER BY controlmantenimiento.idControlMantenimiento DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarDepartamento` ()  BEGIN
	SELECT * FROM departamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarDetalleEquipoC` ()  BEGIN
	SELECT detequipocomputadora.codEquipo, tiporam.tipoRam, capacidad.capacidad, velocidadram.velocidadRam, tipodisco.tipoDisco, capacidad.capacidad FROM detequipocomputadora INNER JOIN velocidadram  USING (idVelocidadRam) INNER JOIN capacidad USING (idCapacidad)  INNER JOIN tipodisco USING (idTipoDisco)  INNER JOIN tiporam USING (idTipoRam) INNER JOIN equipo USING (codEquipo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEmpleado` ()  BEGIN
	SELECT empleado.codEmpleado, empleado.nombres, empleado.apellidos,  empleado.telefono, empleado.celular, empleado.extension, sexo.sexo, cargo.cargo, empleado.correoElectronico,  CASE empleado.estado WHEN 0 THEN 'INACTIVO'                                                                                                                                                                   WHEN 1 THEN 'ACTIVO'                                                                                                                                        END AS estado
FROM empleado INNER JOIN cargo  USING (idCargo) INNER JOIN sexo USING (idSexo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEmpleado1` ()  BEGIN
	SELECT empleado.codEmpleado, concat(empleado.nombres, ' ', empleado.apellidos) as empleado, empleado.telefono, empleado.celular, sexo.sexo, cargo.cargo, empleado.estado FROM empleado INNER JOIN cargo  USING (idCargo) INNER JOIN sexo USING (idSexo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEmpresaGarantia` ()  BEGIN
	SELECT * FROM empresagarantia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEquipo` ()  BEGIN
	SELECT equipo.codEquipo, tipoequipo.tipoEquipo, equipo.descripcionEquipo, equipo.serie, equipo.serviceTag, modelo.modelo FROM equipo  INNER JOIN tipoequipo  USING (idTipoEquipo) INNER JOIN modelo USING (idModelo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEquipo1` ()  BEGIN
	SELECT equipo.codEquipo, equipo.numInventario, tipoequipo.tipoEquipo, modelo.modelo, equipo.serie, equipo.serviceTag, equipo.descripcionEquipo 
    FROM equipo  INNER JOIN tipoequipo USING (idTipoEquipo) 
    			 INNER JOIN modelo USING(idModelo) ;
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEstadoControlMant` ()  BEGIN
	SELECT idEstadoControlMantenimiento, estadoControlMantenimiento FROM estadocontrolmantenimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarEstadoControlMantenimiento` ()  BEGIN
	SELECT * FROM estadoControlMantenimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarMantenimientosPorUsuario` (IN `_idUsuario` INT)  BEGIN
SELECT equipo.codEquipo, tipoequipo.tipoEquipo, equipo.descripcionEquipo, 					
    		equipo.serie, equipo.serviceTag, modelo.modelo, controlmantenimiento.idControlMantenimiento,
            controlmantenimiento.idDepartamento, controlmantenimiento.fechaControlMantenimiento, controlmantenimiento.observacion
    FROM equipo  INNER JOIN tipoequipo  
    				USING (idTipoEquipo) 
                INNER JOIN modelo
                	USING (idModelo)
                 INNER JOIN asignacionequipo
                    USING (codEquipo)
                 INNER JOIN  controlmantenimiento
				    USING (idUsuario)
   WHERE controlmantenimiento.idUsuario = _idUsuario
   ORDER BY controlmantenimiento.idUsuario DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarMarca` ()  BEGIN
	SELECT * FROM marca;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarModelo` ()  BEGIN
	SELECT modelo.idModelo, modelo.modelo, marca.marca FROM modelo  INNER JOIN marca  USING (idMarca);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarModeloSelect` (IN `_marca` INT)  BEGIN
	SELECT modelo.idModelo, modelo.modelo, marca.marca FROM modelo  INNER JOIN marca  USING (idMarca)
WHERE modelo.idMarca = _marca;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarSexo` ()  BEGIN
	SELECT idSexo, sexo FROM sexo ORDER BY sexo ASC;
END$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarSolicitudMControl` ()  BEGIN
	SELECT solicitudmantenimiento.idSolicitudMantenimiento, solicitudmantenimiento.fechaSolicitudMantenimiento, equipo.descripcionEquipo, solicitudMantenimiento.preDiagnostico, concat(empleado.nombres, ' ', empleado.apellidos) as empleado
    FROM solicitudmantenimiento  INNER JOIN equipo  USING (codEquipo)
    							INNER JOIN usuario USING (idUsuario)
                                INNER JOIN empleado USING(codEmpleado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarSolicitudMRegistro` (IN `_idUsuario` INT)  BEGIN
	SELECT solicitudmantenimiento.idSolicitudMantenimiento, solicitudmantenimiento.fechaSolicitudMantenimiento, equipo.codEquipo, equipo.descripcionEquipo, tipoequipo.tipoEquipo, modelo.modelo, equipo.serviceTag, solicitudMantenimiento.preDiagnostico, usuario.userName, estadocontrolmantenimiento.estadoControlMantenimiento
    FROM solicitudmantenimiento  INNER JOIN equipo  
                                       ON solicitudmantenimiento.codEquipo = equipo.codEquipo
                                  INNER JOIN tipoequipo
                                       ON equipo.idTipoEquipo = tipoequipo.idTipoEquipo
                                  INNER JOIN modelo
                                       ON equipo.idModelo = modelo.idModelo
                                  INNER JOIN usuario
                                       ON solicitudmantenimiento.idUsuario = usuario.idUsuario
                                  INNER JOIN controlmantenimiento
                                  	USING(idSolicitudMantenimiento)
                                  INNER JOIN estadocontrolmantenimiento
                                  	USING(idEstadoControlMantenimiento)
  	WHERE solicitudmantenimiento.idUsuario = _idUsuario
    ORDER BY solicitudmantenimiento.idSolicitudMantenimiento DESC ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarSolicitudMRegistroX` (IN `_idUsuario` INT)  BEGIN
SELECT solicitudmantenimiento.idSolicitudMantenimiento, solicitudmantenimiento.fechaSolicitudMantenimiento, solicitudMantenimiento.preDiagnostico, equipo.codEquipo, equipo.codEquipo, equipo.descripcionEquipo, 
equipo.serviceTag, tipoequipo.tipoEquipo, modelo.modelo, usuario.userName, estadocontrolmantenimiento.estadoControlMantenimiento
    FROM solicitudmantenimiento  INNER JOIN equipo  
                                       ON solicitudmantenimiento.codEquipo = equipo.codEquipo
                                       INNER JOIN tipoequipo
                                       ON equipo.idTipoEquipo = tipoequipo.idTipoEquipo
                                       INNER JOIN modelo
                                       ON equipo.idModelo = modelo.idModelo
                                       INNER JOIN usuario
                                       ON solicitudmantenimiento.idUsuario = usuario.idUsuario
                                       INNER JOIN estadocontrolmantenimiento
                                  	   ON estadocontrolmantenimiento.idEstadoControlMantenimiento = controlmantenimiento.idEstadoControlMantenimiento
  	WHERE solicitudmantenimiento.idUsuario = _idUsuario
    ORDER BY solicitudmantenimiento.idSolicitudMantenimiento DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoDisco` ()  BEGIN
	SELECT * FROM tipoDisco;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoEquipo` ()  BEGIN
	SELECT * FROM tipoEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoMantenimiento` ()  BEGIN
	SELECT * FROM tipoMantenimiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarTipoRam` ()  BEGIN
	SELECT * FROM tiporam;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarUsuario` ()  BEGIN
	SELECT usuario.idUsuario, concat(empleado.nombres, ' ', empleado.apellidos) as empleado, usuario.fechaCreacion, usuario.userName, usuario.password, usuario.fechaBaja, CASE usuario.estado WHEN 0 THEN 'INACTIVO'                                                                                                                                                                   WHEN 1 THEN 'ACTIVO'                                                                                                                                        END AS estado
FROM usuario  INNER JOIN empleado  USING (codEmpleado);END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarUsuario1` ()  BEGIN
	SELECT usuario.idUsuario, concat(empleado.nombres, ' ', empleado.apellidos) as empleado, usuario.fechaCreacion, usuario.userName, usuario.password, usuario.fechaBaja, usuario.estado  FROM usuario  INNER JOIN empleado  USING (codEmpleado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarVelocidadRam` ()  BEGIN
	SELECT * FROM velocidadram;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleado` (IN `_codEmpleado` VARCHAR(10))  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN solicitudmantenimiento USING(idUsuario)
    							INNER JOIN empleado USING(codEmpleado)
    WHERE codEmpleado = _codEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleadoAsigEquipo` (IN `_idUsuario` INT)  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN asignacionequipo USING(idUsuario)
    							INNER JOIN empleado USING(codEmpleado)
    WHERE idUsuario = _idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleadoControlGarantia` (IN `_codEquipo` VARCHAR(9))  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN asignacionequipo USING(idUsuario)
    			INNER JOIN empleado USING(codEmpleado)
               	INNER JOIN equipo USING(codEquipo)
    WHERE codEquipo = _codEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCorreoEmpleadoControlMant` (IN `_codEquipo` VARCHAR(9))  BEGIN
	SELECT CONCAT(empleado.nombres, ' ', empleado.apellidos) as NombreEmpleado,empleado.correoElectronico
	from usuario INNER JOIN asignacionequipo USING(idUsuario)
    							INNER JOIN empleado USING(codEmpleado)
    WHERE codEquipo = _codEquipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerEmpresa` (IN `_idEmpresa` INT)  BEGIN
	SELECT nombreEmpresa 
	from empresagarantia
    WHERE idEmpresa = _idEmpresa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerUsuario` (IN `_usuario` VARCHAR(20), IN `_contraseña` VARCHAR(20))  BEGIN
    SELECT  *  from usuario 
    WHERE userName = _usuario  AND password = _contraseña ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerUsuarioLogeado` (IN `_userName` VARCHAR(20))  BEGIN
	select idUsuario, userName 
	FROM usuario
	WHERE userName = _userName;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verificarUsuario` (IN `_usuario` VARCHAR(20), IN `_contraseña` VARCHAR(20))  BEGIN
    SELECT  usuario.idUsuario, empleado.codEmpleado, usuario.estado, concat(empleado.nombres, '  ' ,empleado.apellidos) as empleado  
from usuario INNER JOIN empleado USING(codEmpleado)
    WHERE userName = _usuario  AND password = _contraseña  AND usuario.estado = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accesos`
--

CREATE TABLE `accesos` (
  `idaccessLog` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `accessToken` varchar(90) DEFAULT NULL,
  `accessUrl` varchar(255) DEFAULT NULL,
  `accesosFecha` datetime DEFAULT NULL,
  `accesoEstado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accesos`
--

INSERT INTO `accesos` (`idaccessLog`, `idUsuario`, `accessToken`, `accessUrl`, `accesosFecha`, `accesoEstado`) VALUES
(1, 0, '$2y$10$d4tj2RWRk8UmqrExXr1Zxe0QVnDZjD.Jlyr.t7u.cPoW6VhTRR4MC', 'login', '0000-00-00 00:00:00', 0),
(2, 119, '$2y$10$XXf6biMiiyN6/c2SktVsN.p9bp7P4ypcJ40Kdstcpo5PQbzaeYwW.', 'login', '0000-00-00 00:00:00', 0),
(3, 119, '$2y$10$O.eT2UZYhICr2pV0L7FSaeTtmQ3szHxeH/iXqdbFp2zeJQAQVfQ12', 'login', '2021-03-28 15:55:24', 0),
(4, 119, '$2y$10$.xfm9dKKd0n2pvmX/NyUO.lDpiOEnmxgLHtMBtTHNSTxjmsf72uOe', 'login', '2021-04-28 15:56:50', 0),
(5, 119, '$2y$10$nWtMD6zrwwr3ZwIhktRBfetpGVD9u88gUzXXbuPIvtyjApj5i.Kne', 'login', '2021-04-28 16:31:41', 0),
(6, 119, '$2y$10$p6EcYNIH.4yF5w/e/KM6F.jvzaApXcWaRvovV0IOS1hDuNxHJ028e', 'login', '2021-04-28 17:39:34', 0),
(7, 119, '$2y$10$RrZedQXMlbItshh98szS4OzQpXHjP3/4ISYrE9DvB4O7PX0Nokk9y', 'login', '2021-04-28 22:53:20', 0),
(8, 119, '$2y$10$JLUD/cPtYNvkeTWkOF0gkO9fKR2l58pyZNSghXTO1rvVaxcxfuQ7a', 'login', '2021-04-28 22:53:56', 0),
(9, 119, '$2y$10$m5/4ZWvWRo63s04l0C4mwOHqetupNTHlK.P13Xo1ToFiJbqi46wXi', 'login', '2021-04-28 22:54:42', 0),
(10, 119, '$2y$10$24d8z8SI7F8wJQUTAm2Lt./T4o1XrJ/iMZD1vzxQtMma6vO/ZDY7C', 'login', '2021-04-28 22:55:09', 0),
(11, 119, '$2y$10$PnM8MjdfH7hG9gNYcO1KZOcc1E3fz2ZFg6nCGk4puac489oh.vyZC', 'login', '2021-04-28 23:00:58', 0),
(12, 119, '$2y$10$PBJ0pibMfli76xgwvbulwepmaYp/2HCk536G9IE.Bp4SBLOm2cbNm', 'login', '2021-04-28 23:01:52', 0),
(13, 119, '$2y$10$JEGSI6hSwwFTK3Mp1VHSDuMIhNNjOZMSZSpNZcYtMuYWD.bH.DQLu', 'login', '2021-04-28 23:02:09', 0),
(14, 119, '$2y$10$Ypv8y8HWhOn4BBeKFltRUu/SJLhxH5u2JvjyTc48Mj8Jbr.iW0BSq', 'login', '2021-04-28 23:03:44', 0),
(15, 119, '$2y$10$2lM2a/OhPWa80jcfN3Jr1Os9CFPV54wHwCIiOUSjHIKQLw1bZltCC', 'login', '2021-04-28 23:04:43', 0),
(16, 119, '$2y$10$WIGY9lBGuzFLejLfmuito.RdMNV59vufUN9DwtgL9tfDJt8.PLbrq', 'login', '2021-04-28 23:08:47', 0),
(17, 119, '$2y$10$axIAC/RORGT4MmOdnPKHc.gbV219bdUXnp3rOI50VUxqUPfDRfB4m', 'login', '2021-04-28 23:09:27', 0),
(18, 119, '$2y$10$FZHU3QLWHX1nM7ltrOSCguNeYw9HL8N2MTIscRBfk3ysXvhfzOAru', 'login', '2021-04-28 23:25:02', 0),
(19, 119, '$2y$10$QYQAXLEvqH6jhXHT.Hv5K.dPotFuRnNlAB8az5uZGidp1vTVv7YUO', 'login', '2021-04-28 23:35:28', 0),
(20, 119, '$2y$10$FGDaPhtWLIk9a2JWwpOiM.ADozG8hY47ZvkBr.vCryBkeyZYIotOq', 'login', '2021-04-28 23:56:24', 0),
(21, 119, '$2y$10$4yYJPyvwncht0iDlv9cnOexn4QHx9G4mbUMw5obLcis7a7aNIujha', 'login', '2021-04-29 00:11:40', 0),
(22, 119, '$2y$10$gGs2/RX5HfB.i9a5xHkCPOV5j8GXQipy9USCPzh3IAbGRG9E.QRx.', 'login', '2021-04-29 01:17:03', 0),
(23, 119, '$2y$10$Kt3XU8PYNoRCnLjFk1.mq.bGLzmzErwYs9WNH/0Kf7abs0fjoFJKu', 'login', '2021-04-29 01:36:32', 0),
(24, 119, '$2y$10$9QoAFGy0V54tUA3PS2AI/OAetnW8PlI0eGUR/zN.OBEce5zN071rS', 'login', '2021-04-29 01:47:57', 0),
(25, 116, '$2y$10$Q3HBkvRsCrnLXC/B.w3v6eqFRVFy5fiRCef9pcrmGEKl1JeZqRWv.', 'login', '2021-04-29 02:00:17', 1),
(26, 119, '$2y$10$SAekmjQ84IaFlM3FNWX3aOcEL7wQQ.T5Kvni3z3PhpB92D5qs18H2', 'login', '2021-04-29 02:00:32', 0),
(27, 119, '$2y$10$xu09KmnH8z4cEvXbP4g3.O.b95Lk7MrxqMDf/YQTTO9f/MvpLpTvS', 'login', '2021-04-29 02:07:28', 0),
(28, 119, '$2y$10$TTQDSdeQTp1UaSmlhHvyJO5NULZV3wZPr5UoGvbYqaYZDMNpsmkJG', 'login', '2021-04-29 02:27:46', 0),
(29, 119, '$2y$10$TcZo3Cfa9S/tGSHQvbEC1eqjtsfaxKsnKmoDzX0xzgMK/hfykusYa', 'login', '2021-04-29 02:29:06', 0),
(30, 119, '$2y$10$w57QyXPOaYeSJqPEBclD9.iJozAimLJSt9rt.5tMW5rN3es5F.3RC', 'login', '2021-04-29 15:04:03', 0),
(31, 119, '$2y$10$9n702v2S6Xk06wIyH1Wzb.EItVKRCL6BvYfmPIMHKmsSbQ0CyXLWC', 'login', '2021-04-29 22:33:42', 1),
(32, 119, '$2y$10$IQrWj0ZAZB/W0fbdh0N7J.YTA5.DT.ABMlZPOncdm6L.HKJHbT/ky', 'login', '2021-04-29 22:53:20', 0),
(33, 116, '$2y$10$mEyzDARLMA5IZoFNs.bp5OqouCLI9//RGHt6qBnm/NRULqe1BsX3C', 'login', '2021-04-29 23:00:34', 0),
(34, 119, '$2y$10$ZR1aFRCDZV7T5m7IGnKVqebOF8VkI/pvPTNeUPCQUigsTxj5gMVam', 'login', '2021-04-29 23:03:55', 0),
(35, 116, '$2y$10$ny4RjwmgvOO2/8vSYIB85uhVDh/qpU1l.xIF/rElzlPfkqa2l2gjW', 'login', '2021-04-29 23:11:24', 0),
(36, 119, '$2y$10$iJsAyKigXL/6Vz02AgoKgOhFZl5JgGObL5MJdlpCZuIH85UaQpnwO', 'login', '2021-04-29 23:43:34', 0),
(37, 116, '$2y$10$wpBN8FSnhXwTl2AL7rvTv.5KYnc40WQ7NSBB1zpTLPKeRjTDy3g5O', 'login', '2021-04-29 23:43:59', 0),
(38, 116, '$2y$10$unvxuD/e9TE5Ej6Ku02Kqe0aZXU81MJEVgyE152cwK1O.E7RUawG6', 'login', '2021-04-30 01:03:47', 0),
(39, 117, '$2y$10$zYQfM01KBHTXa1A8gQ1s7OjJi.HpJZrNfnCVhZG4GFtARZxZMb..a', 'login', '2021-04-30 01:04:11', 0),
(40, 119, '$2y$10$6V6bYW0JH7gjgOSc8hfiwe7iPD96Q25QUFNW7NJN1y2MDh75u.xjq', 'login', '2021-04-30 12:34:49', 1),
(41, 119, '$2y$10$mq9M18ED9viYqvGuWq3/weKE.4xWGnIAhvLgsTc4rlHaGAtVr0OeC', 'login', '2021-04-30 14:53:45', 0),
(42, 117, '$2y$10$FJNfXXHZaBMbRPVw/V3bzeSoupDmgdyEV27EMIB5B/tgFu7tJ0Wn2', 'login', '2021-04-30 14:54:19', 0),
(43, 119, '$2y$10$hSb/E6PwM0RCyXFaKN/ZGOLNDC/Wjj97IJCxE/DXOZ3dLq6w.FmZW', 'login', '2021-04-30 16:07:14', 1),
(44, 117, '$2y$10$N.uc4ymO0KBUIkoqKLi/cOsGXvo6xgSol5/cj6qS686I4Thb3kSDK', 'login', '2021-05-03 14:56:59', 0),
(45, 119, '$2y$10$NkaAIIICLBtJfegu.v/.0eUkap7wjOTrU6hQ6po0DGMS/h731qx.6', 'login', '2021-05-03 15:00:46', 0),
(46, 116, '$2y$10$uDUI.0julEmoLOik9fuI9u.6yuaQdI.lB.a22IkizSgtlPQN3.iyW', 'login', '2021-05-03 15:04:35', 0),
(47, 119, '$2y$10$JoyDU11OztLGUXzP2Hl.oumy9x6soOXFJpk.oN11ivvD0cr9cOh2e', 'login', '2021-05-03 15:12:41', 0),
(48, 116, '$2y$10$Cf1Epat5pSRjjY78L4GVg.J1D05H9X3wY0B17.w1cNSOf9502w1XG', 'login', '2021-05-03 15:52:05', 0),
(49, 119, '$2y$10$/.LeZXkx6ibUcK8WFzwxBOYNCPF1K6lY3y3Epai66DG1Kb9gJZhrS', 'login', '2021-05-03 22:28:52', 1),
(50, 119, '$2y$10$l9GTczw7z2ATpG4De2.NxeQdufBApVphcajDCVXOgJ/X1IZn1TKxC', 'login', '2021-05-03 22:29:59', 0),
(51, 119, '$2y$10$K466iWGvIyPacpNnY9/Qwu8HZ3B8cFe9fj3eAWQqEzKZSBm2rp5jm', 'login', '2021-05-03 22:30:55', 1),
(52, 119, '$2y$10$ntIwiNXXBNWpWiSYy1B58.3QtLpt7ufZ31fy5HqYY61BHQOfPn2gm', 'login', '2021-05-03 22:34:54', 0),
(53, 116, '$2y$10$mgcX2eY29kELWqa90BdLkexxlZYj3A9UEGUAGrdA8RQsZw/h/XjJO', 'login', '2021-05-03 22:35:21', 0),
(54, 116, '$2y$10$McN94ibwYGTof5uS9iA3/u9u3.m5QpZTR8NHOt6tUvIAS9JCELdOS', 'login', '2021-05-03 23:04:53', 1),
(55, 116, '$2y$10$60FkUTOvz2nv80RLQ0yzmOKjTpQlebiN5wI8OFYeT1TomO5IS2ryG', 'login', '2021-05-03 23:24:16', 0),
(56, 117, '$2y$10$IbQAjN3FzbuldSj9VK0ZpePOgdiWWQNNx8eKBkZqsVglmARgCyw9G', 'login', '2021-05-03 23:25:10', 1),
(57, 119, '$2y$10$wJFz7RUNZR5kO6oDNYPklePNUw6EOZnr9yi938ToYFw3/51sdh8bi', 'login', '2021-05-03 23:28:56', 0),
(58, 116, '$2y$10$gqQ4TOQR4dVRPFVWcr/07.OiOgAhpm1JVwnq9Pm7i7GzBD4Xa4O3.', 'login', '2021-05-03 23:29:55', 0),
(59, 117, '$2y$10$teX6BlMbs5GFd/dyEcXTIOI7rydKwtBqCWdgyJJaEYeL5oy2ThieC', 'login', '2021-05-03 23:30:26', 0),
(60, 117, '$2y$10$vg4kb8Y0M.Yy2/nwTywwtOgO/HdRw6w5eDENN1z2F.BIUrgSJMm.e', 'login', '2021-05-03 23:30:53', 0),
(61, 119, '$2y$10$m2hpKuqO3bs14Gvik6JTW.8J5SSHRoJLK9u00VEGWQU7h4HMXu5Cu', 'login', '2021-05-04 00:09:51', 0),
(62, 116, '$2y$10$9ZuhAdwwe/JkPnAqE4J3SOmEkcnwNX/nhJ4HQ4WPO0iqBE00p6k2S', 'login', '2021-05-04 00:10:05', 0),
(63, 116, '$2y$10$pncXTxbqL7NaNrZoe40J6OA7TrkLHyKgGc63JXf9o.PwPVowhX74O', 'login', '2021-05-04 00:17:12', 0),
(64, 119, '$2y$10$yTx6UKVC2cw.n7xBglHqH.f4QGZ5nQAF9zvbcb40J7OWO.CQMtRMi', 'login', '2021-05-04 00:17:47', 0),
(65, 119, '$2y$10$XmYuz5r0cTR69owSHFQK.uIkZXBSh/mlo0.k33t9ZEs0CVct6r3Om', 'login', '2021-05-04 00:18:06', 0),
(66, 119, '$2y$10$.JDY1nRtmwtkiU6ARzx35.4qkOjYAUMOitP7EZUWmrMFbN6whqwFK', 'login', '2021-05-04 00:18:33', 0),
(67, 119, '$2y$10$xko8X98Ao/jgkGESliDVi.B64zhpSI/nRfbDI7mZVWh3s9fGVeQTi', 'login', '2021-05-04 00:21:12', 1),
(68, 119, '$2y$10$fzkoCqGsIUx.f6Kr4Vm.Pej6.lzq4IdVICJlrGd/iotumcdCZLmMS', 'login', '2021-05-04 00:32:30', 0),
(69, 119, '$2y$10$EFslAhAnvQuvWuSVqoDfkOKJyKDyE55tAfOPd/yqhlgi5TlUNWhBq', 'login', '2021-05-04 00:32:46', 1),
(70, 119, '$2y$10$JhDE2.Z0f72tbSYCbN4QOelqvzINMWTLnMjFD7tdHcGzZWwWZRKBm', 'login', '2021-05-04 00:33:23', 0),
(71, 119, '$2y$10$EeGTM9k4Jy0Hwv0Vspieseg9E1RD1SMTAzowISbPBitXMe8koXbXa', 'login', '2021-05-04 00:44:31', 0),
(72, 117, '$2y$10$VvHMZB8Cpxcz49zlJ/nq.ePYNwyAFay7tQ5/o3hoLi/tWzKoQfS0m', 'login', '2021-05-04 00:44:58', 0),
(73, 119, '$2y$10$yp2H6biQbZB77jfhNqZAXuSq712D0780jGksljXCDIhEzX3SFMs3.', 'login', '2021-05-04 16:21:06', 0),
(74, 119, '$2y$10$AbWViwHeXO8nVwl5Kahvju5FBhFkA0dhDnSenMYCiO9MtLjWPIU7K', 'login', '2021-05-04 16:21:29', 0),
(75, 117, '$2y$10$SJTzFV.fbVWEU9X51WZ1qOpt5HsZUNqo6S4CRQ/0IEqatK0DkG2F2', 'login', '2021-05-04 16:21:41', 0),
(76, 119, '$2y$10$mJ4213nnJANzFNQcSJLqb.A87bsd9GwmXPDp13c.zat2idMrW2O8K', 'login', '2021-05-04 16:25:24', 0),
(77, 116, '$2y$10$Ve5Q7QpM9.l0dEIWPanuoOFe31.GVXeHZEWE7w2wod5Hy6snYNc3C', 'login', '2021-05-04 16:26:28', 0),
(78, 117, '$2y$10$mMjEpwZsFzieivvzsI2KQ.KbWVWBp/1DdR8kgPfFZgodEMflF0XDW', 'login', '2021-05-04 16:26:48', 0),
(79, 119, '$2y$10$xhKLQ4pNDjczC1uLBByziudFlUbyUubzYb8e.EJgE1kzzbYKybyl2', 'login', '2021-05-04 16:27:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `asignacionequipo`
--

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
-- Dumping data for table `asignacionequipo`
--

INSERT INTO `asignacionequipo` (`idAsignacionEquipo`, `fechaAsignacion`, `codEquipo`, `observacion`, `fechaBaja`, `estado`, `idUsuario`) VALUES
(5, '2021-02-11', '031', 'laptop reciente', NULL, 1, 116),
(14, '2021-02-09', '1998', 'hjfgj', '0000-00-00', 1, 116),
(15, '2021-02-10', '123456', 'dfs', '0000-00-00', 1, 117),
(16, '2021-03-10', '789', 'Se asigno con un peque;o detalle en su case', '0000-00-00', 1, 116);

--
-- Triggers `asignacionequipo`
--
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
-- Table structure for table `audilog`
--

CREATE TABLE `audilog` (
  `idAudiLog` int(11) NOT NULL,
  `fechaEvento` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audilog`
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
(212, '2021-03-11 15:33:02', 116, 'Se insertó el registro en controlmantenimiento con Id 33', 1),
(213, '2021-03-24 00:20:25', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(214, '2021-03-24 00:20:28', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(215, '2021-05-04 17:32:57', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(216, '2021-05-04 18:36:32', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(217, '2021-05-04 18:42:35', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(218, '2021-05-04 18:42:35', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(219, '2021-05-04 18:42:35', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(220, '2021-05-04 18:44:24', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(221, '2021-05-04 18:44:24', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(222, '2021-05-04 18:44:45', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(223, '2021-05-04 18:45:26', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(224, '2021-05-04 18:47:03', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(225, '2021-05-04 18:47:03', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(226, '2021-05-04 18:49:15', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(227, '2021-05-04 18:49:15', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(228, '2021-05-04 21:44:59', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(229, '2021-05-04 21:45:06', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(230, '2021-05-04 21:52:32', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(231, '2021-05-04 21:53:11', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(232, '2021-05-04 21:56:00', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(233, '2021-05-04 21:56:09', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(234, '2021-05-04 22:00:12', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(235, '2021-05-04 22:00:20', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(236, '2021-05-04 22:00:30', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(237, '2021-05-04 22:01:23', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(238, '2021-05-04 22:01:51', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(239, '2021-05-04 22:01:59', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(240, '2021-05-04 22:09:22', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(241, '2021-05-04 22:10:48', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(242, '2021-05-04 22:10:58', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(243, '2021-05-04 22:13:45', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(244, '2021-05-04 22:13:45', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(245, '2021-05-04 22:20:05', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(246, '2021-05-04 22:24:01', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(247, '2021-05-04 22:24:37', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(248, '2021-05-04 22:24:37', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(249, '2021-05-04 22:27:12', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2),
(250, '2021-05-04 22:27:35', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(251, '2021-05-04 22:28:05', 116, 'Se actualizó el registro en controlmantenimiento con Id 32', 2),
(252, '2021-05-04 22:28:05', 116, 'Se actualizó el registro en controlmantenimiento con Id 33', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bitacoramantenimiento`
--

CREATE TABLE `bitacoramantenimiento` (
  `idBitacora` int(11) NOT NULL,
  `fechaCambioEstado` date NOT NULL,
  `idSolicitudMantenimiento` int(11) NOT NULL,
  `idEstadoControlMantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `capacidad`
--

CREATE TABLE `capacidad` (
  `idCapacidad` int(11) NOT NULL,
  `capacidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `capacidad`
--

INSERT INTO `capacidad` (`idCapacidad`, `capacidad`) VALUES
(2, '256gb'),
(5, '48gb'),
(1, '512gb'),
(3, '64gb');

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`idCargo`, `cargo`, `idDepartamento`) VALUES
(1, 'admin', 1),
(2, 'asistente', 2),
(4, 'tercero', 1),
(5, 'Gerent', 2),
(13, 'contadora', 1),
(14, 'tecnico', 3),
(15, 'personal', 3);

-- --------------------------------------------------------

--
-- Table structure for table `controlgarantia`
--

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
-- Dumping data for table `controlgarantia`
--

INSERT INTO `controlgarantia` (`idControlGarantia`, `codEquipo`, `fechaInicio`, `fechaVencimiento`, `estado`, `idEmpresa`, `telefonoContacto`, `correoElectronico`, `idUsuario`) VALUES
(43, '031', '2021-02-18', '2021-02-19', 1, 1, '', '', 117),
(53, '123456', '2021-03-11', '2021-04-08', 1, 1, '', '', 117),
(54, '789', '2021-03-08', '2021-03-26', 1, 1, '', '', 117),
(58, '1998', '2021-03-05', '2021-03-30', 1, 1, '', '', 117);

-- --------------------------------------------------------

--
-- Table structure for table `controlmantenimiento`
--

CREATE TABLE `controlmantenimiento` (
  `idControlMantenimiento` int(11) NOT NULL,
  `fechaControlMantenimiento` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idTipoMantenimiento` int(11) NOT NULL,
  `idSolicitudMantenimiento` int(11) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  `idEstadoControlMantenimiento` int(11) NOT NULL,
  `idDepartamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `controlmantenimiento`
--

INSERT INTO `controlmantenimiento` (`idControlMantenimiento`, `fechaControlMantenimiento`, `idUsuario`, `idTipoMantenimiento`, `idSolicitudMantenimiento`, `observacion`, `idEstadoControlMantenimiento`, `idDepartamento`) VALUES
(32, '2021-03-10', 116, 2, 153, 'dfgfd', 1, 1),
(33, '2021-03-20', 116, 1, 155, 'chcgf', 2, 2);

--
-- Triggers `controlmantenimiento`
--
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
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `departamento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `departamento`) VALUES
(1, 'admin'),
(2, 'gerencia.'),
(3, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `detequipocomputadora`
--

CREATE TABLE `detequipocomputadora` (
  `codEquipo` varchar(9) NOT NULL,
  `idTipoRam` int(11) NOT NULL,
  `idCapacidad` int(11) NOT NULL,
  `idVelocidadRam` int(11) NOT NULL,
  `idTipoDisco` int(11) NOT NULL,
  `idCapacidadDisco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detequipocomputadora`
--

INSERT INTO `detequipocomputadora` (`codEquipo`, `idTipoRam`, `idCapacidad`, `idVelocidadRam`, `idTipoDisco`, `idCapacidadDisco`) VALUES
('1998', 1, 1, 1, 3, 5),
('789', 1, 1, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

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
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`codEmpleado`, `nombres`, `apellidos`, `telefono`, `celular`, `extension`, `idSexo`, `idCargo`, `correoElectronico`, `estado`) VALUES
(1975, 'Omar', 'McClellan', '22551946', '98051583', '200-000', 1, 1, 'omar.mcclellan@gmail.com', 1),
(1998, 'Angel', 'mendoza', '2782-4403', '3394-7239', '', 1, 15, 'joseangel.mendoza98@gmail.com', 1),
(2222, 'Ramon', 'Lopez', '2780-5014', '9988-7766', '200-032', 1, 1, 'wilson.villanueva@unah.edu.hn', 1),
(12281, 'wilson', 'villanueva', '2780-4250', '', '200-031', 1, 14, 'joseangel.mendoza98@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `empresagarantia`
--

CREATE TABLE `empresagarantia` (
  `idEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `empresagarantia`
--

INSERT INTO `empresagarantia` (`idEmpresa`, `nombreEmpresa`) VALUES
(1, 'Jestereo'),
(4, 'Tropigas');

-- --------------------------------------------------------

--
-- Table structure for table `equipo`
--

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
-- Dumping data for table `equipo`
--

INSERT INTO `equipo` (`codEquipo`, `numInventario`, `idTipoEquipo`, `idModelo`, `serie`, `serviceTag`, `descripcionEquipo`) VALUES
('.63.66', '1', 3, 7, '.63.', '.3.3', '.63.3.'),
('031', '', 3, 1, '255', '780', 'sd'),
('123', '1', 3, 5, '987', '789', 'Adquisición'),
('123456', '', 4, 8, 'huhuuuh55', '', 'no funciona'),
('1998', '', 3, 5, '789', '987', 'Laptop en buen estado'),
('789', 'V-2113', 3, 1, '849', '874', 'escritorio'),
('965', '1', 1, 7, '123456', 'tag01', 'Impresora matricial'),
('hp1220', '', 3, 1, '655656156', '62156165', 'jnfnjn');

-- --------------------------------------------------------

--
-- Table structure for table `equipoimagenes`
--

CREATE TABLE `equipoimagenes` (
  `idEquipoImagen` int(11) NOT NULL,
  `idControlMantenimiento` varchar(8) CHARACTER SET utf8mb4 DEFAULT NULL,
  `imagenEquipoUrl` varchar(900) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `equipoimagenes`
--

INSERT INTO `equipoimagenes` (`idEquipoImagen`, `idControlMantenimiento`, `imagenEquipoUrl`) VALUES
(9, '32', '../inicio/dist/img/equipos/3a063ef0c77a14bd00ff8fdf992489ec.jpg'),
(10, '32', '../inicio/dist/img/equipos/71h6PpGaz9L._AC_SL1500_.jpg'),
(11, '32', '../inicio/dist/img/equipos/81OyDqVoEaL._AC_SL1500_.jpg'),
(12, '32', '../inicio/dist/img/equipos/Acer_Aspire_8920_Gemstone.jpg'),
(13, '32', '../inicio/dist/img/equipos/D_NQ_NP_631499-MEC44797955395_022021-O.jpg'),
(14, '32', '../inicio/dist/img/equipos/portatil-gaming.jpg'),
(15, '32', '../inicio/dist/img/equipos/RE3oYjc.png'),
(16, '32', '../inicio/dist/img/equipos/SsPtibC5nHvucgYkKckDHL.jpg'),
(17, '32', '../inicio/dist/img/equipos/Webp.net-resizeimage (1).jpg'),
(18, '33', '../inicio/dist/img/equipos/40386104-01-BASEIMAGE-Midres.jpg'),
(19, '33', '../inicio/dist/img/equipos/HTB1eeowbiLrK1Rjy1zdq6ynnpXa1.jpg'),
(20, '33', '../inicio/dist/img/equipos/photo2.png'),
(21, '32', '../inicio/dist/img/equipos/23722727_1559324220827332_902414871947732586_n.jpg'),
(22, '33', '../inicio/dist/img/equipos/145741953_4358771220803861_3642026239701909001_n.jpg'),
(23, '33', '../inicio/dist/img/equipos/received_679077055812575.png'),
(24, '33', '../inicio/dist/img/equipos/BeardManPhoto_20180927_072913.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `estadocontrolmantenimiento`
--

CREATE TABLE `estadocontrolmantenimiento` (
  `idEstadoControlMantenimiento` int(11) NOT NULL,
  `estadoControlMantenimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estadocontrolmantenimiento`
--

INSERT INTO `estadocontrolmantenimiento` (`idEstadoControlMantenimiento`, `estadoControlMantenimiento`) VALUES
(1, 'Diagnosticado'),
(2, 'En reparación'),
(3, 'Finalizado');

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marca`
--

INSERT INTO `marca` (`idMarca`, `marca`) VALUES
(2, 'dell'),
(1, 'hp'),
(4, 'Lenovo');

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `idMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modelo`
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
-- Table structure for table `notificacion`
--

CREATE TABLE `notificacion` (
  `idNotificacion` int(11) NOT NULL,
  `idControlMantenimiento` int(11) DEFAULT NULL,
  `idEstadoNotificacion` int(11) DEFAULT NULL,
  `estadoNotificacion` varchar(45) DEFAULT NULL,
  `fechaNotificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notificacion`
--

INSERT INTO `notificacion` (`idNotificacion`, `idControlMantenimiento`, `idEstadoNotificacion`, `estadoNotificacion`, `fechaNotificacion`) VALUES
(0, 32, 2, 'read', '2021-03-10 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sexo`
--

CREATE TABLE `sexo` (
  `idSexo` int(11) NOT NULL,
  `sexo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sexo`
--

INSERT INTO `sexo` (`idSexo`, `sexo`) VALUES
(2, 'femenino'),
(1, 'masculino');

-- --------------------------------------------------------

--
-- Table structure for table `solicitudmantenimiento`
--

CREATE TABLE `solicitudmantenimiento` (
  `idSolicitudMantenimiento` int(11) NOT NULL,
  `fechaSolicitudMantenimiento` date NOT NULL,
  `codEquipo` varchar(9) NOT NULL,
  `preDiagnostico` varchar(100) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `solicitudmantenimiento`
--

INSERT INTO `solicitudmantenimiento` (`idSolicitudMantenimiento`, `fechaSolicitudMantenimiento`, `codEquipo`, `preDiagnostico`, `idUsuario`) VALUES
(153, '2021-03-10', '1998', 'dsfdf', 116),
(154, '2021-03-10', '123456', 'vb', 117),
(155, '2021-03-27', '789', 'sfdnbd', 116);

--
-- Triggers `solicitudmantenimiento`
--
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
-- Table structure for table `tipodisco`
--

CREATE TABLE `tipodisco` (
  `idTipoDisco` int(11) NOT NULL,
  `tipoDisco` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipodisco`
--

INSERT INTO `tipodisco` (`idTipoDisco`, `tipoDisco`) VALUES
(2, 'HDD'),
(3, 'SSD');

-- --------------------------------------------------------

--
-- Table structure for table `tipoequipo`
--

CREATE TABLE `tipoequipo` (
  `idTipoEquipo` int(11) NOT NULL,
  `tipoEquipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipoequipo`
--

INSERT INTO `tipoequipo` (`idTipoEquipo`, `tipoEquipo`) VALUES
(3, 'Computadora'),
(1, 'Impresora'),
(4, 'UPS');

-- --------------------------------------------------------

--
-- Table structure for table `tipomantenimiento`
--

CREATE TABLE `tipomantenimiento` (
  `idTipoMantenimiento` int(11) NOT NULL,
  `tipoMantenimiento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipomantenimiento`
--

INSERT INTO `tipomantenimiento` (`idTipoMantenimiento`, `tipoMantenimiento`) VALUES
(2, 'Correctivo'),
(1, 'Preventivo'),
(3, 'rutinajhj');

-- --------------------------------------------------------

--
-- Table structure for table `tiporam`
--

CREATE TABLE `tiporam` (
  `idTipoRam` int(11) NOT NULL,
  `tipoRam` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiporam`
--

INSERT INTO `tiporam` (`idTipoRam`, `tipoRam`) VALUES
(3, 'ddr2'),
(1, 'ddr3'),
(2, 'ddr4');

-- --------------------------------------------------------

--
-- Table structure for table `tipotransaccion`
--

CREATE TABLE `tipotransaccion` (
  `idTipoTransaccion` int(11) NOT NULL,
  `tipoTransaccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipotransaccion`
--

INSERT INTO `tipotransaccion` (`idTipoTransaccion`, `tipoTransaccion`) VALUES
(2, 'Actualización'),
(3, 'Eliminación'),
(1, 'Inserción');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `codEmpleado` int(10) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fechaBaja` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fotoUsuario` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `codEmpleado`, `fechaCreacion`, `userName`, `password`, `fechaBaja`, `estado`, `fotoUsuario`) VALUES
(116, 1998, '2021-01-31', 'angel', '81dc9bdb52d04dc20036', '0000-00-00', 1, '../inicio/dist/img/FB_IMG_1590298797825.jpg'),
(117, 12281, '2021-02-11', 'wilson', 'abd7372bba5557759073', '0000-00-00', 1, '../inicio/dist/img/Nocturnal Vampir Merge1.jpg'),
(118, 2222, '2021-03-10', 'ramon', '266575d3c2b8a34f8381', '0000-00-00', 1, NULL),
(119, 1975, '2021-03-16', 'Omarukun', 'aee708bca6c595ed8bdd', '0000-00-00', 1, '../inicio/dist/img/FB_IMG_1449247286473.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `velocidadram`
--

CREATE TABLE `velocidadram` (
  `idVelocidadRam` int(11) NOT NULL,
  `velocidadRam` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `velocidadram`
--

INSERT INTO `velocidadram` (`idVelocidadRam`, `velocidadRam`) VALUES
(2, '4gb'),
(3, '512rpm'),
(1, '8gb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`idaccessLog`);

--
-- Indexes for table `asignacionequipo`
--
ALTER TABLE `asignacionequipo`
  ADD PRIMARY KEY (`idAsignacionEquipo`),
  ADD KEY `codEquipo` (`codEquipo`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `audilog`
--
ALTER TABLE `audilog`
  ADD PRIMARY KEY (`idAudiLog`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idTipoTransaccion` (`idTipoTransaccion`);

--
-- Indexes for table `bitacoramantenimiento`
--
ALTER TABLE `bitacoramantenimiento`
  ADD PRIMARY KEY (`idBitacora`),
  ADD KEY `idEstadoControlMantenimiento` (`idEstadoControlMantenimiento`),
  ADD KEY `idSolicitudMantenimiento` (`idSolicitudMantenimiento`);

--
-- Indexes for table `capacidad`
--
ALTER TABLE `capacidad`
  ADD PRIMARY KEY (`idCapacidad`),
  ADD UNIQUE KEY `capacidad` (`capacidad`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`),
  ADD UNIQUE KEY `cargo` (`cargo`),
  ADD KEY `idDepartamento` (`idDepartamento`);

--
-- Indexes for table `controlgarantia`
--
ALTER TABLE `controlgarantia`
  ADD PRIMARY KEY (`idControlGarantia`),
  ADD KEY `codEquipo` (`codEquipo`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  ADD PRIMARY KEY (`idControlMantenimiento`),
  ADD KEY `idSolicitudMantenimiento` (`idSolicitudMantenimiento`),
  ADD KEY `idTipoMantenimiento` (`idTipoMantenimiento`),
  ADD KEY `idEstadoControlMantenimiento` (`idEstadoControlMantenimiento`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD UNIQUE KEY `departamento` (`departamento`);

--
-- Indexes for table `detequipocomputadora`
--
ALTER TABLE `detequipocomputadora`
  ADD PRIMARY KEY (`codEquipo`) USING BTREE,
  ADD KEY `idVelocidadRam` (`idVelocidadRam`),
  ADD KEY `idCapacidadRam` (`idCapacidad`),
  ADD KEY `idCapacidadDisco` (`idCapacidadDisco`),
  ADD KEY `idTipoDisco` (`idTipoDisco`),
  ADD KEY `idTipoRam` (`idTipoRam`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codEmpleado`),
  ADD KEY `idCargo` (`idCargo`),
  ADD KEY `idSexo` (`idSexo`);

--
-- Indexes for table `empresagarantia`
--
ALTER TABLE `empresagarantia`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indexes for table `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`codEquipo`),
  ADD KEY `idTipoEquipo` (`idTipoEquipo`),
  ADD KEY `idModelo` (`idModelo`);

--
-- Indexes for table `equipoimagenes`
--
ALTER TABLE `equipoimagenes`
  ADD PRIMARY KEY (`idEquipoImagen`);

--
-- Indexes for table `estadocontrolmantenimiento`
--
ALTER TABLE `estadocontrolmantenimiento`
  ADD PRIMARY KEY (`idEstadoControlMantenimiento`),
  ADD UNIQUE KEY `estadoControlMantenimiento` (`estadoControlMantenimiento`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`),
  ADD UNIQUE KEY `marca_UNIQUE` (`marca`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idModelo`),
  ADD UNIQUE KEY `modelo` (`modelo`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indexes for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`idNotificacion`);

--
-- Indexes for table `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`idSexo`),
  ADD UNIQUE KEY `sexo` (`sexo`);

--
-- Indexes for table `solicitudmantenimiento`
--
ALTER TABLE `solicitudmantenimiento`
  ADD PRIMARY KEY (`idSolicitudMantenimiento`),
  ADD KEY `codEquipo` (`codEquipo`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `tipodisco`
--
ALTER TABLE `tipodisco`
  ADD PRIMARY KEY (`idTipoDisco`),
  ADD UNIQUE KEY `tipoDisco` (`tipoDisco`);

--
-- Indexes for table `tipoequipo`
--
ALTER TABLE `tipoequipo`
  ADD PRIMARY KEY (`idTipoEquipo`),
  ADD UNIQUE KEY `tipoEquipo` (`tipoEquipo`);

--
-- Indexes for table `tipomantenimiento`
--
ALTER TABLE `tipomantenimiento`
  ADD PRIMARY KEY (`idTipoMantenimiento`),
  ADD UNIQUE KEY `tipoMantenimiento` (`tipoMantenimiento`);

--
-- Indexes for table `tiporam`
--
ALTER TABLE `tiporam`
  ADD PRIMARY KEY (`idTipoRam`),
  ADD UNIQUE KEY `tipoRam` (`tipoRam`);

--
-- Indexes for table `tipotransaccion`
--
ALTER TABLE `tipotransaccion`
  ADD PRIMARY KEY (`idTipoTransaccion`),
  ADD UNIQUE KEY `tipoTransaccion` (`tipoTransaccion`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `codEmpleado` (`codEmpleado`);

--
-- Indexes for table `velocidadram`
--
ALTER TABLE `velocidadram`
  ADD PRIMARY KEY (`idVelocidadRam`),
  ADD UNIQUE KEY `velocidadRam` (`velocidadRam`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesos`
--
ALTER TABLE `accesos`
  MODIFY `idaccessLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `asignacionequipo`
--
ALTER TABLE `asignacionequipo`
  MODIFY `idAsignacionEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `audilog`
--
ALTER TABLE `audilog`
  MODIFY `idAudiLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `bitacoramantenimiento`
--
ALTER TABLE `bitacoramantenimiento`
  MODIFY `idBitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `capacidad`
--
ALTER TABLE `capacidad`
  MODIFY `idCapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `controlgarantia`
--
ALTER TABLE `controlgarantia`
  MODIFY `idControlGarantia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  MODIFY `idControlMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `empresagarantia`
--
ALTER TABLE `empresagarantia`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `equipoimagenes`
--
ALTER TABLE `equipoimagenes`
  MODIFY `idEquipoImagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `estadocontrolmantenimiento`
--
ALTER TABLE `estadocontrolmantenimiento`
  MODIFY `idEstadoControlMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `idModelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `idNotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sexo`
--
ALTER TABLE `sexo`
  MODIFY `idSexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `solicitudmantenimiento`
--
ALTER TABLE `solicitudmantenimiento`
  MODIFY `idSolicitudMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `tipodisco`
--
ALTER TABLE `tipodisco`
  MODIFY `idTipoDisco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipoequipo`
--
ALTER TABLE `tipoequipo`
  MODIFY `idTipoEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipomantenimiento`
--
ALTER TABLE `tipomantenimiento`
  MODIFY `idTipoMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tiporam`
--
ALTER TABLE `tiporam`
  MODIFY `idTipoRam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipotransaccion`
--
ALTER TABLE `tipotransaccion`
  MODIFY `idTipoTransaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `velocidadram`
--
ALTER TABLE `velocidadram`
  MODIFY `idVelocidadRam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asignacionequipo`
--
ALTER TABLE `asignacionequipo`
  ADD CONSTRAINT `asignacionequipo_ibfk_2` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asignacionequipo_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `audilog`
--
ALTER TABLE `audilog`
  ADD CONSTRAINT `audilog_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audilog_ibfk_2` FOREIGN KEY (`idTipoTransaccion`) REFERENCES `tipotransaccion` (`idTipoTransaccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `controlgarantia`
--
ALTER TABLE `controlgarantia`
  ADD CONSTRAINT `controlgarantia_ibfk_2` FOREIGN KEY (`idEmpresa`) REFERENCES `empresagarantia` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlgarantia_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlgarantia_ibfk_4` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  ADD CONSTRAINT `controlmantenimiento_ibfk_1` FOREIGN KEY (`idSolicitudMantenimiento`) REFERENCES `solicitudmantenimiento` (`idSolicitudMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_2` FOREIGN KEY (`idTipoMantenimiento`) REFERENCES `tipomantenimiento` (`idTipoMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_4` FOREIGN KEY (`idEstadoControlMantenimiento`) REFERENCES `estadocontrolmantenimiento` (`idEstadoControlMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_5` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detequipocomputadora`
--
ALTER TABLE `detequipocomputadora`
  ADD CONSTRAINT `detequipocomputadora_ibfk_1` FOREIGN KEY (`idTipoDisco`) REFERENCES `tipodisco` (`idTipoDisco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_2` FOREIGN KEY (`idTipoRam`) REFERENCES `tiporam` (`idTipoRam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_3` FOREIGN KEY (`idVelocidadRam`) REFERENCES `velocidadram` (`idVelocidadRam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_6` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_7` FOREIGN KEY (`idCapacidad`) REFERENCES `capacidad` (`idCapacidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_8` FOREIGN KEY (`idCapacidadDisco`) REFERENCES `capacidad` (`idCapacidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idSexo`) REFERENCES `sexo` (`idSexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`idTipoEquipo`) REFERENCES `tipoequipo` (`idTipoEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON UPDATE CASCADE;

--
-- Constraints for table `solicitudmantenimiento`
--
ALTER TABLE `solicitudmantenimiento`
  ADD CONSTRAINT `solicitudmantenimiento_ibfk_1` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudmantenimiento_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codEmpleado`) REFERENCES `empleado` (`codEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
