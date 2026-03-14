-- ============================================
-- SCRIPT DE DIAGNÓSTICO PARA SUPABASE
-- ============================================
-- Ejecuta este script en Supabase SQL Editor para verificar la estructura de tus tablas

-- 1. Ver estructura de la tabla productos
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'productos'
ORDER BY ordinal_position;

-- 2. Ver estructura de la tabla categorias
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'categorias'
ORDER BY ordinal_position;

-- 3. Ver estructura de la tabla subcategorias
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'subcategorias'
ORDER BY ordinal_position;

-- 4. Verificar si las tablas existen
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('productos', 'categorias', 'subcategorias');

-- 5. Ver un producto de ejemplo (si existe)
SELECT * FROM productos LIMIT 1;

-- 6. Ver una categoría de ejemplo (si existe)
SELECT * FROM categorias LIMIT 1;

-- 7. Ver una subcategoría de ejemplo (si existe)
SELECT * FROM subcategorias LIMIT 1;
