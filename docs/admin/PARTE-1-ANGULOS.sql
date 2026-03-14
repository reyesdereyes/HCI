-- =====================================================
-- PARTE 1: ÁNGULOS (EXTERIOR E INTERIOR)
-- =====================================================
-- Ejecuta este script primero después de eliminar productos

-- ÁNGULOS PARA WALLPANEL EXTERIOR
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-CEN', 'ANGULO EXTERIOR 2,90M COLOR CENIZA', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-VIN', 'ANGULO EXTERIOR X2,90M COLOR VINOTINTO', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-CAF', 'ANGULO EXTERIOR 2,90M COLOR CAFÉ', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-MAR', 'ANGULO EXTERIOR 2,90M COLOR MARRÓN AMARILLO', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-TEC-CL', 'ANGULO EXTERIOR X2,90M COLOR TECA CLARO', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-TEC-OS', 'ANGULO EXTERIOR 2,90M COLOR TECA OSCURO', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-PUR', 'ANGULO EXTERIOR 2,90M COLOR PÚRPURA', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-GRI', 'ANGULO EXTERIOR 2,90M COLOR GRIS PLATA', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-EXT-BRO', 'ANGULO EXTERIOR COLOR BROWM 50*50*2900MM', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

-- ÁNGULOS PARA WALLPANEL INTERIOR
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-ROY', 'ANGULO INTERIOR 2,90M COLOR ROYAL OAK', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-WHI', 'ANGULO INTERIOR 2,90M COLOR MATT WHITE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-SIL', 'ANGULO INTERIOR 2,90M COLOR SILVER OAK', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-DRE', 'ANGULO INTERIOR 2,90M COLOR DREAM SPACE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-TEC', 'ANGULO INTERIOR 2,90M COLOR TECNICAL WOODY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-MOC', 'ANGULO INTERIOR 2,90M COLOR MOCHA GRAY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-HOM', 'ANGULO INTERIOR 2,90M COLOR HOME PERFUME', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-GOL', 'ANGULO INTERIOR 2,90M COLOR GOLDEN WIND', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-VEN', 'ANGULO INTERIOR 2,90M COLOR STRAIGTH LOVE VENICE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-APP', 'ANGULO INTERIOR 2,90M COLOR APPLE WOODY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-CEM', 'ANGULO INTERIOR 2,90M COLOR CEMENTE GRAY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-SCI', 'ANGULO INTERIOR 2,90M COLOR SCIENCIA TECHNOLOGY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-COM', 'ANGULO INTERIOR 2,90M COLOR COMOLU', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-QUI', 'ANGULO INTERIOR 2,90M COLOR QUI GUANGYAN', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-PON', 'ANGULO INTERIOR 2,90M COLOR STRAIGTH GRAIN PONE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-ROS', 'ANGULO INTERIOR 2,90M COLOR ROSEWOOD', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-SLI', 'ANGULO INTERIOR 2,90M COLOR SLIKA CLOTH2', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) 
SELECT 'ANG-INT-CLA', 'ANGULO INTERIOR 2,90M COLOR CLASICAL TECHNOLOGY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

-- Verificar
SELECT COUNT(*) as productos_insertados FROM productos;
SELECT 'PARTE 1 COMPLETADA - Ángulos insertados' as status;
