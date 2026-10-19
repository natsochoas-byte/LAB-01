--ACTIVIDAD 7- RETENCIÓN DE DATOS
--Se utilizará un periodo de cinco años:
SELECT *
FROM clientes
WHERE fecha_alta < CURRENT_DATE - INTERVAL '5 years';

--VERIFICACIÓN FINAL
--Area de soporte
SET ROLE soporte;
--Debe poder consultar:
SELECT * FROM v_clientes_soporte;
--pero no acceder directamente a:
SELECT * FROM public.clientes;


--Area de analitica
--Debe poder consultar:
SELECT * FROM analitica.clientes;
--pero no:
SELECT * FROM pii.mapa_cliente;
--ni:
SELECT * FROM public.clientes;

RESET ROLE;