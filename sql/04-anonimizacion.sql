--ACTIVIDAD 5_Anonimización (anonymization)
--El área de dirección solicita información estadística.
--No necesita conocer los clientes individualmente.
--El objetivo es generar información agregada y reducir el riesgo de reidentificación.

--Generalizar la edad
SELECT
    CASE
        WHEN edad BETWEEN 18 AND 30 THEN '18-30'
        WHEN edad BETWEEN 31 AND 45 THEN '31-45'
        ELSE '46+'
    END AS rango_edad,
    COUNT(*) AS total
FROM clientes
GROUP BY 1;

--generalizar la región
SELECT
    LEFT(codigo_postal, 2) AS region,
    COUNT(*) AS total
FROM clientes
GROUP BY 1;

--Combinar atributos
SELECT
    CASE
        WHEN edad BETWEEN 18 AND 30 THEN '18-30'
        WHEN edad BETWEEN 31 AND 45 THEN '31-45'
        ELSE '46+'
    END AS rango_edad,
    LEFT(codigo_postal, 2) AS region,
    COUNT(*) AS total
FROM clientes
GROUP BY 1, 2;

--Suprimir grupos pequeños
--se utilizará un umbral de cinco registros:
SELECT
    CASE
        WHEN edad BETWEEN 18 AND 30 THEN '18-30'
        WHEN edad BETWEEN 31 AND 45 THEN '31-45'
        ELSE '46+'
    END AS rango_edad,

    LEFT(codigo_postal, 2) AS region,

    COUNT(*) AS total

FROM clientes

GROUP BY 1, 2

HAVING COUNT(*) >= 5;

--ACTIVIDAD 6 — Análisis del riesgo de reidentificación
--Reto — Reducir el riesgo de reidentificación
SELECT
    CASE
        WHEN edad < 40 THEN 'Menor de 40'
        ELSE '40 o más'
    END AS grupo_edad,
    ciudad,
    COUNT(*) AS total
FROM clientes
GROUP BY 1, 2
HAVING COUNT(*) >= 2;
