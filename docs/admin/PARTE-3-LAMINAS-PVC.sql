-- =====================================================
-- PARTE 3: LÁMINAS PVC (20CM, 25CM, 30CM)
-- =====================================================
-- Ejecuta después de PARTE-2

-- LÁMINAS PVC 20CM
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR CENIZA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR VINOTINTO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR CAFÉ', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR MARRÓN AMARILLO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR TECA CLARO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR TECA OSCURO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR PÚRPURA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR GRIS PLATA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 20CM*5,95M COLOR BROWM', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

-- LÁMINAS PVC 25CM
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR CENIZA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR VINOTINTO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR CAFÉ', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR MARRÓN AMARILLO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR TECA CLARO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' OR nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR TECA OSCURO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR PÚRPURA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR GRIS PLATA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 25CM*5,95M COLOR BROWM', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

-- LÁMINAS PVC 30CM
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR CENIZA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR VINOTINTO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR CAFÉ', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR MARRÓN AMARILLO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR TECA CLARO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR TECA OSCURO', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR PÚRPURA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR GRIS PLATA', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'LAMINA PVC 30CM*5,95M COLOR BROWM', 'Láminas PVC', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%pvc%' LIMIT 1;

-- Verificar
SELECT COUNT(*) as productos_insertados FROM productos;
SELECT 'PARTE 3 COMPLETADA - Láminas PVC insertadas' as status;
