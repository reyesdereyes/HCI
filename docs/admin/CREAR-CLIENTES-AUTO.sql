-- ============================================
-- CREAR PERFILES DE CLIENTES AUTOMÁTICAMENTE
-- ============================================
-- Este script sincroniza usuarios de auth.users con la tabla clientes

-- PASO 1: Insertar clientes faltantes
-- Esto crea un perfil de cliente para cada usuario que no lo tenga
INSERT INTO clientes (id, nombre_completo, tipo_cliente, fecha_registro, activo)
SELECT 
    au.id,
    COALESCE(
        au.raw_user_meta_data->>'full_name',
        au.raw_user_meta_data->>'name', 
        au.email
    ) as nombre_completo,
    'detal' as tipo_cliente,
    au.created_at as fecha_registro,
    true as activo
FROM auth.users au
LEFT JOIN clientes c ON c.id = au.id
WHERE c.id IS NULL
ON CONFLICT (id) DO NOTHING;

-- PASO 2: Crear función para auto-crear perfil al registrarse
CREATE OR REPLACE FUNCTION crear_perfil_cliente_auto()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO clientes (
        id, 
        nombre_completo, 
        tipo_cliente, 
        fecha_registro, 
        activo
    )
    VALUES (
        NEW.id,
        COALESCE(
            NEW.raw_user_meta_data->>'full_name',
            NEW.raw_user_meta_data->>'name',
            NEW.email
        ),
        'detal',
        NOW(),
        true
    )
    ON CONFLICT (id) DO NOTHING;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- PASO 3: Crear trigger para nuevos usuarios
DROP TRIGGER IF EXISTS trigger_crear_perfil_cliente_auto ON auth.users;

CREATE TRIGGER trigger_crear_perfil_cliente_auto
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION crear_perfil_cliente_auto();

-- PASO 4: Verificar clientes creados
SELECT 
    c.id,
    c.nombre_completo,
    au.email,
    c.tipo_cliente,
    c.fecha_registro,
    c.total_pedidos,
    c.total_compras
FROM clientes c
INNER JOIN auth.users au ON au.id = c.id
ORDER BY c.fecha_registro DESC;

-- PASO 5: Ver estadísticas
SELECT 
    COUNT(*) as total_usuarios,
    COUNT(c.id) as usuarios_con_perfil,
    COUNT(*) - COUNT(c.id) as usuarios_sin_perfil
FROM auth.users au
LEFT JOIN clientes c ON c.id = au.id;

COMMENT ON FUNCTION crear_perfil_cliente_auto() IS 'Crea automáticamente un perfil de cliente cuando un usuario se registra';
COMMENT ON TRIGGER trigger_crear_perfil_cliente_auto ON auth.users IS 'Trigger que ejecuta crear_perfil_cliente_auto() al insertar un nuevo usuario';
