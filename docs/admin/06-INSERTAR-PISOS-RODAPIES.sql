-- =====================================================
-- PARTE 6: PISOS Y RODAPIÉS
-- subcategoria_id: 9 = Pisos, 15 = Rodapiés
-- =====================================================

-- PISOS SPC
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PSPC01', 'PISO SPC 4MM GRIS CLARO', 'PISO SPC', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PSPC02', 'PISO SPC 4MM GRIS OSCURO', 'PISO SPC', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PSPC03', 'PISO SPC 4MM MADERA CLARA', 'PISO SPC', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PSPC04', 'PISO SPC 4MM MADERA OSCURA', 'PISO SPC', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PSPC05', 'PISO SPC 5MM PREMIUM GRIS', 'PISO SPC', 9, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PSPC06', 'PISO SPC 5MM PREMIUM MADERA', 'PISO SPC', 9, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

-- PISOS ADHESIVOS
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PADH01', 'PISO ADHESIVO 2MM GRIS', 'PISO ADHESIVO', 9, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PADH02', 'PISO ADHESIVO 2MM MADERA', 'PISO ADHESIVO', 9, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PADH03', 'PISO ADHESIVO 3MM PREMIUM', 'PISO ADHESIVO', 9, 8, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

-- PISOS EXTERIORES
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PEXT01', 'PISO EXTERIOR WPC GRIS', 'PISO EXTERIOR', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PEXT02', 'PISO EXTERIOR WPC CAFÉ', 'PISO EXTERIOR', 9, 5, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-PEXT03', 'PISO EXTERIOR BAMBOO', 'PISO EXTERIOR', 9, 3, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

-- RODAPIÉS (id=15)
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-RDP01', 'RODAPIÉ PVC 60MM BLANCO', 'RODAPIÉ', 15, 20, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-RDP02', 'RODAPIÉ PVC 60MM GRIS', 'RODAPIÉ', 15, 20, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-RDP03', 'RODAPIÉ PVC 80MM BLANCO', 'RODAPIÉ', 15, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-RDP04', 'RODAPIÉ PVC 80MM GRIS', 'RODAPIÉ', 15, 15, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-RDP05', 'RODAPIÉ PVC 100MM BLANCO', 'RODAPIÉ', 15, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;
INSERT INTO productos (codigo, nombre, descripcion, subcategoria_id, stock, precio_detal, precio_mayor, activo) VALUES ('HC-RDP06', 'RODAPIÉ PVC 100MM GRIS', 'RODAPIÉ', 15, 10, 0, 0, true) ON CONFLICT (codigo) DO NOTHING;

-- Verificar
SELECT COUNT(*) as total_productos FROM productos;
SELECT 'PARTE 6 COMPLETADA - Pisos y Rodapiés insertados' as status;
