-- Combined Products & Sales
SELECT
  t.Name                    AS product,
  inv.InvoiceDate           AS sale_date,
  il.Quantity,
  ROUND(il.UnitPrice * il.Quantity, 2) AS sale_amount
FROM InvoiceLine il
JOIN Track t      ON il.TrackId = t.TrackId
JOIN Invoice inv  ON il.InvoiceId = inv.InvoiceId
ORDER BY inv.InvoiceDate;
