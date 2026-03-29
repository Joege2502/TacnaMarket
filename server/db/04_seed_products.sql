-- ============================================================
-- TacnaMarket - Script de inserción de datos de ejemplo
-- Categorías: 5 | Productos: 25 (5 por categoría)
-- ============================================================

BEGIN;

-- ============================================================
-- Insertar Categorías
-- ============================================================
INSERT INTO categories ("name", "description") VALUES
('Granos y Cereales', 'Arroz, trigo, harina y otros granos básicos'),
('Aceites y Grasas', 'Aceites vegetales, mantequilla y grasas para cocina'),
('Bebidas', 'Bebidas refrescantes, jugos y bebidas calientes'),
('Productos Lácteos', 'Leche, queso, yogurt y derivados lácteos'),
('Snacks y Frituras', 'Galletas, papas fritas, dulces y botanas');

-- ============================================================
-- Insertar Productos
-- ============================================================

-- Granos y Cereales
INSERT INTO products ("name", "description", "price", "stock", "categoryId") VALUES
('Arroz Integral 1kg', 'Arroz integral de grano largo, marca premium', 8.50, 150, (SELECT "id" FROM categories WHERE "name" = 'Granos y Cereales')),
('Harina de Trigo 2kg', 'Harina refinada para repostería y pan', 5.20, 200, (SELECT "id" FROM categories WHERE "name" = 'Granos y Cereales')),
('Avena en Hojuelas 500g', 'Avena pura sin aditivos, ideal para desayuno', 6.75, 120, (SELECT "id" FROM categories WHERE "name" = 'Granos y Cereales')),
('Fideos Pasta Surtida 450g', 'Variedad de pastas italianas para todo tipo de comidas', 3.50, 300, (SELECT "id" FROM categories WHERE "name" = 'Granos y Cereales')),
('Maíz Palomero 1kg', 'Maíz para hacer palomitas de maíz caseras', 7.99, 80, (SELECT "id" FROM categories WHERE "name" = 'Granos y Cereales'));

-- Aceites y Grasas
INSERT INTO products ("name", "description", "price", "stock", "categoryId") VALUES
('Aceite Vegetal 1L', 'Aceite vegetal de alto punto de humo para freír', 9.99, 100, (SELECT "id" FROM categories WHERE "name" = 'Aceites y Grasas')),
('Aceite de Oliva Extra Virgen 500ml', 'Aceite premium para ensaladas y acabados', 18.50, 60, (SELECT "id" FROM categories WHERE "name" = 'Aceites y Grasas')),
('Mantequilla Pura 250g', 'Mantequilla natural sin conservantes', 12.75, 90, (SELECT "id" FROM categories WHERE "name" = 'Aceites y Grasas')),
('Margarina 500g', 'Margarina para cocina y repostería', 6.50, 140, (SELECT "id" FROM categories WHERE "name" = 'Aceites y Grasas')),
('Manteca de Cerdo 1kg', 'Manteca tradicional para sofreír y cocinar', 11.99, 70, (SELECT "id" FROM categories WHERE "name" = 'Aceites y Grasas'));

-- Bebidas
INSERT INTO products ("name", "description", "price", "stock", "categoryId") VALUES
('Agua Embotellada 2L', 'Agua purificada en botella reutilizable', 2.50, 500, (SELECT "id" FROM categories WHERE "name" = 'Bebidas')),
('Jugo de Naranja Natural 1L', 'Jugo 100% natural sin azúcar añadida', 7.25, 120, (SELECT "id" FROM categories WHERE "name" = 'Bebidas')),
('Refresco Cola 2L', 'Bebida gaseosa sabor cola, paquete personal', 4.99, 200, (SELECT "id" FROM categories WHERE "name" = 'Bebidas')),
('Leche Fresca UHT 1L', 'Leche ultra pasteurizada de larga duración', 3.75, 250, (SELECT "id" FROM categories WHERE "name" = 'Bebidas')),
('Café Molido 250g', 'Café de origen selecto, molido fino para cafetera', 14.99, 85, (SELECT "id" FROM categories WHERE "name" = 'Bebidas'));

-- Productos Lácteos
INSERT INTO products ("name", "description", "price", "stock", "categoryId") VALUES
('Queso Fresco 500g', 'Queso artesanal fresco tipo quesillo', 16.50, 75, (SELECT "id" FROM categories WHERE "name" = 'Productos Lácteos')),
('Yogurt Natural 1kg', 'Yogurt natural probiótico sin sabores', 8.99, 150, (SELECT "id" FROM categories WHERE "name" = 'Productos Lácteos')),
('Queso Maduro 250g', 'Queso semicurado con sabor intenso', 19.99, 50, (SELECT "id" FROM categories WHERE "name" = 'Productos Lácteos')),
('Leche en Polvo 400g', 'Leche descremada en polvo para toda la familia', 11.50, 110, (SELECT "id" FROM categories WHERE "name" = 'Productos Lácteos')),
('Crema Ácida 200ml', 'Crema para cocina y postres', 7.50, 95, (SELECT "id" FROM categories WHERE "name" = 'Productos Lácteos'));

-- Snacks y Frituras
INSERT INTO products ("name", "description", "price", "stock", "categoryId") VALUES
('Papas Fritas Clásicas 150g', 'Papas crujientes sabor clásico apto para todos', 5.99, 300, (SELECT "id" FROM categories WHERE "name" = 'Snacks y Frituras')),
('Galletas de Trigo 300g', 'Galletas integrales saludables, bajas en grasas', 6.49, 200, (SELECT "id" FROM categories WHERE "name" = 'Snacks y Frituras')),
('Chocolate en Tableta 90g', 'Chocolate amargo 70% cacao puro', 8.75, 120, (SELECT "id" FROM categories WHERE "name" = 'Snacks y Frituras')),
('Caramelos Variados 250g', 'Mezcla de caramelos duros de diferentes sabores', 4.50, 180, (SELECT "id" FROM categories WHERE "name" = 'Snacks y Frituras')),
('Maní Tostado 200g', 'Maní selecto tostado sin sal añadida', 9.99, 100, (SELECT "id" FROM categories WHERE "name" = 'Snacks y Frituras'));

COMMIT;
