-- =====================================================
-- PARTE 5: SILICONAS Y ADHESIVOS
-- subcategoria_id = 20 (Siliconas)
-- =====================================================

-- SILICONAS
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL01 WHITE', 'SILICON BLANCO', 'SILICON BLANCO', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL02 BLACK', 'SILICON NEGRO', 'SILICON NEGRO', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL03 CLEAR', 'SILICON TRANSPARENTE', 'SILICON TRANSPARENTE', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL04 GLUE', 'SILICON BLANCO', 'SILICON BLANCO', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL01WHITE', 'SILICONA WHITE', 'SILICON BLANCO', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL02BLACK', 'SILICONA BLACK', 'SILICON NEGRO', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL03CLEAR', 'SILICON GLUE TRANSPARENTE', 'ACCESORIO WALLPANEL', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SELL01WHITE', 'SILICON SELLADOR BLANCO', 'SILICON SELLADOR', 20, 1.5, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL02BLACKPROM', 'SILICON PROMOCIONAL', 'SILICON PROMOCIONAL', 20, 1, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- ADHESIVOS
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL05 ADHESIVO GREEN', 'SILICON ADHESIVO', 'SILICON ADHESIVO', 20, 2.30, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-SL05 ADHESIVO BLUE', 'SILICON ADHESIVO', 'SILICON ADHESIVO', 20, 2.50, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-ADP02CLEAR', 'ADHESIVO PROFESIONAL PARA CONSTRUCCION EXTRA FUERTE COLOR CLEAR (CAJA VERDE)', 'ADHESIVO PROFESIONAL', 20, 2.50, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-ADP01AZUL', 'ADHESIVO PROFESIONAL PARA CONSTRUCCION EXTRA FUERTE COLOR BROWN (CAJA AZUL)', 'ADHESIVO PROFESIONAL', 20, 2.3, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- Verificar
SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 5 COMPLETADA - Siliconas y Adhesivos insertados' as status;
