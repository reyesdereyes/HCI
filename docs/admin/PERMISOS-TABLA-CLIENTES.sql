-- =====================================================
-- CONFIGURAR PERMISOS PARA TABLA CLIENTES
-- =====================================================
-- Este script configura los permisos correctos para que
-- los usuarios y administradores puedan acceder a la tabla

-- 1. Deshabilitar RLS temporalmente para pruebas (SOLO DESARROLLO)
-- ADVERTENCIA: Esto permite acceso completo a todos. Usar solo para pruebas.
-- ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;

-- 2. Habilitar RLS (recomendado para producción)
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;

-- 3. Eliminar todas las políticas existentes
DROP POLICY IF EXISTS "Usuarios pueden ver su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden actualizar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden insertar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden ver todos los clientes" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden actualizar todos los clientes" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden insertar clientes" ON clientes;
DROP POLICY IF EXISTS "Permitir lectura a usuarios autenticados" ON clientes;
DROP POLICY IF EXISTS "Permitir todo a administradores" ON clientes;

-- 4. Crear políticas simples y permisivas

-- Política 1: Los usuarios pueden ver y editar su propio perfil
CREATE POLICY "Usuarios pueden ver su propio perfil"
ON clientes FOR SELECT
TO authenticated
USING (auth.uid() = id);

CREATE POLICY "Usuarios pueden actualizar su propio perfil"
ON clientes FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

CREATE POLICY "Usuarios pueden insertar su propio perfil"
ON clientes FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = id);

-- Política 2: Los administradores pueden hacer todo
CREATE POLICY "Administradores pueden ver todos los clientes"
ON clientes FOR SELECT
TO authenticated
USING (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

CREATE POLICY "Administradores pueden actualizar todos los clientes"
ON clientes FOR UPDATE
TO authenticated
USING (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

CREATE POLICY "Administradores pueden insertar clientes"
ON clientes FOR INSERT
TO authenticated
WITH CHECK (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

-- 5. Otorgar permisos básicos a usuarios autenticados
GRANT SELECT, INSERT, UPDATE ON clientes TO authenticated;
GRANT USAGE ON SCHEMA public TO authenticated;

-- 6. Verificar las políticas creadas
SELECT 
    policyname,
    cmd,
    roles,
    CASE 
        WHEN qual IS NOT NULL THEN 'Tiene condición USING'
        ELSE 'Sin condición USING'
    END as tiene_using,
    CASE 
        WHEN with_check IS NOT NULL THEN 'Tiene condición WITH CHECK'
        ELSE 'Sin condición WITH CHECK'
    END as tiene_with_check
FROM pg_policies
WHERE tablename = 'clientes'
ORDER BY policyname;

-- 7. Probar acceso (ejecutar como usuario normal)
-- SELECT * FROM clientes WHERE id = auth.uid();

-- 8. Probar acceso como administrador
-- SELECT * FROM clientes LIMIT 5;
