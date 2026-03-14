-- ============================================
-- SCRIPT PARA SINCRONIZAR CLIENTES CON AUTH.USERS
-- ============================================
-- Este script crea registros en la tabla clientes para todos los usuarios
-- que existen en auth.users pero no tienen perfil de cliente

-- OPCIÓN 1: Insertar clientes faltantes con datos básicos
INSERT INTO clientes (id, nombre_completo, tipo_cliente, fecha_registro, activo)
SELECT 
    au.id,
    COALESCE(au.raw_user_meta_data->>'full_name', au.email) as nombre_completo,
    'detal' as tipo_cliente,
    au.created_at as fecha_registro,
    true as activo
FROM auth.users au
LEFT JOIN clientes c ON c.id = au.id
WHERE c.id IS NULL;

-- OPCIÓN 2: Ver usuarios que no tienen perfil de cliente
SELECT 
    au.id,
    au.email,
    au.created_at,
    au.raw_user_meta_data->>'full_name' as nombre
FROM auth.users au
LEFT JOIN clientes c ON c.id = au.id
WHERE c.id IS NULL;

-- OPCIÓN 3: Actualizar email en clientes desde auth.users
UPDATE clientes c
SET nombre_completo = COALESCE(c.nombre_completo, au.email)
FROM auth.users au
WHERE c.id = au.id
AND c.nombre_completo IS NULL;

-- OPCIÓN 4: Ver todos los clientes con su email de auth
SELECT 
    c.*,
    au.email
FROM clientes c
INNER JOIN auth.users au ON au.id = c.id
ORDER BY c.fecha_registro DESC;

-- OPCIÓN 5: Crear función para auto-crear perfil de cliente al registrarse
CREATE OR REPLACE FUNCTION crear_perfil_cliente()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO clientes (id, nombre_completo, tipo_cliente, fecha_registro, activo)
    VALUES (
        NEW.id,
        COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
        'detal',
        NOW(),
        true
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Crear trigger para auto-crear perfil
DROP TRIGGER IF EXISTS trigger_crear_perfil_cliente ON auth.users;
CREATE TRIGGER trigger_crear_perfil_cliente
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION crear_perfil_cliente();

-- NOTA: Para ver los clientes en el admin, necesitas:
-- 1. Ejecutar OPCIÓN 1 para crear perfiles de clientes existentes
-- 2. El trigger (OPCIÓN 5) creará automáticamente perfiles para nuevos usuarios
