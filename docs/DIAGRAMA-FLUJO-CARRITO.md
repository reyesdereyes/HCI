# 🔄 Diagrama de Flujo: Sistema de Carrito y Pedidos

## 📊 Arquitectura del Sistema

```
┌─────────────────────────────────────────────────────────────┐
│                    HITACH COOL IMPORT                        │
│                   E-Commerce Platform                        │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
        ┌─────────────────────────────────────┐
        │      ¿Usuario Autenticado?          │
        └─────────────────────────────────────┘
                 │                    │
          SÍ     │                    │    NO
                 ▼                    ▼
    ┌──────────────────┐    ┌──────────────────┐
    │   DASHBOARD      │    │   PRODUCTOS      │
    │  (Con precios)   │    │  (Sin precios)   │
    └──────────────────┘    └──────────────────┘
                 │                    │
                 └────────┬───────────┘
                          ▼
              ┌─────────────────────┐
              │   CART CONTEXT      │
              │  (Estado Global)    │
              └─────────────────────┘
                          │
                          ▼
              ┌─────────────────────┐
              │   CARRITO.JSX       │
              │  (Panel Lateral)    │
              └─────────────────────┘
                          │
                          ▼
              ┌─────────────────────┐
              │ MODAL COTIZACIÓN    │
              │   (Formulario)      │
              └─────────────────────┘
                          │
                          ▼
              ┌─────────────────────┐
              │   SUPABASE DB       │
              │  (Guardar Pedido)   │
              └─────────────────────┘
                          │
                          ▼
              ┌─────────────────────┐
              │    WHATSAPP         │
              │  (Enviar Mensaje)   │
              └─────────────────────┘
```

---

## 🛒 Flujo Detallado: Usuario Autenticado

```
┌─────────────────────────────────────────────────────────────┐
│ PASO 1: LOGIN                                                │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Usuario ingresa email y contraseña
                          │
                          ▼
        Supabase Auth valida credenciales
                          │
                          ▼
        Redirige a /dashboard
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 2: VER PRODUCTOS                                        │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Dashboard.jsx carga productos
                          │
                          ▼
        Muestra productos CON precios
        - Precio al Mayor: $XX.XX
        - Precio al Detal: $XX.XX
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 3: AGREGAR AL CARRITO                                   │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Usuario selecciona tipo de precio
        (Al Mayor / Al Detal)
                          │
                          ▼
        Click en "Agregar al Carrito"
                          │
                          ▼
        addToCart(product) → CartContext
                          │
                          ▼
        Producto se guarda con:
        - id
        - nombre
        - imagen
        - quantity: 1
        - selectedPrice: XX.XX
        - priceType: 'mayor' o 'detal'
                          │
                          ▼
        localStorage.setItem('cart', JSON.stringify(cart))
                          │
                          ▼
        Notificación: "🛒 Agregado al carrito"
                          │
                          ▼
        Badge del botón flotante se actualiza
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 4: ABRIR CARRITO                                        │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Click en botón flotante (esquina inferior derecha)
                          │
                          ▼
        setShowCart(true)
                          │
                          ▼
        Carrito.jsx se renderiza
                          │
                          ▼
        Panel lateral desliza desde la derecha
                          │
                          ▼
        Muestra lista de productos:
        - Imagen
        - Nombre
        - Precio seleccionado
        - Controles de cantidad (+/-)
        - Botón eliminar
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 5: CONFIRMAR PEDIDO                                     │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Click en "Solicitar Cotización"
                          │
                          ▼
        setShowModalCotizacion(true)
                          │
                          ▼
        ModalCotizacion.jsx se renderiza
                          │
                          ▼
        Muestra formulario:
        - Nombre Completo *
        - Email *
        - Teléfono *
        - Mensaje (opcional)
                          │
                          ▼
        Usuario llena formulario
                          │
                          ▼
        Click en "Confirmar Pedido"
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 6: GUARDAR EN BASE DE DATOS                             │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        guardarPedidoEnBD()
                          │
                          ▼
        1. Obtener usuario actual
           const { data: { user } } = await supabase.auth.getUser()
                          │
                          ▼
        2. Generar número de pedido
           PED-20260313-1234
                          │
                          ▼
        3. Calcular totales
           subtotal = Σ(precio × cantidad)
           total = subtotal
                          │
                          ▼
        4. Insertar en tabla 'pedidos'
           {
             numero_pedido: 'PED-20260313-1234',
             cliente_id: user.id,
             cliente_nombre: formData.nombre,
             cliente_email: formData.email,
             cliente_telefono: formData.telefono,
             subtotal: XX.XX,
             total: XX.XX,
             estado: 'pendiente',
             tipo_cliente: 'detal',
             notas: formData.mensaje
           }
                          │
                          ▼
        5. Insertar en tabla 'pedido_items'
           Para cada producto en cart:
           {
             pedido_id: pedido.id,
             producto_id: item.id,
             producto_nombre: item.nombre,
             producto_codigo: item.codigo,
             cantidad: item.quantity,
             precio_unitario: item.selectedPrice,
             subtotal: item.selectedPrice × item.quantity
           }
                          │
                          ▼
        6. Actualizar tabla 'clientes'
           upsert({
             id: user.id,
             nombre_completo: formData.nombre,
             telefono: formData.telefono,
             tipo_cliente: 'detal',
             activo: true
           })
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 7: ENVIAR A WHATSAPP                                    │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Construir mensaje:
        
        *SOLICITUD DE COTIZACIÓN*
        📋 *Pedido:* PED-20260313-1234
        
        👤 *Nombre:* Juan Pérez
        📧 *Email:* juan@example.com
        📱 *Teléfono:* 0412-1234567
        
        🛒 *PRODUCTOS SOLICITADOS (3):*
        
        1. *Aire Acondicionado 12000 BTU*
           Cantidad: 2
           Código: AC-12000
        
        2. *Ventilador de Techo*
           Cantidad: 1
           Código: VT-001
        
        ✅ _Pedido registrado en el sistema_
        _Enviado desde Hitach Cool Import_
                          │
                          ▼
        abrirWhatsApp(numero, mensaje)
                          │
                          ▼
        window.open(`https://wa.me/${numero}?text=${encodeURIComponent(mensaje)}`)
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 8: LIMPIAR Y CERRAR                                     │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Mostrar notificación de éxito
        "✅ Pedido guardado exitosamente!"
                          │
                          ▼
        Esperar 2 segundos
                          │
                          ▼
        clearCart() → CartContext
                          │
                          ▼
        localStorage.removeItem('cart')
                          │
                          ▼
        onClose() → Cerrar modal y carrito
                          │
                          ▼
        Usuario es redirigido a WhatsApp
```

---

## 🚫 Flujo: Usuario NO Autenticado

```
┌─────────────────────────────────────────────────────────────┐
│ PASO 1: ACCESO DIRECTO                                       │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Usuario va a /productos (sin login)
                          │
                          ▼
        Productos.jsx carga productos
                          │
                          ▼
        Muestra productos SIN precios
        - Solo dice "Solicitar cotización"
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 2: AGREGAR AL CARRITO                                   │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Click en "Agregar al Carrito"
                          │
                          ▼
        addToCart(product) → CartContext
                          │
                          ▼
        Producto se guarda SIN precio
        {
          id,
          nombre,
          imagen,
          quantity: 1
        }
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ PASO 3-8: IGUAL QUE USUARIO AUTENTICADO                      │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        DIFERENCIA: En BD se guarda con cliente_id = NULL
```

---

## 🔐 Flujo: Administrador

```
┌─────────────────────────────────────────────────────────────┐
│ ADMIN: VER PEDIDOS                                           │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
        Login como admin → /admin
                          │
                          ▼
        Admin.jsx carga pedidos
                          │
                          ▼
        SELECT * FROM pedidos
        LEFT JOIN pedido_items
        ORDER BY fecha_pedido DESC
                          │
                          ▼
        Muestra lista de pedidos:
        - Número de pedido
        - Cliente (nombre o "Invitado")
        - Fecha
        - Estado
        - Total
        - Cantidad de items
                          │
                          ▼
        Admin puede:
        - Ver detalles
        - Cambiar estado
        - Filtrar por estado
        - Buscar por número
```

---

## 📱 Componentes y Responsabilidades

```
┌─────────────────────────────────────────────────────────────┐
│ CartContext.jsx                                              │
│ - Estado global del carrito                                  │
│ - Funciones: add, remove, update, clear                      │
│ - Persistencia en localStorage                               │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ Dashboard.jsx                                                │
│ - Muestra productos CON precios                              │
│ - Botón flotante del carrito                                 │
│ - Integración con CartContext                                │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ Productos.jsx                                                │
│ - Muestra productos SIN precios                              │
│ - Para usuarios NO autenticados                              │
│ - Integración con CartContext                                │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ Carrito.jsx                                                  │
│ - Panel lateral deslizable                                   │
│ - Lista de productos                                         │
│ - Controles de cantidad                                      │
│ - Botón "Solicitar Cotización"                               │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ ModalCotizacion.jsx                                          │
│ - Formulario de datos del cliente                            │
│ - Guardar pedido en BD                                       │
│ - Enviar a WhatsApp                                          │
│ - Limpiar carrito                                            │
└─────────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────┐
│ UserOrders.jsx                                               │
│ - Muestra pedidos del usuario                                │
│ - Carga desde BD                                             │
│ - Filtros y búsqueda                                         │
└─────────────────────────────────────────────────────────────┘
```

---

## 💾 Estructura de Datos

### localStorage

```javascript
// Carrito (global)
cart: [
  {
    id: 123,
    nombre: "Producto A",
    imagen: "url",
    quantity: 2,
    selectedPrice: 100.00,
    priceType: "mayor"
  },
  // ...
]

// Favoritos (por usuario)
favorites_[user_id]: [123, 456, 789]
```

### Supabase

```sql
-- Tabla: pedidos
{
  id: uuid,
  numero_pedido: "PED-20260313-1234",
  cliente_id: uuid | null,
  cliente_nombre: "Juan Pérez",
  cliente_email: "juan@example.com",
  cliente_telefono: "0412-1234567",
  subtotal: 300.00,
  total: 300.00,
  estado: "pendiente",
  tipo_cliente: "detal",
  notas: "Mensaje adicional",
  fecha_pedido: "2026-03-13T10:30:00Z"
}

-- Tabla: pedido_items
{
  id: uuid,
  pedido_id: uuid,
  producto_id: 123,
  producto_nombre: "Producto A",
  producto_codigo: "PROD-A",
  cantidad: 2,
  precio_unitario: 100.00,
  subtotal: 200.00
}

-- Tabla: clientes
{
  id: uuid,
  nombre_completo: "Juan Pérez",
  telefono: "0412-1234567",
  tipo_cliente: "detal",
  activo: true,
  fecha_registro: "2026-03-13T10:30:00Z"
}
```

---

## 🎯 Estados del Pedido

```
┌──────────────┐
│  PENDIENTE   │ ← Estado inicial al crear pedido
└──────────────┘
       │
       ▼
┌──────────────┐
│  APROBADO    │ ← Admin revisa y aprueba
└──────────────┘
       │
       ▼
┌──────────────┐
│  PROCESANDO  │ ← Se está preparando el pedido
└──────────────┘
       │
       ▼
┌──────────────┐
│   ENVIADO    │ ← Pedido en camino
└──────────────┘
       │
       ▼
┌──────────────┐
│  ENTREGADO   │ ← Pedido completado
└──────────────┘

       O

┌──────────────┐
│  CANCELADO   │ ← Pedido cancelado en cualquier momento
└──────────────┘
```

---

## 🔒 Seguridad y Permisos

### RLS (Row Level Security)

```sql
-- TEMPORAL: Deshabilitado para desarrollo
ALTER TABLE pedidos DISABLE ROW LEVEL SECURITY;
ALTER TABLE pedido_items DISABLE ROW LEVEL SECURITY;
ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;

-- FUTURO: Políticas correctas
-- Usuarios pueden ver solo sus pedidos
CREATE POLICY "Users can view own orders"
ON pedidos FOR SELECT
USING (auth.uid() = cliente_id);

-- Usuarios pueden crear pedidos
CREATE POLICY "Users can create orders"
ON pedidos FOR INSERT
WITH CHECK (auth.uid() = cliente_id OR cliente_id IS NULL);

-- Admins pueden ver todos los pedidos
CREATE POLICY "Admins can view all orders"
ON pedidos FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM administradores
    WHERE email = auth.email()
  )
);
```

---

## 📊 Métricas y Análisis

### Dashboard de Admin

```
┌─────────────────────────────────────────────────────────────┐
│ ESTADÍSTICAS                                                 │
├─────────────────────────────────────────────────────────────┤
│ Total Pedidos:        150                                    │
│ Pedidos Pendientes:    25                                    │
│ Pedidos Completados:  100                                    │
│ Ingresos del Mes:  $15,000                                   │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ PEDIDOS RECIENTES                                            │
├─────────────────────────────────────────────────────────────┤
│ PED-20260313-1234  │ Juan Pérez    │ $300.00 │ Pendiente   │
│ PED-20260313-1235  │ María García  │ $450.00 │ Aprobado    │
│ PED-20260313-1236  │ Invitado      │ $200.00 │ Pendiente   │
└─────────────────────────────────────────────────────────────┘
```

---

**Creado por:** Kiro AI Assistant  
**Fecha:** Marzo 13, 2026  
**Versión:** 1.0
