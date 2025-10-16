-- Tendencia anual (Top 5 marcas por unidades totales)
WITH top5 AS (
  SELECT marca
  FROM notebooks_global.ventas
  GROUP BY marca
  ORDER BY SUM(unidades_vendidas) DESC
  LIMIT 5
)
SELECT
  v.anio,
  v.marca,
  SUM(v.unidades_vendidas) AS unidades
FROM notebooks_global.ventas v
JOIN top5 t ON v.marca = t.marca
GROUP BY v.anio, v.marca
ORDER BY v.anio, v.marca;
