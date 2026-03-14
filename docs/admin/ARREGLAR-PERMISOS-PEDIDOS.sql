-- ============================================
-- ARREGLAR PERMISOS PARA QUE USUARIOS PUEDAN CREAR PEDIDOS
-- ============================================
-- Este script permite que usuarios autenticados Y NO autenticados creen pedidos

-- 1. ELIMINAR POLÍTICAS RESTRICTIVAS EXISTENTES
DROP POLICY IF EXISTS "Admin puede insertar pedidos" ON pedidos;
DROP POLICY IF EXISTS "Usuarios pueden ver sus propios pedidos" ON pedidos;
DROP POLICY IF EXISTS "Admin puede ver todos los pedidos" ON pedidos;
DROP POLICY IF EXISTS "Admin puede actualizar pedidos" ON pedidos;
DROP POLICY IF EXISTS "Usuarios pueden crear sus propios pedidos" ON pedidos;

-- 2. PERMITIR QUE CUALQUIERA CREE PEDIDOS (autenticado o no)
CREATE POLICY "Cualquiera puede crear pedidos"
    ON pedidos FOR INSERT
    TO public
    WITH CHECK (true);

-- 3. PERMITIR QUE USUARIOS VEAN SUS PROPIOS PEDIDOS
CREATE POLICY "Usuarios pueden ver sus propios pedidos"
    ON pedidos FOR SELECT
    TO authenticated
    USING (
        cliente_id = auth.uid() 
        OR 
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- 4. ADMIN PUEDE VER TODOS LOS PEDIDOS (incluso sin cliente_id)
CREATE POLICY "Admin puede ver todos los pedidos"
    ON pedidos FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- 5. SOLO ADMIN PUEDE ACTUALIZAR PEDIDOS
CREATE POLICY "Admin puede actualizar pedidos"
    ON pedidos FOR UPDATE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- 6. SOLO ADMIN PUEDE ELIMINAR PEDIDOS
CREATE POLICY "Admin puede eliminar pedidos"
    ON pedidos FOR DELETE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- 7. ARREGLAR POLÍTICAS DE PEDIDO_ITEMS
DROP POLICY IF EXISTS "Admin puede ver todos los items" ON pedido_items;
DROP POLICY IF EXISTS "Usuarios pueden ver items de sus pedidos" ON pedido_items;
DROP POLICY IF EXISTS "Usuarios pueden crear items de sus pedidos" ON pedido_items;

-- Permitir que cualquiera inserte items (autenticado o no)
CREATE POLICY "Cualquiera puede crear items de pedidos"
    ON pedido_items FOR INSERT
    TO public
    WITH CHECK (true);

-- Permitir que usuarios vean items de sus pedidos
CREATE POLICY "Usuarios pueden ver items de sus pedidos"
    ON pedido_items FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM pedidos
            WHERE pedidos.id = pedido_items.pedido_id
            AND pedidos.cliente_id = auth.uid()
        )
        OR
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Admin puede ver todos los items
CREATE POLICY "Admin puede ver todos los items"
    ON pedido_items FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- 8. ARREGLAR POLÍTICAS DE CLIENTES
DROP POLICY IF EXISTS "Usuarios pueden actualizar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden ver su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Admin puede ver todos los clientes" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden gestionar su perfil" ON clientes;

-- Usuarios pueden crear/actualizar su propio perfil
CREATE POLICY "Usuarios pueden gestionar su perfil"
    ON clientes FOR ALL
    TO authenticated
    USING (id = auth.uid())
    WITH CHECK (id = auth.uid());

-- Admin puede ver todos los clientes
CREATE POLICY "Admin puede ver todos los clientes"
    ON clientes FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- 9. VERIFICAR POLÍTICAS CREADAS
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd
FROM pg_policies
WHERE tablename IN ('pedidos', 'pedido_items', 'clientes')
ORDER BY tablename, policyname;

SELECT '✅ Políticas RLS actualizadas - Usuarios autenticados y NO autenticados pueden crear pedidos' as resultado;
