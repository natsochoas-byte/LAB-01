# EVIDENCIAS TLS
# Actividades 4, 5 y 6 — Protección de datos durante la comunicación

## Objetivo
Comprender la importancia de TLS para proteger la información durante la comunicación entre un cliente y PostgreSQL, y verificar el estado de la conexión.

## Comando o procedimiento
Se consultó la configuración de PostgreSQL mediante `SHOW ssl`, `SHOW ssl_min_protocol_version`, `SHOW port` y `SHOW listen_addresses`. También se verificó la conexión actual mediante la vista `pg_stat_ssl`.

## Resultado obtenido
La conexión actual utiliza TLS, ya que el valor de `ssl` fue `true`.

- **TLS activo:** Sí.
- **Versión:** TLSv1.3.
- **Cifrado:** TLS_AES_256_GCM_SHA384.

## Análisis

### Actividad 5 — Verificación de TLS

**1. ¿La conexión actual utiliza TLS?**

Sí, la conexión utiliza TLS, porque la columna `ssl` muestra el valor `true`.

**2. ¿Qué versión de TLS se está utilizando?**

Se utiliza TLSv1.3.

**3. ¿Qué algoritmo de cifrado aparece?**

El cifrado utilizado es `TLS_AES_256_GCM_SHA384`.

**4. ¿Qué diferencia existe entre una conexión protegida con TLS y una conexión sin TLS?**

TLS cifra la comunicación entre el cliente y el servidor, ayudando a evitar que terceros puedan leer la información transmitida. Sin TLS, los datos podrían quedar expuestos si alguien intercepta el tráfico de red.

### Actividad 6 — Conexión mediante psql

## Comando utilizado
psql "host=localhost port=5432 dbname=postgres user=postgres sslmode=require"

**Se ejecutó la siguiente consulta:
SELECT ssl, version, cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();

## Resultados
- TLS activo: Sí (t).
- Versión: TLSv1.3.
- Cifrado: TLS_AES_256_GCM_SHA384.
## Análisis
El resultado confirma que la conexión realizada desde la terminal utiliza TLS. El parámetro sslmode=require solicita que la conexión esté cifrada.
## Conclusión
Se comprobó que las conexiones realizadas desde pgAdmin y desde la terminal con psql utilizan TLSv1.3 y el cifrado TLS_AES_256_GCM_SHA384, lo que contribuye a proteger la información durante su transmisión.
