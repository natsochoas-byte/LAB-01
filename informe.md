//NATALIA OCHOA LEÓN 
//GRUPO 4-1
//ALEXIS MOISES MONTAÑO ARAUJO

# Informe de protección de datos y privacidad de los datos

## 19. Informe

### 1 Clasificación

Los datos que requieren protección son `nombre`, `correo`, `telefono` y `rfc`, porque permiten identificar directamente a una persona. También deben protegerse atributos como `edad`, `ciudad`, `codigo_postal` y `fecha_alta`, ya que pueden combinarse para identificar indirectamente a un cliente. Por ello, es importante establecer medidas de protección según el tipo de información y el uso que se le dará.

### 2 Enmascaramiento

Se creó la vista `v_clientes_soporte` para que el personal de soporte pueda consultar información sin visualizar completamente los datos personales. Se ocultaron parcialmente el correo electrónico, el teléfono y el RFC, con el objetivo de reducir la exposición de información confidencial. Para hacerlo, se sustituyeron partes de los valores por asteriscos, conservando algunos caracteres que permiten reconocer los registros. Además, se otorgaron permisos sobre la vista y se restringió el acceso directo a la tabla `clientes`.

### 3 Seudonimización

Se generaron tokens UUID mediante `pgcrypto` para sustituir los identificadores originales de los clientes. El mapa de correspondencia se almacenó en `pii.mapa_cliente`, donde se relacionan los tokens con los identificadores originales. El acceso a este mapa debe limitarse al personal autorizado, ya que permite recuperar la relación entre los tokens y las identidades reales. Los permisos se separaron para que el usuario `analista` pueda consultar los datos seudonimizados sin acceder directamente a las identidades originales, aplicando el principio de mínimo privilegio.

### 4 Anonimización

Para reducir el riesgo de identificación, deben eliminarse los identificadores directos, como `nombre`, `correo`, `telefono` y `rfc`. También pueden generalizarse atributos como `edad`, `ciudad`, `codigo_postal` y `fecha_alta` para dificultar la identificación indirecta. Los grupos con pocos registros deben suprimirse cuando puedan facilitar la identificación de una persona. Sin embargo, permanece cierto riesgo de reidentificación si se combinan varios atributos o se relacionan los datos con otras fuentes de información.

### 5 Retención

Se utilizó un periodo de cinco años como criterio para identificar registros que podrían superar el tiempo de conservación establecido. Deben conservarse los registros que todavía sean necesarios por motivos legales, administrativos u operativos, mientras que aquellos que hayan superado el periodo y ya no tengan una finalidad justificada podrían eliminarse. Antes de hacerlo, es necesario verificar las obligaciones de conservación, comprobar que no existan procesos pendientes, obtener las autorizaciones correspondientes y asegurar que la eliminación se realice de manera controlada.

### 6 Conclusiones

Para un área de soporte utilizaría el enmascaramiento, porque permite consultar información sin mostrar completamente los datos personales. Para un área de analítica utilizaría la seudonimización, ya que permite analizar información sin exponer directamente la identidad de los clientes. Para publicar estadísticas utilizaría la anonimización, acompañada de la generalización de atributos y la supresión de grupos pequeños cuando sea necesario. Ninguna de estas técnicas sustituye al control de acceso, porque este determina quién puede consultar, modificar o eliminar la información, mientras que las técnicas de protección reducen la exposición de los datos.

## 20. Preguntas de reflexión

### 1. ¿Cuál es la diferencia entre enmascaramiento y seudonimización?

El enmascaramiento oculta total o parcialmente los datos que se muestran, mientras que la seudonimización sustituye los identificadores originales por tokens. El primero limita la visualización de la información y el segundo dificulta relacionar directamente los registros con una persona.

### 2. ¿Por qué la seudonimización no significa anonimización?

Porque los datos seudonimizados todavía pueden relacionarse con una persona mediante el mapa de correspondencia o información adicional. La anonimización busca impedir que las personas puedan identificarse razonablemente a partir de los datos disponibles.

### 3. ¿Por qué eliminar `nombre` y `RFC` no garantiza que un conjunto de datos sea anónimo?

Porque pueden permanecer otros atributos que permitan identificar a una persona cuando se combinan, como la edad, la ciudad, el código postal o las fechas de determinadas actividades.

### 4. ¿Qué función tienen los cuasi-identificadores?

Los cuasi-identificadores son atributos que no identifican directamente a una persona por sí solos, pero que pueden combinarse con otros datos para reconocerla. Por eso deben evaluarse antes de compartir o publicar información.

### 5. ¿Por qué es importante separar el mapa de seudonimización?

Porque contiene la relación entre los tokens y las identidades originales. Mantenerlo separado reduce el riesgo de que una persona sin autorización pueda identificar a los titulares de los registros.

### 6. ¿Qué principio de seguridad se aplica al impedir que el analista acceda al mapa?

Se aplica el principio de mínimo privilegio, que establece que cada usuario debe tener únicamente los permisos necesarios para realizar sus funciones. De esta manera, el analista puede trabajar con datos seudonimizados sin acceder a las identidades originales.

### 7. ¿Por qué una vista puede ser preferible a entregar acceso directo a la tabla?

Porque una vista permite mostrar únicamente las columnas y los registros necesarios para una tarea. Esto reduce la exposición de información confidencial y evita que el usuario necesite acceso directo a todos los datos de la tabla original.

### 8. ¿Qué diferencia existe entre proteger un dato para visualización y protegerlo contra acceso no autorizado?

Proteger un dato para visualización significa limitar la información que se muestra, por ejemplo, mediante el enmascaramiento. En cambio, protegerlo contra acceso no autorizado implica impedir que usuarios sin los permisos correspondientes puedan consultar la información original.

### 9. ¿Por qué la retención forma parte de la protección de datos?

Porque conservar información durante más tiempo del necesario aumenta el riesgo de exposición y uso indebido. Establecer periodos de retención permite determinar cuándo debe revisarse y eliminarse la información que ya no se necesita.

### 10. ¿Qué riesgo existe si una organización conserva información indefinidamente?

Aumenta el riesgo de que la información sea expuesta, consultada sin autorización o utilizada indebidamente. Además, se acumulan datos que podrían haber dejado de ser necesarios para la organización.