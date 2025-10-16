-- Market share global por marca (unidades)
SELECT
  marca,
  SUM(unidades_vendidas) AS total_unidades,
  ROUND(100.0 * SUM(unidades_vendidas) / SUM(SUM(unidades_vendidas)) OVER (), 2) AS market_share_pct
FROM notebooks_global.ventas
GROUP BY marca
ORDER BY total_unidades DESC;
