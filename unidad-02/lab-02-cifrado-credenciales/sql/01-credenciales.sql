-- LAB-02
-- Actividad 1 — Protección de credenciales
-- Preparación

-- Verificar la tabla clientes
SELECT *
FROM clientes;

-- Verificar la extensión pgcrypto
CREATE EXTENSION IF NOT EXISTS pgcrypto;

SELECT extname
FROM pg_extension
WHERE extname = 'pgcrypto';

--El problema_Supongamos que una aplicación necesita almacenar información de usuarios.
--Una implementación incorrecta sería:
CREATE TABLE usuarios_insegura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);
--Insertamos usuario de prueba:
INSERT INTO usuarios_insegura (usuario, password)
VALUES ('juan', 'Password123');
--Verificamos
SELECT * FROM usuarios_insegura;

--Generar una representación no reversible
--utilizaremos pgcrypto
SELECT crypt(
    'Password123',
    gen_salt('bf')
);
SELECT crypt(
    'Password123',
    gen_salt('bf')
);
--Crear una tabla para credenciales protegidas
CREATE TABLE usuarios_segura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);
--Insertamos un usuario
INSERT INTO usuarios_segura (usuario, password_hash)
VALUES (
    'juan',
    crypt('Password123', gen_salt('bf'))
);
--Consultamos y verificamos que ya no aparece la contraseña original.
SELECT * FROM usuarios_segura;

--Verificar una contraseña
SELECT
    usuario,
    password_hash = crypt('Password123', password_hash)
        AS contraseña_correcta
FROM usuarios_segura
WHERE usuario = 'juan';

--Prueba ahora con una contraseña incorrecta:
SELECT
    usuario,
    password_hash = crypt('OtraPassword', password_hash)
        AS contraseña_correcta
FROM usuarios_segura
WHERE usuario = 'juan';