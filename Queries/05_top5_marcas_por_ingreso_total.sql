-- Top 5 marcas por ingreso total
SELECT
  marca,
  SUM(ingreso_total) AS ingreso
FROM notebooks_global.ventas
GROUP BY marca
ORDER BY ingreso DESC
LIMIT 5;
