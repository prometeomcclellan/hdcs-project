-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2021 a las 01:34:33
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

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

DELIMITER $$
--
-- Procedimientos
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarAsignacionEquipo` (IN `_fechaAsignacion` DATE, IN `_codEquipo` VARCHAR(9), IN `_observacion` VARCHAR(50), IN `_idUsuario` INT)  BEGIN
	INSERT INTO asignacionequipo (fechaAsignacion, codEquipo, observacion,  idUsuario) 
    	VALUES(_fechaAsignacion, _codEquipo, _observacion,  _idUsuario);
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarControlMantenimiento` (IN `_fechaControlMant` DATE, IN `_usuario` INT(11), IN `_tipoMant` INT, IN `_idSolMant` INT, IN `_observacion` VARCHAR(100), IN `_idEstadoControlMant` INT, IN `_idDepartamento` INT)  BEGIN
	INSERT INTO controlmantenimiento (fechaControlMantenimiento, idUsuario, idTipoMantenimiento, idSolicitudMantenimiento, observacion, idEstadoControlMantenimiento, idDepartamento) 
    	VALUES( _fechaControlMant, _usuario,  _tipoMant, _idSolMant, _observacion, _idEstadoControlMant, _idDepartamento);
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarUsuario` (IN `_codEmpleado` INT(10), IN `_fechaC` DATETIME, IN `_userName` VARCHAR(20), IN `_password` VARCHAR(20))  BEGIN
         INSERT INTO usuario (codEmpleado, fechaCreacion, userName, password) VALUES(_codEmpleado, _fechaC, _userName, _password);
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
	SELECT controlmantenimiento.idControlMantenimiento, solicitudmantenimiento.idSolicitudMantenimiento, controlmantenimiento.fechaControlMantenimiento, 
    equipo.codEquipo, equipo.descripcionEquipo, tipomantenimiento.tipoMantenimiento, solicitudmantenimiento.fechaSolicitudMantenimiento,
    controlmantenimiento.observacion, estadocontrolmantenimiento.estadoControlMantenimiento, concat(empleado.nombres, ' ', empleado.apellidos) as empleado, controlmantenimiento.tituloControlmantenimiento
    
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
                                  	   ON solicitudmantenimiento.idSolicitudMantenimiento = controlmantenimiento.idControlMantenimiento
                                  INNER JOIN estadocontrolmantenimiento
                                  	   ON controlmantenimiento.idEstadoControlMantenimiento = estadocontrolmantenimiento.idEstadoControlMantenimiento
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarUsuarioControl` ()  BEGIN
	SELECT usuario.idUsuario, concat(empleado.nombres, ' ', empleado.apellidos) as empleado
FROM usuario  INNER JOIN empleado  
USING (codEmpleado)
INNER JOIN cargo 
USING (idCargo)
WHERE cargo.cargo = 'tecnico';
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
-- Estructura de tabla para la tabla `accesos`
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
-- Volcado de datos para la tabla `accesos`
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
(43, 119, '$2y$10$hSb/E6PwM0RCyXFaKN/ZGOLNDC/Wjj97IJCxE/DXOZ3dLq6w.FmZW', 'login', '2021-04-30 16:07:14', 0),
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
(79, 119, '$2y$10$xhKLQ4pNDjczC1uLBByziudFlUbyUubzYb8e.EJgE1kzzbYKybyl2', 'login', '2021-05-04 16:27:07', 1),
(80, 119, '$2y$10$0mBDMCUXRjIlYuTCT50duee3TnXnBsyZaal.Mscs464LLiXFG.LI2', 'login', '2021-05-04 23:50:41', 0),
(81, 119, '$2y$10$WMOnX9Uc9T441n868Oq.pu3QxyOHXRBO8O1FX3p6HSEFmiNmDuO1e', 'login', '2021-05-05 15:30:19', 0),
(82, 119, '$2y$10$hiNu3OiDNyLQq66aGpWda.Hlt28QbXkIqPfspIRc46RuDGXGv9ltu', 'login', '2021-05-05 16:05:30', 0),
(83, 116, '$2y$10$rzQYwxXW.66F3OT3dSS/u.GH55GBBV2DFcT3WoPAlqimC/8JrWakm', 'login', '2021-05-05 16:06:33', 0),
(84, 119, '$2y$10$OdCgQJyRUMg4C833v3mgZuSAzlxCMGYLJhPrsyViTLOFFgXV7KK6e', 'login', '2021-05-05 16:10:04', 0),
(85, 116, '$2y$10$K0f2/zCXOwq0kBTLz5D9XuMOAD8fPOzgAr/ZZ.w3ZYNCAYh2oWP1G', 'login', '2021-05-05 16:10:56', 0),
(86, 119, '$2y$10$EA2BLJTr/4cSGsHeFxEIIePcJl43qCSr2SGBj3shNqFQJpdFfEpW2', 'login', '2021-05-05 16:13:04', 1),
(87, 119, '$2y$10$KrX3XElhM91hVhnj/DZzsOeHp9LOo55HDsoZZfqqUcTcdx3bNhFg.', 'login', '2021-05-05 16:20:21', 0),
(88, 119, '$2y$10$j6Vx7CO5gkwM50jqgI2XPu9/ycAwwuaGpYX0XRk4trJ0.h.JMxjd6', 'login', '2021-05-05 16:42:33', 0),
(89, 119, '$2y$10$tpFsMlxXjcP8onw69ozM1uWgCZtHJcPlOTvBe3RrIB7bhcwwpyN2m', 'login', '2021-05-05 16:43:19', 0),
(90, 119, '$2y$10$TkI9MOGNTjOH1ozC2oZuGu2Ty203ggP3Ov0S.t2aiL6U6ImEGB45u', 'login', '2021-05-05 16:45:49', 0),
(91, 119, '$2y$10$8e0Ddxtu5ntCJrxkWSny/OeZmyGfUPDlwcGo4yMcOacxWDGt17lr6', 'login', '2021-05-05 17:13:04', 0),
(92, 119, '$2y$10$qeU4uS9QwsWehHUJw55e3uhG6zMJmtQBeDxbFTvdScfB.JCncGzsy', 'login', '2021-05-05 17:22:33', 0),
(93, 116, '$2y$10$ervnO7Jt/w.7J2hx8W8vTOqfwG9FtiJ/RNMXxt.TaxHQ1V1xSeLqS', 'login', '2021-05-05 17:23:04', 0),
(94, 119, '$2y$10$3o2pRHecj.iri002dozSpetTe0C/3zxPPIDVcWJZp5VIS0GLKwhES', 'login', '2021-05-05 17:44:29', 1),
(95, 116, '$2y$10$wman.eteuQQat8oCoDfO5e7R0FZ4uhOOyuBlbBMcSzcDugB1Tck2W', 'login', '2021-05-05 19:39:08', 1),
(96, 116, '$2y$10$1KGiclUouAM9NpWtxpkvq./CyIOuepmmqCTQY6P/sRrBBTjx9DJf2', 'login', '2021-05-05 19:39:19', 1),
(97, 116, '$2y$10$Z3n5saoCbT2Zu3UyoJTNMO2I2Gva.UohtX/V5naQwaSZAT0zrU3r.', 'login', '2021-05-05 19:39:19', 1),
(98, 116, '$2y$10$D/bWfB8.zV03cCydruRVke79.5113BOXGulRCQTpcyVEs/eq05Iju', 'login', '2021-05-05 19:39:20', 1),
(99, 116, '$2y$10$r5USzQM0ppOFRMvJsQ7rvuj40pJeDj1RllxQeOorVAUiKZbvWcuKW', 'login', '2021-05-05 19:39:20', 1),
(100, 116, '$2y$10$NKQEKtOaTwKMEy8D3tRMPuBNi3JPfhHNmm2AH9Z5lF1dvoY8Ge3A2', 'login', '2021-05-05 19:40:14', 1),
(101, 116, '$2y$10$C4EuEkDtB4uH.dDOYzD62.GybcEweC87Oemar5K7Z/k8W0RuIvBjm', 'login', '2021-05-05 19:40:32', 1),
(102, 116, '$2y$10$8zt9K2ucBQ9ge3cc7XUBSOJn/bhf6JfY9k5ZvZXFM/uEI0fEdE88O', 'login', '2021-05-05 19:41:36', 0),
(103, 119, '$2y$10$Pu6EppbBQdSEND4U/1ULEuXLvGcfn4Vx2K.CpmoFf8PwPTDqXonJa', 'login', '2021-05-05 19:47:42', 0),
(104, 119, '$2y$10$et5LfKrV9duez9UK6YRLE.4srSZWDjZCsKEiBCyFSJjKlyzn75eZi', 'login', '2021-05-05 21:53:20', 0),
(105, 1, '$2y$10$CYNKRjh93mBc2MqA19KjXu8bID6XPYeVhodY0QUgjTWLsbP6QFq6m', 'login', '2021-05-06 00:16:10', 0),
(106, 3, '$2y$10$d66dx0vLwp5NnGaJp/U66e6RkSIU0d2hUz5mxxEXmSuszi8YWxfae', 'login', '2021-05-06 14:08:39', 0),
(107, 2, '$2y$10$NwA4DUNeFoOghFo8IzSFBeNwWATzX.FsF0u4PTghWNOd3jhvOAp/K', 'login', '2021-05-06 14:10:56', 0),
(108, 3, '$2y$10$twegf6nzCgle0CE7EmUgMevibsaq.yvC5m8hfWr4o4vKyq8oS5G.K', 'login', '2021-05-06 14:55:51', 0),
(109, 1, '$2y$10$2lr9PY3uTHy.SLOtE1o2XeQaB7LF.nYyCIcoeKvHHL7WfS21nXZui', 'login', '2021-05-06 14:56:19', 1),
(110, 1, '$2y$10$dFuCH8axN5PCXuNLvVQ8kO.bNYfMF5yp21fTZvco49MYsoXppBjCa', 'login', '2021-05-07 14:11:27', 0),
(111, 1, '$2y$10$Oi.JcqTR6FXiMDYWrc7K.uqjWC7OPBvwPhD7TdwZmfeEaaUJ9GAAm', 'login', '2021-05-07 22:14:47', 1),
(112, 3, '$2y$10$V2vPFra/rLmgm4ZkESBb/.W72uo2PSoCRdzXvc4BZh.BS3fDyNyxq', 'login', '2021-05-10 14:11:51', 1),
(113, 1, '$2y$10$0RgdgIdgk1fH2M0GSaueT.4uz18yKO6poZslyw94I1.OtD37ycgEq', 'login', '2021-05-12 13:45:36', 1),
(114, 1, '$2y$10$d8w22Qmo/8ycahwKhkcem.ZHEODQj3fzTrkUKfjjS6acLp1FA/vKa', 'login', '2021-05-12 13:58:24', 1),
(115, 1, '$2y$10$Eu7TkcHu35n6B/lApv1hYutSdftbBVXLMDmKoKkuFMEowpuNSKduu', 'login', '2021-05-12 14:03:52', 1),
(116, 1, '$2y$10$dkET/lL5/2b7LeGEh4jbxOXkuxIlis3iV69/rSql7ZBR3QLmeJZiy', 'login', '2021-05-12 14:06:06', 0),
(117, 1, '$2y$10$AHwGDykh3BT5ZwA2JBY.e.mEDgmq5zuddEJZbENxcrrdyddeHG.GS', 'login', '2021-05-12 14:21:20', 0),
(118, 1, '$2y$10$F6V2Um1ZVI9RyYIpooPAb.ShpNytUzR3UhtiW4bc8zeYARfXIjFgW', 'login', '2021-05-12 15:13:46', 1),
(119, 1, '$2y$10$LrLTuflaJ3/FtylVThUQ4er6NSskrqvSgZ.Jq8c2cWspTg1vzcYii', 'login', '2021-05-13 10:40:10', 1),
(120, 1, '$2y$10$4UBePGPVws1fZMtycRTVSOtTmdzKMZgLr.YvrRnBHdE9jPfeNinXW', 'login', '2021-05-14 11:49:54', 0),
(121, 1, '$2y$10$zVFF4YwTKLUd3aBI.HWbxOryeQqf3DZy9JEUn20IDdF8T6nsQlRTG', 'login', '2021-05-14 11:51:25', 0),
(122, 3, '$2y$10$wWh.IjLqF7QRlwUXG0Uwzuv0Q.uaCwzNk.aZtxFX3IqV3Og1Uqjfa', 'login', '2021-05-14 14:30:42', 0),
(123, 2, '$2y$10$YWeeucVrsq0ZWYTjHYkaBeB3tpeZ0BDkstAbeEqZyX1fXGOlWfAi.', 'login', '2021-05-14 14:31:19', 0),
(124, 1, '$2y$10$KzXwjF1D9HzX/KgdnxoFIOF2Z15cFvmQ0MBJaI3Psz07kblrhoEZa', 'login', '2021-05-25 14:50:00', 0),
(125, 7, '$2y$10$GWcEbcUNPgowTj6zDX5rZeseCzCq9JxzoFcCoiyrySVJvd2dX.0Ua', 'login', '2021-05-25 16:41:09', 0),
(126, 1, '$2y$10$m7A71WOCTc.3R2NmOawuuuVBsX1q4TpE7bj3N4BMYX0SI0aHKv3re', 'login', '2021-05-25 16:42:07', 0),
(127, 7, '$2y$10$XSpX6cyG08yNpQneA/2EleY1U9Ugd7J4VrWCXU/SyEKdF7Ugscul2', 'login', '2021-05-25 16:43:00', 0),
(128, 1, '$2y$10$85GYI5Z0Khhiji9NOVNrAOCS9YhA8whk5cL4s5jZvqcPVIyVOoCZa', 'login', '2021-05-25 16:43:46', 0),
(129, 4, '$2y$10$KVM7R/s21HEFqmYpznMUEeuJISK57OM8/j3Jys7cIYLtrCcYRN68i', 'login', '2021-05-25 16:44:09', 0),
(130, 1, '$2y$10$Ua2L5E3jCEsF51FMywskkOI7hhVxD8JfTMDYHRZXqjccZE1b6W5eK', 'login', '2021-05-25 17:24:57', 1),
(131, 1, '$2y$10$lxRZ8HLY1XpLceIxdtYNAuvBAskdT1Moi.CS40SYBFhaZ766SwOiy', 'login', '2021-05-25 17:28:20', 0),
(132, 4, '$2y$10$vYRZL.HMyFXQqfwcK10PrOxn2e/irL.RrSOzr3n4hOJn6rnDek82W', 'login', '2021-05-26 08:17:44', 0),
(133, 1, '$2y$10$4.sIzv/0eQeZ7nmMKOGdJu6l7NDjACxmuchVHbdtWBZXnlfgFAO/S', 'login', '2021-05-26 13:07:54', 0),
(134, 4, '$2y$10$d4jtZk37f.ANsuGSUzhTRe0k2E7TuU2DpiYMfY7sjUeOqRC9f16Qy', 'login', '2021-05-26 13:08:49', 1),
(135, 4, '$2y$10$kq4mcMwV26Iyi2s/CQE1sea97MRkZiHxRDxlYHajE8FljvY8uqppC', 'login', '2021-05-26 13:14:00', 0),
(136, 4, '$2y$10$w6SonfzuGt/6KQpnlAjAee1w.esYbFNkSuSkHwsi2QmTektlhxz7.', 'login', '2021-05-26 14:00:37', 1),
(137, 1, '$2y$10$oEWhBjwY8ajoHS9CYK4RSOy2wGi7FLdbHKIuI6GYasDKoEh42fk6q', 'login', '2021-05-26 14:42:16', 1),
(138, 1, '$2y$10$nIyGGOE7rlfJT8GVrn/XmObVaFybsGMvWHpEiyhVVswdE.XSggLxW', 'login', '2021-06-07 22:40:23', 1),
(139, 1, '$2y$10$CMekGVtUkpVzQhcVl.spceiOclo99p/Hne96NbLDiY4hOqYLPi2SC', 'login', '2021-06-07 22:41:39', 1),
(140, 1, '$2y$10$OAVr135KvgGnBrC1LZ8dxe6bn1nz34LrEx2ULIcbOJiAE432Ev7fm', 'login', '2021-06-16 13:38:48', 0),
(141, 1, '$2y$10$d.C/1cE4BBJrCl62sMv8f.229IXGzAhGs/WrFeJkFlPamFI1nYlJa', 'login', '2021-06-16 13:41:15', 0),
(142, 1, '$2y$10$3vG8TUneLgG..mkC15UepudzbwCCyPOUIOmlP1h6rTUXiKNp.0Pt6', 'login', '2021-06-16 19:54:24', 1),
(143, 1, '$2y$10$M7V1m9X.lTMj3Pt9BZcjC.zCSpNsiYrZtHxPOTVR11FyMPwScczXK', 'login', '2021-06-16 19:55:35', 1),
(144, 1, '$2y$10$oewPEchUKMBUP1tpX4ysOe73mhb7cXm6rWTBjrEm4VfSnf2/JGhXu', 'login', '2021-06-16 19:59:22', 0),
(145, 1, '$2y$10$Ij5ViD99gL83CcMQ2MzDqubPR0r6/.RuXlr.uk6rua98tteOQP8bm', 'login', '2021-06-16 20:01:57', 0),
(146, 1, '$2y$10$cCXBF.PKGI3vBBXG.JuQke5128GwlaERNEG.1oeTaI3Vu9ptv/nT.', 'login', '2021-06-16 20:05:38', 0),
(147, 1, '$2y$10$itc4G3KIrYIn8ggWtoknceWooDgz5OmTYw/nVugvEa.iw6O0VTJ5.', 'login', '2021-06-16 20:17:07', 0),
(148, 1, '$2y$10$cqSRiQk1/EMugA0tgZXUoOx8Q4x2Y3TJvPDsTAi89eFh7bxMlwPO6', 'login', '2021-06-16 20:19:12', 1),
(149, 1, '$2y$10$k/sbX3yhWtKLv0ORUiMDS.BaEBEtFpOQzjE.dBk4NxBBuKOD9AMja', 'login', '2021-06-16 20:20:08', 0),
(150, 1, '$2y$10$oDGm50Rmy6fE4VvKnmf3TeeHTwt93u5JsIR6wWvABZUUBMcPeppnC', 'login', '2021-06-16 20:20:33', 0),
(151, 7, '$2y$10$lD.u88Rr4j4Z9RS7NiGt5eqNP3WoCbI4MPzvp863o4/xGN.i2DGQ6', 'login', '2021-06-17 01:13:26', 0),
(152, 4, '$2y$10$TKr0CDi7aicBq4dgpU3TuevQpS3iUpfcFlbY6fFmX4JqEEupKiig6', 'login', '2021-06-17 01:16:20', 0),
(153, 4, '$2y$10$MrfcQgoRaL5FonlNJc5t0uq0.GiXbyRllneBa86l3ijZr7zdL6wTm', 'login', '2021-06-17 01:31:31', 0),
(154, 2, '$2y$10$I08OAPL7GUnqdr4Jx3wCMup1zZ6jRm/SRuSjCgqLF1i3NK1Y7EHkm', 'login', '2021-06-17 01:34:01', 0),
(155, 1, '$2y$10$A4H8c7nPptpeICd8ONpt/eDp9.l3.Co.WSB/L6CV5jGa1I5XZesay', 'login', '2021-06-17 01:34:49', 0),
(156, 1, '$2y$10$3EWNz2mP39JdJJP6DisGh.SXZEAiMX1tt8ZdyHe.y31.Q9ymPvylK', 'login', '2021-06-18 15:07:56', 1),
(157, 1, '$2y$10$4wbUn6OwGuXjrJ4G1Acg6e0Jookdj8jLOdvNb9V9ysdMY3X/cirOm', 'login', '2021-06-18 15:54:56', 1),
(158, 1, '$2y$10$PSt4dy0y8XU0zJjKAcVgKeHfn3lR4l7J1OdrCzs71/G76YoT7Z8ym', 'login', '2021-06-18 17:14:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionequipo`
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
-- Volcado de datos para la tabla `asignacionequipo`
--

INSERT INTO `asignacionequipo` (`idAsignacionEquipo`, `fechaAsignacion`, `codEquipo`, `observacion`, `fechaBaja`, `estado`, `idUsuario`) VALUES
(1, '2020-02-15', '19985', 'En excelentes condiciones', '0000-00-00', 1, 1),
(2, '2019-03-30', '15959', 'Entregado con cables', '0000-00-00', 1, 4),
(3, '2021-03-10', '6812818', 'Entregado en caja', '0000-00-00', 1, 2),
(4, '2021-01-14', '518366', 'Pantalla nueva', '0000-00-00', 1, 6),
(5, '2021-04-09', '9595696', 'Entregado con tintas', '0000-00-00', 1, 6),
(6, '2020-12-16', '84363', 'Entregado con embalaje', '0000-00-00', 1, 5),
(7, '2020-10-16', '82222', 'Asignado sin cargador', '0000-00-00', 1, 5);

--
-- Disparadores `asignacionequipo`
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
-- Estructura de tabla para la tabla `audilog`
--

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
(269, '2021-06-17 00:40:27', 7, 'Se insertó el registro en controlmantenimiento con Id 2', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoramantenimiento`
--

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

CREATE TABLE `capacidad` (
  `idCapacidad` int(11) NOT NULL,
  `capacidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capacidad`
--

INSERT INTO `capacidad` (`idCapacidad`, `capacidad`) VALUES
(1, '1 GB'),
(11, '1024 GB'),
(8, '128 GB'),
(5, '16 GB'),
(2, '2 GB'),
(9, '256 GB'),
(6, '32 GB'),
(3, '4 GB'),
(10, '512 GB'),
(7, '64 GB'),
(4, '8 GB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `cargo`, `idDepartamento`) VALUES
(1, 'admin', 9),
(2, 'tecnico', 9),
(3, 'personal', 1),
(4, 'personal', 2),
(5, 'personal', 3),
(6, 'personal', 4),
(7, 'personal', 5),
(8, 'personal', 6),
(9, 'personal', 7),
(10, 'personal', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlgarantia`
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
-- Volcado de datos para la tabla `controlgarantia`
--

INSERT INTO `controlgarantia` (`idControlGarantia`, `codEquipo`, `fechaInicio`, `fechaVencimiento`, `estado`, `idEmpresa`, `telefonoContacto`, `correoElectronico`, `idUsuario`) VALUES
(3, '518366', '2020-01-11', '2024-06-14', 1, 1, '2276-0010', '', 1),
(4, '15959', '2019-03-22', '2023-12-13', 1, 6, '9746-1884', 'acosa.honduras@gmail.com', 1),
(5, '9595696', '2020-02-15', '2025-08-21', 1, 4, '9438-1087', '', 1),
(6, '19985', '2021-01-24', '2024-07-30', 1, 2, '7255-0090', '', 1),
(7, '6812818', '2017-01-18', '2022-09-29', 1, 3, '', 'soporte@apple.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlmantenimiento`
--

CREATE TABLE `controlmantenimiento` (
  `idControlMantenimiento` int(11) NOT NULL,
  `tituloControlmantenimiento` varchar(45) DEFAULT NULL,
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

INSERT INTO `controlmantenimiento` (`idControlMantenimiento`, `tituloControlmantenimiento`, `fechaControlMantenimiento`, `idUsuario`, `idTipoMantenimiento`, `idSolicitudMantenimiento`, `observacion`, `idEstadoControlMantenimiento`) VALUES
(1, NULL, '2021-04-28', 3, 2, 1, 'Verificar botón de encendido', 1),
(2, NULL, '2021-06-17', 7, 2, 4, 'Posible entregar antes de finalizar mes', 1);

--
-- Disparadores `controlmantenimiento`
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
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `departamento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `departamento`) VALUES
(1, 'Administración'),
(8, 'CRAED Región Sur'),
(9, 'DEGT'),
(3, 'Dirección Regional'),
(7, 'Jefatura y Coordinaciones Académicas'),
(6, 'Oficina de Admisiones'),
(5, 'Oficina de Registro'),
(2, 'Planta Telefónica CURLP'),
(4, 'Recursos Humanos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detequipocomputadora`
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
-- Volcado de datos para la tabla `detequipocomputadora`
--

INSERT INTO `detequipocomputadora` (`codEquipo`, `idTipoRam`, `idCapacidad`, `idVelocidadRam`, `idTipoDisco`, `idCapacidadDisco`) VALUES
('262626', 3, 5, 4, 1, 11),
('518366', 2, 4, 6, 1, 10),
('6812818', 3, 3, 1, 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
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
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`codEmpleado`, `nombres`, `apellidos`, `telefono`, `celular`, `extension`, `idSexo`, `idCargo`, `correoElectronico`, `estado`) VALUES
(1990, 'Wilson', 'Villanueva', '', '9847-5800', '200-039', 1, 1, 'wilson.villanueva@unah.edu.hn', 1),
(9895, 'Rogelio', 'Álvarez', '2782-5056', '3284-5595', '200-029', 1, 3, 'rogelio.alvarez@unah.edu.hn', 1),
(22662, 'Lucia', 'Flores', '', '9851-6665', '200-000', 2, 3, 'lucia.flores@unah.edu.hn', 1),
(44546, 'Dennise', 'Calderón', '', '', '200-001', 2, 3, 'denisse.calderon@unah.edu.hn', 1),
(45189, 'Ernesto', 'Mendoza', '2780-6365', '9876-2306', '200-030', 1, 3, 'ernesto.mendoza@unah.edu.hn', 1),
(55959, 'Juan', 'Paz', '2780-3022', '9826-6355', '', 1, 2, 'juan.paz@unah.edu.hn', 1),
(62629, 'Ronal Otoniel', 'Mendoza Zambrano', '2782-4403', '3398-1655', '', 1, 2, 'ronal.mendoza@unah.edu.hn', 1),
(226262, 'Jessica', 'Ávila', '', '3265-8865', '', 2, 3, 'jessica.avila@unah.edu.hn', 1),
(310551, 'Laura', 'Banegas', '2780-3021', '9823-1855', '', 2, 3, 'laura.banegas@unah.edu.hn', 1),
(656565, 'Santos', 'Soriano', '', '9856-9562', '200-002', 2, 3, 'santos.soriano@unah.edu.hn', 1),
(3262629, 'Vilma', 'Salinas', '', '9826-2685', '200-010', 2, 3, 'vilma.salinas@unah.edu.hn', 1),
(19982401, 'José Angel', 'Mendoza Zambrano', '2780-3042', '3394-7239', '200-001', 1, 1, 'joseangel.mendoza98@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresagarantia`
--

CREATE TABLE `empresagarantia` (
  `idEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresagarantia`
--

INSERT INTO `empresagarantia` (`idEmpresa`, `nombreEmpresa`) VALUES
(1, 'Jetstereo'),
(2, 'DELL'),
(3, 'Apple'),
(4, 'TecnoComp'),
(5, 'IntelComp'),
(6, 'ACOSA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
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
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`codEquipo`, `numInventario`, `idTipoEquipo`, `idModelo`, `serie`, `serviceTag`, `descripcionEquipo`) VALUES
('15959', 'Y-202105', 2, 27, 'FG626H629', 'H66J6Ñ2', 'laser'),
('19985', 'V-202150', 1, 3, '0A566B51W', 'HD05H81', 'Adquisición'),
('262626', 'A-201015', 1, 17, '6HTG959R5', 'F9HJ21R', 'Traslado'),
('518366', 'D-202012', 1, 6, '8N9H5S2EA', 'F98HD58', 'Funcional'),
('656565', 'I-202012', 2, 30, '8IFG66D25', 'T55FJI6', 'Continuo'),
('6812818', 'J-202152', 1, 18, '2H8JD8DF2', 'T545F6GH', 'Registro'),
('82222', 'S-201980', 1, 8, '6J30SD6J6', 'JJ5825H', 'Renovación'),
('84363', 'I-201501', 3, 37, 'JF65RT58', 'h656HH5', 'Fuente'),
('886698', 'L-202020', 3, 38, '2FG8254DF', 'IJ92ER6', 'Fuente nueva'),
('9595696', 'J-200910', 2, 26, '6SFG052F2', 'R6H82KU', 'Multifuncional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipoimagenes`
--

CREATE TABLE `equipoimagenes` (
  `idEquipoImagen` int(11) NOT NULL,
  `idControlMantenimiento` int(11) DEFAULT NULL,
  `imagenEquipoUrl` varchar(900) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocontrolmantenimiento`
--

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

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `marca`) VALUES
(5, 'Acer'),
(13, 'Alienware'),
(18, 'APC'),
(2, 'Apple'),
(6, 'Asus'),
(16, 'Brother'),
(14, 'Canon'),
(1, 'Dell'),
(17, 'Eaton'),
(15, 'EPSON'),
(11, 'Gateway'),
(3, 'HP'),
(4, 'Lenovo'),
(9, 'LG'),
(10, 'MSI'),
(8, 'Samsung'),
(7, 'Sony'),
(12, 'Toshiba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `idMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`idModelo`, `modelo`, `idMarca`) VALUES
(1, 'Inspiron', 1),
(2, 'XPS', 1),
(3, 'G3', 1),
(4, 'G5', 1),
(5, 'G7', 1),
(6, 'Optiplex', 1),
(7, 'MacBook Air', 2),
(8, 'MacBook Pro', 2),
(9, 'Spectre', 3),
(10, 'ENVY', 3),
(11, 'Pavilion', 3),
(12, 'Zbook', 3),
(13, 'Ideapad', 4),
(14, 'Legion', 4),
(15, 'Thinkpad', 4),
(16, 'Aspire', 5),
(17, 'ZenBook', 6),
(18, 'ExpertBook', 6),
(19, 'VAIO SX14', 7),
(20, 'VAIO SX12', 7),
(21, 'Notebook 7 Spin', 8),
(22, 'LG Gram', 9),
(23, 'M15', 13),
(24, 'M17', 13),
(25, 'PIXMA MX475', 14),
(26, 'PIXMA TS3150', 14),
(27, 'Canon i-Sensys MF', 14),
(28, 'Epson Workforce WF-2', 15),
(29, 'Epson XP 342', 15),
(30, 'Epson EcoTank ET-265', 15),
(31, 'Brother MFCL2710DW', 16),
(32, 'Brother DCP1610W', 16),
(33, 'Brother DCP-L3550CDW', 16),
(34, 'Brother MFCJ5330DW', 16),
(35, 'SMC1500IC', 18),
(36, 'BR1500G', 18),
(37, 'BR900GI', 18),
(38, 'Ellipse PRO 1200 DIN', 17),
(39, '9SX 5000i RT3U', 17),
(40, 'Back-UPS Pro 1500VA', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `idNotificacion` int(11) NOT NULL,
  `idControlMantenimiento` int(11) DEFAULT NULL,
  `idEstadoNotificacion` int(11) DEFAULT NULL,
  `estadoNotificacion` varchar(45) DEFAULT NULL,
  `fechaNotificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `idSexo` int(11) NOT NULL,
  `sexo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`idSexo`, `sexo`) VALUES
(2, 'Femenino'),
(1, 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudmantenimiento`
--

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
(1, '2021-04-09', '19985', 'No enciende', 1),
(2, '2021-03-30', '6812818', 'Se descarga rapido', 2),
(3, '2021-04-30', '19985', 'Esta trabajando lenta', 1),
(4, '2021-05-19', '15959', 'No enciende', 4);

--
-- Disparadores `solicitudmantenimiento`
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
-- Estructura de tabla para la tabla `tipodisco`
--

CREATE TABLE `tipodisco` (
  `idTipoDisco` int(11) NOT NULL,
  `tipoDisco` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipodisco`
--

INSERT INTO `tipodisco` (`idTipoDisco`, `tipoDisco`) VALUES
(1, 'HDD'),
(2, 'SSD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoequipo`
--

CREATE TABLE `tipoequipo` (
  `idTipoEquipo` int(11) NOT NULL,
  `tipoEquipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipoequipo`
--

INSERT INTO `tipoequipo` (`idTipoEquipo`, `tipoEquipo`) VALUES
(1, 'Computadora'),
(2, 'Impresora'),
(3, 'UPS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomantenimiento`
--

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
(3, 'Rutina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporam`
--

CREATE TABLE `tiporam` (
  `idTipoRam` int(11) NOT NULL,
  `tipoRam` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiporam`
--

INSERT INTO `tiporam` (`idTipoRam`, `tipoRam`) VALUES
(1, 'DDR2'),
(2, 'DDR3'),
(3, 'DDR4'),
(4, 'DDR5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotransaccion`
--

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
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `codEmpleado`, `fechaCreacion`, `userName`, `password`, `fechaBaja`, `estado`, `fotoUsuario`) VALUES
(1, 19982401, '2020-11-19', 'angel', 'f4f068e71e0d87bf0ad5', '0000-00-00', 1, '../inicio/dist/img/JAMZ.jpg'),
(2, 1990, '2021-02-10', 'wilson', 'abd7372bba5557759073', '0000-00-00', 1, NULL),
(3, 62629, '2021-02-19', 'ronal', 'cfcd7931ab079ae38483', '0000-00-00', 1, NULL),
(4, 9895, '2021-03-28', 'rogelio', '8fc52b933532f9a4b832', '0000-00-00', 1, NULL),
(5, 226262, '2021-03-31', 'jessica', 'aae039d6aa239cfc1213', '0000-00-00', 1, NULL),
(6, 3262629, '2021-04-21', 'vilma', '8f91cec9a1609e68f344', '0000-00-00', 1, NULL),
(7, 55959, '2021-04-10', 'juan', 'a94652aa97c7211ba895', '0000-00-00', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `velocidadram`
--

CREATE TABLE `velocidadram` (
  `idVelocidadRam` int(11) NOT NULL,
  `velocidadRam` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `velocidadram`
--

INSERT INTO `velocidadram` (`idVelocidadRam`, `velocidadRam`) VALUES
(3, '1333 MHz'),
(4, '1600 MHz'),
(5, '1866 MHz'),
(6, '2133 MHz'),
(7, '2400 MHz'),
(8, '2666 MHz'),
(1, '667 MHz'),
(2, '800 MHz');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`idaccessLog`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idUsuario_2` (`idUsuario`);

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
  ADD KEY `idDepartamento` (`idDepartamento`),
  ADD KEY `cargo` (`cargo`) USING BTREE;

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
-- Indices de la tabla `equipoimagenes`
--
ALTER TABLE `equipoimagenes`
  ADD PRIMARY KEY (`idEquipoImagen`),
  ADD KEY `idControlMantenimiento` (`idControlMantenimiento`);

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
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`idNotificacion`),
  ADD KEY `idControlMantenimiento` (`idControlMantenimiento`);

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
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `idaccessLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `asignacionequipo`
--
ALTER TABLE `asignacionequipo`
  MODIFY `idAsignacionEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `audilog`
--
ALTER TABLE `audilog`
  MODIFY `idAudiLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT de la tabla `bitacoramantenimiento`
--
ALTER TABLE `bitacoramantenimiento`
  MODIFY `idBitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  MODIFY `idCapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `controlgarantia`
--
ALTER TABLE `controlgarantia`
  MODIFY `idControlGarantia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  MODIFY `idControlMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empresagarantia`
--
ALTER TABLE `empresagarantia`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `equipoimagenes`
--
ALTER TABLE `equipoimagenes`
  MODIFY `idEquipoImagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `estadocontrolmantenimiento`
--
ALTER TABLE `estadocontrolmantenimiento`
  MODIFY `idEstadoControlMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `idModelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `idNotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `idSexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitudmantenimiento`
--
ALTER TABLE `solicitudmantenimiento`
  MODIFY `idSolicitudMantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipodisco`
--
ALTER TABLE `tipodisco`
  MODIFY `idTipoDisco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoequipo`
--
ALTER TABLE `tipoequipo`
  MODIFY `idTipoEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `velocidadram`
--
ALTER TABLE `velocidadram`
  MODIFY `idVelocidadRam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `audilog_ibfk_1` FOREIGN KEY (`idTipoTransaccion`) REFERENCES `tipotransaccion` (`idTipoTransaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audilog_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `controlgarantia`
--
ALTER TABLE `controlgarantia`
  ADD CONSTRAINT `controlgarantia_ibfk_1` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlgarantia_ibfk_2` FOREIGN KEY (`idEmpresa`) REFERENCES `empresagarantia` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlgarantia_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `controlmantenimiento`
--
ALTER TABLE `controlmantenimiento`
  ADD CONSTRAINT `controlmantenimiento_ibfk_1` FOREIGN KEY (`idSolicitudMantenimiento`) REFERENCES `solicitudmantenimiento` (`idSolicitudMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_2` FOREIGN KEY (`idEstadoControlMantenimiento`) REFERENCES `estadocontrolmantenimiento` (`idEstadoControlMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controlmantenimiento_ibfk_4` FOREIGN KEY (`idTipoMantenimiento`) REFERENCES `tipomantenimiento` (`idTipoMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detequipocomputadora`
--
ALTER TABLE `detequipocomputadora`
  ADD CONSTRAINT `detequipocomputadora_ibfk_1` FOREIGN KEY (`idTipoRam`) REFERENCES `tiporam` (`idTipoRam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_2` FOREIGN KEY (`idVelocidadRam`) REFERENCES `velocidadram` (`idVelocidadRam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_3` FOREIGN KEY (`idCapacidad`) REFERENCES `capacidad` (`idCapacidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_4` FOREIGN KEY (`idCapacidadDisco`) REFERENCES `capacidad` (`idCapacidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_5` FOREIGN KEY (`idTipoDisco`) REFERENCES `tipodisco` (`idTipoDisco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detequipocomputadora_ibfk_6` FOREIGN KEY (`codEquipo`) REFERENCES `equipo` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idTipoEquipo`) REFERENCES `tipoequipo` (`idTipoEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipoimagenes`
--
ALTER TABLE `equipoimagenes`
  ADD CONSTRAINT `equipoimagenes_ibfk_1` FOREIGN KEY (`idControlMantenimiento`) REFERENCES `controlmantenimiento` (`idControlMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`idControlMantenimiento`) REFERENCES `controlmantenimiento` (`idControlMantenimiento`) ON DELETE CASCADE ON UPDATE CASCADE;

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
