# Solución Error 403 al Actualizar Productos

## Problema

Al intentar editar un producto en el admin, aparece el error:
```
Error 403: new row violates row-level security policy for table "historial_stock"
```

## Causa

El trigger automático que registra cambios en el stock intenta insertar en la tabla `historial_stock`, pero las políticas RLS (Row Level Security) no permiten la inserción.

## Solución Rápida

Ejecuta este script en Supabase SQL Editor:

```sql
-- 1. Modificar función para usar SECURITY DEFINER
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

-- 2. Modificar función de alertas
CREATE OR REPLACE FUNCTION verificar_stock_bajo()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.stock <= 10 AND NEW.stock > 0 THEN
        INSERT INTO alertas_inventario (producto_id, tipo, mensaje)
        VALUES (
            NEW.id,
            'stock_bajo',
            'El producto "' || NEW.nombre || '" tiene stock bajo (' || NEW.stock || ' unidades)'
        )
        ON CONFLICT DO NOTHING;
    END IF;
    
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

-- 3. Agregar política para inserción en historial_stock
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

-- 4. Verificar que tu email está en administradores
SELECT * FROM administradores WHERE email = auth.email();
```

## ¿Qué hace SECURITY DEFINER?

`SECURITY DEFINER` hace que la función se ejecute con los permisos del usuario que la creó (generalmente el superusuario), no con los permisos del usuario que la invoca. Esto permite que los triggers funcionen correctamente sin violar las políticas RLS.

## Verificar que Funciona

1. Ejecuta el script anterior en Supabase SQL Editor
2. Recarga la página del admin
3. Intenta editar un producto
4. El error 403 debería desaparecer

## Solución Alternativa (No Recomendada)

Si el problema persiste, puedes deshabilitar temporalmente RLS en estas tablas:

```sql
ALTER TABLE historial_stock DISABLE ROW LEVEL SECURITY;
ALTER TABLE alertas_inventario DISABLE ROW LEVEL SECURITY;
```

⚠️ **ADVERTENCIA**: Esto elimina la seguridad de estas tablas. Solo usar en desarrollo.

## Script Completo

Para una solución completa con todas las políticas corregidas, ejecuta:
```
docs/admin/FIX-RLS-POLICIES.sql
```
