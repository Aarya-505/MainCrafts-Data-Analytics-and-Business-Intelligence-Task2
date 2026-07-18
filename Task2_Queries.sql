SELECT
  o."Order ID",
  o."Order Date",
  c."Customer Name",
  c.Region,
  o.Category,
  o.Sales,
  o.Profit
FROM Orders o
INNER JOIN Customers c
ON o."Customer ID" = c."Customer ID";

SELECT c.Region,
SUM(o.Sales) AS Total_Sales
FROM Orders o
JOIN Customers c
ON o."Customer ID" = c."Customer ID"
GROUP BY c.Region;

SELECT Category,
(SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin_Percentage
FROM Orders
GROUP BY Category;

SELECT c."Customer Name",
SUM(o.Sales) AS Total_Revenue
FROM Orders o
JOIN Customers c
ON o."Customer ID" = c."Customer ID"
GROUP BY c."Customer Name"
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT SUBSTR("Order Date", 4, 2) AS Month,
SUM(Sales) AS Monthly_Sales
FROM Orders
GROUP BY Month
ORDER BY Month;