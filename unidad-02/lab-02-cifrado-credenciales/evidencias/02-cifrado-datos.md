# EVIDENCIAS
# Actividad 2 — Cifrado de información sensible

## Objetivo
Proteger un dato sensible mediante cifrado simétrico en PostgreSQL y comprobar su recuperación utilizando la clave correspondiente.

## Comando o procedimiento
Se creó la tabla `clientes_protegidos` con un campo `rfc_cifrado` de tipo `BYTEA`. Se insertó un RFC de prueba utilizando `pgp_sym_encrypt()` y posteriormente se consultó el registro cifrado. Después, se utilizó `pgp_sym_decrypt()` para recuperar el dato original y se realizó una prueba con una clave incorrecta.

## Resultado obtenido
El RFC se almacenó cifrado y pudo recuperarse utilizando la clave correcta. Al intentar descifrarlo con una clave incorrecta, se produjo un error.

## Análisis

**1. ¿Qué diferencia existe entre `crypt()` y `pgp_sym_encrypt()`?**

`crypt()` se utiliza para generar y verificar hashes de contraseñas, mientras que `pgp_sym_encrypt()` cifra información que posteriormente puede recuperarse mediante una clave.

**2. ¿Cuál de los dos mecanismos permite recuperar el dato original?**

`pgp_sym_encrypt()` permite recuperar el dato original mediante `pgp_sym_decrypt()` y la clave correcta.

**3. ¿Qué ocurre si se utiliza una clave incorrecta?**

El descifrado falla y PostgreSQL genera un error.

**4. ¿Qué problema de seguridad representa colocar la clave directamente en una consulta?**

La clave podría quedar expuesta en archivos SQL, repositorios, registros o capturas de pantalla, permitiendo que otras personas accedan a la información cifrada.

## Conclusión
El cifrado simétrico permite proteger datos sensibles y recuperarlos cuando se dispone de la clave correcta. Sin embargo, es necesario proteger las claves y evitar almacenarlas directamente en los scripts o repositorios.