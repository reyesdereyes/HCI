-- =====================================================
-- REFRIGERACIÓN: CATEGORÍA, SUBCATEGORÍAS Y PRODUCTOS
-- Ejecutar en Supabase SQL Editor
-- =====================================================

-- PASO 1: INSERTAR CATEGORÍA (si no existe)
INSERT INTO categorias (nombre, icono, orden, activo)
SELECT 'Refrigeración', 'snowflake', 3, true
WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE nombre = 'Refrigeración');

-- PASO 2: INSERTAR SUBCATEGORÍAS usando subquery para obtener el UUID
INSERT INTO subcategorias (nombre, categoria_id)
SELECT 'Capacitadores', id FROM categorias WHERE nombre = 'Refrigeración'
AND NOT EXISTS (SELECT 1 FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración'));

INSERT INTO subcategorias (nombre, categoria_id)
SELECT 'Compresores', id FROM categorias WHERE nombre = 'Refrigeración'
AND NOT EXISTS (SELECT 1 FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración'));

INSERT INTO subcategorias (nombre, categoria_id)
SELECT 'Motores', id FROM categorias WHERE nombre = 'Refrigeración'
AND NOT EXISTS (SELECT 1 FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración'));

INSERT INTO subcategorias (nombre, categoria_id)
SELECT 'Válvulas', id FROM categorias WHERE nombre = 'Refrigeración'
AND NOT EXISTS (SELECT 1 FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración'));

INSERT INTO subcategorias (nombre, categoria_id)
SELECT 'Termostatos', id FROM categorias WHERE nombre = 'Refrigeración'
AND NOT EXISTS (SELECT 1 FROM subcategorias WHERE nombre = 'Termostatos' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración'));

INSERT INTO subcategorias (nombre, categoria_id)
SELECT 'Filtros', id FROM categorias WHERE nombre = 'Refrigeración'
AND NOT EXISTS (SELECT 1 FROM subcategorias WHERE nombre = 'Filtros' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración'));

INSERT INTO subcategorias (nombre, categoria_id)
SELECT 'Accesorios Refrigeración', id FROM categorias WHERE nombre = 'Refrigeración'
AND NOT EXISTS (SELECT 1 FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración'));

-- Verificar subcategorías creadas
SELECT s.id, s.nombre FROM subcategorias s
JOIN categorias c ON s.categoria_id = c.id
WHERE c.nombre = 'Refrigeración';

-- =====================================================
-- PASO 3: PRODUCTOS - CAPACITADORES
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0001', 'CAPACITADOR 1.5 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0002', 'CAPACITADOR 2 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0003', 'CAPACITADOR 2.5 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0004', 'CAPACITADOR 3 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0005', 'CAPACITADOR 3.5 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0006', 'CAPACITADOR 4 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0007', 'CAPACITADOR 5 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0008', 'CAPACITADOR 6 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0009', 'CAPACITADOR 7.5 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0010', 'CAPACITADOR 8 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0011', 'CAPACITADOR 10 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0012', 'CAPACITADOR 12.5 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0013', 'CAPACITADOR 15 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0014', 'CAPACITADOR 20 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0015', 'CAPACITADOR 25 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0016', 'CAPACITADOR 30 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0017', 'CAPACITADOR 35 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0018', 'CAPACITADOR 40 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0019', 'CAPACITADOR 45 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0020', 'CAPACITADOR 50 MFD 370/440V', 'CAPACITADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Capacitadores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- COMPRESORES
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0021', 'COMPRESOR 1/5 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0022', 'COMPRESOR 1/4 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0023', 'COMPRESOR 1/3 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0024', 'COMPRESOR 1/2 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0025', 'COMPRESOR 3/4 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0026', 'COMPRESOR 1 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0027', 'COMPRESOR 1.5 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0028', 'COMPRESOR 2 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0029', 'COMPRESOR 2.5 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0030', 'COMPRESOR 3 HP R22', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0031', 'COMPRESOR 1/5 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0032', 'COMPRESOR 1/4 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0033', 'COMPRESOR 1/3 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0034', 'COMPRESOR 1/2 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0035', 'COMPRESOR 3/4 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0036', 'COMPRESOR 1 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0037', 'COMPRESOR 1.5 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0038', 'COMPRESOR 2 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0039', 'COMPRESOR 2.5 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0040', 'COMPRESOR 3 HP R410A', 'COMPRESOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Compresores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- MOTORES
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0041', 'MOTOR EVAPORADOR 1/15 HP 208-230V', 'MOTOR EVAPORADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0042', 'MOTOR EVAPORADOR 1/12 HP 208-230V', 'MOTOR EVAPORADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0043', 'MOTOR EVAPORADOR 1/10 HP 208-230V', 'MOTOR EVAPORADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0044', 'MOTOR EVAPORADOR 1/8 HP 208-230V', 'MOTOR EVAPORADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0045', 'MOTOR CONDENSADOR 1/6 HP 208-230V', 'MOTOR CONDENSADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0046', 'MOTOR CONDENSADOR 1/5 HP 208-230V', 'MOTOR CONDENSADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0047', 'MOTOR CONDENSADOR 1/4 HP 208-230V', 'MOTOR CONDENSADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0048', 'MOTOR CONDENSADOR 1/3 HP 208-230V', 'MOTOR CONDENSADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0049', 'MOTOR CONDENSADOR 1/2 HP 208-230V', 'MOTOR CONDENSADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0050', 'MOTOR CONDENSADOR 3/4 HP 208-230V', 'MOTOR CONDENSADOR', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Motores' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- VÁLVULAS
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0051', 'VALVULA EXPANSION TERMOSTATICA 1/2 TON R22', 'VALVULA EXPANSION', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0052', 'VALVULA EXPANSION TERMOSTATICA 1 TON R22', 'VALVULA EXPANSION', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0053', 'VALVULA EXPANSION TERMOSTATICA 1.5 TON R22', 'VALVULA EXPANSION', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0054', 'VALVULA EXPANSION TERMOSTATICA 2 TON R22', 'VALVULA EXPANSION', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0055', 'VALVULA EXPANSION TERMOSTATICA 1/2 TON R410A', 'VALVULA EXPANSION', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0056', 'VALVULA EXPANSION TERMOSTATICA 1 TON R410A', 'VALVULA EXPANSION', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0057', 'VALVULA SOLENOIDE 1/4 PULG 110V', 'VALVULA SOLENOIDE', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0058', 'VALVULA SOLENOIDE 3/8 PULG 110V', 'VALVULA SOLENOIDE', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0059', 'VALVULA SOLENOIDE 1/2 PULG 110V', 'VALVULA SOLENOIDE', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0060', 'VALVULA DE SERVICIO 1/4 PULG', 'VALVULA DE SERVICIO', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Válvulas' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- TERMOSTATOS
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0061', 'TERMOSTATO MECANICO UNIVERSAL', 'TERMOSTATO', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Termostatos' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0062', 'TERMOSTATO DIGITAL 110V', 'TERMOSTATO DIGITAL', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Termostatos' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0063', 'TERMOSTATO DIGITAL 220V', 'TERMOSTATO DIGITAL', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Termostatos' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0064', 'TERMOSTATO PARA NEVERA DOMESTICA', 'TERMOSTATO NEVERA', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Termostatos' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0065', 'TERMOSTATO PARA CONGELADOR', 'TERMOSTATO CONGELADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Termostatos' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0066', 'TERMOSTATO PARA AIRE ACONDICIONADO SPLIT', 'TERMOSTATO SPLIT', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Termostatos' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- FILTROS
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0067', 'FILTRO DESHIDRATADOR 1/4 PULG SOLDABLE', 'FILTRO DESHIDRATADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Filtros' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0068', 'FILTRO DESHIDRATADOR 3/8 PULG SOLDABLE', 'FILTRO DESHIDRATADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Filtros' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0069', 'FILTRO DESHIDRATADOR 1/2 PULG SOLDABLE', 'FILTRO DESHIDRATADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Filtros' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0070', 'FILTRO DESHIDRATADOR 5/8 PULG SOLDABLE', 'FILTRO DESHIDRATADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Filtros' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0071', 'FILTRO DESHIDRATADOR 1/4 PULG ROSCA', 'FILTRO DESHIDRATADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Filtros' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0072', 'FILTRO DESHIDRATADOR 3/8 PULG ROSCA', 'FILTRO DESHIDRATADOR', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Filtros' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- ACCESORIOS REFRIGERACIÓN
-- =====================================================

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0073', 'RELAY DE ARRANQUE UNIVERSAL', 'RELAY ARRANQUE', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0074', 'OVERLOAD PROTECTOR UNIVERSAL', 'OVERLOAD', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0075', 'RESISTENCIA DESHIELO 110V 200W', 'RESISTENCIA DESHIELO', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0076', 'RESISTENCIA DESHIELO 110V 300W', 'RESISTENCIA DESHIELO', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0077', 'SENSOR DE TEMPERATURA NTC 10K', 'SENSOR TEMPERATURA', id, 10, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0078', 'PRESOSTATO DE ALTA PRESION R22', 'PRESOSTATO', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0079', 'PRESOSTATO DE BAJA PRESION R22', 'PRESOSTATO', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
SELECT 'HC0080', 'PRESOSTATO DUAL ALTA/BAJA R22', 'PRESOSTATO DUAL', id, 5, 0, 0, true
FROM subcategorias WHERE nombre = 'Accesorios Refrigeración' AND categoria_id = (SELECT id FROM categorias WHERE nombre = 'Refrigeración')
ON CONFLICT (codigo) DO NOTHING;

-- =====================================================
-- VERIFICACIÓN FINAL
-- =====================================================

SELECT c.nombre as categoria, s.nombre as subcategoria, COUNT(p.id) as productos
FROM categorias c
JOIN subcategorias s ON s.categoria_id = c.id
LEFT JOIN productos p ON p.subcategoria_id = s.id
WHERE c.nombre = 'Refrigeración'
GROUP BY c.nombre, s.nombre
ORDER BY s.nombre;

SELECT 'REFRIGERACIÓN INSERTADA CORRECTAMENTE' as status;
