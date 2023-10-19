--Requerimiento 1: Proveer un servicio que retorne los servidores con más usuarios registrados. El servicio deberá recibir un parámetro para listar solo los N primeros servidores
CREATE OR REPLACE PROCEDURE get_top_servers (p_top IN NUMBER) IS
BEGIN
  FOR r IN (
    SELECT servidor_id, COUNT(usuario_id) as total_usuarios
    FROM MiembroServidor
    GROUP BY servidor_id
    ORDER BY COUNT(usuario_id) DESC
    FETCH FIRST p_top ROWS ONLY
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Servidor ID: ' || r.servidor_id || ', Usuarios: ' || r.total_usuarios);
  END LOOP;
END;

--Requerimiento 2: Proveer un servicio que revise las solicitudes de amistad pendientes. En caso de que la solicitud no se haya confirmado en los últimos 10 días el servicio cancelará automáticamente la solicitud. La cantidad de días puede variar a futuro, ese servicio debe permitir el cambio con costo mínimo 
--NOTA: PARA QUE ESTE REQUERIMIENTO FUNCIONE DE MANERA CORRECTA SE DEBE UTILIZAR EL DDL CON LAS MODIFICACIONES REALIZADAS PARA ESTE OBLIGATORIO 2 (TABLA “SolicitudAmistad” agregada)

create or replace PROCEDURE update_friend_request(p_days IN NUMBER) AS
    CURSOR cur_solicitud IS
    SELECT usuario_id_1, usuario_id_2
    FROM SolicitudAmistad
    WHERE fecha_solicitud < SYSDATE - p_days AND estado = 0;
BEGIN
    FOR cur IN cur_solicitud LOOP
        BEGIN
            DELETE FROM SolicitudAmistad
            WHERE usuario_id_1 = cur.usuario_id_1
            AND usuario_id_2 = cur.usuario_id_2;
            COMMIT;
            EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
        END;
    END LOOP;
END;

--Requerimiento 3: Proveer un servicio que, dado un rango de fechas y un usuario, retorna la lista de servidores públicos y privados a los que se unió

CREATE OR REPLACE PROCEDURE get_user_servers (p_user_id IN NUMBER, p_start_date IN DATE, p_end_date IN DATE) AS
    CURSOR cur_ingreso IS
    SELECT servidor_id
    FROM MiembroServidor
    WHERE usuario_id = p_user_id AND fecha_ingreso BETWEEN p_start_date AND p_end_date;
BEGIN
        FOR ingreso IN cur_ingreso LOOP
        DBMS_OUTPUT.PUT_LINE('Servidor ID: ' || ingreso.servidor_id);
        END LOOP;
END;

