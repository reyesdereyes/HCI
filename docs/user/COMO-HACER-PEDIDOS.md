# Cómo Hacer Pedidos - Guía Completa

## Para Usuarios (Clientes)

### 1. Agregar Productos al Carrito

1. Navega al Dashboard después de iniciar sesión
2. Busca los productos que deseas
3. Haz clic en "Agregar al Carrito" en cada producto
4. Selecciona la cantidad deseada

### 2. Ver tu Carrito

- El carrito se muestra en la parte superior derecha
- Haz clic en el ícono del carrito para ver los productos
- Puedes modificar cantidades o eliminar productos

### 3. Confirmar Pedido

1. Haz clic en "Solicitar Cotización" en el carrito
2. Completa tus datos:
   - Nombre completo
   - Email
   - Teléfono
   - Mensaje adicional (opcional)
3. Haz clic en "Confirmar Pedido"

### 4. ¿Qué Sucede al Confirmar?

Cuando confirmas un pedido:

1. **Se guarda en la base de datos** con estado "Pendiente"
2. **Se crea tu perfil de cliente** si es tu primer pedido
3. **Se abre WhatsApp** con el mensaje pre-formateado
4. **El admin recibe la notificación** en el panel de administración
5. **Tu carrito se limpia** automáticamente

### 5. Seguimiento del Pedido

- Los pedidos se guardan con un número único (ej: PED-20260313-0001)
- El admin puede ver y gestionar tu pedido
- Recibirás respuesta por WhatsApp con la cotización

## Para Administradores

### Ver Pedidos en Admin

1. Inicia sesión como administrador
2. Ve a la sección "Pedidos" en el panel admin
3. Verás todos los pedidos con:
   - Número de pedido
   - Cliente
   - Fecha
   - Estado
   - Total estimado

### Estados de Pedidos

- **Pendiente**: Recién creado, esperando revisión
- **Aprobado**: Cotización enviada y aceptada
- **Procesando**: Preparando el pedido
- **Enviado**: En camino al cliente
- **Entregado**: Completado
- **Cancelado**: Pedido cancelado

### Gestionar Pedidos

1. Haz clic en "Ver Detalles" para ver los productos
2. Usa los botones de acción para cambiar el estado:
   - ✓ Aprobar
   - ✗ Cancelar
   - 🕐 Procesar
   - 🚚 Marcar como enviado
   - 📦 Marcar como entregado

### Ver Clientes

Para que los clientes aparezcan en el admin:

1. Ejecuta el script `docs/admin/CREAR-CLIENTES-AUTO.sql` en Supabase
2. Esto sincronizará todos los usuarios registrados
3. Los nuevos usuarios se crearán automáticamente

## Configuración Inicial (Solo una vez)

### 1. Crear Tablas de Pedidos

Ejecuta en Supabase SQL Editor:
```sql
-- Contenido de docs/admin/ADMIN-TABLES-SETUP.sql
```

### 2. Sincronizar Clientes Existentes

Ejecuta en Supabase SQL Editor:
```sql
-- Contenido de docs/admin/CREAR-CLIENTES-AUTO.sql
```

### 3. Arreglar Permisos RLS

Si tienes error 403 al editar productos:
```sql
-- Contenido de docs/admin/APLICAR-SECURITY-DEFINER.sql
```

### 4. Verificar Configuración

```sql
-- Ver pedidos
SELECT * FROM pedidos ORDER BY fecha_pedido DESC LIMIT 10;

-- Ver clientes
SELECT c.*, au.email 
FROM clientes c 
INNER JOIN auth.users au ON au.id = c.id 
ORDER BY c.fecha_registro DESC;

-- Ver items de pedidos
SELECT pi.*, p.nombre as producto_nombre
FROM pedido_items pi
INNER JOIN productos p ON p.id = pi.producto_id
ORDER BY pi.created_at DESC LIMIT 20;
```

## Flujo Completo del Pedido

```
Usuario                          Sistema                         Admin
   |                                |                              |
   |--[1. Agrega productos]-------->|                              |
   |                                |                              |
   |--[2. Confirma pedido]--------->|                              |
   |                                |                              |
   |                                |--[3. Guarda en BD]---------->|
   |                                |                              |
   |                                |--[4. Crea perfil cliente]--->|
   |                                |                              |
   |<--[5. Abre WhatsApp]-----------|                              |
   |                                |                              |
   |                                |                              |
   |                                |      [6. Ve pedido en admin]<|
   |                                |                              |
   |                                |      [7. Cambia estado]----->|
   |                                |                              |
   |<--[8. Responde cotización]-----|<-----------------------------|
```

## Preguntas Frecuentes

**¿Se cobra al hacer el pedido?**
No, es una solicitud de cotización. El admin te enviará los precios finales.

**¿Puedo cancelar un pedido?**
Sí, contacta al admin por WhatsApp con el número de pedido.

**¿Cuánto tarda la respuesta?**
El admin responderá por WhatsApp lo antes posible con la cotización.

**¿Dónde veo mis pedidos anteriores?**
Próximamente habrá una sección de "Mis Pedidos" en el dashboard.

**¿Por qué no aparecen los clientes en admin?**
Debes ejecutar el script `CREAR-CLIENTES-AUTO.sql` para sincronizarlos.
