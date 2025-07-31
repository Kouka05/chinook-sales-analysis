-- Monthly Performance (Revenue by Month)
SELECT
  CONVERT(VARCHAR(7), inv.InvoiceDate, 120)   AS year_month,  -- yields 'YYYY‑MM'
  ROUND(SUM(il.UnitPrice * il.Quantity), 2)   AS monthly_revenue
FROM Invoice inv
JOIN InvoiceLine il ON inv.InvoiceId = il.InvoiceId
GROUP BY CONVERT(VARCHAR(7), inv.InvoiceDate, 120)
ORDER BY year_month;
