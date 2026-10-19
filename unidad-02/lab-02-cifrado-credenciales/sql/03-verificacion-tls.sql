-- Actividad 4 — Protección de datos durante la comunicación
--Actividad 5 — Verificar el estado de TLS en PostgreSQL
-- Verificar si SSL está habilitado en PostgreSQL
SHOW ssl;

-- Verificar la versión mínima del protocolo SSL/TLS
SHOW ssl_min_protocol_version;

-- Verificar el puerto del servidor
SHOW port;

-- Verificar las direcciones en las que escucha PostgreSQL
SHOW listen_addresses;

-- Consultar la dirección y el puerto del cliente conectado
SELECT inet_client_addr(), inet_client_port();

-- Verificar si la conexión actual utiliza TLS
SELECT ssl, version, cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();