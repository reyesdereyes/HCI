-- =====================================================
-- PARTE 3: GRAMA ARTIFICIAL Y JARDÍN VERTICAL
-- subcategoria_id: 6 = Grama Artificial, 7 = Jardín Vertical
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-GA30MM-4', 'GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 4MX25MX9RD', 'GRAMA ARTIFICIAL', 6, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-GA25MM-2', 'GRAMA ARTIFICIAL 25MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25MX14', 'GRAMA ARTIFICIAL', 6, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-GA10MM-2', 'GRAMA ARTIFICIAL 10MM ALTO/CAL. 3/16"/PUNTADA 300S/M. 2MX25MX25', 'GRAMA ARTIFICIAL', 6, 6, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-GA20MM-2', 'GRAMA ARTIFICIAL 20MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25M (MT2)', 'GRAMA ARTIFICIAL', 6, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-GA30MM-2', 'GRAMA ARTIFICIAL 30MM ALTO/CAL. 3/8"/PUNTADA 160S/M. 2MX25MX18RD', 'GRAMA ARTIFICIAL', 6, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT03', 'JARDIN VERTICAL MILAN GRASS (EXTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT01', 'JARDIN VERTICAL ANTI-UV CLOVER. (EXTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT02', 'JARDIN VERTICAL GARDENIA LEAVES. (INTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT04', 'JARDIN VERTICAL MILAN MIXED-B PLANT. (INTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT05', 'JARDIN VERTICAL MIXED-1. (INTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT06', 'JARDIN VERTICAL MIXED-2. (INTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT07', 'JARDIN VERTICAL MIXED-5 PLANTS. (INTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT08', 'JARDIN VERTICAL MONEY TREE-A. (INTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT09', 'JARDIN VERTICAL SUNFLOWERS AND LEAVES MIXED A. (INTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-JVEXT10', 'JARDIN VERTICAL WHEAT SEADING. (EXTERIOR) 52X52CM', 'JARDIN VERTICAL', 7, 14, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 3 COMPLETADA' as status;
