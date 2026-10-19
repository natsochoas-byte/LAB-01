# EVIDENCIAS
# Actividad 1 — Protección de credenciales

## Objetivo
Identificar los riesgos de almacenar contraseñas como texto claro y comprobar cómo se protegen las credenciales mediante funciones de hash en PostgreSQL.

## Comando o procedimiento
Se creó la tabla `usuarios_insegura`, se insertó un usuario de prueba y se consultaron los registros almacenados. Después, se utilizó `crypt()` junto con `gen_salt('bf')` para generar hashes y se creó la tabla `usuarios_segura` para almacenar la contraseña protegida. Finalmente, se realizaron pruebas para verificar contraseñas correctas e incorrectas.

## Resultado obtenido
En la tabla `usuarios_insegura`, la contraseña `Password123` se mostró directamente en la consulta. Al utilizar `crypt()` y `gen_salt('bf')`, se generaron hashes de la contraseña. En la tabla `usuarios_segura`, la contraseña se almacenó como un hash en lugar de texto claro.

## Análisis

### 7.1 El problema

**¿Qué ocurriría si una persona obtiene acceso de lectura a esta tabla?**

Podría visualizar directamente las contraseñas almacenadas y utilizarlas para acceder a las cuentas correspondientes. Esto representa un riesgo mayor si los usuarios reutilizan sus contraseñas en otros servicios.

### 7.3 Generar una representación no reversible

**1. ¿Son iguales los resultados de las dos consultas?**

No, los resultados son diferentes.

**2. Si no son iguales, ¿por qué?**

Porque `gen_salt('bf')` genera una sal diferente para cada operación, por lo que el hash resultante cambia aunque la contraseña sea la misma.

**3. ¿Qué función cumple `gen_salt()`?**

Genera una sal que se utiliza durante el proceso de hash para dificultar los ataques basados en tablas precalculadas.

**4. ¿Qué función cumple `crypt()`?**

Genera un hash de la contraseña y permite comprobar posteriormente si una contraseña coincide con el hash almacenado.

**5. ¿Esto es cifrado reversible?**

No. Es un proceso de hash que permite verificar la contraseña sin tener que recuperar el texto original.

### 7.5 Verificar una contraseña

**1. ¿Qué resultado obtuviste con la contraseña correcta?**

La consulta devuelve el usuario `juan` y el resultado `true` en la columna `contraseña_correcta`.

**2. ¿Qué resultado obtuviste con la contraseña incorrecta?**

La consulta devuelve el resultado `false` en la columna `contraseña_correcta`.

**3. ¿Por qué no es necesario recuperar la contraseña original?**

Porque basta con comparar el hash almacenado con el resultado de procesar la contraseña ingresada utilizando el hash guardado.

**4. ¿Por qué un hash no debe confundirse con cifrado?**

Porque el hash está diseñado para verificar información sin recuperarla, mientras que el cifrado permite recuperar los datos originales utilizando la clave correspondiente.

## Conclusión
El almacenamiento de contraseñas en texto claro representa un riesgo para la seguridad de los usuarios. Utilizar hashes permite proteger las credenciales y verificar las contraseñas sin almacenar su contenido original. En aplicaciones reales, deben utilizarse mecanismos de protección de contraseñas recomendados y evitar almacenar credenciales en texto claro.