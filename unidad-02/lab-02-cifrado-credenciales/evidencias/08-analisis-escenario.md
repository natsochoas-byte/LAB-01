# EVIDENCIAS
# Actividad 8 — Analizar un escenario de seguridad

## Objetivo
Identificar los riesgos de seguridad que puede tener una empresa y proponer formas de proteger su información.

## Comando o procedimiento
Se analizó el escenario de la empresa y los problemas que presenta en el almacenamiento y la protección de sus datos.

## Resultado obtenido

### Pregunta 1. ¿Cuáles son los principales riesgos?

Los principales riesgos son que alguien pueda conocer las contraseñas y los RFC porque están guardados en texto claro. También existe el riesgo de que se intercepte información durante las conexiones, que alguien obtenga las claves criptográficas al estar escritas en archivos SQL y que los respaldos sean accesibles para personas no autorizadas.

### Pregunta 2. ¿Qué mecanismo utilizarías para cada elemento?

Para las contraseñas utilizaría un hash con sal para que no se almacenen en texto claro. Para el RFC y la información financiera utilizaría cifrado, mientras que para el nombre y el correo electrónico establecería permisos de acceso adecuados. Para las conexiones usaría TLS con validación del servidor. Las claves criptográficas las guardaría en un sistema seguro de gestión de secretos y protegería los respaldos mediante cifrado.

### Pregunta 3. ¿Cuál de los problemas consideras más crítico y por qué?

Considero que guardar las contraseñas en texto claro es uno de los problemas más críticos, porque cualquier persona que tenga acceso a la tabla podría conocerlas directamente. Además, si una persona utiliza la misma contraseña en otras cuentas, también podrían verse afectadas.

### Pregunta 4. ¿Tener correctamente configurados los usuarios y permisos elimina estos riesgos? Justifica tu respuesta.

No, porque aunque los permisos estén bien configurados, siguen existiendo otros problemas, como guardar contraseñas y RFC en texto claro o dejar las claves en archivos SQL. Por eso, también es necesario utilizar cifrado, proteger las conexiones y cuidar el almacenamiento de los respaldos.

## Conclusión
La seguridad de una base de datos no depende solamente de los usuarios y permisos. También es importante proteger la información almacenada, las conexiones y las claves para reducir los riesgos de que los datos lleguen a personas no autorizadas.