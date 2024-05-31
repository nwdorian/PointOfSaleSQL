CREATE TABLE "Category"(
	"Id" UUID PRIMARY KEY,
	"Name" VARCHAR(50) NOT NULL
);

CREATE TABLE "Product"(
	"Id" UUID PRIMARY KEY,
	"Name" VARCHAR(100) NOT NULL,
	"Price" NUMERIC(5, 2) NOT NULL,
	"Quantity" INT NOT NULL,
	"IsAvailable" BOOLEAN NOT NULL
);

CREATE TABLE "ProductCategory"(
	"Id" UUID PRIMARY KEY,
	"CategoryId" UUID NOT NULL,
	"ProductId" UUID NOT NULL,
	FOREIGN KEY ("CategoryId") REFERENCES "Category"("Id"),
	FOREIGN KEY ("ProductId") REFERENCES "Product"("Id")
);

CREATE TABLE "Department"(
	"Id" UUID PRIMARY KEY,
	"Name" VARCHAR(50) NOT NULL
);

CREATE TABLE "Employee"(
	"Id" UUID PRIMARY KEY,
	"DepartmentId" UUID NOT NULL,
	"FirstName" VARCHAR(100) NOT NULL,
	"LastName" VARCHAR(100) NOT NULL,
	FOREIGN KEY ("DepartmentId") REFERENCES "Department"("Id")
);

CREATE TABLE "Order"(
	"Id" UUID PRIMARY KEY,
	"EmployeeId" UUID NOT NULL,
	"DateCreated" TIMESTAMP NOT NULL,
	FOREIGN KEY ("EmployeeId") REFERENCES "Employee"("Id")
);

CREATE TABLE "ProductOrder"(
	"Id" UUID PRIMARY KEY,
	"OrderId" UUID NOT NULL,
	"ProductId" UUID NOT NULL,
	"Quantity" INT NOT NULL,
	FOREIGN KEY ("OrderId") REFERENCES "Order"("Id"),
	FOREIGN KEY ("ProductId") REFERENCES "Product"("Id")
)