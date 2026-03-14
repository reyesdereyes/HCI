-- =====================================================
-- ELIMINAR TODOS LOS PRODUCTOS - EJECUTAR AHORA
-- =====================================================
-- Este script elimina TODOS los productos de la base de datos
-- Ejecuta este script completo en Supabase SQL Editor

-- Paso 1: Ver cuántos productos tienes antes de eliminar
SELECT COUNT(*) as total_productos_antes FROM productos;

-- Paso 2: Eliminar referencias en pedido_items primero
DELETE FROM pedido_items;

-- Paso 3: Eliminar TODOS los productos
DELETE FROM productos;

-- Paso 4: Reiniciar el contador de IDs
ALTER SEQUENCE productos_id_seq RESTART WITH 1;

-- Paso 5: Verificar que se eliminaron todos
SELECT COUNT(*) as productos_restantes FROM productos;

-- Mensaje de confirmación
SELECT 'Todos los productos han sido eliminados exitosamente' as resultado;
