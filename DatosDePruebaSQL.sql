--Inserción de datos de prueba para la tabla Usuario
-- Usuarios con verificación en 2 pasos y acepta mensajes directos
INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario1', 'usuario1@example.com', 'imagen1.jpg', 'Uruguay', SYSDATE, 'contraseña1', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario2', 'usuario2@example.com', 'imagen2.jpg', 'Argentina', SYSDATE, 'contraseña2', TO_DATE('1991-02-03', 'YYYY-MM-DD'), 1, 1);


--Usuarios sin verificación en 2 pasos y acepta mensajes directos
INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario3', 'usuario3@example.com', 'imagen3.jpg', 'Brasil', SYSDATE, 'contraseña3', TO_DATE('1995-05-10', 'YYYY-MM-DD'), 0, 1);

INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario4', 'usuario4@example.com', 'imagen4.jpg', 'Uruguay', SYSDATE, 'contraseña4', TO_DATE('1985-04-10', 'YYYY-MM-DD'), 0, 1);

INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario5', 'usuario5@example.com', 'imagen5.jpg', 'Uruguay', SYSDATE, 'contraseña5', TO_DATE('2000-01-10', 'YYYY-MM-DD'), 0, 1);


-- Usuario sin verificación en 2 pasos y no acepta mensajes directos
INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario6', 'usuario6@example.com', 'imagen6.jpg', 'Argentina', SYSDATE, 'contraseña3', TO_DATE('1985-12-25', 'YYYY-MM-DD'), 0, 0);

INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario7', 'usuario7@example.com', 'imagen7.jpg', 'Uruguay', SYSDATE, 'contraseña6', TO_DATE('1999-12-25', 'YYYY-MM-DD'), 0, 0);

-- Usuarios con verificación en 2 pasos y no aceptan mensajes directos
INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario8', 'usuario8@example.com', 'imagen8.jpg', 'Uruguay', SYSDATE, 'contraseña8', TO_DATE('1999-12-25', 'YYYY-MM-DD'), 1, 0);

INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario9', 'usuario9@example.com', 'imagen9.jpg', 'Uruguay', SYSDATE, 'contraseña9', TO_DATE('1999-12-25', 'YYYY-MM-DD'), 1, 0);

INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario10', 'usuario10@example.com', 'imagen10.jpg', 'Argentina', SYSDATE, 'contraseña10', TO_DATE('1994-07-21', 'YYYY-MM-DD'), 1, 0);

INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario11', 'usuario11@example.com', 'imagen11.jpg', 'Argentina', SYSDATE, 'contraseña11', TO_DATE('1999-07-21', 'YYYY-MM-DD'), 1, 0);

-- Usuario menor de 13 añados (Debería fallar)
INSERT INTO Usuario (nombre_usuario, correo_electronico, imagen_perfil, pais, fecha_registro, contrasena, fecha_nacimiento, acepta_Mensaje_directos, verificacion_en_2_pasos)
VALUES ('Usuario12', 'usuario12@example.com', 'imagen12.jpg', 'Argentina', SYSDATE, 'contraseña12', TO_DATE('2015-07-21', 'YYYY-MM-DD'), 1, 0);




--Inserción de datos de prueba para la tabla Telefono
-- Varios teléfonos para un usuario

INSERT INTO Telefono (usuario_id, telefono)
VALUES (1, '1234567890');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (1, '9876543210');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (3, '9869371910');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (3, '9963254210');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (7, '9865181910');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (7, '0243254210');

-- Un solo teléfono para otro usuario
INSERT INTO Telefono (usuario_id, telefono)
VALUES (2, '5555555555');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (4, '5555789325');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (5, '5557859315');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (6, '8519432745');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (8, '9860269510');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (9, '0274395110');

INSERT INTO Telefono (usuario_id, telefono)
VALUES (10, '0296335720');



--Inserción de datos de prueba para la tabla Amistad
-- Amistades entre distintos miembros

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (1, 2);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (2, 3);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (4, 3);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (4, 5);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (4, 6);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (7, 6);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (7, 1);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (7, 4);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (8, 9);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (8, 10);

INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (9, 10);

-- Intento de amistad a sí mismo (debería dar error)
INSERT INTO Amistad (usuario_id_1, usuario_id_2)
VALUES (1, 1);



--Inserción de datos de prueba para la tabla Servidor

-- Varios servidores, algunos públicos y otros privados (cantidad_miembros = 0)
INSERT INTO Servidor (nombre_servidor, descripcion, fecha_creacion, imagen, banner, publico, usuario_owner_id)
VALUES ('Servidor1', 'Descripción del servidor 1', '12/10/2013', 'imagen1.jpg', 'banner1.jpg', 1, 1);

INSERT INTO Servidor (nombre_servidor, descripcion, fecha_creacion, imagen, banner, publico, usuario_owner_id)
VALUES ('Servidor2', 'Descripción del servidor 2', '13/12/2019', 'imagen2.jpg', 'banner2.jpg', 0, 2);

INSERT INTO Servidor (nombre_servidor, descripcion, fecha_creacion, imagen, banner, publico, usuario_owner_id)
VALUES ('Midjourney', 'servidor de midjourney', '25/03/2015', 'imagen3.jpg', 'banner3.jpg', 0, 2);

INSERT INTO Servidor (nombre_servidor, descripcion, fecha_creacion, imagen, banner, publico, usuario_owner_id)
VALUES ('Servidor 4', 'descripción del servidor 4', '12/10/2020', 'imagen4.jpg', 'banner4.jpg', 0, 1);

INSERT INTO Servidor (nombre_servidor, descripcion, fecha_creacion, imagen, banner, publico, usuario_owner_id)
VALUES ('Servidor 5', 'descripción del servidor 5', '12/10/2022', 'imagen5.jpg', 'banner5.jpg', 1, 1);

INSERT INTO Servidor (nombre_servidor, descripcion, fecha_creacion, imagen, banner, publico, usuario_owner_id)
VALUES ('Servidor 6', 'descripción del servidor 6', '12/06/2021', 'imagen6.jpg', 'banner6.jpg', 1, 1);

INSERT INTO Servidor (nombre_servidor, descripcion, fecha_creacion, imagen, banner, publico, usuario_owner_id)
VALUES ('Servidor 7', 'descripción del servidor 7', '12/06/2023', 'imagen7.jpg', 'banner7.jpg', 1, 1);



--Inserción de datos de prueba para la tabla Rol
-- Varios roles en distintos servidores
INSERT INTO Rol (nombre_rol, servidor_id)
VALUES ('Rol1', 1);

INSERT INTO Rol (nombre_rol, servidor_id)
VALUES ('Rol1.1', 1);

INSERT INTO Rol (nombre_rol, servidor_id)
VALUES ('Rol2', 2);

INSERT INTO Rol (nombre_rol, servidor_id)
VALUES ('Rol2.1', 2);

INSERT INTO Rol (nombre_rol, servidor_id)
VALUES ('LocalAdmin', 3);





--Inserción de datos de prueba para la tabla MiembroServidor

-- Varios miembros en distintos servidores


INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (2, 1, TO_DATE('2019-11-25', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (3, 2, TO_DATE('2022-06-13', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (4, 3, TO_DATE('2023-03-13', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (5, 2, TO_DATE('2023-12-24', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (5, 3, TO_DATE('2023-02-27', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (6, 2, TO_DATE('2022-04-01', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (7, 3, TO_DATE('2023-03-18', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (8, 1, TO_DATE('2021-09-05', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (8, 3, TO_DATE('2021-09-05', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (9, 3, TO_DATE('2023-03-18', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (10, 1, TO_DATE('2016-12-25', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (10, 2, TO_DATE('2018-02-11', 'YYYY-MM-DD'));

INSERT INTO MiembroServidor (usuario_id, servidor_id, fecha_ingreso)
VALUES (10, 3, TO_DATE('2023-03-31', 'YYYY-MM-DD'));




-- Inserción de datos de prueba para la tabla Invitacion

-- Varias invitaciones a distintos servidores
INSERT INTO Invitacion (servidor_id, remitente_id, destinatario_id, enlace)
VALUES (1, 1, 2, 1);

INSERT INTO Invitacion (servidor_id, remitente_id, destinatario_id, enlace)
VALUES (2, 2, 1, 0);

INSERT INTO Invitacion (servidor_id, remitente_id, destinatario_id, enlace)
VALUES (3, 5, 7, 0);

INSERT INTO Invitacion (servidor_id, remitente_id, destinatario_id, enlace)
VALUES (3, 10, 8, 1);

-- Crear invitación sin ser miembro del servidor (Debería fallar) 
INSERT INTO Invitacion (servidor_id, remitente_id, destinatario_id, enlace)
VALUES (11, 10, 8, 1);





-- Inserción de datos de prueba para la tabla Canal

-- Varios canales en distintos servidores, algunos públicos y otros privados
INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
VALUES ('Canal1', 'texto', 'Descripción del canal 1', 1, 1);

INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
VALUES ('Canal2', 'voz', 'Descripción del canal 2', 0, 1);

INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
VALUES ('Canal3', 'voz', 'Descripción del canal 3', 0, 2);

INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
VALUES ('Canal4', 'voz', 'Descripción del canal 4', 0, 3);

INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
VALUES ('Canal5', 'voz', 'Descripción del canal 5', 1, 3);

INSERT INTO Canal (nombre_canal, tipo, descripcion, privado, servidor_id)
VALUES ('Canal6', 'voz', 'Descripción del canal 6', 0, 3);






--Inserción de datos para la tabla solicitud de amistad
INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (1,2,'02/02/2019',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (1,3,'01/03/2023',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (1,4,'11/04/2018',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (1,7,'07/05/2022',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (1,8,'17/01/2019',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (1,9,'18/02/2020',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (1,10,'21/09/2018',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (2,5,'22/12/2017',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (2,6,'30/11/2021',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (2,9,'21/07/2019',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (3,7,'25/09/2018',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (3,5,'01/01/2019',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) values (3,10,'01/02/2022',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (4,5,'11/02/2023',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (5,6,'21/01/2020',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (5,9,'27/03/2021',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (6,7,'28/09/2022',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (6,8,'25/08/2021',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (7,10,'16/07/2020',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (8,9,'18/06/2021',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (8,10,'01/05/2019',1);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (9,10,'01/04/2020',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,10,'01/04/2023',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,9,'20/06/2023',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,7,'11/06/2023',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,6,'01/05/2023',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,1,'01/04/2020',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,3,'01/04/2022',0);

INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,4,'01/06/2022',0);

-- Intento de solicitud de amistad a sí mismo (debería dar error)
INSERT INTO SOLICITUDAMISTAD (usuario_id_1, usuario_id_2, fecha_solicitud, estado) VALUES (11,11,'01/06/2022',0);




-- Verificar funcionamiento de Triggers (Creación de roles, canales, asignación de permisos, insercción de owners, fecha de amistad, etc... automatizado)
SELECT * FROM CANAL;
SELECT * FROM MIEMBROSERVIDOR;
SELECT * FROM ROL;
SELECT * FROM PERMISOSROL;
SELECT * FROM MIEMBROROL;
SELECT * FROM AMISTAD;
