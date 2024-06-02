CREATE TABLE IF NOT EXISTS "Category"(
	"Id" UUID DEFAULT gen_random_uuid(),
	"Name" VARCHAR(50) NOT NULL,
	CONSTRAINT "PK_Category" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS "Product"(
	"Id" UUID DEFAULT gen_random_uuid(),
	"Name" VARCHAR(100) NOT NULL,
	"Price" NUMERIC(7, 2) NOT NULL,
	"Quantity" INT NOT NULL,
	"IsAvailable" BOOLEAN NOT NULL,
	CONSTRAINT "PK_Product" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS "ProductCategory"(
	"Id" UUID DEFAULT gen_random_uuid(),
	"CategoryId" UUID NOT NULL,
	"ProductId" UUID NOT NULL,
	CONSTRAINT "FK_ProductCategory_Category_CategoryId" FOREIGN KEY ("CategoryId") REFERENCES "Category"("Id"),
	CONSTRAINT "FK_ProductCategory_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES "Product"("Id"),
	CONSTRAINT "PK_ProductCategory" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS "Department"(
	"Id" UUID DEFAULT gen_random_uuid(),
	"Name" VARCHAR(50) NOT NULL,
	CONSTRAINT "PK_Department" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS "Employee"(
	"Id" UUID DEFAULT gen_random_uuid(),
	"DepartmentId" UUID NOT NULL,
	"FirstName" VARCHAR(100) NOT NULL,
	"LastName" VARCHAR(100) NOT NULL,
	CONSTRAINT "FK_Employee_Department_DepartmentId" FOREIGN KEY ("DepartmentId") REFERENCES "Department"("Id"),
	CONSTRAINT "PK_Employee" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS "Order"(
	"Id" UUID DEFAULT gen_random_uuid(),
	"EmployeeId" UUID NOT NULL,
	"DateCreated" TIMESTAMP NOT NULL,
	CONSTRAINT "FK_Order_Employee_EmployeeId" FOREIGN KEY ("EmployeeId") REFERENCES "Employee"("Id"),
	CONSTRAINT "PK_Order" PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS "ProductOrder"(
	"Id" UUID DEFAULT gen_random_uuid(),
	"OrderId" UUID NOT NULL,
	"ProductId" UUID NOT NULL,
	"Quantity" INT NOT NULL,
	CONSTRAINT "FK_ProductOrder_Order_OrderId" FOREIGN KEY ("OrderId") REFERENCES "Order"("Id"),
	CONSTRAINT "FK_ProductOrder_Product_ProductId" FOREIGN KEY ("ProductId") REFERENCES "Product"("Id"),
	CONSTRAINT "PK_ProductOrder" PRIMARY KEY ("Id")
);