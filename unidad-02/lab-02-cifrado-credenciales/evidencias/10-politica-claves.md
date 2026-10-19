# EVIDENCIAS
# Actividad 10 — Crear una política mínima de protección de claves

## Objetivo
Establecer reglas básicas para proteger las claves criptográficas y evitar que personas no autorizadas puedan acceder a ellas.

## Política de protección de claves

1. **Generación:** Las claves criptográficas deben generarse mediante herramientas seguras que utilicen métodos adecuados de generación aleatoria.

2. **Almacenamiento:** Las claves deben guardarse en un sistema seguro de gestión de secretos y no en archivos SQL, código fuente o repositorios Git.

3. **Acceso:** Solamente las personas autorizadas deben tener acceso a las claves, de acuerdo con las funciones que desempeñan.

4. **Rotación:** Las claves deben cambiarse periódicamente y cuando exista sospecha de que pudieron ser comprometidas.

5. **Respaldo:** Se deben mantener respaldos protegidos de las claves cuando sean necesarios para recuperar la información, evitando que personas no autorizadas puedan acceder a ellos.

6. **Revocación:** Si una clave deja de ser segura o ya no se necesita, debe revocarse para evitar que continúe utilizándose.

7. **Exposición accidental:** Si una clave se publica por error en un repositorio o archivo compartido, debe considerarse comprometida y reemplazarse lo antes posible.

8. **Eliminación:** Las claves que ya no se utilicen deben eliminarse de forma segura, incluyendo las copias que puedan existir en respaldos o archivos temporales, cuando corresponda.

## Verificación final

### Credenciales

**¿Una contraseña debe cifrarse o protegerse mediante un mecanismo de derivación de claves para contraseñas?**

Debe protegerse mediante un mecanismo de derivación de claves para contraseñas, como `crypt()` con `gen_salt()` de `pgcrypto`, para almacenar un hash con sal en lugar de la contraseña original.

### Datos sensibles

**¿Qué diferencia existe entre enmascaramiento, seudonimización y cifrado?**

El enmascaramiento oculta parte de los datos para que no se vean completos. La seudonimización reemplaza los datos que identifican a una persona por otros valores, aunque todavía es posible volver a identificarla si se cuenta con información adicional. El cifrado transforma los datos para que no puedan leerse sin la clave correspondiente.

### Comunicaciones

**¿Qué problema resuelve TLS?**

TLS protege la información que se transmite entre un cliente y un servidor mediante cifrado, ayudando a evitar que terceros puedan leerla o modificarla durante la comunicación.

### Claves

**¿Dónde debería almacenarse una clave criptográfica en un entorno real?**

En un sistema seguro de gestión de secretos o de claves, con acceso restringido a personas autorizadas.

### Repositorio

**¿Es correcto subir una contraseña o clave real a GitLab aunque el repositorio sea privado?**

No.

Un repositorio privado reduce la exposición, pero no convierte un secreto en información apropiada para almacenar dentro del código. Las contraseñas y claves reales deben mantenerse fuera del repositorio.

## Análisis

La protección de las claves criptográficas es importante porque, si alguien obtiene acceso a ellas, podría descifrar información protegida. Por eso, es necesario guardarlas en un lugar seguro, limitar quién puede utilizarlas y cambiarlas si existe riesgo de que hayan sido expuestas.

## Conclusión

Establecer reglas para gestionar las claves ayuda a proteger la información y reducir los riesgos de acceso no autorizado. También es importante evitar guardar claves reales en los archivos SQL o en repositorios, incluso si son privados.