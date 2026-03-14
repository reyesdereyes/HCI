-- ============================================
-- VERIFICAR CATEGORÍAS Y PRODUCTOS
-- ============================================
-- Ejecuta esto en Supabase SQL Editor

-- 1. Ver todas las categorías activas
SELECT id, nombre, icono, activo, orden
FROM categorias
WHERE activo = true
ORDER BY orden;

-- 2. Ver todas las subcategorías y sus categorías
SELECT 
    s.id as subcategoria_id,
    s.nombre as subcategoria_nombre,
    s.categoria_id,
    c.nombre as categoria_nombre,
    s.activo as subcategoria_activa
FROM subcategorias s
LEFT JOIN categorias c ON s.categoria_id = c.id
ORDER BY c.nombre, s.nombre;

-- 3. Ver productos con sus subcategorías y categorías
SELECT 
    p.id as producto_id,
    p.nombre as producto_nombre,
    p.subcategoria_id,
    s.nombre as subcategoria_nombre,
    s.categoria_id,
    c.nombre as categoria_nombre,
    p.activo as producto_activo,
    p.stock
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
LEFT JOIN categorias c ON s.categoria_id = c.id
WHERE p.activo = true
ORDER BY c.nombre, s.nombre, p.nombre;

-- 4. Contar productos por categoría
SELECT 
    c.nombre as categoria,
    COUNT(p.id) as total_productos
FROM categorias c
LEFT JOIN subcategorias s ON c.id = s.categoria_id
LEFT JOIN productos p ON s.id = p.subcategoria_id AND p.activo = true
WHERE c.activo = true
GROUP BY c.id, c.nombre
ORDER BY c.nombre;

-- 5. Ver productos de Decoración específicamente
SELECT 
    p.id,
    p.nombre,
    p.stock,
    s.nombre as subcategoria,
    c.nombre as categoria
FROM productos p
JOIN subcategorias s ON p.subcategoria_id = s.id
JOIN categorias c ON s.categoria_id = c.id
WHERE c.nombre ILIKE '%decoracion%' 
AND p.activo = true;

-- 6. Ver productos de Refrigeración específicamente
SELECT 
    p.id,
    p.nombre,
    p.stock,
    s.nombre as subcategoria,
    c.nombre as categoria
FROM productos p
JOIN subcategorias s ON p.subcategoria_id = s.id
JOIN categorias c ON s.categoria_id = c.id
WHERE c.nombre ILIKE '%refrigeracion%' 
AND p.activo = true;
