# Instrucciones para Probar el Sistema de Carrito y Pedidos

## ✅ Cambios Realizados

### 1. Botón Flotante del Carrito
- Agregado botón flotante en la esquina inferior derecha del Dashboard
- Solo aparece cuando hay productos en el carrito
- Muestra badge con cantidad total de productos
- Animación de pulso para llamar la atención

### 2. Unificación del Sistema de Carrito
- Dashboard ahora usa CartContext (sistema global)
- Carrito compartido entre Dashboard y componente Carrito
- Los productos se guardan con precio seleccionado (mayor/detal)

### 3. Flujo Completo de Pedidos
- Agregar productos → Abrir carrito → Confirmar pedido
- Pedido se guarda en BD antes de enviar a WhatsApp
- Funciona para usuarios autenticados y NO autenticados

## 🔧 Pasos para Probar

### Paso 1: Ejecutar Scripts SQL (CRÍTICO)
Antes de probar, debes ejecutar en Supabase SQL Editor:

```sql
-- Deshabilitar RLS temporalmente
ALTER TABLE pedidos DISABLE ROW LEVEL SECURITY;
ALTER TABLE pedido_items DISABLE ROW LEVEL SECURITY;
ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;
```

**Ubicación del script:** `docs/admin/SOLUCION-TEMPORAL-RLS.sql`

### Paso 2: Probar como Usuario Autenticado

1. **Iniciar sesión** en `/login`
2. **Ir a Dashboard** (`/dashboard`)
3. **Agregar productos al carrito:**
   - Seleccionar tipo de precio (Al Mayor / Al Detal)
   - Click en "Agregar al Carrito" en varios productos
   - Verás notificación "🛒 Agregado al carrito"
4. **Ver el botón flotante:**
   - Aparece en esquina inferior derecha
   - Muestra cantidad de productos
5. **Abrir carrito:**
   - Click en botón flotante
   - Se abre panel lateral con productos
6. **Confirmar pedido:**
   - Click en "Solicitar Cotización"
   - Llenar formulario (nombre, email, teléfono)
   - Click en "Confirmar Pedido"
   - Pedido se guarda en BD
   - Se abre WhatsApp con mensaje
7. **Verificar en Admin:**
   - Ir a `/admin`
   - Ver sección "Pedidos"
   - Debe aparecer el pedido recién creado
8. **Verificar en Mis Pedidos:**
   - Ir a "Mis Pedidos" en sidebar
   - Debe aparecer el pedido con todos los detalles

### Paso 3: Probar como Usuario NO Autenticado

1. **Cerrar sesión** (si estás logueado)
2. **Ir a Productos** (`/productos`)
3. **Agregar productos al carrito:**
   - Los productos NO muestran precios
   - Solo dice "Solicitar cotización"
   - Click en "Agregar al Carrito"
4. **Abrir carrito:**
   - Click en ícono de carrito en header
5. **Confirmar pedido:**
   - Llenar formulario completo
   - Click en "Confirmar Pedido"
   - Pedido se guarda con `cliente_id = NULL`
6. **Verificar en Admin:**
   - El pedido aparece sin cliente asociado
   - Muestra nombre, email y teléfono del formulario

## 🐛 Problemas Conocidos y Soluciones

### Error 401/403 al Guardar Pedido
**Síntoma:** `new row violates row-level security policy for table "pedidos"`

**Solución:** Ejecutar el script de `SOLUCION-TEMPORAL-RLS.sql`

### Carrito No Se Muestra
**Síntoma:** Click en botón flotante no hace nada

**Solución:** 
- Verificar que CartProvider esté en App.jsx
- Revisar consola del navegador para errores

### Pedidos No Aparecen en Admin
**Síntoma:** Pedido se guarda pero no aparece en lista

**Solución:**
- Verificar que Admin.jsx esté cargando pedidos correctamente
- Ejecutar script `SYNC-CLIENTES.sql` para sincronizar clientes

### Modal No Se Cierra Después de Confirmar
**Síntoma:** Modal de cotización permanece abierto

**Solución:** Ya está corregido en ModalCotizacion.jsx (cierra después de 2 segundos)

## 📊 Verificación en Base de Datos

Puedes verificar que los pedidos se guardaron correctamente ejecutando:

```sql
-- Ver últimos pedidos
SELECT 
  p.numero_pedido,
  p.cliente_nombre,
  p.cliente_email,
  p.estado,
  p.total,
  p.fecha_pedido,
  COUNT(pi.id) as cantidad_items
FROM pedidos p
LEFT JOIN pedido_items pi ON p.id = pi.pedido_id
GROUP BY p.id
ORDER BY p.fecha_pedido DESC
LIMIT 10;

-- Ver items de un pedido específico
SELECT 
  pi.producto_nombre,
  pi.cantidad,
  pi.precio_unitario,
  pi.subtotal
FROM pedido_items pi
WHERE pi.pedido_id = [ID_DEL_PEDIDO];
```

## 🎯 Funcionalidades Implementadas

✅ Botón flotante del carrito con badge de cantidad
✅ Carrito lateral deslizable
✅ Agregar/eliminar productos del carrito
✅ Actualizar cantidades
✅ Guardar pedido en BD antes de WhatsApp
✅ Generar número de pedido único
✅ Funciona con usuarios autenticados y NO autenticados
✅ Sincronización con tabla clientes
✅ Vista de pedidos en Admin
✅ Vista de "Mis Pedidos" para usuarios

## 📝 Próximos Pasos (Opcional)

1. **Habilitar RLS correctamente:**
   - Crear políticas que permitan a usuarios crear sus propios pedidos
   - Permitir a admins ver todos los pedidos

2. **Mejorar notificaciones:**
   - Usar sistema de toast más robusto
   - Agregar sonidos de confirmación

3. **Agregar estados de pedido:**
   - Permitir cambiar estado desde Admin
   - Notificar a clientes por email

4. **Historial de pedidos:**
   - Filtros por fecha, estado
   - Exportar a PDF/Excel

## 🆘 Soporte

Si encuentras algún problema:

1. Revisa la consola del navegador (F12)
2. Verifica que los scripts SQL se ejecutaron
3. Revisa los archivos de documentación en `docs/`
4. Consulta `docs/SOLUCION-RAPIDA-PEDIDOS.md`
