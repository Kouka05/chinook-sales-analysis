-- Top‐Selling Products (by total units sold)
SELECT TOP 10
  t.Name               AS product_name,
  SUM(il.Quantity)     AS total_units_sold
FROM InvoiceLine il
JOIN Track t      ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY total_units_sold DESC;
