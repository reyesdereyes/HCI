# Guía del Dashboard de Administración

## 📋 Tabla de Contenidos
1. [Configuración Inicial](#configuración-inicial)
2. [Funcionalidades Implementadas](#funcionalidades-implementadas)
3. [Cómo Usar Cada Módulo](#cómo-usar-cada-módulo)
4. [Próximos Pasos](#próximos-pasos)

---

## 🚀 Configuración Inicial

### Paso 1: Crear las Tablas en Supabase

1. Ve a tu proyecto en Supabase
2. Abre el **SQL Editor**
3. Ejecuta el archivo `ADMIN-TABLES-SETUP.sql`
4. Verifica que todas las tablas se crearon correctamente

### Paso 2: Verificar Permisos

Las tablas ya tienen configuradas las políticas RLS (Row Level Security):
- **Administradores**: Acceso completo a todo
- **Usuarios**: Solo pueden ver sus propios datos
- **Público**: Puede ver promociones activas

---

## 📊 Funcionalidades Implementadas

### ✅ 1. Dashboard con Estadísticas

**Componente**: `StatsCards.jsx`

Muestra 6 tarjetas con métricas clave:
- 💰 Ventas del Mes
- 🛒 Pedidos Pendientes
- 📦 Total Productos
- ⚠️ Alertas de Stock
- 👥 Clientes Activos
- 📈 Ticket Promedio

**Características**:
- Animaciones suaves al hacer hover
- Colores diferenciados por tipo de métrica
- Indicadores de crecimiento/decrecimiento
- Responsive para móviles

### ✅ 2. Gestión de Pedidos

**Componente**: `PedidosView.jsx`

**Funcionalidades**:
- Ver todos los pedidos en tabla
- Buscar por número, cliente o email
- Filtrar por estado (pendiente, aprobado, procesando, enviado, entregado, cancelado)
- Cambiar estado de pedidos con un clic
- Ver detalles completos de cada pedido

**Flujo de Estados**:
```
Pendiente → Aprobado → Procesando → Enviado → Entregado
           ↓
        Cancelado
```

**Acciones Rápidas**:
- 👁️ Ver detalles
- ✅ Aprobar pedido
- ❌ Cancelar pedido
- ⏰ Marcar como procesando
- 🚚 Marcar como enviado
- 📦 Marcar como entregado

### 🔄 3. Gestión de Clientes (En Desarrollo)

**Tabla**: `clientes`

Información almacenada:
- Datos personales (nombre, email, teléfono)
- Datos de empresa (RIF, razón social)
- Tipo de cliente (detal/mayor)
- Descuentos especiales
- Historial de compras
- Total gastado

### 🔄 4. Reportes (En Desarrollo)

Reportes disponibles:
- Ventas por período
- Productos más vendidos
- Clientes top
- Inventario actual
- Exportar a Excel/CSV

### 🔄 5. Gestión de Promociones (En Desarrollo)

**Tabla**: `promociones`

Tipos de promociones:
- Descuento por porcentaje
- Descuento por monto fijo
- 2x1 o 3x2
- Envío gratis

Configuración:
- Código de promoción
- Fecha inicio/fin
- Uso máximo
- Monto mínimo de compra
- Productos/categorías específicas

### ✅ 6. Control de Inventario

**Características Automáticas**:

1. **Alertas Automáticas**:
   - Stock bajo (≤10 unidades)
   - Sin stock (0 unidades)
   - Se crean automáticamente con triggers

2. **Historial de Stock**:
   - Registra cada cambio de inventario
   - Tipo de movimiento (entrada/salida/ajuste)
   - Usuario que hizo el cambio
   - Fecha y hora

3. **Triggers Configurados**:
   - `trigger_verificar_stock`: Crea alertas automáticas
   - `trigger_historial_stock`: Registra cambios

---

## 🎯 Cómo Usar Cada Módulo

### Dashboard de Estadísticas

```jsx
import StatsCards from './components/admin/StatsCards';

// En tu componente Admin
const [stats, setStats] = useState({
  ventasMes: 0,
  crecimientoVentas: 0,
  pedidosPendientes: 0,
  pedidosHoy: 0,
  totalProductos: 0,
  productosActivos: 0,
  alertasStock: 0,
  sinStock: 0,
  clientesActivos: 0,
  clientesNuevos: 0,
  ticketPromedio: 0
});

// Cargar estadísticas
useEffect(() => {
  const fetchStats = async () => {
    // Ventas del mes
    const { data: ventas } = await supabase
      .from('pedidos')
      .select('total')
      .gte('fecha_pedido', startOfMonth)
      .eq('estado', 'entregado');
    
    const ventasMes = ventas?.reduce((sum, p) => sum + p.total, 0) || 0;
    
    // Pedidos pendientes
    const { count: pendientes } = await supabase
      .from('pedidos')
      .select('*', { count: 'exact', head: true })
      .eq('estado', 'pendiente');
    
    // ... más consultas
    
    setStats({
      ventasMes,
      pedidosPendientes: pendientes,
      // ... resto de stats
    });
  };
  
  fetchStats();
}, []);

// Renderizar
<StatsCards stats={stats} />
```

### Gestión de Pedidos

```jsx
import PedidosView from './components/admin/PedidosView';

// Cargar pedidos
const [pedidos, setPedidos] = useState([]);

useEffect(() => {
  const fetchPedidos = async () => {
    const { data } = await supabase
      .from('pedidos')
      .select('*')
      .order('fecha_pedido', { ascending: false });
    
    setPedidos(data || []);
  };
  
  fetchPedidos();
}, []);

// Actualizar estado de pedido
const handleUpdateEstado = async (pedidoId, nuevoEstado) => {
  const { error } = await supabase
    .from('pedidos')
    .update({ 
      estado: nuevoEstado,
      fecha_actualizado: new Date().toISOString()
    })
    .eq('id', pedidoId);
  
  if (!error) {
    // Recargar pedidos
    fetchPedidos();
    // Mostrar notificación
    toast.success('Estado actualizado');
  }
};

// Ver detalles
const handleViewDetails = (pedido) => {
  // Abrir modal con detalles
  setSelectedPedido(pedido);
  setShowModal(true);
};

// Renderizar
<PedidosView 
  pedidos={pedidos}
  onUpdateEstado={handleUpdateEstado}
  onViewDetails={handleViewDetails}
/>
```

### Control de Inventario

Las alertas se crean automáticamente. Para verlas:

```jsx
// Cargar alertas
const [alertas, setAlertas] = useState([]);

useEffect(() => {
  const fetchAlertas = async () => {
    const { data } = await supabase
      .from('alertas_inventario')
      .select(`
        *,
        productos (
          nombre,
          codigo,
          stock
        )
      `)
      .eq('leido', false)
      .order('fecha_alerta', { ascending: false });
    
    setAlertas(data || []);
  };
  
  fetchAlertas();
}, []);

// Marcar alerta como leída
const marcarLeida = async (alertaId) => {
  await supabase
    .from('alertas_inventario')
    .update({ leido: true })
    .eq('id', alertaId);
};
```

### Historial de Stock

```jsx
// Ver historial de un producto
const verHistorial = async (productoId) => {
  const { data } = await supabase
    .from('historial_stock')
    .select('*')
    .eq('producto_id', productoId)
    .order('created_at', { ascending: false })
    .limit(50);
  
  return data;
};
```

---

## 📝 Próximos Pasos

### Fase 1: Completar Componentes Básicos ✅
- [x] StatsCards
- [x] PedidosView
- [ ] ClientesView
- [ ] PromocionesView
- [ ] InventarioView
- [ ] ReportesView

### Fase 2: Integración
- [ ] Integrar componentes en Admin.jsx
- [ ] Crear sistema de navegación por tabs
- [ ] Agregar modales para detalles
- [ ] Implementar notificaciones toast

### Fase 3: Funcionalidades Avanzadas
- [ ] Gráficos con Chart.js o Recharts
- [ ] Exportar reportes a Excel
- [ ] Filtros avanzados
- [ ] Búsqueda global
- [ ] Notificaciones en tiempo real

### Fase 4: Optimización
- [ ] Paginación de tablas
- [ ] Caché de datos
- [ ] Lazy loading
- [ ] Optimización de consultas

---

## 🎨 Personalización

### Colores de Estados

Puedes personalizar los colores en `admin-pedidos.css`:

```css
.estado-warning { background: #fef3c7; color: #92400e; }
.estado-success { background: #d1fae5; color: #065f46; }
/* ... etc */
```

### Iconos

Los iconos vienen de `lucide-react`. Para cambiarlos:

```jsx
import { TuIcono } from 'lucide-react';
<TuIcono size={24} />
```

---

## 🐛 Troubleshooting

### Las estadísticas no cargan
- Verifica que las tablas existan en Supabase
- Revisa las políticas RLS
- Chequea la consola del navegador

### Los pedidos no se actualizan
- Verifica permisos de administrador
- Revisa que el user_id esté en la tabla `administradores`

### Las alertas no se crean automáticamente
- Verifica que los triggers estén creados
- Ejecuta: `SELECT * FROM pg_trigger WHERE tgname LIKE '%stock%';`

---

## 📚 Recursos

- [Supabase Docs](https://supabase.com/docs)
- [Lucide Icons](https://lucide.dev/)
- [React Docs](https://react.dev/)

---

¿Necesitas ayuda? Revisa los archivos:
- `ADMIN-TABLES-SETUP.sql` - Estructura de base de datos
- `ADMIN-FEATURES.md` - Lista de funcionalidades
- `TROUBLESHOOTING.md` - Solución de problemas comunes
