ALTER TABLE "Order"
	ADD COLUMN "IsPaid" BOOLEAN NOT NULL;

ALTER TABLE "Product" 
	DROP COLUMN "IsAvailable",
	ADD COLUMN "Description" VARCHAR;

ALTER TABLE "Employee"
	ADD COLUMN "Email" VARCHAR(50),
	ADD COLUMN "Phone" VARCHAR(30),
	ADD COLUMN "Adress" VARCHAR(100);

ALTER TABLE "Category"
	ADD COLUMN "Description" VARCHAR;

ALTER TABLE "Employee"
	ALTER COLUMN "Email" SET NOT NULL,
	ALTER COLUMN "Phone" SET NOT NULL;

ALTER TABLE "ProductCategory"
	ALTER COLUMN "CategoryId" DROP NOT NULL;

ALTER TABLE "ProductCategory"
	DROP CONSTRAINT "FK_ProductCategory_Category_CategoryId",
	DROP CONSTRAINT "FK_ProductCategory_Product_ProductId";

ALTER TABLE "ProductCategory"
	ADD CONSTRAINT "FK_ProductCategory_Category_CategoryId"
	FOREIGN KEY ("CategoryId") REFERENCES "Category" ("Id")
	ON DELETE SET NULL;

ALTER TABLE "ProductCategory"
	ADD CONSTRAINT "FK_ProductCategory_Product_ProductId"
	FOREIGN KEY ("ProductId") REFERENCES "Product" ("Id")
	ON DELETE CASCADE;

ALTER TABLE "Employee"
	ALTER COLUMN "DepartmentId" DROP NOT NULL;

ALTER TABLE "Employee"
	DROP CONSTRAINT "FK_Employee_Department_DepartmentId";

ALTER TABLE "Employee"
	ADD CONSTRAINT "FK_Employee_Department_DepartmentId"
	FOREIGN KEY ("DepartmentId") REFERENCES "Department" ("Id")
	ON DELETE SET NULL