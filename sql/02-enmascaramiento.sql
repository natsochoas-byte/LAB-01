--ACT2- ENMASCARAMIENTO(MASKING)
--Primero creamos el rol
CREATE ROLE soporte NOLOGIN;
--Crear una vista de acceso restringido
CREATE VIEW v_clientes_soporte AS
SELECT
    id,
    nombre,

    CONCAT(
        LEFT(correo, 2),
        '*****',
        SUBSTRING(correo FROM POSITION('@' IN correo))
    ) AS correo,

    CONCAT(
        '******',
        RIGHT(telefono, 4)
    ) AS telefono,

    CONCAT(
        '*********',
        RIGHT(rfc, 4)
    ) AS rfc

FROM clientes;
--Consulta a la vista:
SELECT * FROM v_clientes_soporte;

--Conceder acceso a la vista
GRANT USAGE
ON SCHEMA public
TO soporte;

GRANT SELECT
ON v_clientes_soporte
TO soporte;
--Revocar el acceso directo a la tabla
REVOKE ALL
ON clientes
FROM soporte;
--Verificar el resultado
--La consulta a la vista debe mostrar los datos protegidos:
SELECT * FROM v_clientes_soporte;
--El acceso directo a la tabla debe estar restringido para el rol soporte:
SELECT * FROM clientes;









