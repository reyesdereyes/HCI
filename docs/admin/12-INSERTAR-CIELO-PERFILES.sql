-- =====================================================
-- PARTE 12: CIELO RASO Y PERFILES
-- subcategoria_id: 18 = Cielo Raso, 16 = Perfiles
-- =====================================================

-- CIELO RASO (id=18)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-CR01', 'CIELO RASO PVC BLANCO', 'CIELO RASO', 18, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-CR02', 'CIELO RASO PVC GRIS', 'CIELO RASO', 18, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-CR03', 'CIELO RASO PVC MADERA', 'CIELO RASO', 18, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-CR04', 'CIELO RASO PVC BEIGE', 'CIELO RASO', 18, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-CR05', 'CIELO RASO WPC BLANCO', 'CIELO RASO', 18, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-CR06', 'CIELO RASO WPC GRIS', 'CIELO RASO', 18, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-CR07', 'CIELO RASO WPC MADERA', 'CIELO RASO', 18, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

-- PERFILES (id=16)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF01', 'PERFIL ALUMINIO BLANCO 3M', 'PERFIL', 16, 20, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF02', 'PERFIL ALUMINIO GRIS 3M', 'PERFIL', 16, 20, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF03', 'PERFIL ALUMINIO NEGRO 3M', 'PERFIL', 16, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF04', 'PERFIL PVC BLANCO 3M', 'PERFIL', 16, 20, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF05', 'PERFIL PVC GRIS 3M', 'PERFIL', 16, 20, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF06', 'PERFIL PVC NEGRO 3M', 'PERFIL', 16, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF07', 'PERFIL U BLANCO 3M', 'PERFIL', 16, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF08', 'PERFIL U GRIS 3M', 'PERFIL', 16, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF09', 'PERFIL L BLANCO 3M', 'PERFIL', 16, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PRF10', 'PERFIL L GRIS 3M', 'PERFIL', 16, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 12 COMPLETADA - Cielo Raso y Perfiles insertados' as status;
