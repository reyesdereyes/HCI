-- =====================================================
-- PARTE 13: PIEZAS 3D
-- subcategoria_id: 17 = Piezas 3D
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D01', 'PIEZA 3D BLANCO MODELO 1', 'PIEZA 3D', 17, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D02', 'PIEZA 3D BLANCO MODELO 2', 'PIEZA 3D', 17, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D03', 'PIEZA 3D BLANCO MODELO 3', 'PIEZA 3D', 17, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D04', 'PIEZA 3D GRIS MODELO 1', 'PIEZA 3D', 17, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D05', 'PIEZA 3D GRIS MODELO 2', 'PIEZA 3D', 17, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D06', 'PIEZA 3D NEGRO MODELO 1', 'PIEZA 3D', 17, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D07', 'PIEZA 3D NEGRO MODELO 2', 'PIEZA 3D', 17, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D08', 'PIEZA 3D MADERA MODELO 1', 'PIEZA 3D', 17, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D09', 'PIEZA 3D MADERA MODELO 2', 'PIEZA 3D', 17, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-3D10', 'PIEZA 3D DECORATIVA PREMIUM', 'PIEZA 3D', 17, 2, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 13 COMPLETADA - Piezas 3D insertadas' as status;
