-- =====================================================
-- PARTE 8: WALL PANEL EXTERIOR
-- subcategoria_id: 1 = Wallpanel Exterior
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT01', 'WALL PANEL EXTERIOR GRIS CENIZA', 'WALL PANEL EXTERIOR', 1, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT02', 'WALL PANEL EXTERIOR VINOTINTO', 'WALL PANEL EXTERIOR', 1, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT03', 'WALL PANEL EXTERIOR CAFÉ', 'WALL PANEL EXTERIOR', 1, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT04', 'WALL PANEL EXTERIOR MARRÓN AMARILLO', 'WALL PANEL EXTERIOR', 1, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT05', 'WALL PANEL EXTERIOR TECA CLARO', 'WALL PANEL EXTERIOR', 1, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT06', 'WALL PANEL EXTERIOR TECA OSCURO', 'WALL PANEL EXTERIOR', 1, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT07', 'WALL PANEL EXTERIOR PÚRPURA', 'WALL PANEL EXTERIOR', 1, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT08', 'WALL PANEL EXTERIOR GRIS PLATA', 'WALL PANEL EXTERIOR', 1, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT09', 'WALL PANEL EXTERIOR BROWN', 'WALL PANEL EXTERIOR', 1, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT10', 'WALL PANEL EXTERIOR NEGRO', 'WALL PANEL EXTERIOR', 1, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT11', 'WALL PANEL EXTERIOR BLANCO', 'WALL PANEL EXTERIOR', 1, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPEXT12', 'WALL PANEL EXTERIOR BEIGE', 'WALL PANEL EXTERIOR', 1, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 8 COMPLETADA - Wall Panel Exterior insertados' as status;
