--BORRAR EN CASO DE QUE EXISTAN TABLAS ANTERIORES
DROP TABLE INVITACION;
DROP TABLE AMISTAD;
DROP TABLE SOLICITUDAMISTAD;
DROP TABLE CANAL;
DROP TABLE PERMISOSROL;
DROP TABLE MIEMBROROL;
DROP TABLE ROL;
DROP TABLE MIEMBROSERVIDOR;
DROP TABLE SERVIDOR;
DROP TABLE TELEFONO;
DROP TABLE USUARIO;

-- TABLAS
CREATE TABLE Usuario (
    usuario_id NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre_usuario VARCHAR2(55) NOT NULL,
    correo_electronico VARCHAR2(55) UNIQUE NOT NULL,
    imagen_perfil VARCHAR2(255),
    pais VARCHAR2(55),
    fecha_registro DATE NOT NULL,
    contrasena VARCHAR2(55) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    acepta_Mensaje_directos NUMBER(1) DEFAULT 0,
    verificacion_en_2_pasos NUMBER(1) DEFAULT 1,
    PRIMARY KEY (usuario_id)
);

CREATE TABLE Telefono (
    usuario_id NUMBER NOT NULL,
    telefono VARCHAR2(20),
    PRIMARY KEY (telefono),
    FOREIGN KEY (usuario_id) REFERENCES Usuario (usuario_id)
);

CREATE TABLE Amistad (
    usuario_id_1 NUMBER,
    usuario_id_2 NUMBER,
    fecha_amistad DATE NOT NULL,
    PRIMARY KEY (usuario_id_1, usuario_id_2),
    FOREIGN KEY (usuario_id_1) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (usuario_id_2) REFERENCES Usuario(usuario_id),
    CHECK (usuario_id_1 != usuario_id_2)
);

CREATE TABLE SolicitudAmistad (
    usuario_id_1 NUMBER,
    usuario_id_2 NUMBER,
    fecha_solicitud DATE NOT NULL,
    estado NUMBER(1) DEFAULT 0, -- 0 para pendiente, 1 para confirmada, 2 para confirmada
    PRIMARY KEY (usuario_id_1, usuario_id_2),
    FOREIGN KEY (usuario_id_1) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (usuario_id_2) REFERENCES Usuario(usuario_id),
    CHECK (usuario_id_1 != usuario_id_2)
);

CREATE TABLE Servidor (
    servidor_id NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre_servidor VARCHAR2(55) NOT NULL,
    descripcion VARCHAR2(255),
    fecha_creacion TIMESTAMP NOT NULL,
    imagen VARCHAR2(255),
    banner VARCHAR2(255),
    publico NUMBER(1) NOT NULL,
    usuario_owner_id NUMBER NOT NULL,
    PRIMARY KEY (servidor_id),
    FOREIGN KEY (usuario_owner_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE Rol (
    rol_id NUMBER GENERATED ALWAYS AS IDENTITY,
    nombre_rol VARCHAR2(55) NOT NULL,
    servidor_id NUMBER NOT NULL,
    PRIMARY KEY (rol_id),
    FOREIGN KEY (servidor_id) REFERENCES Servidor(servidor_id)
);

CREATE TABLE PermisosRol (
    rol_id NUMBER,
    ver_canales NUMBER(1) DEFAULT 1,
    gestionar_canales NUMBER(1) DEFAULT 0,
    gestionar_roles NUMBER(1) DEFAULT 0,
    PRIMARY KEY (rol_id),
    FOREIGN KEY (rol_id) REFERENCES Rol(rol_id)
);

CREATE TABLE MiembroServidor (
    usuario_id NUMBER,
    servidor_id NUMBER,
    fecha_ingreso DATE NOT NULL,
    PRIMARY KEY (usuario_id, servidor_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (servidor_id) REFERENCES Servidor(servidor_id)
);

CREATE TABLE MiembroRol (
    rol_id NUMBER,
    miembro_servidor_id NUMBER,
    servidor_id NUMBER,
    PRIMARY KEY (rol_id, miembro_servidor_id, servidor_id),
    FOREIGN KEY (rol_id) REFERENCES Rol(rol_id),
    FOREIGN KEY (miembro_servidor_id, servidor_id) REFERENCES MiembroServidor(usuario_id, servidor_id)
);

CREATE TABLE Invitacion (
    invitacion_id NUMBER GENERATED ALWAYS AS IDENTITY,
    servidor_id NUMBER NOT NULL,
    remitente_id NUMBER NOT NULL,
    destinatario_id NUMBER NOT NULL,
    enlace NUMBER(1) NOT NULL,
    PRIMARY KEY (invitacion_id),
    FOREIGN KEY (destinatario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (remitente_id, servidor_id) REFERENCES MiembroServidor(usuario_id, servidor_id)
);

CREATE TABLE Canal (
    nombre_canal VARCHAR2(55),
    tipo VARCHAR2(10)CHECK (tipo IN ('voz', 'texto')),
    descripcion VARCHAR2(255),
    privado NUMBER(1) NOT NULL,
    servidor_id NUMBER,
    PRIMARY KEY (servidor_id, nombre_canal, tipo),
    FOREIGN KEY (servidor_id) REFERENCES Servidor(servidor_id)
);