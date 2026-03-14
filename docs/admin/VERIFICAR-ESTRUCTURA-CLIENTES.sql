-- =====================================================
-- VERIFICAR ESTRUCTURA DE TABLA CLIENTES (SIN MODIFICAR)
-- =====================================================
-- Este script solo verifica la estructura actual sin hacer cambios

-- 1. Ver todas las columnas de la tabla clientes
SELECT 
    column_name, 
    data_type, 
    character_maximum_length,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'clientes'
ORDER BY ordinal_position;

-- 2. Ver las políticas RLS activas
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE tablename = 'clientes';

-- 3. Ver los índices de la tabla
SELECT
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename = 'clientes';

-- 4. Contar registros
SELECT 
    COUNT(*) as total_clientes,
    COUNT(CASE WHEN activo = true THEN 1 END) as clientes_activos,
    COUNT(CASE WHEN tipo_cliente = 'detal' THEN 1 END) as clientes_detal,
    COUNT(CASE WHEN tipo_cliente = 'mayor' THEN 1 END) as clientes_mayor
FROM clientes;

-- 5. Ver algunos registros de ejemplo
SELECT 
    id,
    nombre_completo,
    empresa,
    telefono,
    tipo_cliente,
    activo,
    fecha_registro
FROM clientes
ORDER BY fecha_registro DESC
LIMIT 10;

-- 6. Verificar si hay usuarios sin registro en clientes
SELECT 
    u.id,
    u.email,
    u.created_at,
    CASE 
        WHEN c.id IS NULL THEN 'Sin registro en clientes'
        ELSE 'Tiene registro'
    END as estado
FROM auth.users u
LEFT JOIN clientes c ON u.id = c.id
ORDER BY u.created_at DESC
LIMIT 10;
