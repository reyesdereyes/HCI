# Diferencia entre Usuarios Normales y Autenticados

## Tipos de Usuarios

### 1. Usuarios NO Autenticados (Visitantes)
**Acceso:** Página `/productos` (sin login)

**Pueden:**
- ✅ Ver todos los productos
- ✅ Buscar y filtrar por categorías
- ✅ Agregar productos al carrito
- ✅ Solicitar cotización por WhatsApp
- ❌ **NO pueden ver precios** (solo dice "Solicitar cotización")

**Flujo:**
1. Entran a la página de Productos
2. Ven productos sin precios
3. Agregan al carrito
4. Llenan formulario de cotización
5. Se guarda el pedido en BD
6. Se abre WhatsApp con la solicitud

### 2. Usuarios Autenticados (Con Login)
**Acceso:** Dashboard `/dashboard` (requiere login)

**Pueden:**
- ✅ Ver todos los productos
- ✅ **VER PRECIOS** (al mayor y al detal)
- ✅ Ver código de productos
- ✅ Agregar a favoritos
- ✅ Agregar al carrito
- ✅ Solicitar cotización
- ✅ Ver su perfil
- ✅ Ver sus pedidos (próximamente)

**Flujo:**
1. Inician sesión
2. Acceden al Dashboard
3. Ven productos CON precios
4. Agregan al carrito
5. Confirman pedido
6. Se guarda en BD con su usuario
7. Se abre WhatsApp

## Componentes Usados

### Card.jsx (Sin Precios)
Usado en: `/productos` (página pública)

```jsx
<Card product={product} />
```

Muestra:
- Imagen del producto
- Nombre
- Descripción
- "Solicitar cotización" (sin precios)
- Botón "Agregar para Cotizar"

### CardWithPrice.jsx (Con Precios)
Usado en: `/dashboard` (requiere login)

```jsx
<CardWithPrice 
  product={product}
  onAddToCart={handleAddToCart}
  onToggleFavorite={handleToggleFavorite}
  isFavorite={favorites.includes(product.id)}
/>
```

Muestra:
- Imagen del producto
- Nombre
- Código del producto
- Descripción
- **Precio al Mayor**
- **Precio al Detal**
- Botón de favoritos
- Botón "Agregar al Carrito"

## Configuración Actual

### Rutas Públicas (Sin Login)
- `/` - Inicio
- `/productos` - Catálogo sin precios
- `/equipo` - Sobre nosotros
- `/contacto` - Contacto
- `/login` - Iniciar sesión

### Rutas Protegidas (Requieren Login)
- `/dashboard` - Productos con precios
- `/user/favorites` - Mis favoritos
- `/user/orders` - Mis pedidos
- `/user/profile` - Mi perfil
- `/user/settings` - Configuración
- `/admin` - Panel de administración (solo admins)

## Ventajas de Este Sistema

### Para el Negocio
1. **Captación de leads**: Visitantes pueden solicitar cotización sin registro
2. **Incentivo al registro**: Para ver precios deben registrarse
3. **Seguimiento**: Todos los pedidos se guardan en BD
4. **Control**: Admin ve todos los pedidos en un solo lugar

### Para los Usuarios
1. **Acceso rápido**: Pueden cotizar sin crear cuenta
2. **Beneficios al registrarse**: Ven precios y tienen historial
3. **Favoritos**: Solo usuarios registrados
4. **Seguimiento**: Pueden ver sus pedidos anteriores

## Implementación Técnica

### CartContext
El carrito funciona para ambos tipos de usuarios:
- **Sin login**: Guarda en localStorage sin user_id
- **Con login**: Guarda en localStorage con `cart_${user.id}`

### Pedidos
Ambos tipos pueden crear pedidos:
- **Sin login**: `cliente_id` es NULL, solo datos del formulario
- **Con login**: `cliente_id` tiene el UUID del usuario

### Políticas RLS
```sql
-- Usuarios pueden crear pedidos (con o sin login)
CREATE POLICY "Usuarios pueden crear sus propios pedidos"
    ON pedidos FOR INSERT
    TO authenticated
    WITH CHECK (cliente_id = auth.uid() OR cliente_id IS NULL);
```

## Próximas Mejoras

1. **Historial de Pedidos**: Usuarios autenticados ven sus pedidos anteriores
2. **Precios Personalizados**: Clientes mayoristas ven precios especiales
3. **Descuentos**: Aplicar descuentos automáticos según tipo de cliente
4. **Notificaciones**: Avisar cuando cambia el estado del pedido
5. **Wishlist Pública**: Compartir lista de favoritos

## Preguntas Frecuentes

**¿Por qué no mostrar precios a todos?**
- Estrategia comercial: incentiva el registro
- Control de precios: evita comparaciones directas
- Segmentación: precios diferentes según tipo de cliente

**¿Los visitantes pueden hacer pedidos?**
- Sí, pero sin ver precios
- El admin les responde con la cotización

**¿Qué pasa si un visitante se registra después?**
- Sus pedidos anteriores quedan sin `cliente_id`
- Puede hacer nuevos pedidos con su cuenta

**¿Cómo sabe el admin quién es quién?**
- Los pedidos tienen nombre, email y teléfono
- Los pedidos con `cliente_id` están vinculados al usuario
