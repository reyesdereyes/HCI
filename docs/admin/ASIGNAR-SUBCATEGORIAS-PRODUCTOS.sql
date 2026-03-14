-- =====================================================
-- ASIGNAR SUBCATEGORÍAS A PRODUCTOS
-- =====================================================
-- Este script asigna la subcategoría correcta a cada producto
-- basándose en el nombre del producto

-- Primero, vamos a ver las subcategorías disponibles
SELECT id, nombre, categoria_id FROM subcategorias ORDER BY nombre;

-- Ver los productos actuales y sus subcategorías
SELECT id, nombre, subcategoria_id FROM productos ORDER BY id;

-- ASIGNAR SUBCATEGORÍAS A CADA PRODUCTO
-- Nota: Ajusta los IDs de subcategorías según tu base de datos

-- 1. Wallpanel Exterior - Paneles decorativos para exteriores
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%panel%' OR nombre ILIKE '%revestimiento%' LIMIT 1)
WHERE nombre = 'Wallpanel Exterior';

-- 2. Wallpanel Interior - Paneles decorativos para interiores
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%panel%' OR nombre ILIKE '%revestimiento%' LIMIT 1)
WHERE nombre = 'Wallpanel Interior';

-- 3. Láminas PVC - Láminas de PVC marmoleadas y colores
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%lámina%' OR nombre ILIKE '%lamina%' OR nombre ILIKE '%pvc%' LIMIT 1)
WHERE nombre = 'Láminas PVC';

-- 4. Láminas WPC - Láminas de madera plástico composite
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%lámina%' OR nombre ILIKE '%lamina%' OR nombre ILIKE '%wpc%' OR nombre ILIKE '%madera%' LIMIT 1)
WHERE nombre = 'Láminas WPC';

-- 5. Láminas Bamboo - Láminas de bambú decorativas
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%lámina%' OR nombre ILIKE '%lamina%' OR nombre ILIKE '%bamboo%' OR nombre ILIKE '%bambú%' LIMIT 1)
WHERE nombre = 'Láminas Bamboo';

-- 6. Grama Artificial - Grama sintética para decoración
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%grama%' OR nombre ILIKE '%césped%' OR nombre ILIKE '%jardin%' LIMIT 1)
WHERE nombre = 'Grama Artificial';

-- 7. Jardín Vertical - Paneles de jardín vertical artificial
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%jardin%' OR nombre ILIKE '%jardín%' OR nombre ILIKE '%vertical%' OR nombre ILIKE '%grama%' LIMIT 1)
WHERE nombre = 'Jardín Vertical';

-- 8. Papeles Tapiz - Papeles decorativos para paredes
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%papel%' OR nombre ILIKE '%tapiz%' OR nombre ILIKE '%decoración%' LIMIT 1)
WHERE nombre = 'Papeles Tapiz';

-- 9. Pisos - Pisos para interiores y exteriores
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%piso%' OR nombre ILIKE '%suelo%' OR nombre ILIKE '%pavimento%' LIMIT 1)
WHERE nombre = 'Pisos';

-- 10. Accesorios - Accesorios de instalación y acabados
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%accesorio%' OR nombre ILIKE '%instalación%' OR nombre ILIKE '%herramienta%' LIMIT 1)
WHERE nombre = 'Accesorios';

-- 11. Madera Aserrada - Madera de teca y cedro
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%madera%' OR nombre ILIKE '%teca%' OR nombre ILIKE '%cedro%' LIMIT 1)
WHERE nombre = 'Madera Aserrada';

-- 12. Machimbrado - Machimbrado de teca
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%machimbrado%' OR nombre ILIKE '%madera%' LIMIT 1)
WHERE nombre = 'Machimbrado';

-- 13. Determinaciones - Perfiles de terminación
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%terminación%' OR nombre ILIKE '%accesorio%' LIMIT 1)
WHERE nombre = 'Determinaciones';

-- 14. Ángulos - Ángulos interiores y exteriores
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%ángulo%' OR nombre ILIKE '%angulo%' OR nombre ILIKE '%esquina%' OR nombre ILIKE '%accesorio%' LIMIT 1)
WHERE nombre = 'Ángulos';

-- 15. Rodapies - Rodapies y zócalos
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%rodapie%' OR nombre ILIKE '%rodapié%' OR nombre ILIKE '%zócalo%' OR nombre ILIKE '%accesorio%' LIMIT 1)
WHERE nombre = 'Rodapies';

-- 16. Perfiles - Perfiles T, C y otros
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%perfil%' OR nombre ILIKE '%accesorio%' LIMIT 1)
WHERE nombre = 'Perfiles';

-- 17. Piezas 3D - Piezas decorativas 3D plásticas
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%3d%' OR nombre ILIKE '%decoración%' OR nombre ILIKE '%panel%' LIMIT 1)
WHERE nombre = 'Piezas 3D';

-- 18. Cielo Raso - Paneles para cielo raso
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%cielo%' OR nombre ILIKE '%techo%' OR nombre ILIKE '%panel%' LIMIT 1)
WHERE nombre = 'Cielo Raso';

-- 19. Separadores - Separadores de espacio
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%separador%' OR nombre ILIKE '%división%' OR nombre ILIKE '%panel%' LIMIT 1)
WHERE nombre = 'Separadores';

-- 20. Siliconas - Siliconas y adhesivos
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%silicona%' OR nombre ILIKE '%adhesivo%' OR nombre ILIKE '%pegamento%' OR nombre ILIKE '%accesorio%' LIMIT 1)
WHERE nombre = 'Siliconas';

-- 21. Compresor
UPDATE productos 
SET subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%herramienta%' OR nombre ILIKE '%equipo%' OR nombre ILIKE '%accesorio%' LIMIT 1)
WHERE nombre = 'Compresor';

-- Verificar los cambios
SELECT 
    p.id,
    p.nombre as producto,
    s.nombre as subcategoria,
    c.nombre as categoria
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
LEFT JOIN categorias c ON s.categoria_id = c.id
ORDER BY p.id;

-- Contar productos por subcategoría
SELECT 
    s.nombre as subcategoria,
    COUNT(p.id) as total_productos
FROM subcategorias s
LEFT JOIN productos p ON p.subcategoria_id = s.id
GROUP BY s.id, s.nombre
ORDER BY total_productos DESC;
