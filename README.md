
## ⚙️ How to Run

### Option 1: Using SQLite (Recommended for Beginners)

1. Download [DB Browser for SQLite](https://sqlitebrowser.org/dl/)
2. Open the `chinook.db` file from the `main` folder.
3. Open the `SQL` tab and paste any of the `.sql` scripts from the `main` folder to execute them.

### Option 2: Using SQL Server

1. Use SQL Server Management Studio (SSMS) or Azure Data Studio.
2. Import the Chinook SQL Server version of the database (or manually recreate tables).
3. Open and run the `*_sqlserver.sql` versions of each query.

> 💡 Let me know if you need the `.bak` or `.sql` files for restoring the SQL Server version of Chinook.

## 📈 Queries Included

| File | Description |
|------|-------------|
| `01_top_products.sql` | Top 10 selling products by quantity |
| `02_revenue_by_region.sql` | Revenue breakdown per country |
| `03_monthly_performance.sql` | Monthly revenue trends |
| `04_product_sales_join.sql` | Join of product names, dates, and sales |
| `05_top3_per_region.sql` | Top 3 products per region using window functions |

## 🧑‍💻 Built With

- SQL (SQLite and SQL Server)
- Chinook Database (sample music store)
- Guidance and training by **Elevvo**

---

### ⭐ If you find this project helpful or want to support me, feel free to give it a star!

