-- Base para heatmap: unidades por marca y año
SELECT
  anio,
  marca,
  SUM(unidades_vendidas) AS unidades
FROM notebooks_global.ventas
GROUP BY anio, marca
ORDER BY marca, anio;
