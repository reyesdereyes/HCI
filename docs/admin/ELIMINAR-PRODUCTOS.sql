-- =====================================================
-- SCRIPT PARA ELIMINAR PRODUCTOS DE LA BASE DE DATOS
-- =====================================================
-- ADVERTENCIA: Este script eliminará productos de tu base de datos
-- Usa con precaución y asegúrate de tener un respaldo

-- =====================================================
-- OPCIÓN 1: ELIMINAR TODOS LOS PRODUCTOS
-- =====================================================
-- Esta opción elimina TODOS los productos de la base de datos

-- Paso 1: Ver cuántos productos tienes actualmente
SELECT COUNT(*) as total_productos FROM productos;

-- Paso 2: Ver productos por subcategoría
SELECT 
  s.nombre as subcategoria,
  COUNT(p.id) as cantidad_productos
FROM subcategorias s
LEFT JOIN productos p ON p.subcategoria_id = s.id
GROUP BY s.nombre
ORDER BY cantidad_productos DESC;

-- Paso 3: Eliminar referencias en pedido_items primero (si existen)
-- ADVERTENCIA: Esto eliminará el historial de productos en pedidos
-- DELETE FROM pedido_items;

-- Paso 4: Eliminar todos los productos
-- DELETE FROM productos;

-- Paso 5: Reiniciar el contador de IDs (opcional)
-- ALTER SEQUENCE productos_id_seq RESTART WITH 1;

-- Paso 6: Verificar que se eliminaron
-- SELECT COUNT(*) as productos_restantes FROM productos;

-- =====================================================
-- OPCIÓN 2: DESACTIVAR TODOS LOS PRODUCTOS (RECOMENDADO)
-- =====================================================
-- Esta opción NO elimina los productos, solo los desactiva
-- Esto es más seguro porque mantiene el historial de pedidos

-- Desactivar todos los productos
-- UPDATE productos SET activo = false;

-- Verificar productos desactivados
-- SELECT COUNT(*) as productos_desactivados FROM productos WHERE activo = false;

-- =====================================================
-- OPCIÓN 3: ELIMINAR PRODUCTOS POR SUBCATEGORÍA
-- =====================================================
-- Elimina productos de una subcategoría específica

-- Ver subcategorías disponibles
SELECT id, nombre FROM subcategorias ORDER BY nombre;

-- Eliminar productos de una subcategoría específica (ejemplo: Láminas PVC)
-- DELETE FROM productos 
-- WHERE subcategoria_id = (SELECT id FROM subcategorias WHERE nombre ILIKE '%lamina%pvc%' LIMIT 1);

-- =====================================================
-- OPCIÓN 4: ELIMINAR PRODUCTOS SIN SUBCATEGORÍA
-- =====================================================
-- Elimina solo productos que no tienen subcategoría asignada

-- Ver productos sin subcategoría
SELECT id, nombre, descripcion 
FROM productos 
WHERE subcategoria_id IS NULL;

-- Eliminar productos sin subcategoría
-- DELETE FROM productos WHERE subcategoria_id IS NULL;

-- =====================================================
-- OPCIÓN 5: ELIMINAR PRODUCTOS INACTIVOS
-- =====================================================
-- Elimina solo productos que están marcados como inactivos

-- Ver productos inactivos
SELECT COUNT(*) as productos_inactivos FROM productos WHERE activo = false;

-- Eliminar productos inactivos
-- DELETE FROM productos WHERE activo = false;

-- =====================================================
-- OPCIÓN 6: ELIMINAR PRODUCTOS POR NOMBRE (BÚSQUEDA)
-- =====================================================
-- Elimina productos que coincidan con un patrón de búsqueda

-- Ver productos que coinciden con el patrón (ejemplo: "LAMINA PVC")
SELECT id, nombre FROM productos WHERE nombre ILIKE '%LAMINA PVC%';

-- Eliminar productos que coinciden con el patrón
-- DELETE FROM productos WHERE nombre ILIKE '%LAMINA PVC%';

-- =====================================================
-- SCRIPT DE LIMPIEZA COMPLETA (USA CON PRECAUCIÓN)
-- =====================================================
-- Este script elimina TODO: productos, pedido_items y reinicia contadores
-- SOLO descomenta si estás 100% seguro

/*
-- 1. Eliminar items de pedidos
DELETE FROM pedido_items;

-- 2. Eliminar todos los productos
DELETE FROM productos;

-- 3. Reiniciar contadores
ALTER SEQUENCE productos_id_seq RESTART WITH 1;
ALTER SEQUENCE pedido_items_id_seq RESTART WITH 1;

-- 4. Verificar
SELECT 
  (SELECT COUNT(*) FROM productos) as productos_restantes,
  (SELECT COUNT(*) FROM pedido_items) as items_restantes;
*/

-- =====================================================
-- NOTAS IMPORTANTES
-- =====================================================
-- 1. SIEMPRE haz un respaldo antes de eliminar datos
-- 2. La OPCIÓN 2 (desactivar) es la más segura
-- 3. Si eliminas productos que están en pedidos, debes eliminar pedido_items primero
-- 4. Los scripts están comentados para evitar ejecución accidental
-- 5. Descomenta solo las líneas que necesites ejecutar
-- =====================================================
