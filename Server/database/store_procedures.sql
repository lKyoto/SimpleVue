select a.nombre , b.salario_hora as salario
from empleados a
inner join salarios b on b.cedula_empleado = a.cedula;


USE `rrhh_db`;
DROP procedure IF EXISTS `nuevoEmpleado`;

DELIMITER $$
USE `rrhh_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoEmpleado`(
	in _cedula varchar(9),
    in _nombre varchar(50),
    in _p_apellido varchar(50),
    in _s_apellido varchar(50),
    in _correo varchar(200),
    in _fecha_contrato datetime,
    in _tipo_empleado int,
    in _planilla int,
    in _salario_hora decimal(10,2)
)
begin
	IF NOT EXISTS (select cedula from empleados where cedula = _cedula) THEN
		insert into empleados (cedula, nombre, p_apellido, s_apellido, correo, fecha_contrato, tipo_empleado, planilla)
        values(_cedula, _nombre, _p_apellido, _s_apellido, _correo, _fecha_contrato, _tipo_empleado, _planilla);
        insert into salarios(cedula_empleado, salario_hora)
        values(_cedula, _salario_hora);
    END IF;
end$$

DELIMITER ;
CALL nuevoEmpleado('802220222','Dora','Gonzales', 'Fuentes', 'd79ora@gmail.com', '2010-09-25', 1, 1, 2000.00);


USE `rrhh_db`;
DROP procedure IF EXISTS `nuevoPermiso`;

DELIMITER $$
USE `rrhh_db`$$
CREATE PROCEDURE `nuevoPermiso` (
	in _cedula varchar(9),
    in _fecha datetime,
    in _descripcion varchar(300),
    in _costoSalarial decimal(10,2)
)
BEGIN
	IF (SELECT cedula FROM empleados WHERE cedula = _cedula AND activo = true) then
		insert into permisos(cedula_empleado, fecha, descripcion, costo_salarial)
        values(_cedula, _fecha, _descripcion, _costoSalarial);
    end if;
END$$

DELIMITER ;
CALL nuevoPermiso('802220222', '2015-09-25', 'Esta es la primera prueba de los pemisos de salida', -500.00);


USE `rrhh_db`;
DROP procedure IF EXISTS `nuevoAumento`;

DELIMITER $$
USE `rrhh_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoAumento`(
	in _cedula varchar(9),
    in _fecha datetime,
    in _aumento_salarial decimal(10,2)
)
BEGIN
IF (SELECT cedula FROM empleados WHERE cedula = _cedula AND activo = true) then
		insert into aumento_salarial(cedula_empleado, fecha, cantidad)
        values(_cedula, _fecha, _aumento_salarial);
        update salarios
        set salario_hora = salario_hora + _aumento_salarial
        where cedula_empleado = _cedula;
    end if;
END$$

DELIMITER ;
CALL nuevoAumento('802220222', '2018-09-25', 800.00);


USE `rrhh_db`;
DROP procedure IF EXISTS `nuevoRegistroDisciplinario`;

DELIMITER $$
USE `rrhh_db`$$
CREATE PROCEDURE `nuevoRegistroDisciplinario` (
	in _cedula varchar(9),
    in _fecha datetime,
    in _descripcion varchar(300)
)
BEGIN
IF (SELECT cedula FROM empleados WHERE cedula = _cedula AND activo = true) then
		insert into registro_disciplinario(cedula_empleado, fecha, descripcion)
        values(_cedula, _fecha, _descripcion);
    end if;
END$$
DELIMITER ;
CALL nuevoRegistroDisciplinario('802220222', '2018-09-25', 'Mal trato al cliente');


USE `rrhh_db`;
DROP procedure IF EXISTS `nuevoBono`;

DELIMITER $$
USE `rrhh_db`$$
CREATE PROCEDURE `nuevoBono` (
	in _cedula varchar(9),
    in _motivo varchar(200),
    in _cantidad decimal (10.2),
    in _fecha datetime
)
BEGIN
IF (SELECT cedula FROM empleados WHERE cedula = _cedula AND activo = true) then
		insert into bonos(cedula_empleado, motivo, cantidad, fecha)
        values(_cedula, _motivo, _cantidad, _fecha);
    end if;
END$$

DELIMITER ;
CALL nuevoBono('802220222', 'Trabajo duro', 1000.00 ,'2018-09-25');


