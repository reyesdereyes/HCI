-- =====================================================
-- PARTE 4: LÁMINAS (PVC, WPC, BAMBOO), MADERA Y PAPEL TAPIZ
-- subcategoria IDs: 3=Láminas PVC, 4=Láminas WPC, 5=Láminas Bamboo
--                  8=Papeles Tapiz, 11=Madera Aserrada, 12=Machimbrado
-- =====================================================

-- LÁMINAS PVC (subcategoria_id = 3)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LPVC7', 'LAMINA DE PCV 3 MARMOLIZADO GRIS -DORADO', 'LAMINA DE PVC', 3, 35, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LPVC4', 'LAMINAS PVC MARMOLIZADA BLANCO CARRARA', 'LAMINA DE PVC', 3, 35, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LPVC3', 'LAMINAS PVC WHITE 1.22MX2.44M', 'LAMINA DE PVC', 3, 35, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LPVC8', 'LAMINAS PVC MARMOLIZADA BLANCO ARENA DY2420', 'LAMINA DE PVC', 3, 35, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LPVC1', 'LAMINAS PVC BLACK 1.22MX2.44M', 'LAMINA DE PVC', 3, 35, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LPVC5', 'LAMINA PVC BLANCO CARRARA', 'LAMINA DE PVC', 3, 35, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- LÁMINAS WPC (subcategoria_id = 4)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LWPC01', 'LAMINA WPC ESPEJO SILVER 1220*24405MM', 'LAMINA DE WPC', 4, 35, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-WPC03', 'LAMINA WPC ESPEJO GRIS MATE 1220*24405MM', 'LAMINA DE WPC', 4, 45, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-WPC02', 'LAMINA WPC ESPEJO BRONCE 1220*24405MM', 'LAMINA DE WPC', 4, 45, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-WPC01', 'LAMINA WPC ESPEJO SILVER 1220*24405MM', 'LAMINA DE WPC', 4, 45, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- LÁMINAS BAMBOO (subcategoria_id = 5)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LB05', 'LAMINA BAMBOO 8CM*12.20CM*2.44M', 'LAMINA DE BAMBOO', 5, 40, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LB03', 'LAMINA BAMBOO 8CM*12.20CM*2.44M', 'LAMINA DE BAMBOO', 5, 40, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LB06', 'LAMINA BAMBOO 8CM*12.20CM*2.44M', 'LAMINA DE BAMBOO', 5, 40, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LB02', 'LAMINA BAMBOO 8CM*12.20CM*2.44M', 'LAMINA DE BAMBOO', 5, 40, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LB01', 'LAMINA BAMBOO 8CM*12.20CM*2.44M', 'LAMINA DE BAMBOO', 5, 40, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-LBE01', 'LAMINA DE BAMBOO TIPO ESPEJO 1220X2440X5MM', 'LAMINA DE BAMBOO', 5, 45, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- MACHIMBRADO (subcategoria_id = 12)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-MACH-6CM', 'MACHIHEMBRADO DE TECA (6CM)', 'MACHIMBRADO DE TECA', 12, 8, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-MACH-8CM', 'MACHIHEMBRADO DE TECA 8CM', 'MACHIMBRADO DE TECA', 12, 8, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- MADERA ASERRADA (subcategoria_id = 11)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-MDTECA31', 'MADERA ASERRADA TECA (TECTONA GRANDIS) M3', 'MADERA ASERRADA', 11, 1, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- PAPEL TAPIZ (subcategoria_id = 8)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA014', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA080', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA083', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA082', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA005', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA047', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA065', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA077', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA066', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA087', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA002', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA007', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA081', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA001', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA046', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA004', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA078', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA076', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA058', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 2, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo)
VALUES ('HC-PTMA003', 'PAPEL TAPIZ 600X3000MM', 'PAPEL TAPIZ', 8, 3, 0, 0, true)
ON CONFLICT (codigo) DO NOTHING;

-- Verificar
SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 4 COMPLETADA - Laminas, Madera y Papel Tapiz insertados' as status;
