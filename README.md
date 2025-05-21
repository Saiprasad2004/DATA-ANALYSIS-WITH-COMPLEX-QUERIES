# DATA-ANALYSIS-WITH-COMPLEX-QUERIES

Task 2: DATA ANALYSIS WITH COMPLEX QUERIES
Company: CODTECH IT SOLUTIONS
Name : pasupula sai prasad
Intern ID : CT04DL115
Domain : SQL
Duration : 4 WEEKS
Mentor : Neela Santhosh

Task Description
Use advanced SQL features—window functions, subqueries, and Common Table Expressions (CTEs)—to analyze a simple sales table and showcase trends or patterns.
i used online mySQL work beanch to run my queries.

Steps and Files
analysis.sql
Creates a table named .orders2 (order_id, item_name, region, order_value) 
Inserts five sample rows.
![Image](https://github.com/user-attachments/assets/fd49b356-734a-4cdd-bc19-58e11617f229)


Demonstrates:
SUM(amount) OVER (PARTITION BY region): total sales per region.
![Image](https://github.com/user-attachments/assets/7ef9b733-822c-4869-8c29-8f3303da1e2a)

ROW_NUMBER() OVER (PARTITION BY product ORDER BY amount DESC): ranking orders by amount within each product.
![Image](https://github.com/user-attachments/assets/1abecdd5-3b0e-42a1-925f-1db2e97087b5)

A CTE (avg_region) to compute average amount per region, then filters actual sales greater than that average.
Image

A subquery that aggregates total sales per product, then filters to products whose total sales exceed 250.
