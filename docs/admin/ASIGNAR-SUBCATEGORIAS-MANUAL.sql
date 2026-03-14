-- =====================================================
-- ASIGNAR SUBCATEGORÍAS MANUALMENTE
-- =====================================================
-- Ejecuta primero esta consulta para ver tus subcategorías disponibles
-- y luego ajusta los IDs en las actualizaciones

-- PASO 1: Ver todas las subcategorías disponibles
SELECT 
    s.id,
    s.nombre as subcategoria,
    c.nombre as categoria
FROM subcategorias s
LEFT JOIN categorias c ON s.categoria_id = c.id
ORDER BY c.nombre, s.nombre;

-- PASO 2: Ver los productos actuales
SELECT 
    id,
    nombre,
    subcategoria_id
FROM productos
ORDER BY id;

-- =====================================================
-- PASO 3: ASIGNAR SUBCATEGORÍAS
-- =====================================================
-- Reemplaza los números (1, 2, 3, etc.) con los IDs reales de tus subcategorías

-- Ejemplo de cómo actualizar:
-- UPDATE productos SET subcategoria_id = ID_DE_TU_SUBCATEGORIA WHERE id = ID_DEL_PRODUCTO;

-- Productos de PANELES/REVESTIMIENTOS
UPDATE productos SET subcategoria_id = 1 WHERE nombre = 'Wallpanel Exterior';
UPDATE productos SET subcategoria_id = 1 WHERE nombre = 'Wallpanel Interior';
UPDATE productos SET subcategoria_id = 1 WHERE nombre = 'Cielo Raso';
UPDATE productos SET subcategoria_id = 1 WHERE nombre = 'Separadores';

-- Productos de LÁMINAS
UPDATE productos SET subcategoria_id = 2 WHERE nombre = 'Láminas PVC';
UPDATE productos SET subcategoria_id = 2 WHERE nombre = 'Láminas WPC';
UPDATE productos SET subcategoria_id = 2 WHERE nombre = 'Láminas Bamboo';

-- Productos de JARDÍN/DECORACIÓN EXTERIOR
UPDATE productos SET subcategoria_id = 3 WHERE nombre = 'Grama Artificial';
UPDATE productos SET subcategoria_id = 3 WHERE nombre = 'Jardín Vertical';

-- Productos de DECORACIÓN INTERIOR
UPDATE productos SET subcategoria_id = 4 WHERE nombre = 'Papeles Tapiz';
UPDATE productos SET subcategoria_id = 4 WHERE nombre = 'Piezas 3D';

-- Productos de PISOS
UPDATE productos SET subcategoria_id = 5 WHERE nombre = 'Pisos';

-- Productos de MADERA
UPDATE productos SET subcategoria_id = 6 WHERE nombre = 'Madera Aserrada';
UPDATE productos SET subcategoria_id = 6 WHERE nombre = 'Machimbrado';

-- Productos de ACCESORIOS/PERFILES
UPDATE productos SET subcategoria_id = 7 WHERE nombre = 'Accesorios';
UPDATE productos SET subcategoria_id = 7 WHERE nombre = 'Determinaciones';
UPDATE productos SET subcategoria_id = 7 WHERE nombre = 'Ángulos';
UPDATE productos SET subcategoria_id = 7 WHERE nombre = 'Rodapies';
UPDATE productos SET subcategoria_id = 7 WHERE nombre = 'Perfiles';
UPDATE productos SET subcategoria_id = 7 WHERE nombre = 'Siliconas';

-- Productos de HERRAMIENTAS/EQUIPOS
UPDATE productos SET subcategoria_id = 8 WHERE nombre = 'Compresor';

-- =====================================================
-- PASO 4: VERIFICAR LOS CAMBIOS
-- =====================================================
SELECT 
    p.id,
    p.nombre as producto,
    s.nombre as subcategoria,
    c.nombre as categoria
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
LEFT JOIN categorias c ON s.categoria_id = c.id
ORDER BY p.id;

-- Ver productos sin subcategoría asignada
SELECT 
    id,
    nombre,
    subcategoria_id
FROM productos
WHERE subcategoria_id IS NULL;

-- Contar productos por subcategoría
SELECT 
    COALESCE(s.nombre, 'Sin subcategoría') as subcategoria,
    COUNT(p.id) as total_productos
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
GROUP BY s.id, s.nombre
ORDER BY total_productos DESC;
