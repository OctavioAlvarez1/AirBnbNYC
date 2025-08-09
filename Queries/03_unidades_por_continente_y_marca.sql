-- Unidades vendidas por continente y marca
SELECT
  continente,
  marca,
  SUM(unidades_vendidas) AS unidades
FROM notebooks_global.ventas
GROUP BY continente, marca
ORDER BY continente, unidades DESC;
