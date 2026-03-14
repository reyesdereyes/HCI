-- =====================================================
-- PARTE 11: WALL PANEL LISO
-- subcategoria_id: 2 = Wallpanel Interior
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO01', 'WALL PANEL LISO BLANCO', 'WALL PANEL LISO', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO02', 'WALL PANEL LISO GRIS CLARO', 'WALL PANEL LISO', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO03', 'WALL PANEL LISO GRIS MEDIO', 'WALL PANEL LISO', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO04', 'WALL PANEL LISO GRIS OSCURO', 'WALL PANEL LISO', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO05', 'WALL PANEL LISO NEGRO', 'WALL PANEL LISO', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO06', 'WALL PANEL LISO BEIGE', 'WALL PANEL LISO', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO07', 'WALL PANEL LISO CREMA', 'WALL PANEL LISO', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO08', 'WALL PANEL LISO CAFÉ', 'WALL PANEL LISO', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO09', 'WALL PANEL LISO AZUL CLARO', 'WALL PANEL LISO', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO10', 'WALL PANEL LISO AZUL OSCURO', 'WALL PANEL LISO', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO11', 'WALL PANEL LISO VERDE', 'WALL PANEL LISO', 2, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO12', 'WALL PANEL LISO AMARILLO', 'WALL PANEL LISO', 2, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO13', 'WALL PANEL LISO ROJO', 'WALL PANEL LISO', 2, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO14', 'WALL PANEL LISO NARANJA', 'WALL PANEL LISO', 2, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPLISO15', 'WALL PANEL LISO ROSA', 'WALL PANEL LISO', 2, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 11 COMPLETADA - Wall Panel Liso insertados' as status;
