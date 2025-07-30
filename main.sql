-- 1) Top‑Selling Products (by total units sold)
SELECT
  p.Name           AS product_name,
  SUM(il.Quantity) AS total_units_sold
FROM InvoiceLine il
JOIN Track t   ON il.TrackId = t.TrackId
JOIN Album a   ON t.AlbumId = a.AlbumId
JOIN Artist ar ON a.ArtistId = ar.ArtistId
JOIN Genre g   ON t.GenreId = g.GenreId
-- if you want just product name, skip Album/Artist/Genre joins
JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId
JOIN Track p2   ON il.TrackId = p2.TrackId
-- simplified to:
-- JOIN Track p ON il.TrackId = p.TrackId
GROUP BY p2.Name
ORDER BY total_units_sold DESC
LIMIT 10;


-- 2) Revenue per Region (Country)
SELECT
  c.Country                     AS region,
  ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS total_revenue
FROM Customer c
JOIN Invoice inv   ON c.CustomerId = inv.CustomerId
JOIN InvoiceLine il ON inv.InvoiceId = il.InvoiceId
GROUP BY c.Country
ORDER BY total_revenue DESC;


-- 3) Monthly Performance (Revenue by Month)
SELECT
  STRFTIME('%Y-%m', inv.InvoiceDate) AS year_month,
  ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS monthly_revenue
FROM Invoice inv
JOIN InvoiceLine il ON inv.InvoiceId = il.InvoiceId
GROUP BY year_month
ORDER BY year_month;


-- 4) Combining Products & Sales (with JOINs)
SELECT
  p.Name             AS product,
  inv.InvoiceDate    AS sale_date,
  il.Quantity,
  ROUND(il.UnitPrice * il.Quantity, 2) AS sale_amount
FROM InvoiceLine il
JOIN Track p     ON il.TrackId = p.TrackId
JOIN Invoice inv ON il.InvoiceId = inv.InvoiceId;


-- Bonus) Top 3 Products per Region using a Window Function
WITH revenue_by_product AS (
  SELECT
    c.Country                       AS region,
    p.Name                          AS product,
    SUM(il.UnitPrice * il.Quantity) AS revenue
  FROM Customer c
  JOIN Invoice inv   ON c.CustomerId = inv.CustomerId
  JOIN InvoiceLine il ON inv.InvoiceId = il.InvoiceId
  JOIN Track p       ON il.TrackId = p.TrackId
  GROUP BY c.Country, p.Name
),
ranked AS (
  SELECT
    region,
    product,
    revenue,
    ROW_NUMBER() OVER (PARTITION BY region ORDER BY revenue DESC) AS rn
  FROM revenue_by_product
)
SELECT region, product, revenue
FROM ranked
WHERE rn <= 3
ORDER BY region, revenue DESC;
