-- =====================================================
-- INSERTAR PRODUCTOS - PARTE 1 DE 5
-- =====================================================
-- Ejecuta este script primero

-- ÁNGULOS PARA WALLPANEL EXTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR 2,90M COLOR CENIZA', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR X2,90M COLOR VINOTINTO', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR 2,90M COLOR CAFÉ', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR 2,90M COLOR MARRÓN AMARILLO', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR X2,90M COLOR TECA CLARO', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR 2,90M COLOR TECA OSCURO', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR 2,90M COLOR PÚRPURA', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR 2,90M COLOR GRIS PLATA', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANGULO EXTERIOR COLOR BROWM 50*50*2900MM', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' OR nombre ILIKE '%accesorio%' LIMIT 1;

SELECT 'Parte 1 completada - Ángulos Exterior insertados' as status;
