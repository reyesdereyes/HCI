# Configurar Clientes y Pedidos en Admin

## Problema Actual

Los clientes y pedidos no aparecen en el panel de administración porque:

1. **Clientes**: La tabla `clientes` está vacía o no tiene registros para los usuarios existentes
2. **Pedidos**: La tabla `pedidos` no existe o está vacía

## Solución Paso a Paso

### 1. Crear las Tablas Necesarias

Si aún no lo has hecho, ejecuta el script principal en Supabase SQL Editor:

```sql
-- Ejecutar todo el contenido de:
docs/admin/ADMIN-TABLES-SETUP.sql
```

Este script crea:
- Tabla `pedidos`
- Tabla `pedido_items`
- Tabla `clientes`
- Tabla `promociones`
- Tabla `alertas_inventario`
- Tabla `historial_stock`
- Triggers y funciones automáticas
- Políticas de seguridad (RLS)

### 2. Sincronizar Clientes Existentes

Los usuarios que ya se registraron en tu aplicación existen en `auth.users` pero no tienen perfil en la tabla `clientes`. Para sincronizarlos:

**Opción A: Sincronizar todos los usuarios existentes**

```sql
-- Ejecutar en Supabase SQL Editor:
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
```

**Opción B: Crear trigger para nuevos usuarios**

```sql
-- Este trigger creará automáticamente un perfil de cliente
-- cuando un nuevo usuario se registre
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

DROP TRIGGER IF EXISTS trigger_crear_perfil_cliente ON auth.users;
CREATE TRIGGER trigger_crear_perfil_cliente
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION crear_perfil_cliente();
```

### 3. Verificar Clientes

Para ver los clientes sincronizados:

```sql
SELECT 
    c.*,
    au.email
FROM clientes c
INNER JOIN auth.users au ON au.id = c.id
ORDER BY c.fecha_registro DESC;
```

### 4. Crear Pedidos de Prueba (Opcional)

Si quieres ver cómo se ven los pedidos en el admin:

```sql
-- Insertar un pedido de ejemplo
INSERT INTO pedidos (
    numero_pedido, 
    cliente_id,
    cliente_nombre, 
    cliente_email, 
    cliente_telefono, 
    total, 
    estado
)
VALUES (
    'PED-20260313-0001',
    (SELECT id FROM auth.users LIMIT 1), -- Usar un usuario real
    'Cliente de Prueba',
    'cliente@example.com',
    '0414-1234567',
    1500.00,
    'pendiente'
);

-- Insertar items del pedido
INSERT INTO pedido_items (
    pedido_id,
    producto_id,
    producto_nombre,
    producto_codigo,
    cantidad,
    precio_unitario,
    subtotal
)
SELECT 
    (SELECT id FROM pedidos ORDER BY id DESC LIMIT 1),
    p.id,
    p.nombre,
    p.codigo,
    2,
    p.precio_detal,
    p.precio_detal * 2
FROM productos p
LIMIT 3;
```

### 5. Verificar Permisos RLS

Asegúrate de que tu usuario admin tiene los permisos correctos:

```sql
-- Verificar que tu email está en la tabla administradores
SELECT * FROM administradores WHERE email = 'tu-email@example.com';

-- Si no existe, agregarlo:
INSERT INTO administradores (email, nombre, activo)
VALUES ('tu-email@example.com', 'Tu Nombre', true);
```

## Características Implementadas

### Vista de Productos
- ✅ Muestra código del producto
- ✅ Búsqueda por nombre y código
- ✅ Carga optimizada (20 productos por página)
- ✅ Infinite scroll
- ✅ Vista en grid compacta

### Vista de Clientes
- ✅ Muestra todos los clientes de la tabla `clientes`
- ✅ Filtros por tipo (Detal/Mayor)
- ✅ Búsqueda por nombre, empresa, RIF
- ✅ Estadísticas de compras
- ✅ Vista en tarjetas

### Vista de Pedidos
- ✅ Muestra todos los pedidos con sus items
- ✅ Filtros por estado
- ✅ Búsqueda por número, cliente
- ✅ Acciones rápidas (aprobar, cancelar, etc.)
- ✅ Vista en tabla

## Próximos Pasos

1. Ejecutar `ADMIN-TABLES-SETUP.sql` si no lo has hecho
2. Ejecutar la sincronización de clientes (Opción A)
3. Crear el trigger para nuevos usuarios (Opción B)
4. Verificar que tu email está en `administradores`
5. Recargar el panel de admin

## Notas Importantes

- Los clientes solo aparecerán si tienen un registro en la tabla `clientes`
- Los pedidos solo aparecerán si existen en la tabla `pedidos`
- El trigger automático creará perfiles para nuevos usuarios
- Los usuarios existentes necesitan ser sincronizados manualmente
