--Registrar la fecha de amistad al aceptar una solicitud de amistad
create or replace TRIGGER Trg_RegistrarAmistad
BEFORE INSERT ON Amistad
FOR EACH ROW
BEGIN
    IF :new.fecha_amistad IS NULL THEN
        :new.fecha_amistad := SYSDATE; -- Usa la fecha actual si no se proporciona una fecha
    END IF;
END;
/

--Asegurarse que los usuarios tengan al menos 13 años de edad
create or replace TRIGGER Trg_VerificarEdadUsuario
BEFORE INSERT OR UPDATE ON Usuario
FOR EACH ROW
DECLARE
    years INT;
BEGIN
    SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM :NEW.fecha_nacimiento) INTO years FROM dual;
    IF years < 13 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El usuario debe tener al menos 13 años de edad');
    END IF;
END;
/

-- Agregar como miembro al creador del servidor, asignarle permisos de Owner, crear rol "Everyone" y crear canales por defecto
CREATE OR REPLACE TRIGGER Trg_CrearServidor
AFTER INSERT ON Servidor
FOR EACH ROW
DECLARE
    v_owner_rol_id NUMBER;
BEGIN
    -- Insertar una nueva fila en la tabla Rol para el rol "Everyone"
    INSERT INTO Rol (nombre_rol, servidor_id)
    VALUES ('Everyone', :new.servidor_id);

    -- Agregar al dueño como miembro del servidor
    INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
    VALUES (:new.usuario_owner_id, :new.servidor_id, :new.fecha_creacion);

    -- Crear canal de voz "General"
    INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
    VALUES ('General', 'voz', '', 0, :new.servidor_id);

    -- Crear canal de texto "General"
    INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
    VALUES ('General', 'texto', '', 0, :new.servidor_id);

    -- Crear rol "Owner"
    INSERT INTO Rol (nombre_rol, servidor_id)
    VALUES ('Owner', :new.servidor_id)
    RETURNING rol_id INTO v_owner_rol_id;

    -- Asignar todos los permisos al rol "Owner"
    UPDATE PermisosRol
    SET ver_canales = 1, gestionar_canales = 1, gestionar_roles = 1
    WHERE rol_id = v_owner_rol_id;

    -- Asignar el rol "Owner" al propietario del servidor
    INSERT INTO MiembroRol (rol_id, miembro_servidor_id, servidor_id)
    VALUES (v_owner_rol_id, :new.usuario_owner_id, :new.servidor_id);
END;
/

--Cada vez que se cree un rol asignarle permisos por defecto
create or replace TRIGGER Trg_CreacionRolPermisos
AFTER INSERT ON Rol
FOR EACH ROW
BEGIN
    -- Insertar una nueva fila en la tabla PermisosRol con los permisos por defecto
    INSERT INTO PermisosRol (rol_id, ver_canales, gestionar_canales, gestionar_roles)
    VALUES (:NEW.rol_id, 1, 0, 0);
END;
/


--Asignar automáticamente el rol “Everyone” a los usuarios que se unen a un servidor e incrementar la cantidad de miembros del mismo
create or replace TRIGGER Trg_AsignarRolEveryone
AFTER INSERT ON MiembroServidor
FOR EACH ROW
BEGIN
    -- Insertar una nueva fila en la tabla MiembroRol asignando el rol "Everyone"
    INSERT INTO MiembroRol (rol_id, miembro_servidor_id, servidor_id)
    SELECT r.rol_id, :NEW.usuario_id, :NEW.servidor_id
    FROM Rol r
    WHERE r.nombre_rol = 'Everyone'
    AND r.servidor_id = :NEW.servidor_id;
END;
/

--Para crear una invitación se necesita ser miembro del servidor
CREATE OR REPLACE TRIGGER Trg_VerificarMiembroInvitacion
BEFORE INSERT ON Invitacion
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  -- Verificar si el usuario es miembro del servidor
  SELECT COUNT(*) INTO v_count
  FROM MiembroServidor
  WHERE usuario_id = :NEW.remitente_id
  AND servidor_id = :NEW.servidor_id;

  -- Si no es miembro, lanzar un error
  IF v_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Debe ser miembro del servidor para crear una invitación.');
  END IF;
END;
/

--Cada vez que entre se intente agregar un miembro a un servidor se verifica que haya lugar disponible
CREATE OR REPLACE TRIGGER Trg_CapacidadMaximaServidor
BEFORE INSERT OR UPDATE ON MiembroServidor
FOR EACH ROW
DECLARE
    total_miembros NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_miembros
    FROM MiembroServidor
    WHERE servidor_id = :NEW.servidor_id;

    IF total_miembros >= 250000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No se pueden agregar más miembros a este servidor. La cantidad máxima de miembros ha sido alcanzada (250.000).');
    END IF;
END;
/

--Servidores privados son solo accesibles con invitación
-- Este trigger se trató de realizar pero surgieron problemas de mutación en la tabla “Servidor”, debido a que cada vez que se crea un servidor se inserta como miembro al owner, entonces se dispara este trigger y ahí es donde trata de consultar datos de la tabla “Servidor” que está siendo modificada, por lo cual se procedió a quitar.
--CREATE OR REPLACE TRIGGER trg_acceso_servidor_privado
--BEFORE INSERT ON MiembroServidor
--FOR EACH ROW
--DECLARE
  --v_publico NUMBER(1);
  --v_invitacion_existente NUMBER(1);
  --v_owner_id NUMBER;
--BEGIN
  --SELECT publico, usuario_owner_id INTO v_publico, v_owner_id
  --FROM Servidor
  --WHERE servidor_id = :NEW.servidor_id;

  --IF v_publico = 0 AND :NEW.usuario_id <> v_owner_id THEN -- El servidor es privado y el usuario no es el propietario
    -- Verificar si el usuario tiene una invitación válida
    --SELECT COUNT(*) INTO v_invitacion_existente
    --FROM Invitacion
    --WHERE destinatario_id = :NEW.usuario_id
      --AND servidor_id = :NEW.servidor_id;

   -- IF v_invitacion_existente = 0 THEN
      --RAISE_APPLICATION_ERROR(-20001, 'No tienes acceso a este servidor privado.');
    --END IF;
  --END IF;
--EXCEPTION
  --WHEN NO_DATA_FOUND THEN
   -- RAISE_APPLICATION_ERROR(-20002, 'El servidor no existe.');
--END;
--/
