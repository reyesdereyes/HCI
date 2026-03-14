-- =====================================================
-- PARTE 14: STAIR BOARD Y STAIR RISER
-- subcategoria_id: 9 = Pisos (no hay subcategoría Stair específica)
-- =====================================================

-- STAIR BOARD
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STB01', 'STAIR BOARD GRIS CLARO', 'STAIR BOARD - HUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STB02', 'STAIR BOARD GRIS OSCURO', 'STAIR BOARD - HUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STB03', 'STAIR BOARD MADERA CLARA', 'STAIR BOARD - HUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STB04', 'STAIR BOARD MADERA OSCURA', 'STAIR BOARD - HUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STB05', 'STAIR BOARD ROBLE', 'STAIR BOARD - HUELLA DE ESCALERA', 9, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STB06', 'STAIR BOARD NOGAL', 'STAIR BOARD - HUELLA DE ESCALERA', 9, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

-- STAIR RISER
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STR01', 'STAIR RISER GRIS CLARO', 'STAIR RISER - CONTRAHUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STR02', 'STAIR RISER GRIS OSCURO', 'STAIR RISER - CONTRAHUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STR03', 'STAIR RISER MADERA CLARA', 'STAIR RISER - CONTRAHUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STR04', 'STAIR RISER MADERA OSCURA', 'STAIR RISER - CONTRAHUELLA DE ESCALERA', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STR05', 'STAIR RISER ROBLE', 'STAIR RISER - CONTRAHUELLA DE ESCALERA', 9, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-STR06', 'STAIR RISER NOGAL', 'STAIR RISER - CONTRAHUELLA DE ESCALERA', 9, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 14 COMPLETADA - Stair Board y Stair Riser insertados' as status;
