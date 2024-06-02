SELECT p."Name", p."Price", p."Quantity", p."Description" 
	FROM "Product" AS p

SELECT p."Name", p."Price", p."Quantity", p."Description", c."Name", c."Description"
	FROM "Product" AS p
	JOIN "ProductCategory" AS pc ON p."Id" = pc."ProductId"
	JOIN "Category" AS c ON pc."CategoryId" = c."Id"

SELECT e."FirstName", e."LastName", e."Email", e."Phone", e."Adress", d."Name"
	FROM "Employee" AS e
	JOIN "Department" AS d ON e."DepartmentId" = d."Id"

SELECT o."Id", o."DateCreated", o."IsPaid", p."Name", po."Quantity" AS "ItemsOrdered", p."Price", p."Quantity", p."Description"
	FROM "Order" AS o
	JOIN "ProductOrder" AS po ON o."Id" = po."OrderId"
	JOIN "Product" AS p ON po."ProductId" = p."Id"

SELECT e."FirstName", e."LastName", e."Email", e."Phone", e."Adress", d."Name"
	FROM "Employee" AS e
	LEFT JOIN "Department" AS d ON e."DepartmentId" = d."Id"

SELECT o."Id", o."DateCreated", o."IsPaid", p."Name", po."Quantity" AS "ItemsOrdered", p."Price", p."Quantity", p."Description"
	FROM "Order" AS o
	RIGHT JOIN "ProductOrder" AS po ON o."Id" = po."OrderId"
	RIGHT JOIN "Product" AS p ON po."ProductId" = p."Id"