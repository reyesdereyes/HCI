-- ============================================
-- SOLUCIÓN TEMPORAL - DESHABILITAR RLS
-- ============================================
-- ⚠️ ADVERTENCIA: Esto desactiva la seguridad de las tablas
-- Solo usar en desarrollo o mientras configuras las políticas correctas

-- OPCIÓN 1: Deshabilitar RLS completamente (MÁS FÁCIL)
ALTER TABLE pedidos DISABLE ROW LEVEL SECURITY;
ALTER TABLE pedido_items DISABLE ROW LEVEL SECURITY;

SELECT '✅ RLS deshabilitado - Ahora puedes crear pedidos' as resultado;

-- Para verificar:
SELECT 
    tablename,
    rowsecurity
FROM pg_tables
WHERE tablename IN ('pedidos', 'pedido_items')
AND schemaname = 'public';

-- NOTA: Cuando tengas tiempo, ejecuta OPCIÓN 2 para reactivar RLS con políticas correctas

-- ============================================
-- OPCIÓN 2: Reactivar RLS con políticas correctas (HACER DESPUÉS)
-- ============================================
/*
-- Reactivar RLS
ALTER TABLE pedidos ENABLE ROW LEVEL SECURITY;
ALTER TABLE pedido_items ENABLE ROW LEVEL SECURITY;

-- Eliminar políticas viejas
DROP POLICY IF EXISTS "allow_insert_pedidos" ON pedidos;
DROP POLICY IF EXISTS "allow_select_pedidos" ON pedidos;
DROP POLICY IF EXISTS "allow_update_pedidos" ON pedidos;
DROP POLICY IF EXISTS "allow_insert_pedido_items" ON pedido_items;
DROP POLICY IF EXISTS "allow_select_pedido_items" ON pedido_items;

-- Crear políticas nuevas que funcionen
CREATE POLICY "pedidos_insert_policy"
    ON pedidos FOR INSERT
    TO anon, authenticated
    WITH CHECK (true);

CREATE POLICY "pedidos_select_policy"
    ON pedidos FOR SELECT
    TO anon, authenticated
    USING (true);

CREATE POLICY "pedidos_update_policy"
    ON pedidos FOR UPDATE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

CREATE POLICY "pedido_items_insert_policy"
    ON pedido_items FOR INSERT
    TO anon, authenticated
    WITH CHECK (true);

CREATE POLICY "pedido_items_select_policy"
    ON pedido_items FOR SELECT
    TO anon, authenticated
    USING (true);

SELECT '✅ RLS reactivado con políticas correctas' as resultado;
*/
