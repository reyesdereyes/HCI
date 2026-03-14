-- =====================================================
-- PARTE 10: WALL PANEL PS INTERIOR
-- subcategoria_id: 2 = Wallpanel Interior
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS01', 'WALL PANEL PS BLANCO MATE', 'WALL PANEL PS INTERIOR', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS02', 'WALL PANEL PS BLANCO BRILLANTE', 'WALL PANEL PS INTERIOR', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS03', 'WALL PANEL PS GRIS CLARO', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS04', 'WALL PANEL PS GRIS MEDIO', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS05', 'WALL PANEL PS GRIS OSCURO', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS06', 'WALL PANEL PS BEIGE', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS07', 'WALL PANEL PS CREMA', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS08', 'WALL PANEL PS MADERA CLARA', 'WALL PANEL PS INTERIOR', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS09', 'WALL PANEL PS MADERA MEDIA', 'WALL PANEL PS INTERIOR', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS10', 'WALL PANEL PS MADERA OSCURA', 'WALL PANEL PS INTERIOR', 2, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS11', 'WALL PANEL PS ROBLE CLARO', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS12', 'WALL PANEL PS ROBLE OSCURO', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS13', 'WALL PANEL PS NOGAL', 'WALL PANEL PS INTERIOR', 2, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS14', 'WALL PANEL PS CEREZO', 'WALL PANEL PS INTERIOR', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS15', 'WALL PANEL PS CAOBA', 'WALL PANEL PS INTERIOR', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS16', 'WALL PANEL PS PINO', 'WALL PANEL PS INTERIOR', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS17', 'WALL PANEL PS CEDRO', 'WALL PANEL PS INTERIOR', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS18', 'WALL PANEL PS TECA', 'WALL PANEL PS INTERIOR', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS19', 'WALL PANEL PS BAMBÚ', 'WALL PANEL PS INTERIOR', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-WPPS20', 'WALL PANEL PS MÁRMOL BLANCO', 'WALL PANEL PS INTERIOR', 2, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 10 COMPLETADA - Wall Panel PS insertados' as status;
