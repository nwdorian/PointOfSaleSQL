CREATE VIEW InvoiceView AS
SELECT o."Id", o."DateCreated" + MAKE_INTERVAL(days => 7) AS "DueDate", SUM(p."Price" * po."Quantity") AS "TotalPrice"
FROM "Order" AS o
JOIN "ProductOrder" AS po ON o."Id" = po."OrderId"
JOIN "Product" AS p ON po."ProductId" = p."Id"
GROUP BY o."Id"