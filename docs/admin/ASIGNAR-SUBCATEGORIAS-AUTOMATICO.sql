-- =====================================================
-- ASIGNAR SUBCATEGORÍAS AUTOMÁTICAMENTE
-- =====================================================
-- Este script busca las subcategorías por nombre y las asigna

-- Ver estado actual
SELECT 
    p.id,
    p.nombre as producto,
    COALESCE(s.nombre, 'SIN ASIGNAR') as subcategoria
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
ORDER BY p.id;

-- =====================================================
-- ASIGNACIONES AUTOMÁTICAS
-- =====================================================

-- 1. Wallpanel Exterior -> Buscar subcategoría de paneles/revestimientos
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%panel%' 
       OR nombre ILIKE '%revestimiento%'
       OR nombre ILIKE '%wall%'
    ORDER BY 
        CASE 
            WHEN nombre ILIKE '%exterior%' THEN 1
            WHEN nombre ILIKE '%panel%' THEN 2
            ELSE 3
        END
    LIMIT 1
)
WHERE nombre = 'Wallpanel Exterior' AND subcategoria_id IS NULL;

-- 2. Wallpanel Interior -> Buscar subcategoría de paneles/revestimientos
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%panel%' 
       OR nombre ILIKE '%revestimiento%'
       OR nombre ILIKE '%wall%'
    ORDER BY 
        CASE 
            WHEN nombre ILIKE '%interior%' THEN 1
            WHEN nombre ILIKE '%panel%' THEN 2
            ELSE 3
        END
    LIMIT 1
)
WHERE nombre = 'Wallpanel Interior' AND subcategoria_id IS NULL;

-- 3. Láminas PVC
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%lámina%' 
       OR nombre ILIKE '%lamina%'
       OR nombre ILIKE '%pvc%'
    LIMIT 1
)
WHERE nombre = 'Láminas PVC' AND subcategoria_id IS NULL;

-- 4. Láminas WPC
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%lámina%' 
       OR nombre ILIKE '%lamina%'
       OR nombre ILIKE '%wpc%'
       OR nombre ILIKE '%madera%'
    LIMIT 1
)
WHERE nombre = 'Láminas WPC' AND subcategoria_id IS NULL;

-- 5. Láminas Bamboo
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%lámina%' 
       OR nombre ILIKE '%lamina%'
       OR nombre ILIKE '%bamboo%'
       OR nombre ILIKE '%bambú%'
    LIMIT 1
)
WHERE nombre = 'Láminas Bamboo' AND subcategoria_id IS NULL;

-- 6. Grama Artificial
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%grama%' 
       OR nombre ILIKE '%césped%'
       OR nombre ILIKE '%cesped%'
       OR nombre ILIKE '%jardin%'
       OR nombre ILIKE '%jardín%'
    LIMIT 1
)
WHERE nombre = 'Grama Artificial' AND subcategoria_id IS NULL;

-- 7. Jardín Vertical
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%jardin%' 
       OR nombre ILIKE '%jardín%'
       OR nombre ILIKE '%vertical%'
       OR nombre ILIKE '%grama%'
    LIMIT 1
)
WHERE nombre = 'Jardín Vertical' AND subcategoria_id IS NULL;

-- 8. Papeles Tapiz
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%papel%' 
       OR nombre ILIKE '%tapiz%'
       OR nombre ILIKE '%decoración%'
       OR nombre ILIKE '%decoracion%'
    LIMIT 1
)
WHERE nombre = 'Papeles Tapiz' AND subcategoria_id IS NULL;

-- 9. Pisos
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%piso%' 
       OR nombre ILIKE '%suelo%'
       OR nombre ILIKE '%pavimento%'
    LIMIT 1
)
WHERE nombre = 'Pisos' AND subcategoria_id IS NULL;

-- 10. Accesorios
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%accesorio%' 
       OR nombre ILIKE '%instalación%'
       OR nombre ILIKE '%instalacion%'
    LIMIT 1
)
WHERE nombre = 'Accesorios' AND subcategoria_id IS NULL;

-- 11. Madera Aserrada
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%madera%' 
       OR nombre ILIKE '%teca%'
       OR nombre ILIKE '%cedro%'
    LIMIT 1
)
WHERE nombre = 'Madera Aserrada' AND subcategoria_id IS NULL;

-- 12. Machimbrado
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%machimbrado%' 
       OR nombre ILIKE '%madera%'
    LIMIT 1
)
WHERE nombre = 'Machimbrado' AND subcategoria_id IS NULL;

-- 13. Determinaciones (Perfiles de terminación)
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%perfil%' 
       OR nombre ILIKE '%terminación%'
       OR nombre ILIKE '%terminacion%'
       OR nombre ILIKE '%accesorio%'
    LIMIT 1
)
WHERE nombre = 'Determinaciones' AND subcategoria_id IS NULL;

-- 14. Ángulos
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%ángulo%' 
       OR nombre ILIKE '%angulo%'
       OR nombre ILIKE '%esquina%'
       OR nombre ILIKE '%perfil%'
       OR nombre ILIKE '%accesorio%'
    LIMIT 1
)
WHERE nombre = 'Ángulos' AND subcategoria_id IS NULL;

-- 15. Rodapies
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%rodapie%' 
       OR nombre ILIKE '%rodapié%'
       OR nombre ILIKE '%zócalo%'
       OR nombre ILIKE '%zocalo%'
       OR nombre ILIKE '%accesorio%'
    LIMIT 1
)
WHERE nombre = 'Rodapies' AND subcategoria_id IS NULL;

-- 16. Perfiles
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%perfil%' 
       OR nombre ILIKE '%accesorio%'
    LIMIT 1
)
WHERE nombre = 'Perfiles' AND subcategoria_id IS NULL;

-- 17. Piezas 3D
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%3d%' 
       OR nombre ILIKE '%decoración%'
       OR nombre ILIKE '%decoracion%'
       OR nombre ILIKE '%panel%'
    LIMIT 1
)
WHERE nombre = 'Piezas 3D' AND subcategoria_id IS NULL;

-- 18. Cielo Raso
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%cielo%' 
       OR nombre ILIKE '%techo%'
       OR nombre ILIKE '%panel%'
    LIMIT 1
)
WHERE nombre = 'Cielo Raso' AND subcategoria_id IS NULL;

-- 19. Separadores
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%separador%' 
       OR nombre ILIKE '%división%'
       OR nombre ILIKE '%division%'
       OR nombre ILIKE '%panel%'
    LIMIT 1
)
WHERE nombre = 'Separadores' AND subcategoria_id IS NULL;

-- 20. Siliconas
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%silicona%' 
       OR nombre ILIKE '%adhesivo%'
       OR nombre ILIKE '%pegamento%'
       OR nombre ILIKE '%accesorio%'
    LIMIT 1
)
WHERE nombre = 'Siliconas' AND subcategoria_id IS NULL;

-- 21. Compresor
UPDATE productos 
SET subcategoria_id = (
    SELECT id FROM subcategorias 
    WHERE nombre ILIKE '%herramienta%' 
       OR nombre ILIKE '%equipo%'
       OR nombre ILIKE '%maquinaria%'
       OR nombre ILIKE '%accesorio%'
    LIMIT 1
)
WHERE nombre = 'Compresor' AND subcategoria_id IS NULL;

-- =====================================================
-- VERIFICAR RESULTADOS
-- =====================================================
SELECT 
    p.id,
    p.nombre as producto,
    COALESCE(s.nombre, '⚠️ SIN ASIGNAR') as subcategoria,
    COALESCE(c.nombre, '') as categoria
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
LEFT JOIN categorias c ON s.categoria_id = c.id
ORDER BY p.id;

-- Productos que aún no tienen subcategoría
SELECT 
    id,
    nombre,
    '⚠️ Necesita asignación manual' as estado
FROM productos
WHERE subcategoria_id IS NULL;

-- Resumen por subcategoría
SELECT 
    COALESCE(s.nombre, '⚠️ Sin subcategoría') as subcategoria,
    COUNT(p.id) as total_productos,
    STRING_AGG(p.nombre, ', ') as productos
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
GROUP BY s.id, s.nombre
ORDER BY total_productos DESC;
