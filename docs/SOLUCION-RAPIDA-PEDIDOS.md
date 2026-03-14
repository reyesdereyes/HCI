# Solución Rápida - Error al Crear Pedidos

## Problema

Al intentar confirmar un pedido aparece:
```
Error 401/403: new row violates row-level security policy for table "pedidos"
```

## Solución (Ejecutar en Supabase SQL Editor)

Copia y pega este script completo:

```sql
-- ============================================
-- ARREGLAR PERMISOS PARA PEDIDOS
-- ============================================

-- 1. Eliminar políticas restrictivas
DROP POLICY IF EXISTS "Admin puede insertar pedidos" ON pedidos;
DROP POLICY IF EXISTS "Usuarios pueden ver sus propios pedidos" ON pedidos;
DROP POLICY IF EXISTS "Admin puede ver todos los pedidos" ON pedidos;
DROP POLICY IF EXISTS "Admin puede actualizar pedidos" ON pedidos;
DROP POLICY IF EXISTS "Usuarios pueden crear sus propios pedidos" ON pedidos;

-- 2. Permitir que CUALQUIERA cree pedidos (autenticado o no)
CREATE POLICY "Cualquiera puede crear pedidos"
    ON pedidos FOR INSERT
    TO public
    WITH CHECK (true);

-- 3. Permitir que usuarios vean sus propios pedidos
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

-- 4. Admin puede ver todos los pedidos
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

-- 5. Solo admin puede actualizar pedidos
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

-- 6. Arreglar pedido_items
DROP POLICY IF EXISTS "Admin puede ver todos los items" ON pedido_items;
DROP POLICY IF EXISTS "Usuarios pueden ver items de sus pedidos" ON pedido_items;
DROP POLICY IF EXISTS "Usuarios pueden crear items de sus pedidos" ON pedido_items;

-- Permitir que cualquiera cree items
CREATE POLICY "Cualquiera puede crear items de pedidos"
    ON pedido_items FOR INSERT
    TO public
    WITH CHECK (true);

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

-- 7. Arreglar clientes
DROP POLICY IF EXISTS "Usuarios pueden actualizar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden ver su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Admin puede ver todos los clientes" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden gestionar su perfil" ON clientes;

CREATE POLICY "Usuarios pueden gestionar su perfil"
    ON clientes FOR ALL
    TO authenticated
    USING (id = auth.uid())
    WITH CHECK (id = auth.uid());

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

SELECT '✅ Políticas actualizadas - Usuarios autenticados y NO autenticados pueden crear pedidos' as resultado;
```

## Verificar que Funciona

1. Ejecuta el script anterior
2. Recarga la página
3. Intenta hacer un pedido
4. Debería funcionar sin errores

## Scripts Completos en Orden

Si es la primera vez que configuras:

1. `docs/admin/ADMIN-TABLES-SETUP.sql` - Crear tablas
2. `docs/admin/APLICAR-SECURITY-DEFINER.sql` - Arreglar triggers
3. `docs/admin/ARREGLAR-PERMISOS-PEDIDOS.sql` - Arreglar permisos (ESTE)
4. `docs/admin/CREAR-CLIENTES-AUTO.sql` - Sincronizar clientes

## Problemas Comunes

**Error: "relation pedidos does not exist"**
- Ejecuta primero `ADMIN-TABLES-SETUP.sql`

**Error: "column administradores.user_id does not exist"**
- La tabla administradores usa `email` no `user_id`
- Verifica: `SELECT * FROM administradores;`

**Los clientes no aparecen en admin**
- Ejecuta `CREAR-CLIENTES-AUTO.sql`

**Error 403 al editar productos**
- Ejecuta `APLICAR-SECURITY-DEFINER.sql`
