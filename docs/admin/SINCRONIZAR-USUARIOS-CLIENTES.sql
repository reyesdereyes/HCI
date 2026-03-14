-- =====================================================
-- SINCRONIZAR USUARIOS DE AUTH.USERS CON CLIENTES
-- =====================================================
-- Este script crea registros en la tabla clientes para
-- todos los usuarios que no tienen uno

-- 1. Ver usuarios que NO tienen registro en clientes
SELECT 
    u.id,
    u.email,
    u.created_at,
    u.raw_user_meta_data
FROM auth.users u
LEFT JOIN clientes c ON u.id = c.id
WHERE c.id IS NULL;

-- 2. Insertar usuarios faltantes en la tabla clientes
INSERT INTO clientes (
    id,
    nombre_completo,
    telefono,
    tipo_cliente,
    activo,
    fecha_registro
)
SELECT 
    u.id,
    COALESCE(
        u.raw_user_meta_data->>'full_name',
        u.raw_user_meta_data->>'nombre_completo',
        u.email
    ) as nombre_completo,
    u.raw_user_meta_data->>'phone' as telefono,
    'detal' as tipo_cliente,
    true as activo,
    u.created_at as fecha_registro
FROM auth.users u
LEFT JOIN clientes c ON u.id = c.id
WHERE c.id IS NULL
ON CONFLICT (id) DO NOTHING;

-- 3. Verificar que todos los usuarios ahora tienen registro
SELECT 
    COUNT(*) as total_usuarios,
    COUNT(c.id) as usuarios_con_registro,
    COUNT(*) - COUNT(c.id) as usuarios_sin_registro
FROM auth.users u
LEFT JOIN clientes c ON u.id = c.id;

-- 4. Ver resultado de la sincronización
SELECT 
    u.id,
    u.email,
    c.nombre_completo,
    c.tipo_cliente,
    c.activo,
    c.fecha_registro
FROM auth.users u
INNER JOIN clientes c ON u.id = c.id
ORDER BY c.fecha_registro DESC
LIMIT 10;
