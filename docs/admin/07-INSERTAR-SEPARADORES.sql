-- =====================================================
-- PARTE 7: SEPARADORES DE ESPACIO
-- subcategoria_id: 19 = Separadores
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP01', 'SEPARADOR BLANCO 2.90M', 'SEPARADOR DE ESPACIO', 19, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP02', 'SEPARADOR GRIS 2.90M', 'SEPARADOR DE ESPACIO', 19, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP03', 'SEPARADOR NEGRO 2.90M', 'SEPARADOR DE ESPACIO', 19, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP04', 'SEPARADOR MADERA CLARA 2.90M', 'SEPARADOR DE ESPACIO', 19, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP05', 'SEPARADOR MADERA OSCURA 2.90M', 'SEPARADOR DE ESPACIO', 19, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP06', 'SEPARADOR DECORATIVO BLANCO', 'SEPARADOR DE ESPACIO', 19, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP07', 'SEPARADOR DECORATIVO GRIS', 'SEPARADOR DE ESPACIO', 19, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP08', 'SEPARADOR DECORATIVO NEGRO', 'SEPARADOR DE ESPACIO', 19, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP09', 'SEPARADOR MODULAR BLANCO', 'SEPARADOR DE ESPACIO', 19, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP10', 'SEPARADOR MODULAR GRIS', 'SEPARADOR DE ESPACIO', 19, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP11', 'SEPARADOR MODULAR NEGRO', 'SEPARADOR DE ESPACIO', 19, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP12', 'SEPARADOR PREMIUM BLANCO', 'SEPARADOR DE ESPACIO', 19, 2, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP13', 'SEPARADOR PREMIUM GRIS', 'SEPARADOR DE ESPACIO', 19, 2, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP14', 'SEPARADOR PREMIUM NEGRO', 'SEPARADOR DE ESPACIO', 19, 2, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-SEP15', 'SEPARADOR PREMIUM MADERA', 'SEPARADOR DE ESPACIO', 19, 2, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 7 COMPLETADA - Separadores insertados' as status;
