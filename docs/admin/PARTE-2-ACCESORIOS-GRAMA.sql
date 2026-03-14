-- =====================================================
-- PARTE 2: ACCESORIOS, DETERMINACIONES Y GRAMA
-- =====================================================
-- Ejecuta después de PARTE-1

-- ACCESORIOS PARA TECHO
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'CLAVOS PARA CIELO RASO PAQ 1*100', 'Accesorios para Techo', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'PERFIL CIELO RASO 3MTRS', 'Perfil Cielo Raso', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

-- DETERMINACIONES DE WALLPANEL (Parte 1)
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION PS SMALLGRAY CLARO M02-06148 12*2900 MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL EXT', 'Determinación Wall Panel Exterior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR JAZZ WHITE', 'Determinación de Wallpanel Interior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR BLACK FIRE 40*24*2900MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WPC WALL PANEL', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR 16.50CM*2,90M COLOR TECNICAL WOODY', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR SILVER OAK', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR 16.50CM*2,90M COLOR JAZZ', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR 16.50CM*2,90M COLOR QUI GUANGYAN', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR MATTE BLACK', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INTERIOR 16,5CMX2,90M COLOR HOME PERFUME', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INT LIGTH GRAY TECH WOOD 40*24*2900MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION PS BIGGRAY CLARO M02-06148 12*2900 MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION PS BIGMARRON CLARO M02-5487-1 12*2900 MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION PS GRAY INTERMEDIO M02-22016 12*2900 MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION PS M02-23038-4 MARRON OSCURO 12*2900 MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION PS SMALL GRAY CLARO M02-06148 12*2900 MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION PS SMALL MARRON CLARO M02-5487-1 12*2900 MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INT LIGHT PARTEM40*24*2900MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INT SENSATION GRAY 40*24*2900MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'DETERMINACION WALL PANEL INT TECH GOOD 01 40*24*2900MM', 'Determinación de Wallpanel Interior', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

-- GRAMA ARTIFICIAL
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 4MX25MX9RD', 'Grama Artificial', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'GRAMA ARTIFICIAL 10MM ALTO/CAL. 3/16"/PUNTADA 300S/M. 2MX25MX25', 'Grama Artificial', id, 6, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'GRAMA ARTIFICIAL 20MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25M (MT2)', 'Grama Artificial', id, 8, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25MX18RD', 'Grama Artificial', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;

-- JARDÍN VERTICAL
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'JARDIN VERTICAL MILAN GRASS (EXTERIOR) 52X52CM', 'Jardín Vertical', id, 14, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%jardin%' LIMIT 1;

-- Verificar
SELECT COUNT(*) as productos_insertados FROM productos;
SELECT 'PARTE 2 COMPLETADA - Accesorios, Determinaciones y Grama insertados' as status;
