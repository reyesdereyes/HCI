-- =====================================================
-- INSERTAR TODOS LOS PRODUCTOS - VERSIÓN SIMPLE
-- =====================================================
-- Este script usa INSERT individuales para evitar errores de sintaxis
-- Copia y pega TODO este contenido en Supabase SQL Editor

-- ÁNGULOS EXTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR 2,90M COLOR CENIZA', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR X2,90M COLOR VINOTINTO', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR 2,90M COLOR CAFÉ', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR 2,90M COLOR MARRÓN AMARILLO', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR X2,90M COLOR TECA CLARO', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR 2,90M COLOR TECA OSCURO', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR 2,90M COLOR PÚRPURA', 'Ángulos para Wallpanel Exterior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR 2,90M COLOR GRIS PLATA', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO EXTERIOR COLOR BROWM 50*50*2900MM', 'Ángulos para Wallpanel Exterior', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

-- ÁNGULOS INTERIOR
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR ROYAL OAK', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR MATT WHITE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR SILVER OAK', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR DREAM SPACE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR TECNICAL WOODY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR MOCHA GRAY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR HOME PERFUME', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR GOLDEN WIND', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR STRAIGTH LOVE VENICE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR APPLE WOODY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR CEMENTE GRAY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR SCIENCIA TECHNOLOGY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR COMOLU', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR QUI GUANGYAN', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR STRAIGTH GRAIN PONE', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR ROSEWOOD', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR SLIKA CLOTH2', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'ANGULO INTERIOR 2,90M COLOR CLASICAL TECHNOLOGY', 'Ángulos para Wallpanel Interior', id, 3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%angulo%' LIMIT 1;

-- ACCESORIOS TECHO
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'CLAVOS PARA CIELO RASO PAQ 1*100', 'Accesorios para Techo', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%accesorio%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'PERFIL CIELO RASO 3MTRS', 'Perfil Cielo Raso', id, 5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%perfil%' LIMIT 1;

-- GRAMA ARTIFICIAL
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 4MX25MX9RD', 'Grama Artificial', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'GRAMA ARTIFICIAL 10MM ALTO/CAL. 3/16"/PUNTADA 300S/M. 2MX25MX25', 'Grama Artificial', id, 6, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'GRAMA ARTIFICIAL 20MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25M (MT2)', 'Grama Artificial', id, 8, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25MX18RD', 'Grama Artificial', id, 10, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%grama%' LIMIT 1;

-- JARDÍN VERTICAL
INSERT INTO productos (nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'JARDIN VERTICAL MILAN GRASS (EXTERIOR) 52X52CM', 'Jardín Vertical', id, 14, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%jardin%' LIMIT 1;

-- Verificar productos insertados
SELECT COUNT(*) as total_productos FROM productos;
SELECT 'Script completado exitosamente' as status;
