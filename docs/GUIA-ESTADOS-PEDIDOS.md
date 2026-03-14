# 📋 Guía Completa: Estados de Pedidos

## 🔄 Flujo de Estados

```
┌──────────────┐
│  PENDIENTE   │ ← Cliente crea pedido
└──────────────┘
       │
       │ Admin: Click ✓ (Aprobar)
       ▼
┌──────────────┐
│  APROBADO    │ ← Pedido confirmado
└──────────────┘
       │
       │ Admin: Click ⏱ (Procesar)
       ▼
┌──────────────┐
│  PROCESANDO  │ ← Preparando productos
└──────────────┘
       │
       │ Admin: Click 🚚 (Enviar)
       ▼
┌──────────────┐
│   ENVIADO    │ ← En camino al cliente
└──────────────┘
       │
       │ Admin: Click 📦 (Entregar)
       ▼
┌──────────────┐
│  ENTREGADO   │ ← Pedido completado ✅
└──────────────┘

       O

┌──────────────┐
│  CANCELADO   │ ← Admin: Click ✕ (Cancelar)
└──────────────┘
```

---

## 👨‍💼 Acciones del Admin

### 1. Pedido PENDIENTE
**Botones disponibles:**
- ✓ **Aprobar** → Cambia a "Aprobado"
- ✕ **Cancelar** → Cambia a "Cancelado"

**Cuándo usar:**
- Aprobar: Cuando confirmas que puedes cumplir el pedido
- Cancelar: Cuando no hay stock o hay problemas

### 2. Pedido APROBADO
**Botones disponibles:**
- ⏱ **Procesar** → Cambia a "Procesando"

**Cuándo usar:**
- Cuando empiezas a preparar los productos

### 3. Pedido PROCESANDO
**Botones disponibles:**
- 🚚 **Enviar** → Cambia a "Enviado"

**Cuándo usar:**
- Cuando el pedido sale para entrega

### 4. Pedido ENVIADO
**Botones disponibles:**
- 📦 **Entregar** → Cambia a "Entregado"

**Cuándo usar:**
- Cuando el cliente recibe el pedido

### 5. Pedido ENTREGADO
**Botones disponibles:**
- Ninguno (estado final)

**Nota:**
- Este es el estado final exitoso

### 6. Pedido CANCELADO
**Botones disponibles:**
- Ninguno (estado final)

**Nota:**
- Este es el estado final de cancelación

---

## 👤 Vista del Cliente

### Cómo ve el cliente los estados:

#### 🟡 PENDIENTE
```
┌─────────────────────────────────┐
│ 📋 PED-20260313-1234            │
│ ⏱ Pendiente                     │
│                                  │
│ Tu pedido está siendo revisado   │
└─────────────────────────────────┘
```

#### 🟢 APROBADO
```
┌─────────────────────────────────┐
│ 📋 PED-20260313-1234            │
│ ✅ Aprobado                     │
│                                  │
│ Tu pedido fue confirmado         │
└─────────────────────────────────┘
```

#### 🔵 PROCESANDO
```
┌─────────────────────────────────┐
│ 📋 PED-20260313-1234            │
│ ⏱ Procesando                    │
│                                  │
│ Estamos preparando tu pedido     │
└─────────────────────────────────┘
```

#### 🔷 ENVIADO
```
┌─────────────────────────────────┐
│ 📋 PED-20260313-1234            │
│ 🚚 Enviado                      │
│                                  │
│ Tu pedido está en camino         │
└─────────────────────────────────┘
```

#### ✅ ENTREGADO
```
┌─────────────────────────────────┐
│ 📋 PED-20260313-1234            │
│ ✅ Entregado                    │
│                                  │
│ Pedido completado exitosamente   │
└─────────────────────────────────┘
```

#### ❌ CANCELADO
```
┌─────────────────────────────────┐
│ 📋 PED-20260313-1234            │
│ ❌ Cancelado                    │
│                                  │
│ Este pedido fue cancelado        │
└─────────────────────────────────┘
```

---

## 🎯 Paso a Paso: Admin Gestiona Pedido

### Escenario: Cliente hace un pedido

**1. Cliente crea pedido**
- Va a Dashboard
- Agrega productos al carrito
- Confirma pedido
- Estado inicial: **PENDIENTE**

**2. Admin revisa pedido**
- Va a Admin → Pedidos
- Ve nuevo pedido con estado "Pendiente"
- Revisa productos y datos del cliente

**3. Admin aprueba pedido**
- Click en botón ✓ (Aprobar)
- Estado cambia a: **APROBADO**
- Cliente ve en "Mis Pedidos": "Aprobado"

**4. Admin procesa pedido**
- Click en botón ⏱ (Procesar)
- Estado cambia a: **PROCESANDO**
- Cliente ve: "Procesando"

**5. Admin envía pedido**
- Click en botón 🚚 (Enviar)
- Estado cambia a: **ENVIADO**
- Cliente ve: "Enviado"

**6. Admin marca como entregado**
- Click en botón 📦 (Entregar)
- Estado cambia a: **ENTREGADO**
- Cliente ve: "Entregado"

---

## 🔄 Cómo el Cliente Ve los Cambios

### Opción 1: Actualización Manual
1. Cliente va a "Mis Pedidos"
2. Click en botón "Actualizar"
3. Ve el estado actualizado

### Opción 2: Recargar Página
1. Cliente recarga la página (F5)
2. Los pedidos se cargan con estados actualizados

### Opción 3: Volver a entrar
1. Cliente sale y vuelve a entrar a "Mis Pedidos"
2. Los datos se cargan automáticamente

---

## 📊 Tabla de Referencia Rápida

| Estado | Color | Icono | Siguiente Acción | Botón Admin |
|--------|-------|-------|------------------|-------------|
| Pendiente | 🟡 Naranja | ⏱ | Aprobar o Cancelar | ✓ / ✕ |
| Aprobado | 🟢 Verde | ✅ | Procesar | ⏱ |
| Procesando | 🔵 Azul | ⏱ | Enviar | 🚚 |
| Enviado | 🔷 Cian | 🚚 | Entregar | 📦 |
| Entregado | ✅ Verde | ✅ | Ninguna (Final) | - |
| Cancelado | ❌ Rojo | ✕ | Ninguna (Final) | - |

---

## 💡 Consejos y Mejores Prácticas

### Para Admins:

1. **Revisar pedidos diariamente**
   - Ir a Admin → Pedidos
   - Filtrar por "Pendiente"
   - Aprobar o cancelar rápidamente

2. **Comunicar con el cliente**
   - Usar WhatsApp para notificar cambios importantes
   - Informar número de seguimiento al enviar

3. **Mantener actualizado**
   - Cambiar estado apenas ocurra el evento
   - No dejar pedidos en "Procesando" mucho tiempo

4. **Usar filtros**
   - Filtrar por estado para organizar trabajo
   - Ver solo "Pendientes" al inicio del día

### Para Clientes:

1. **Revisar "Mis Pedidos" regularmente**
   - Click en "Actualizar" para ver cambios
   - Verificar estado del pedido

2. **Contactar si hay demora**
   - Si pedido está en "Pendiente" más de 24h
   - Si pedido está en "Enviado" más de 7 días

3. **Guardar número de pedido**
   - Anotar número para seguimiento
   - Usar en comunicaciones con soporte

---

## 🔧 Configuración Técnica

### Base de Datos

**Tabla: pedidos**
```sql
estado VARCHAR CHECK (estado IN (
  'pendiente',
  'aprobado',
  'procesando',
  'enviado',
  'entregado',
  'cancelado'
))
```

### Función de Actualización

**En Admin.jsx:**
```javascript
const handleUpdateEstadoPedido = async (pedidoId, nuevoEstado) => {
  const { error } = await supabase
    .from('pedidos')
    .update({ 
      estado: nuevoEstado,
      fecha_actualizado: new Date().toISOString()
    })
    .eq('id', pedidoId);
  
  if (!error) {
    success('Estado actualizado correctamente');
    loadPedidos(); // Recargar lista
  }
};
```

### Vista del Cliente

**En UserOrders.jsx:**
```javascript
const loadOrders = async () => {
  const { data } = await supabase
    .from('pedidos')
    .select('*')
    .eq('cliente_id', user.id)
    .order('fecha_pedido', { ascending: false });
  
  setOrders(data || []);
};
```

---

## 🚨 Solución de Problemas

### Cliente no ve cambios de estado

**Problema:** Admin cambió estado pero cliente sigue viendo estado anterior

**Soluciones:**
1. Cliente debe hacer click en "Actualizar"
2. Cliente debe recargar página (F5)
3. Verificar que no haya error en consola del navegador

### Admin no puede cambiar estado

**Problema:** Click en botón no hace nada

**Soluciones:**
1. Verificar que RLS esté deshabilitado
2. Revisar consola del navegador (F12)
3. Verificar permisos en Supabase

### Estado no se guarda en BD

**Problema:** Estado cambia pero no persiste

**Soluciones:**
1. Ejecutar `EJECUTAR-AHORA.sql`
2. Verificar que tabla `pedidos` existe
3. Revisar políticas RLS

---

## 📱 Notificaciones (Futuro)

### Implementación Sugerida:

1. **Email automático al cambiar estado**
   - Usar Supabase Edge Functions
   - Enviar email con Resend o SendGrid

2. **Notificaciones push**
   - Usar Firebase Cloud Messaging
   - Notificar en tiempo real

3. **SMS**
   - Usar Twilio
   - Enviar SMS para estados importantes

---

**Última actualización:** Marzo 13, 2026  
**Versión:** 1.0
