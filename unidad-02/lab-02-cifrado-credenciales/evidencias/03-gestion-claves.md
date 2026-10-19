# EVIDENCIAS
# Actividad 3 — Gestión de claves

## Objetivo
Identificar los riesgos de almacenar claves criptográficas directamente en archivos SQL y repositorios Git.

## Comando o procedimiento
Se analizó un ejemplo de consulta SQL que utiliza una clave escrita directamente en el código para descifrar información almacenada en la tabla `clientes_protegidos`.

## Resultado obtenido
Se identificó que la clave aparece directamente en la consulta SQL, lo que podría exponerla si el archivo se comparte o publica.

## Análisis
**¿Qué ocurriría si esta clave fuera una clave utilizada realmente por una organización y el archivo se publicara en un repositorio Git?**

Una persona que obtuviera acceso al archivo podría conocer la clave e intentar descifrar la información protegida. Esto comprometería la confidencialidad de los datos.

## Conclusión
Las claves criptográficas no deben almacenarse directamente en scripts ni repositorios. Deben protegerse mediante mecanismos adecuados de gestión de secretos y utilizarse únicamente valores ficticios en las prácticas.