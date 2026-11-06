USE BrightMartDB;

SELECT *
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;

SELECT *
FROM Orders
INNER JOIN Payment
ON Orders.Order_ID = Payment.Order_ID;

SELECT Customer.Customer_Name, Product.Product_Name
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
JOIN Order_Details ON Orders.Order_ID = Order_Details.Order_ID
JOIN Product ON Order_Details.Product_ID = Product.Product_ID;

SELECT *
FROM Customer
LEFT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;

SELECT *
FROM Customer
LEFT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
WHERE Orders.Order_ID IS NULL;

SELECT *
FROM Product
LEFT JOIN Order_Details
ON Product.Product_ID = Order_Details.Product_ID
WHERE Order_Details.Order_ID IS NULL;

SELECT *
FROM Customer
RIGHT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;

SELECT *
FROM Customer
RIGHT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
WHERE Customer.Customer_ID IS NULL;

SELECT *
FROM Orders
RIGHT JOIN Payment
ON Orders.Order_ID = Payment.Order_ID;

SELECT Customer.Customer_Name,
Product.Product_Name,
Order_Details.Quantity,
Orders.Order_Date,
Orders.Total_Amount,
Payment.Payment_Status
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
JOIN Order_Details ON Orders.Order_ID = Order_Details.Order_ID
JOIN Product ON Order_Details.Product_ID = Product.Product_ID
LEFT JOIN Payment ON Orders.Order_ID = Payment.Order_ID;

SELECT Customer.Customer_Name, Product.Product_Name
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
JOIN Order_Details ON Orders.Order_ID = Order_Details.Order_ID
JOIN Product ON Order_Details.Product_ID = Product.Product_ID;

SELECT Customer.Customer_Name,
SUM(Orders.Total_Amount) AS Total_Spent
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
GROUP BY Customer.Customer_Name;

SELECT Customer.Customer_Name,
COUNT(Orders.Order_ID) AS Total_Orders
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
GROUP BY Customer.Customer_Name;

SELECT Customer.Customer_Name,
MAX(Orders.Order_Date) AS Latest_Purchase
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
GROUP BY Customer.Customer_Name;

SELECT Customer.Customer_Name,
Orders.Order_ID,
Orders.Order_Date,
Orders.Order_Status
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID;

SELECT Product.Product_Name,
SUM(Order_Details.Quantity) AS Quantity_Sold,
SUM(Order_Details.Quantity * Order_Details.Price) AS Revenue
FROM Product
JOIN Order_Details
ON Product.Product_ID = Order_Details.Product_ID
GROUP BY Product.Product_Name;

SELECT Payment_Mode,
COUNT(*) AS Total_Transactions,
SUM(Payment_Status = 'Success') AS Successful_Payments
FROM Payment
GROUP BY Payment_Mode;

SELECT Customer.Customer_Name,
SUM(Orders.Total_Amount) AS Total_Spending
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
GROUP BY Customer.Customer_Name
ORDER BY Total_Spending DESC
LIMIT 5;

SELECT Customer.Customer_Name,
COUNT(Orders.Order_ID) AS Total_Orders
FROM Customer
JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
GROUP BY Customer.Customer_Name
ORDER BY Total_Orders DESC
LIMIT 5;