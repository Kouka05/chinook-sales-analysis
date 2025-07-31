-- Top 3 Products per Region using a Window Function
WITH revenue_by_product AS (
  SELECT
    c.Country                            AS region,
    t.Name                               AS product,
    SUM(il.UnitPrice * il.Quantity)      AS revenue
  FROM Customer c
  JOIN Invoice inv    ON c.CustomerId = inv.CustomerId
  JOIN InvoiceLine il ON inv.InvoiceId = il.InvoiceId
  JOIN Track t        ON il.TrackId = t.TrackId
  GROUP BY c.Country, t.Name
),
ranked AS (
  SELECT
    region,
    product,
    revenue,
    ROW_NUMBER() OVER (
      PARTITION BY region
      ORDER BY revenue DESC
    ) AS rn
  FROM revenue_by_product
)
SELECT region, product, revenue
FROM ranked
WHERE rn <= 3
ORDER BY region, revenue DESC;
