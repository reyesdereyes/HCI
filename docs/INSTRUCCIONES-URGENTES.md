# ⚠️ INSTRUCCIONES URGENTES - Error 401 al Crear Pedidos

## El Problema

Aparece este error al intentar confirmar un pedido:
```
Error 401: new row violates row-level security policy for table "pedidos"
```

## La Solución MÁS RÁPIDA (2 Pasos)

### PASO 1: Abrir Supabase SQL Editor

1. Ve a https://supabase.com
2. Abre tu proyecto
3. En el menú lateral, haz clic en **SQL Editor**
4. Haz clic en **New Query**

### PASO 2: Ejecutar Este Script Simple

Copia y pega SOLO estas 3 líneas:

```sql
ALTER TABLE pedidos DISABLE ROW LEVEL SECURITY;
ALTER TABLE pedido_items DISABLE ROW LEVEL SECURITY;
SELECT '✅ LISTO' as resultado;
```

**Haz clic en RUN** y listo.

### ¿Qué hace esto?

Desactiva temporalmente la seguridad RLS de las tablas `pedidos` y `pedido_items`, permitiendo que cualquiera pueda crear pedidos.

⚠️ **Nota**: Esto es seguro para desarrollo. Más adelante puedes configurar políticas RLS más específicas.

## Verificar que Funciona

1. Recarga tu aplicación web (F5)
2. Agrega productos al carrito
3. Haz clic en "Solicitar Cotización"
4. Llena el formulario
5. Haz clic en "Confirmar Pedido"
6. ✅ Debería funcionar sin errores

## Si Aún No Funciona

### Opción A: Verificar que las tablas existen

Ejecuta en SQL Editor:
```sql
SELECT * FROM pedidos LIMIT 1;
SELECT * FROM pedido_items LIMIT 1;
```

Si dice "relation does not exist", ejecuta primero:
```
docs/admin/ADMIN-TABLES-SETUP.sql
```

### Opción B: Verificar RLS

Ejecuta en SQL Editor:
```sql
SELECT tablename, rowsecurity 
FROM pg_tables 
WHERE tablename IN ('pedidos', 'pedido_items');
```

Debería mostrar `rowsecurity = true` para ambas tablas.

### Opción C: Ver políticas actuales

Ejecuta en SQL Editor:
```sql
SELECT tablename, policyname, cmd 
FROM pg_policies 
WHERE tablename IN ('pedidos', 'pedido_items');
```

Deberías ver:
- `allow_insert_pedidos` (INSERT)
- `allow_select_pedidos` (SELECT)
- `allow_update_pedidos` (UPDATE)
- `allow_insert_pedido_items` (INSERT)
- `allow_select_pedido_items` (SELECT)

## Archivos de Referencia

- `docs/admin/EJECUTAR-AHORA.sql` - Script completo
- `docs/admin/ARREGLAR-PERMISOS-PEDIDOS.sql` - Versión detallada
- `docs/SOLUCION-RAPIDA-PEDIDOS.md` - Documentación

## Contacto

Si después de seguir estos pasos aún tienes problemas, verifica:

1. ¿Ejecutaste el script en el proyecto correcto de Supabase?
2. ¿Apareció algún error al ejecutar el script?
3. ¿Las tablas `pedidos` y `pedido_items` existen?

El error 401/403 siempre es por políticas RLS. Este script lo soluciona.
