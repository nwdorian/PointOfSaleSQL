UPDATE "Department" 
	SET "Name" = 'Finance'
	WHERE "Name" = 'Marketing'

UPDATE "Product"
	SET "Price" = 489.99
	WHERE "Name" = 'Laptop'

UPDATE "Category"
	SET "Name" = 'Tools & Gardening'
	WHERE "Name" = 'Tools'
	
DELETE FROM "Product"
	WHERE "Name" = 'Tablet'

DELETE FROM "Category"
	WHERE "Name" = 'Cosmetics'