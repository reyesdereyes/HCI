-- ============================================
-- ARREGLAR POLÍTICAS RLS PARA ADMIN
-- ============================================
-- Este script arregla los permisos para que los administradores
-- puedan actualizar productos sin errores

-- 1. ARREGLAR POLÍTICA DE HISTORIAL_STOCK
-- El trigger necesita poder insertar en historial_stock

-- Eliminar política existente si hay conflicto
DROP POLICY IF EXISTS "Admin puede ver historial" ON historial_stock;
DROP POLICY IF EXISTS "Admin puede insertar historial" ON historial_stock;
DROP POLICY IF EXISTS "Sistema puede insertar historial" ON historial_stock;

-- Crear política para que admin pueda ver
CREATE POLICY "Admin puede ver historial"
    ON historial_stock FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Crear política para que admin pueda insertar
CREATE POLICY "Admin puede insertar historial"
    ON historial_stock FOR INSERT
    TO authenticated
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- IMPORTANTE: Permitir que los triggers inserten sin restricciones
-- Modificar la función del trigger para usar SECURITY DEFINER
CREATE OR REPLACE FUNCTION registrar_historial_stock()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.stock IS DISTINCT FROM NEW.stock THEN
        INSERT INTO historial_stock (
            producto_id,
            cantidad_anterior,
            cantidad_nueva,
            diferencia,
            tipo_movimiento,
            motivo
        ) VALUES (
            NEW.id,
            OLD.stock,
            NEW.stock,
            NEW.stock - OLD.stock,
            CASE 
                WHEN NEW.stock > OLD.stock THEN 'entrada'
                WHEN NEW.stock < OLD.stock THEN 'salida'
                ELSE 'ajuste'
            END,
            'Actualización manual'
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. ARREGLAR POLÍTICA DE ALERTAS_INVENTARIO
DROP POLICY IF EXISTS "Admin puede ver alertas" ON alertas_inventario;
DROP POLICY IF EXISTS "Admin puede insertar alertas" ON alertas_inventario;
DROP POLICY IF EXISTS "Sistema puede insertar alertas" ON alertas_inventario;

CREATE POLICY "Admin puede gestionar alertas"
    ON alertas_inventario FOR ALL
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Modificar función de alertas para usar SECURITY DEFINER
CREATE OR REPLACE FUNCTION verificar_stock_bajo()
RETURNS TRIGGER AS $$
BEGIN
    -- Si el stock es menor o igual a 10, crear alerta
    IF NEW.stock <= 10 AND NEW.stock > 0 THEN
        INSERT INTO alertas_inventario (producto_id, tipo, mensaje)
        VALUES (
            NEW.id,
            'stock_bajo',
            'El producto "' || NEW.nombre || '" tiene stock bajo (' || NEW.stock || ' unidades)'
        )
        ON CONFLICT DO NOTHING;
    END IF;
    
    -- Si el stock es 0, crear alerta de sin stock
    IF NEW.stock = 0 THEN
        INSERT INTO alertas_inventario (producto_id, tipo, mensaje)
        VALUES (
            NEW.id,
            'sin_stock',
            'El producto "' || NEW.nombre || '" está sin stock'
        )
        ON CONFLICT DO NOTHING;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. VERIFICAR POLÍTICAS DE PRODUCTOS
-- Asegurarse de que admin puede actualizar productos

DROP POLICY IF EXISTS "Admin puede actualizar productos" ON productos;

CREATE POLICY "Admin puede actualizar productos"
    ON productos FOR UPDATE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    )
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- 4. VERIFICAR QUE TU EMAIL ESTÁ EN ADMINISTRADORES
-- Reemplaza 'tu-email@example.com' con tu email real
SELECT * FROM administradores WHERE email = auth.email();

-- Si no aparece nada, ejecuta esto (reemplaza con tu email):
-- INSERT INTO administradores (email, nombre, activo)
-- VALUES ('tu-email@example.com', 'Tu Nombre', true)
-- ON CONFLICT (email) DO UPDATE SET activo = true;

-- 5. VERIFICAR POLÍTICAS ACTUALES
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
WHERE tablename IN ('productos', 'historial_stock', 'alertas_inventario')
ORDER BY tablename, policyname;

-- 6. OPCIÓN ALTERNATIVA: DESHABILITAR RLS TEMPORALMENTE (NO RECOMENDADO EN PRODUCCIÓN)
-- Solo usar si las políticas no funcionan y necesitas una solución rápida
-- ALTER TABLE historial_stock DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE alertas_inventario DISABLE ROW LEVEL SECURITY;

COMMENT ON FUNCTION registrar_historial_stock() IS 'Función con SECURITY DEFINER para permitir inserciones desde triggers';
COMMENT ON FUNCTION verificar_stock_bajo() IS 'Función con SECURITY DEFINER para permitir inserciones desde triggers';
