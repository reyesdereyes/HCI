-- =====================================================
-- PARTE 5: SILICONAS Y ADHESIVOS
-- =====================================================

-- SILICONAS
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL01 WHITE', 'SILICON BLANCO', 'SILICON BLANCO', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL02 BLACK', 'SILICON NEGRO', 'SILICON NEGRO', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL03 CLEAR', 'SILICON TRANSPARENTE', 'SILICON TRANSPARENTE', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL04 GLUE', 'SILICON BLANCO', 'SILICON BLANCO', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL01WHITE', 'SILICONA WHITE', 'SILICON BLANCO', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL02BLACK', 'SILICONA BLACK', 'SILICON NEGRO', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL03CLEAR', 'SILICON GLUE TRANSPARENTE', 'ACCESORIO WALLPANEL', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SELL01WHITE', 'SILICON SELLADOR BLANCO', 'ACCESORIOS PISO', id, 1.5, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL02BLACKPROM', 'SILICON PROMOCIONAL', 'ACCESORIOS PISO', id, 1, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;

-- ADHESIVOS
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL05 ADHESIVO GREEN', 'SILICON ADHESIVO', 'SILICON ADHESIVO', id, 2.30, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-SL05 ADHESIVO BLUE', 'SILICON ADHESIVO', 'SILICON ADHESIVO', id, 2.50, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-ADP02CLEAR', 'ADHESIVO PROFESIONAL PARA CONSTRUCCION EXTRA FUERTE COLOR CLEAR ( CAJA VERDE)', 'ACCESORIOS PISO', id, 2.50, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) SELECT 'HC-ADP01AZUL', 'AHHESIVO PROFESIONAL PARA CONSTRUCCION EXTRA FUERTE COLOR BROWN (CAJA AZUL)', 'ACCESORIOS PISO', id, 2.3, 0, 0, true FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' LIMIT 1;

-- Verificar
SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 5 COMPLETADA - Siliconas y Adhesivos insertados' as status;
