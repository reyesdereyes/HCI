-- ============================================
-- APLICAR SECURITY DEFINER A LAS FUNCIONES
-- ============================================
-- Ejecuta este script DESPUÉS de ADMIN-TABLES-SETUP.sql
-- o si ya tienes las tablas creadas y necesitas arreglar el error 403

-- 1. RECREAR FUNCIÓN DE HISTORIAL CON SECURITY DEFINER
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

-- 2. RECREAR FUNCIÓN DE ALERTAS CON SECURITY DEFINER
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

-- 3. AGREGAR POLÍTICA PARA INSERCIÓN EN HISTORIAL
DROP POLICY IF EXISTS "Admin puede insertar historial" ON historial_stock;

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

-- 4. VERIFICAR QUE FUNCIONA
-- Intenta actualizar un producto para probar
-- UPDATE productos SET stock = stock WHERE id = 1;

SELECT 'Funciones actualizadas correctamente con SECURITY DEFINER' as resultado;
