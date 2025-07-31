-- Revenue per Region (Country)
SELECT
  c.Country                                   AS region,
  ROUND(SUM(il.UnitPrice * il.Quantity), 2)   AS total_revenue
FROM Customer c
JOIN Invoice inv    ON c.CustomerId = inv.CustomerId
JOIN InvoiceLine il ON inv.InvoiceId = il.InvoiceId
GROUP BY c.Country
ORDER BY total_revenue DESC;
