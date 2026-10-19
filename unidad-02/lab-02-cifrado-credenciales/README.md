# LAB-02 
# INFORME DE CIFRADO, CREDENCIALES Y COMUNICACIONES SEGURAS

## 1. Introducción

En esta práctica se trabajó con diferentes mecanismos para proteger la información almacenada en PostgreSQL y los datos que se transmiten entre el cliente y el servidor. Se revisaron los riesgos de guardar contraseñas y datos sensibles en texto claro, así como la importancia de utilizar cifrado, conexiones seguras y una correcta gestión de las claves criptográficas.

## 2. Protección de credenciales

El texto claro es información que se puede leer directamente, como una contraseña almacenada sin protección. Esto representa un riesgo porque cualquier persona que tenga acceso a la tabla podría conocer la contraseña.

El hash transforma una contraseña en una representación que no se puede recuperar directamente a partir del resultado. En la práctica se utilizó `pgcrypto` con las funciones `crypt()` y `gen_salt()` para proteger las contraseñas.

Por otro lado, el cifrado permite transformar la información para que no pueda leerse sin la clave correspondiente. A diferencia del hash, el cifrado permite recuperar el dato original cuando se cuenta con la clave correcta.

## 3. Protección de datos sensibles

En la práctica se creó la tabla `clientes_protegidos` para almacenar un RFC cifrado mediante la función `pgp_sym_encrypt()` de PostgreSQL.

Después se utilizó `pgp_sym_decrypt()` para recuperar el dato original mediante la clave correcta. También se probó una clave incorrecta para observar qué ocurría al intentar descifrar la información.

Esto permitió comprobar que los datos sensibles pueden almacenarse cifrados para reducir el riesgo de que sean leídos por personas no autorizadas.

## 4. TLS

TLS protege la información que se transmite entre un cliente y un servidor mediante cifrado. Esto ayuda a evitar que terceros puedan leer los datos durante la comunicación.

En PostgreSQL se consultó el estado de la conexión mediante `pg_stat_ssl`. Los resultados mostraron que TLS estaba activo, utilizando la versión `TLSv1.3` y el cifrado `TLS_AES_256_GCM_SHA384`.

También se realizó una conexión desde la terminal de Ubuntu utilizando `psql` con el parámetro `sslmode=require`. La consulta confirmó que esta conexión también utilizaba TLSv1.3 y el mismo cifrado.

## 5. Gestión de claves

Las claves criptográficas no deben almacenarse junto con los scripts SQL porque podrían quedar expuestas al compartir archivos o publicarlos en un repositorio GitLab.

Si alguien obtiene una clave real, podría utilizarla para intentar descifrar la información protegida. Por eso, las claves deben guardarse en sistemas seguros de gestión de secretos y el acceso debe limitarse a las personas autorizadas.

## 6. Resultados

Durante la práctica se obtuvieron los siguientes resultados:

- Se creó una tabla para demostrar el riesgo de almacenar contraseñas en texto claro.
- Se utilizó `pgcrypto` para generar hashes con sal y comprobar contraseñas.
- Se creó una tabla para almacenar un RFC cifrado y se comprobó que podía recuperarse con la clave correcta.
- Se revisaron los riesgos de guardar claves criptográficas directamente en archivos SQL.
- Se verificó que las conexiones desde pgAdmin y desde la terminal utilizaban TLSv1.3.
- Se compararon diferentes mecanismos de protección para información almacenada y transmitida.
- Se propusieron reglas para la generación, almacenamiento, acceso, rotación, respaldo, revocación y eliminación de claves criptográficas.

## 7. Problemas encontrados

Durante la práctica fue necesario identificar los resultados de las consultas ejecutadas en pgAdmin y verificar la conexión desde la terminal de Ubuntu.

Para comprobar la conexión mediante `psql`, se utilizó el parámetro `sslmode=require` y se consultó la vista `pg_stat_ssl`. La conexión se estableció correctamente y se confirmó que TLS estaba activo.

También se identificó que una conexión cifrada no garantiza por sí sola la validación completa de la identidad del servidor, por lo que es importante configurar correctamente los certificados.

## 8. Conclusiones

Con esta práctica aprendí que proteger una base de datos no consiste solamente en configurar usuarios y permisos. También es necesario proteger las contraseñas, cifrar los datos sensibles, asegurar las comunicaciones y administrar correctamente las claves criptográficas.

En un entorno productivo utilizaría hashes con sal para las contraseñas, cifrado para los datos sensibles que necesiten recuperarse, TLS con validación del servidor y un sistema seguro para gestionar las claves. También protegería los respaldos mediante cifrado y controles de acceso.

# Preguntas de reflexión

## 1. ¿Por qué una contraseña no debe almacenarse como texto claro?

Porque cualquier persona que tenga acceso a la tabla podría leerla directamente. Es más seguro almacenar un hash con sal para evitar guardar la contraseña original.

## 2. ¿Por qué un hash no es equivalente a un cifrado?

Porque el hash está diseñado para ser unidireccional y no permite recuperar directamente el dato original. El cifrado sí permite recuperar la información cuando se utiliza la clave correcta.

## 3. ¿Por qué el cifrado de una columna no sustituye al control de acceso?

Porque el cifrado protege la información, pero no determina quién tiene permiso para consultar o modificar la base de datos. Por eso también se necesitan usuarios, roles y permisos adecuados.

## 4. ¿Por qué TLS no sustituye a los mecanismos de autorización de PostgreSQL?

Porque TLS protege la comunicación entre el cliente y el servidor, mientras que los mecanismos de autorización controlan qué acciones puede realizar cada usuario dentro de PostgreSQL.

## 5. ¿Qué ocurriría si una organización pierde una clave utilizada para cifrar información?

Podría perder la posibilidad de recuperar los datos cifrados. Por eso es importante mantener respaldos seguros de las claves y contar con un procedimiento de recuperación.

## 6. ¿Qué ocurriría si una clave criptográfica se publica accidentalmente en GitLab?

Una persona que obtenga la clave podría utilizarla para intentar descifrar la información protegida. La clave debe considerarse comprometida, revocarse o reemplazarse y revisarse el posible impacto de la exposición.

## 7. ¿Por qué un repositorio privado no debe considerarse un almacén de secretos?

Porque otras personas con acceso al repositorio podrían ver los archivos y las claves. Además, los secretos pueden permanecer en el historial de Git aunque se eliminen del archivo actual.

## 8. ¿Qué diferencia existe entre proteger información almacenada y proteger información durante su transmisión?

La protección de la información almacenada busca evitar que los datos guardados sean leídos sin autorización. La protección durante la transmisión busca evitar que terceros puedan leer la información mientras viaja entre el cliente y el servidor.

## 9. ¿Por qué la gestión de claves es tan importante como el algoritmo criptográfico?

Porque, aunque se utilice un algoritmo seguro, si una clave se expone, se pierde o se administra incorrectamente, la información protegida puede quedar en riesgo.

## 10. ¿Qué mecanismo adicional implementarías en una organización para proteger los respaldos de las bases de datos?

Implementaría el cifrado de los respaldos, controles de acceso y almacenamiento en una ubicación segura. También establecería pruebas periódicas de recuperación para comprobar que los respaldos funcionan correctamente.