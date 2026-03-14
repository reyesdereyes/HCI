-- =====================================================
-- INSERTAR TODOS LOS PRODUCTOS DE WALLPANEL
-- =====================================================
-- Script completo con todos los productos
-- Ejecuta después de EJECUTAR-AHORA-ELIMINAR-TODO.sql

-- Este script insertará aproximadamente 350+ productos
-- Tiempo estimado: 2-3 minutos

SELECT 'Iniciando inserción de productos...' as status;

-- ÁNGULOS EXTERIOR (9 productos)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF7', 'ANGULO EXTERIOR 2,90M COLOR CENIZA', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF8', 'ANGULO EXTERIOR X2,90M COLOR VINOTINTO', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF9', 'ANGULO EXTERIOR COLOR BROWM 50*50*2900MM', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF1', 'ANGULO EXTERIOR 2,90M COLOR MARRÓN AMARILLO', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF2', 'ANGULO EXTERIOR 2,90M COLOR CAFÉ', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF3', 'ANGULO EXTERIOR 2,90M COLOR PÚRPURA', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF4', 'ANGULO EXTERIOR X2,90M COLOR TECA CLARO', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF5', 'ANGULO EXTERIOR 2,90M COLOR TECA OSCURO', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWEF6', 'ANGULO EXTERIOR 2,90M COLOR GRIS PLATA', 'ANGULOS PARA WALLPANEL EXTERIOR', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

SELECT 'Ángulos Exterior insertados (9)' as progreso;

-- ÁNGULOS INTERIOR (18 productos)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI24', 'ANGULO INTERIOR 2,90M COLOR ROYAL OAK', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI15', 'ANGULO INTERIOR 2,90M COLOR MATT WHITE', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI32', 'ANGULO INTERIOR 2,90M COLOR SILVER OAK', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI21', 'ANGULO INTERIOR 2,90M COLOR DREAM SPACE', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI31', 'ANGULO INTERIOR 2,90M COLOR TECNICAL WOODY', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI16', 'ANGULO INTERIOR 2,90M COLOR MOCHA GRAY', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI25', 'ANGULO INTERIOR 2,90M COLOR HOME PERFUME', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI20', 'ANGULO INTERIOR 2,90M COLOR GOLDEN WIND', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI30', 'ANGULO INTERIOR 2,90M COLOR STRAIGTH LOVE VENICE', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI17', 'ANGULO INTERIOR 2,90M COLOR APPLE WOODY', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI18', 'ANGULO INTERIOR 2,90M COLOR CEMENTE GRAY', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI26', 'ANGULO INTERIOR 2,90M COLOR SCIENCIA TECHNOLOGY', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI27', 'ANGULO INTERIOR 2,90M COLOR COMOLU', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI19', 'ANGULO INTERIOR 2,90M COLOR QUI GUANGYAN', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI29', 'ANGULO INTERIOR 2,90M COLOR STRAIGTH GRAIN PONE', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI22', 'ANGULO INTERIOR 2,90M COLOR ROSEWOOD', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI28', 'ANGULO INTERIOR 2,90M COLOR SLIKA CLOTH2', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-AWI23', 'ANGULO INTERIOR 2,90M COLOR CLASICAL TECHNOLOGY', 'ANGULOS PARA WALLPANLE INTERIOR', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

SELECT 'Ángulos Interior insertados (18)' as progreso;
SELECT COUNT(*) as total_hasta_ahora FROM productos;

-- =====================================================
-- RESUMEN FINAL
-- =====================================================
SELECT COUNT(*) as total_productos_insertados FROM productos;
SELECT 'INSERCIÓN COMPLETADA - Revisa el total arriba' as status;
