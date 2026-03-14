# ❓ Preguntas Frecuentes: Sistema de Carrito y Pedidos

## 🛒 Carrito de Compras

### ¿Dónde está el botón del carrito?

**Para usuarios autenticados (Dashboard):**
- Hay un botón flotante en la esquina inferior derecha
- Solo aparece cuando hay productos en el carrito
- Tiene un badge rojo con la cantidad de productos

**Para usuarios NO autenticados (Productos):**
- Hay un ícono de carrito en el header
- Click en ese ícono abre el carrito

### ¿Por qué no veo el botón flotante del carrito?

**Posibles razones:**
1. No hay productos en el carrito (el botón solo aparece con productos)
2. Estás en la página de Productos (no Dashboard)
3. Error de CSS - revisar consola del navegador

**Solución:**
- Agregar al menos un producto al carrito
- Verificar que estás en `/dashboard`
- Revisar que `floating-cart-btn` esté en dashboard.css

### ¿El carrito se guarda si cierro el navegador?

**Sí**, el carrito se guarda en localStorage y persiste entre sesiones.

**Ubicación:**
- Key: `cart`
- Formato: JSON array de productos

**Nota:** Si limpias el caché del navegador, el carrito se borrará.

### ¿Puedo tener diferentes carritos en diferentes dispositivos?

**No**, el carrito se guarda localmente en cada dispositivo.

**Ejemplo:**
- Carrito en PC: 3 productos
- Carrito en móvil: 5 productos (diferentes)

**Futuro:** Se puede implementar sincronización en la nube.

---

## 💰 Precios

### ¿Por qué no veo precios en algunos productos?

**Depende de si estás autenticado:**

**Usuario autenticado (Dashboard):**
- ✅ Ve precios al mayor y al detal
- ✅ Puede seleccionar tipo de precio
- ✅ Precio se guarda en el carrito

**Usuario NO autenticado (Productos):**
- ❌ NO ve precios
- ❌ Solo ve "Solicitar cotización"
- ❌ Debe llenar formulario para recibir cotización

### ¿Cómo cambio entre precio al mayor y al detal?

**En Dashboard:**
1. Buscar los botones "Al Mayor" / "Al Detal"
2. Click en el tipo de precio deseado
3. El botón activo se resalta en azul
4. Todos los productos mostrarán ese precio
5. Al agregar al carrito, se guarda el precio seleccionado

### ¿Puedo mezclar productos con precio al mayor y al detal?

**Sí**, cada producto en el carrito guarda su precio seleccionado.

**Ejemplo:**
- Producto A: $100 (al mayor)
- Producto B: $50 (al detal)
- Total: $150

---

## 📦 Pedidos

### ¿Cómo hago un pedido?

**Proceso completo:**

1. **Agregar productos al carrito**
   - Buscar productos
   - Click "Agregar al Carrito"

2. **Abrir carrito**
   - Click en botón flotante (Dashboard)
   - O click en ícono de carrito (Productos)

3. **Revisar productos**
   - Verificar cantidades
   - Eliminar productos no deseados

4. **Solicitar cotización**
   - Click "Solicitar Cotización"
   - Llenar formulario (nombre, email, teléfono)
   - Click "Confirmar Pedido"

5. **Confirmación**
   - Pedido se guarda en base de datos
   - Se abre WhatsApp con mensaje
   - Carrito se limpia automáticamente

### ¿Dónde veo mis pedidos?

**Para usuarios autenticados:**
1. Ir a sidebar (menú lateral)
2. Click en "Mis Pedidos"
3. Ver lista de todos tus pedidos

**Para usuarios NO autenticados:**
- No hay historial de pedidos
- Debes guardar el número de pedido del WhatsApp

### ¿Qué es el número de pedido?

**Formato:** `PED-YYYYMMDD-XXXX`

**Ejemplo:** `PED-20260313-1234`

**Componentes:**
- `PED`: Prefijo de pedido
- `20260313`: Fecha (2026-03-13)
- `1234`: Número aleatorio único

**Uso:**
- Identificar tu pedido
- Hacer seguimiento
- Consultar con soporte

### ¿Puedo cancelar un pedido?

**Actualmente:** No hay opción de cancelación desde la web.

**Para cancelar:**
1. Contactar por WhatsApp
2. Proporcionar número de pedido
3. Solicitar cancelación

**Futuro:** Se puede agregar botón de cancelación para pedidos pendientes.

### ¿Cuánto tarda en procesarse mi pedido?

**Estados del pedido:**
1. **Pendiente** (0-24 horas) - Esperando revisión
2. **Aprobado** (1-2 días) - Confirmado por admin
3. **Procesando** (2-3 días) - Preparando productos
4. **Enviado** (3-7 días) - En camino
5. **Entregado** - Completado

**Nota:** Los tiempos son estimados y pueden variar.

---

## 🚨 Errores Comunes

### Error 401: "new row violates row-level security policy"

**Causa:** Políticas RLS bloqueando inserción en tabla `pedidos`.

**Solución:**
```sql
-- Ejecutar en Supabase SQL Editor
ALTER TABLE pedidos DISABLE ROW LEVEL SECURITY;
ALTER TABLE pedido_items DISABLE ROW LEVEL SECURITY;
ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;
```

**Ubicación del script:** `docs/admin/SOLUCION-TEMPORAL-RLS.sql`

### Error: "Auth session missing"

**Causa:** Usuario no autenticado intentando acceder a Dashboard.

**Solución:**
1. Ir a `/login`
2. Iniciar sesión
3. Volver a intentar

### El carrito no se abre

**Posibles causas:**
1. Error de JavaScript en consola
2. CartProvider no está en App.jsx
3. Conflicto de estilos CSS

**Solución:**
1. Abrir consola del navegador (F12)
2. Buscar errores en rojo
3. Verificar que App.jsx tenga:
   ```jsx
   <CartProvider>
     <Router>...</Router>
   </CartProvider>
   ```

### Los productos no se agregan al carrito

**Verificar:**
1. ¿Hay errores en consola?
2. ¿CartContext está funcionando?
3. ¿localStorage está habilitado?

**Solución:**
```javascript
// Probar en consola del navegador
localStorage.setItem('test', 'value');
console.log(localStorage.getItem('test'));
// Si da error, localStorage está bloqueado
```

### El pedido no aparece en Admin

**Posibles causas:**
1. Pedido no se guardó en BD (error 401)
2. Admin no está cargando pedidos correctamente
3. Filtro de estado activo

**Solución:**
1. Verificar en Supabase que el pedido existe:
   ```sql
   SELECT * FROM pedidos ORDER BY fecha_pedido DESC LIMIT 10;
   ```
2. Revisar filtros en Admin
3. Recargar página de Admin

### WhatsApp no se abre

**Posibles causas:**
1. Número de WhatsApp incorrecto
2. Bloqueador de pop-ups activo
3. Error en formato del mensaje

**Solución:**
1. Verificar `src/config/whatsapp.js`:
   ```javascript
   export const WHATSAPP_CONFIG = {
     numero: '584121234567', // Formato correcto
   };
   ```
2. Permitir pop-ups en el navegador
3. Revisar consola para errores

---

## 🔧 Configuración

### ¿Cómo cambio el número de WhatsApp?

**Archivo:** `src/config/whatsapp.js`

```javascript
export const WHATSAPP_CONFIG = {
  numero: '584121234567', // Cambiar aquí
  mensaje_default: 'Hola, me gustaría hacer una consulta'
};
```

**Formato del número:**
- Código de país (58 para Venezuela)
- Código de área (412, 414, etc.)
- Número (1234567)
- **SIN** espacios, guiones o paréntesis

### ¿Cómo personalizo el mensaje de WhatsApp?

**Archivo:** `src/components/ModalCotizacion.jsx`

**Buscar la función que construye el mensaje:**
```javascript
let mensaje = `*SOLICITUD DE COTIZACIÓN*\n`;
mensaje += `📋 *Pedido:* ${resultado.numeroPedido}\n\n`;
// ... personalizar aquí
```

### ¿Cómo cambio los estados de pedido?

**Archivo:** `src/pages/Admin.jsx` o `src/components/admin/PedidosView.jsx`

**Estados actuales:**
- pendiente
- aprobado
- procesando
- enviado
- entregado
- cancelado

**Para agregar nuevo estado:**
1. Agregar en el select de filtros
2. Agregar color en `getStatusInfo()`
3. Actualizar base de datos si es necesario

---

## 📱 Responsive y Móvil

### ¿Funciona en móvil?

**Sí**, el sistema es completamente responsive.

**Características móviles:**
- Botón flotante más pequeño (56x56px)
- Carrito ocupa 100% del ancho
- Grid de productos en 1 columna
- Touch-friendly (botones grandes)

### ¿Puedo usar en tablet?

**Sí**, se adapta automáticamente.

**Breakpoints:**
- Desktop: > 768px
- Tablet: 768px - 1024px
- Mobile: < 768px

---

## 🎨 Personalización

### ¿Cómo cambio los colores?

**Colores principales:**
- Azul oscuro: `#1a237e`
- Azul claro: `#00bcd4`
- Rosa: `#e91e63`

**Ubicación:**
- `src/css/dashboard.css`
- `src/css/carrito.css`

**Ejemplo:**
```css
.floating-cart-btn {
  background: linear-gradient(135deg, #1a237e 0%, #00bcd4 100%);
  /* Cambiar colores aquí */
}
```

### ¿Cómo cambio las animaciones?

**Animaciones actuales:**
- Pulso del botón flotante
- Deslizamiento del carrito
- Fade in de notificaciones

**Ubicación:** `src/css/dashboard.css`

**Para deshabilitar:**
```css
.floating-cart-btn {
  animation: none; /* Quitar animación */
}
```

---

## 🔐 Seguridad

### ¿Es seguro deshabilitar RLS?

**No**, es una solución temporal para desarrollo.

**Riesgos:**
- Cualquier usuario puede ver todos los pedidos
- Cualquier usuario puede modificar pedidos
- No hay control de acceso

**Recomendación:**
- Usar solo en desarrollo
- Implementar políticas RLS correctas en producción

### ¿Cómo implemento RLS correctamente?

**Ejemplo de políticas:**

```sql
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

### ¿Los datos del formulario son seguros?

**Sí**, los datos se envían directamente a Supabase (HTTPS).

**Datos guardados:**
- Nombre completo
- Email
- Teléfono
- Mensaje (opcional)

**No se guarda:**
- Contraseñas
- Datos de pago
- Información sensible

---

## 📊 Reportes y Análisis

### ¿Puedo exportar pedidos?

**Actualmente:** No hay función de exportación.

**Alternativa:**
1. Ir a Supabase Dashboard
2. Table Editor → pedidos
3. Exportar a CSV

**Futuro:** Se puede agregar botón de exportación en Admin.

### ¿Cómo veo estadísticas?

**En Admin:**
- Total de pedidos
- Pedidos por estado
- Ingresos del mes
- Productos más vendidos

**Ubicación:** `src/components/admin/StatsCards.jsx`

---

## 🆘 Soporte

### ¿Dónde encuentro más ayuda?

**Documentación:**
- `docs/INSTRUCCIONES-PROBAR-CARRITO.md` - Guía de pruebas
- `docs/RESUMEN-CARRITO-IMPLEMENTADO.md` - Resumen técnico
- `docs/DIAGRAMA-FLUJO-CARRITO.md` - Diagramas de flujo
- `docs/SOLUCION-RAPIDA-PEDIDOS.md` - Solución error 401

**Archivos clave:**
- `src/pages/Dashboard.jsx`
- `src/components/Carrito.jsx`
- `src/components/ModalCotizacion.jsx`
- `src/context/CartContext.jsx`

### ¿Cómo reporto un bug?

**Información a incluir:**
1. Descripción del problema
2. Pasos para reproducir
3. Mensajes de error (consola)
4. Navegador y versión
5. Screenshots si es posible

---

**Última actualización:** Marzo 13, 2026  
**Versión:** 1.0
