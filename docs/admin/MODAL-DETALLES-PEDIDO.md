# Modal de Detalles de Pedido

## Descripción
Modal completo para visualizar todos los detalles de un pedido desde el panel de administración.

## Ubicación
- **Componente**: `src/components/admin/PedidoDetalleModal.jsx`
- **CSS**: `src/css/admin-pedido-detalle.css`
- **Integrado en**: `src/components/admin/PedidosView.jsx`

## Características

### 1. Información Mostrada
- **Estado del pedido**: Badge grande con color según estado
- **Información del cliente**:
  - Nombre completo
  - Email
  - Teléfono
  - Fecha del pedido
- **Productos del pedido**:
  - Tabla con todos los items
  - Nombre del producto
  - Código del producto
  - Cantidad
  - Precio unitario
  - Subtotal por producto
- **Total del pedido**: Destacado en sección especial
- **Notas del cliente**: Si existen, se muestran en sección amarilla

### 2. Diseño
- **Header**: Gradiente morado con icono de paquete
- **Body**: Scrolleable con secciones bien organizadas
- **Footer**: Botón para cerrar el modal
- **Overlay**: Fondo oscuro con blur
- **Animaciones**: Fade in y slide up al abrir

### 3. Colores por Estado
- **Pendiente**: Naranja (#f59e0b)
- **Aprobado**: Verde (#10b981)
- **Procesando**: Morado (#8b5cf6)
- **Enviado**: Cyan (#06b6d4)
- **Entregado**: Verde (#10b981)
- **Cancelado**: Rojo (#ef4444)

### 4. Responsive
- Desktop: Modal de 900px de ancho
- Tablet/Mobile: Modal de 95% de ancho
- Tabla de productos: Scroll horizontal en móviles

## Uso

### Abrir el Modal
El modal se abre automáticamente al hacer clic en el botón "Ver" (ícono de ojo) en la tabla de pedidos.

### Cerrar el Modal
- Clic en el botón "Cerrar" del footer
- Clic en el botón X del header
- Clic en el overlay (fondo oscuro)

## Estructura de Datos Requerida

El componente espera recibir un objeto `pedido` con la siguiente estructura:

```javascript
{
  id: number,
  numero_pedido: string,
  estado: string,
  cliente_nombre: string,
  cliente_email: string,
  cliente_telefono: string,
  fecha_pedido: string (ISO date),
  total: number,
  notas: string (opcional),
  pedido_items: [
    {
      producto_nombre: string,
      producto_codigo: string,
      cantidad: number,
      precio_unitario: number,
      subtotal: number
    }
  ]
}
```

## Iconos Utilizados (lucide-react)
- `Package`: Encabezado y productos
- `User`: Información del cliente
- `Mail`: Email
- `Phone`: Teléfono
- `Calendar`: Fecha
- `FileText`: Notas
- `X`: Cerrar modal

## Mejoras Futuras Posibles
- Agregar botones de acción en el footer (aprobar, cancelar, etc.)
- Mostrar historial de cambios de estado
- Permitir editar el pedido desde el modal
- Agregar opción de imprimir o exportar PDF
- Mostrar información de envío si existe
