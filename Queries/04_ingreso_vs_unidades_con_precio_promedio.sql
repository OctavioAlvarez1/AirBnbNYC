-- Dispersión: ingreso vs unidades + precio promedio por marca
SELECT
  marca,
  SUM(unidades_vendidas) AS unidades,
  SUM(ingreso_total)     AS ingreso,
  ROUND(SUM(ingreso_total) / NULLIF(SUM(unidades_vendidas), 0), 2) AS precio_promedio
FROM notebooks_global.ventas
GROUP BY marca
ORDER BY ingreso DESC;
