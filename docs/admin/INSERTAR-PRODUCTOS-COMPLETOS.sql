-- =====================================================
-- INSERTAR PRODUCTOS COMPLETOS CON SUBCATEGORÍAS
-- =====================================================
-- Este script inserta todos los productos con sus subcategorías correspondientes

-- =====================================================
-- PASO 1: ELIMINAR PRODUCTOS EXISTENTES (OPCIONAL)
-- =====================================================
-- ADVERTENCIA: Esto eliminará TODOS los productos de la base de datos
-- Descomenta las siguientes líneas solo si quieres eliminar todos los productos

-- Primero, eliminar referencias en pedido_items (si existen)
-- DELETE FROM pedido_items;

-- Luego, eliminar todos los productos
-- DELETE FROM productos;

-- Reiniciar el contador de IDs (opcional)
-- ALTER SEQUENCE productos_id_seq RESTART WITH 1;

-- Verificar que no hay productos
-- SELECT COUNT(*) as productos_restantes FROM productos;

-- =====================================================
-- PASO 2: VER SUBCATEGORÍAS DISPONIBLES
-- =====================================================
-- Primero, vamos a ver las subcategorías disponibles para mapear correctamente
SELECT id, nombre FROM subcategorias ORDER BY nombre;

-- =====================================================
-- INSERTAR PRODUCTOS
-- =====================================================
-- Nota: Ajusta los subcategoria_id según los IDs reales de tu base de datos

-- ÁNGULOS PARA WALLPANEL EXTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('ANGULO EXTERIOR 2,90M COLOR CENIZA', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('ANGULO EXTERIOR X2,90M COLOR VINOTINTO', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('ANGULO EXTERIOR 2,90M COLOR CAFÉ', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('ANGULO EXTERIOR 2,90M COLOR MARRÓN AMARILLO', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO EXTERIOR X2,90M COLOR TECA CLARO', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('ANGULO EXTERIOR 2,90M COLOR TECA OSCURO', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO EXTERIOR 2,90M COLOR PÚRPURA', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO EXTERIOR 2,90M COLOR GRIS PLATA', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('ANGULO EXTERIOR COLOR BROWM 50*50*2900MM', 'Ángulos para Wallpanel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true);

-- ÁNGULOS PARA WALLPANEL INTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('ANGULO INTERIOR 2,90M COLOR ROYAL OAK', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR MATT WHITE', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR SILVER OAK', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR DREAM SPACE', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR TECNICAL WOODY', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR MOCHA GRAY', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR HOME PERFUME', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR GOLDEN WIND', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR STRAIGTH LOVE VENICE', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR APPLE WOODY', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR CEMENTE GRAY', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR SCIENCIA TECHNOLOGY', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR COMOLU', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR QUI GUANGYAN', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR CLASICAL TECHNOLOGY', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true);
('ANGULO INTERIOR 2,90M COLOR STRAIGTH GRAIN PONE', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR ROSEWOOD', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),
('ANGULO INTERIOR 2,90M COLOR SLIKA CLOTH2', 'Ángulos para Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1), 3, 0, 0, true),

-- ACCESORIOS PARA TECHO
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('CLAVOS PARA CIELO RASO PAQ 1*100', 'Accesorios para Techo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%accesorio%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('PERFIL CIELO RASO 3MTRS', 'Perfil Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true);

-- DETERMINACIONES DE WALLPANEL
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('DETERMINACION PS SMALLGRAY CLARO M02-06148 12*2900 MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL EXT', 'Determinación Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR JAZZ WHITE', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR BLACK FIRE 40*24*2900MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WPC WALL PANEL', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR 16.50CM*2,90M COLOR TECNICAL WOODY', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR SILVER OAK', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR 16.50CM*2,90M COLOR JAZZ', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR 16.50CM*2,90M COLOR QUI GUANGYAN', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR MATTE BLACK', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR HOME PERFUME', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INT LIGTH GRAY TECH WOOD 40*24*2900MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION PS BIGGRAY CLARO M02-06148 12*2900 MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION PS BIGMARRON CLARO M02-5487-1 12*2900 MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION PS GRAY INTERMEDIO M02-22016 12*2900 MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION PS M02-23038-4 MARRON OSCURO 12*2900 MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION PS SMALL GRAY CLARO M02-06148 12*2900 MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION PS SMALL MARRON CLARO M02-5487-1 12*2900 MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INT LIGHT PARTEM40*24*2900MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INT SENSATION GRAY 40*24*2900MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true),
('DETERMINACION WALL PANEL INT TECH GOOD 01 40*24*2900MM', 'Determinación de Wallpanel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 5, 0, 0, true);

-- GRAMA ARTIFICIAL
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 4MX25MX9RD', 'Grama Artificial', (SELECT id FROM subcategorias WHERE nombre ILIKE '%grama%' OR nombre ILIKE '%jardin%' LIMIT 1), 10, 0, 0, true),
('GRAMA ARTIFICIAL 10MM ALTO/CAL. 3/16"/PUNTADA 300S/M. 2MX25MX25', 'Grama Artificial', (SELECT id FROM subcategorias WHERE nombre ILIKE '%grama%' OR nombre ILIKE '%jardin%' LIMIT 1), 6, 0, 0, true),
('GRAMA ARTIFICIAL 20MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25M (MT2)', 'Grama Artificial', (SELECT id FROM subcategorias WHERE nombre ILIKE '%grama%' OR nombre ILIKE '%jardin%' LIMIT 1), 8, 0, 0, true),
('GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25MX18RD', 'Grama Artificial', (SELECT id FROM subcategorias WHERE nombre ILIKE '%grama%' OR nombre ILIKE '%jardin%' LIMIT 1), 10, 0, 0, true);

-- JARDÍN VERTICAL
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('JARDIN VERTICAL MILAN GRASS (EXTERIOR) 52X52CM', 'Jardín Vertical', (SELECT id FROM subcategorias WHERE nombre ILIKE '%jardin%' OR nombre ILIKE '%vertical%' LIMIT 1), 14, 0, 0, true);

-- LÁMINAS PVC
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('LAMINA PVC 20CM*5,95M COLOR CENIZA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR VINOTINTO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR CAFÉ', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR MARRÓN AMARILLO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR TECA CLARO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR TECA OSCURO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR PÚRPURA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR GRIS PLATA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 20CM*5,95M COLOR BROWM', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR CENIZA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR VINOTINTO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR CAFÉ', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR MARRÓN AMARILLO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR TECA CLARO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR TECA OSCURO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR PÚRPURA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR GRIS PLATA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 25CM*5,95M COLOR BROWM', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR CENIZA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR VINOTINTO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR CAFÉ', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR MARRÓN AMARILLO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR TECA CLARO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR TECA OSCURO', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR PÚRPURA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR GRIS PLATA', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true),
('LAMINA PVC 30CM*5,95M COLOR BROWM', 'Láminas PVC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1), 10, 0, 0, true);

-- LÁMINAS WPC
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('LAMINA WPC 19CM*2,90M COLOR CENIZA', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR VINOTINTO', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR CAFÉ', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR MARRÓN AMARILLO', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR TECA CLARO', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR TECA OSCURO', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR PÚRPURA', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR GRIS PLATA', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true),
('LAMINA WPC 19CM*2,90M COLOR BROWM', 'Láminas WPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%wpc%' OR nombre ILIKE '%wpc%' LIMIT 1), 10, 0, 0, true);

-- LÁMINAS BAMBOO
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('LAMINA BAMBOO 19CM*2,90M COLOR CENIZA', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR VINOTINTO', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR CAFÉ', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR MARRÓN AMARILLO', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR TECA CLARO', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR TECA OSCURO', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR PÚRPURA', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR GRIS PLATA', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true),
('LAMINA BAMBOO 19CM*2,90M COLOR BROWM', 'Láminas Bamboo', (SELECT id FROM subcategorias WHERE nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambu%' LIMIT 1), 10, 0, 0, true);

-- MACHIMBRADO DE TECA
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('MACHIMBRADO DE TECA 10CM*2,90M', 'Machimbrado de Teca', (SELECT id FROM subcategorias WHERE nombre ILIKE '%machimbrado%' OR nombre ILIKE '%madera%' LIMIT 1), 10, 0, 0, true);

-- MADERA ASERRADA
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('MADERA ASERRADA 2"*2"*2,90M', 'Madera Aserrada', (SELECT id FROM subcategorias WHERE nombre ILIKE '%madera%' OR nombre ILIKE '%aserrada%' LIMIT 1), 10, 0, 0, true),
('MADERA ASERRADA 2"*3"*2,90M', 'Madera Aserrada', (SELECT id FROM subcategorias WHERE nombre ILIKE '%madera%' OR nombre ILIKE '%aserrada%' LIMIT 1), 10, 0, 0, true),
('MADERA ASERRADA 2"*4"*2,90M', 'Madera Aserrada', (SELECT id FROM subcategorias WHERE nombre ILIKE '%madera%' OR nombre ILIKE '%aserrada%' LIMIT 1), 10, 0, 0, true);

-- PAPEL TAPIZ
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('PAPEL TAPIZ 53CM*10M', 'Papel Tapiz', (SELECT id FROM subcategorias WHERE nombre ILIKE '%papel%tapiz%' OR nombre ILIKE '%tapiz%' LIMIT 1), 10, 0, 0, true);

-- PISOS EXTERIORES
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('PISO EXTERIOR 14,5CM*2,90M COLOR CENIZA', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR VINOTINTO', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR CAFÉ', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR MARRÓN AMARILLO', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR TECA CLARO', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR TECA OSCURO', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR PÚRPURA', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR GRIS PLATA', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true),
('PISO EXTERIOR 14,5CM*2,90M COLOR BROWM', 'Pisos Exteriores', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%exterior%' OR nombre ILIKE '%deck%' LIMIT 1), 10, 0, 0, true);

-- PISOS SPC
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('PISO SPC 18,3CM*122CM COLOR ROYAL OAK', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR MATT WHITE', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR SILVER OAK', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR DREAM SPACE', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR TECNICAL WOODY', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR MOCHA GRAY', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR HOME PERFUME', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR GOLDEN WIND', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR STRAIGTH LOVE VENICE', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR APPLE WOODY', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR CEMENTE GRAY', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR SCIENCIA TECHNOLOGY', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR COMOLU', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR QUI GUANGYAN', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR STRAIGTH GRAIN PONE', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR ROSEWOOD', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR SLIKA CLOTH2', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true),
('PISO SPC 18,3CM*122CM COLOR CLASICAL TECHNOLOGY', 'Pisos SPC', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%spc%' OR nombre ILIKE '%spc%' LIMIT 1), 10, 0, 0, true);

-- PISOS ADHESIVOS
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('PISO ADHESIVO 18,3CM*122CM COLOR ROYAL OAK', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR MATT WHITE', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR SILVER OAK', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR DREAM SPACE', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR TECNICAL WOODY', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR MOCHA GRAY', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR HOME PERFUME', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR GOLDEN WIND', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR STRAIGTH LOVE VENICE', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR APPLE WOODY', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR CEMENTE GRAY', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR SCIENCIA TECHNOLOGY', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR COMOLU', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR QUI GUANGYAN', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR STRAIGTH GRAIN PONE', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR ROSEWOOD', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR SLIKA CLOTH2', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('PISO ADHESIVO 18,3CM*122CM COLOR CLASICAL TECHNOLOGY', 'Pisos Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%adhesivo%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true);

-- RODAPIÉS
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('RODAPIE 6CM*2,40M COLOR ROYAL OAK', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR MATT WHITE', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR SILVER OAK', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR DREAM SPACE', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR TECNICAL WOODY', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR MOCHA GRAY', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR HOME PERFUME', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR GOLDEN WIND', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR STRAIGTH LOVE VENICE', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR APPLE WOODY', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR CEMENTE GRAY', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR SCIENCIA TECHNOLOGY', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR COMOLU', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR QUI GUANGYAN', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR STRAIGTH GRAIN PONE', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR ROSEWOOD', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR SLIKA CLOTH2', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('RODAPIE 6CM*2,40M COLOR CLASICAL TECHNOLOGY', 'Rodapiés', (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true);

-- SEPARADORES DE ESPACIO
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('SEPARADOR DE ESPACIO 2,90M COLOR CENIZA', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR VINOTINTO', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR CAFÉ', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR MARRÓN AMARILLO', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR TECA CLARO', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR TECA OSCURO', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR PÚRPURA', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR GRIS PLATA', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('SEPARADOR DE ESPACIO 2,90M COLOR BROWM', 'Separadores de Espacio', (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true);

-- WALL PANEL EXTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('WALL PANEL EXTERIOR 19CM*2,90M COLOR CENIZA', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR VINOTINTO', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR CAFÉ', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR MARRÓN AMARILLO', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR TECA CLARO', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR TECA OSCURO', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR PÚRPURA', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR GRIS PLATA', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL EXTERIOR 19CM*2,90M COLOR BROWM', 'Wall Panel Exterior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%exterior%' OR nombre ILIKE '%exterior%' LIMIT 1), 10, 0, 0, true);

-- WALL PANEL INTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR ROYAL OAK', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR MATT WHITE', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR SILVER OAK', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR DREAM SPACE', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR TECNICAL WOODY', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR MOCHA GRAY', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR HOME PERFUME', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR GOLDEN WIND', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR STRAIGTH LOVE VENICE', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR APPLE WOODY', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR CEMENTE GRAY', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR SCIENCIA TECHNOLOGY', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR COMOLU', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR QUI GUANGYAN', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR STRAIGTH GRAIN PONE', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR ROSEWOOD', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR SLIKA CLOTH2', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR CLASICAL TECHNOLOGY', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR JAZZ WHITE', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR MATTE BLACK', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL INTERIOR 16,5CM*2,90M COLOR JAZZ', 'Wall Panel Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%interior%' OR nombre ILIKE '%interior%' LIMIT 1), 10, 0, 0, true);

-- WALL PANEL PS INTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR ROYAL OAK', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR MATT WHITE', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR SILVER OAK', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR DREAM SPACE', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR TECNICAL WOODY', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR MOCHA GRAY', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR HOME PERFUME', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR GOLDEN WIND', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR STRAIGTH LOVE VENICE', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR APPLE WOODY', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR CEMENTE GRAY', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR SCIENCIA TECHNOLOGY', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR COMOLU', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR QUI GUANGYAN', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR STRAIGTH GRAIN PONE', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR ROSEWOOD', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR SLIKA CLOTH2', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL PS INTERIOR 16,5CM*2,90M COLOR CLASICAL TECHNOLOGY', 'Wall Panel PS Interior', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%ps%' OR nombre ILIKE '%ps%interior%' LIMIT 1), 10, 0, 0, true);

-- WALL PANEL LISO
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('WALL PANEL LISO 16,5CM*2,90M COLOR ROYAL OAK', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR MATT WHITE', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR SILVER OAK', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR DREAM SPACE', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR TECNICAL WOODY', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR MOCHA GRAY', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR HOME PERFUME', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR GOLDEN WIND', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR STRAIGTH LOVE VENICE', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR APPLE WOODY', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR CEMENTE GRAY', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR SCIENCIA TECHNOLOGY', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR COMOLU', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR QUI GUANGYAN', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR STRAIGTH GRAIN PONE', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR ROSEWOOD', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR SLIKA CLOTH2', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true),
('WALL PANEL LISO 16,5CM*2,90M COLOR CLASICAL TECHNOLOGY', 'Wall Panel Liso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%wall%panel%liso%' OR nombre ILIKE '%liso%' LIMIT 1), 10, 0, 0, true);

-- CIELO RASO
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('CIELO RASO 20CM*5,95M COLOR ROYAL OAK', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR MATT WHITE', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR SILVER OAK', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR DREAM SPACE', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR TECNICAL WOODY', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR MOCHA GRAY', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR HOME PERFUME', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR GOLDEN WIND', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR STRAIGTH LOVE VENICE', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR APPLE WOODY', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR CEMENTE GRAY', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR SCIENCIA TECHNOLOGY', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR COMOLU', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR QUI GUANGYAN', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR STRAIGTH GRAIN PONE', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR ROSEWOOD', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR SLIKA CLOTH2', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true),
('CIELO RASO 20CM*5,95M COLOR CLASICAL TECHNOLOGY', 'Cielo Raso', (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%raso%' OR nombre ILIKE '%techo%' LIMIT 1), 10, 0, 0, true);

-- PIEZAS 3D
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('PIEZA 3D 30CM*30CM', 'Piezas 3D', (SELECT id FROM subcategorias WHERE nombre ILIKE '%3d%' OR nombre ILIKE '%decoracion%' LIMIT 1), 10, 0, 0, true);

-- PERFILES
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('PERFIL INICIAL 3MTRS', 'Perfiles', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('PERFIL FINAL 3MTRS', 'Perfiles', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('PERFIL H 3MTRS', 'Perfiles', (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true);

-- SILICONAS Y ADHESIVOS
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('SILICONA TRANSPARENTE 300ML', 'Siliconas y Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('SILICONA BLANCA 300ML', 'Siliconas y Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true),
('ADHESIVO PARA PISO SPC 1KG', 'Siliconas y Adhesivos', (SELECT id FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1), 10, 0, 0, true);

-- CLIPS Y ACCESORIOS
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('CLIP PARA PISO EXTERIOR PAQ 1*100', 'Clips y Accesorios', (SELECT id FROM subcategorias WHERE nombre ILIKE '%clip%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('CLIP PARA WALL PANEL EXTERIOR PAQ 1*100', 'Clips y Accesorios', (SELECT id FROM subcategorias WHERE nombre ILIKE '%clip%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true),
('CLIP PARA WALL PANEL INTERIOR PAQ 1*100', 'Clips y Accesorios', (SELECT id FROM subcategorias WHERE nombre ILIKE '%clip%' OR nombre ILIKE '%accesorio%' LIMIT 1), 10, 0, 0, true);

-- STAIR BOARD Y STAIR RISER
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES
('STAIR BOARD 30CM*2,90M COLOR ROYAL OAK', 'Stair Board', (SELECT id FROM subcategorias WHERE nombre ILIKE '%stair%' OR nombre ILIKE '%escalera%' LIMIT 1), 10, 0, 0, true),
('STAIR BOARD 30CM*2,90M COLOR MATT WHITE', 'Stair Board', (SELECT id FROM subcategorias WHERE nombre ILIKE '%stair%' OR nombre ILIKE '%escalera%' LIMIT 1), 10, 0, 0, true),
('STAIR BOARD 30CM*2,90M COLOR SILVER OAK', 'Stair Board', (SELECT id FROM subcategorias WHERE nombre ILIKE '%stair%' OR nombre ILIKE '%escalera%' LIMIT 1), 10, 0, 0, true),
('STAIR RISER 18CM*2,90M COLOR ROYAL OAK', 'Stair Riser', (SELECT id FROM subcategorias WHERE nombre ILIKE '%stair%' OR nombre ILIKE '%escalera%' LIMIT 1), 10, 0, 0, true),
('STAIR RISER 18CM*2,90M COLOR MATT WHITE', 'Stair Riser', (SELECT id FROM subcategorias WHERE nombre ILIKE '%stair%' OR nombre ILIKE '%escalera%' LIMIT 1), 10, 0, 0, true),
('STAIR RISER 18CM*2,90M COLOR SILVER OAK', 'Stair Riser', (SELECT id FROM subcategorias WHERE nombre ILIKE '%stair%' OR nombre ILIKE '%escalera%' LIMIT 1), 10, 0, 0, true);

-- =====================================================
-- VERIFICACIÓN Y REPORTE
-- =====================================================

-- Ver cuántos productos se insertaron
SELECT COUNT(*) as total_productos_insertados FROM productos;

-- Ver productos por subcategoría
SELECT 
  s.nombre as subcategoria,
  COUNT(p.id) as cantidad_productos
FROM subcategorias s
LEFT JOIN productos p ON p.subcategoria_id = s.id
GROUP BY s.nombre
ORDER BY cantidad_productos DESC;

-- Ver productos sin subcategoría asignada (si hay alguno)
SELECT id, nombre, descripcion 
FROM productos 
WHERE subcategoria_id IS NULL;

-- =====================================================
-- NOTAS IMPORTANTES
-- =====================================================
-- 1. Este script usa subconsultas para encontrar automáticamente el ID de la subcategoría
-- 2. Si una subcategoría no existe, el producto se insertará con subcategoria_id = NULL
-- 3. Revisa la tabla subcategorias antes de ejecutar para asegurarte que existen
-- 4. Ajusta los valores de stock, precio_detal y precio_mayor según tus necesidades
-- 5. Todos los productos se insertan como activos (activo = true)
-- =====================================================
