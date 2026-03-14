# 🎯 Activar Datos Reales en Dashboard de Admin

## Problema
El Dashboard de Admin muestra ceros en las estadísticas aunque ya hay pedidos y clientes en la base de datos.

## ✅ Solución Implementada

He actualizado Admin.jsx para que calcule y muestre datos reales:

### 📊 Estadísticas que ahora funcionan:

1. **Ventas del Mes** - Suma de pedidos aprobados/procesados/enviados/entregados del mes actual
2. **Crecimiento de Ventas** - Comparación con mes anterior (%)
3. **Pedidos Pendientes** - Cantidad de pedidos en estado "pendiente"
4. **Pedidos Hoy** - Pedidos creados hoy
5. **Total Productos** - Cantidad total de productos
6. **Productos Activos** - Productos con activo=true
7. **Alertas de Stock** - Productos con stock < 10
8. **Sin Stock** - Productos con stock = 0
9. **Clientes Activos** - Clientes con activo=true
10. **Clientes Nuevos** - Clientes registrados este mes
11. **Ticket Promedio** - Promedio de valor de pedidos completados

### 👥 Datos de Clientes

Ahora muestra:
- Total de pedidos por cliente
- Total de compras (suma de pedidos)
- Fecha de última compra
- Email del cliente

## 🚀 Pasos para Activar

### Paso 1: Actualizar Tabla Clientes
Ejecuta en Supabase SQL Editor:

**Archivo:** `docs/admin/ACTUALIZAR-TABLA-CLIENTES.sql`

Este script:
- Agrega columna `email` a tabla clientes
- Sincroniza emails desde auth.users
- Agrega columnas adicionales (empresa, rif, ciudad, estado, descuento_especial)
- Actualiza trigger para incluir email

### Paso 2: Recargar Admin
1. Ve a la página de Admin
2. Presiona F5 para recargar
3. Espera unos segundos mientras carga los datos

### Paso 3: Verificar Datos

**Dashboard:**
- Verifica que "Ventas del Mes" muestre un valor real
- Verifica que "Pedidos Pendientes" muestre la cantidad correcta
- Verifica que "Clientes Activos" muestre la cantidad correcta

**Clientes:**
- Ve a pestaña "Clientes"
- Verifica que aparezcan todos los clientes
- Verifica que cada cliente muestre:
  - Email
  - Total de pedidos
  - Total de compras
  - Fecha de última compra

**Pedidos:**
- Ve a pestaña "Pedidos"
- Verifica que aparezcan todos los pedidos
- Verifica que los estados sean correctos

## 📊 Cálculos Implementados

### Ventas del Mes
```javascript
// Suma de pedidos del mes actual con estados válidos
const ventasMes = pedidosMes.reduce((sum, p) => sum + p.total, 0);
```

### Crecimiento de Ventas
```javascript
// Comparación con mes anterior
const crecimiento = ((ventasMes - ventasMesAnterior) / ventasMesAnterior) * 100;
```

### Ticket Promedio
```javascript
// Promedio de pedidos completados
const ticketPromedio = totalVentas / cantidadPedidos;
```

### Datos de Cliente
```javascript
// Para cada cliente:
- total_pedidos: COUNT de pedidos
- total_compras: SUM de pedidos.total
- ultima_compra: MAX de pedidos.fecha_pedido
```

## 🔍 Verificar que Funciona

### Test 1: Crear Pedido de Prueba
1. Como usuario, crea un pedido
2. Ve a Admin → Dashboard
3. Verifica que "Pedidos Pendientes" aumentó en 1
4. Verifica que "Pedidos Hoy" aumentó en 1

### Test 2: Aprobar Pedido
1. Ve a Admin → Pedidos
2. Aprueba un pedido pendiente
3. Ve a Dashboard
4. Verifica que "Ventas del Mes" aumentó
5. Verifica que "Pedidos Pendientes" disminuyó

### Test 3: Ver Cliente
1. Ve a Admin → Clientes
2. Busca el cliente que hizo el pedido
3. Verifica que muestre:
   - Email correcto
   - Total de pedidos: 1 (o más)
   - Total de compras: $XXX
   - Fecha de última compra

## 🐛 Solución de Problemas

### Los datos siguen en cero

**Causa:** Los datos no se cargaron correctamente

**Solución:**
1. Abre consola del navegador (F12)
2. Busca errores en rojo
3. Verifica que ejecutaste el script SQL
4. Recarga la página (F5)

### Clientes no muestran email

**Causa:** Columna email no existe o no está sincronizada

**Solución:**
1. Ejecuta `ACTUALIZAR-TABLA-CLIENTES.sql`
2. Verifica en Supabase Table Editor que columna email existe
3. Recarga Admin

### Ventas del mes en cero pero hay pedidos

**Causa:** Pedidos están en estado "pendiente"

**Solución:**
- Solo se cuentan pedidos con estados: aprobado, procesando, enviado, entregado
- Aprueba los pedidos pendientes para que se cuenten

### Clientes no muestran total de compras

**Causa:** No hay pedidos completados

**Solución:**
- Verifica que los pedidos estén en estados válidos
- Aprueba al menos un pedido
- Recarga la pestaña Clientes

## 📝 Notas Técnicas

### Estados de Pedido que Cuentan para Ventas:
- ✅ aprobado
- ✅ procesando
- ✅ enviado
- ✅ entregado
- ❌ pendiente (no cuenta)
- ❌ cancelado (no cuenta)

### Rendimiento:
- Los datos se cargan al abrir Admin
- Se recargan al cambiar de pestaña
- Para clientes, se hace una consulta por cada cliente (puede ser lento con muchos clientes)

### Optimización Futura:
- Crear vista materializada en Supabase
- Usar triggers para actualizar stats automáticamente
- Cachear datos en localStorage

## 🎯 Resultado Esperado

Después de seguir estos pasos, deberías ver:

**Dashboard:**
```
┌─────────────────────────────────────┐
│ Ventas del Mes:        $15,450      │
│ Crecimiento:           +12%         │
│ Pedidos Pendientes:    3            │
│ Pedidos Hoy:           2            │
│ Total Productos:       150          │
│ Productos Activos:     145          │
│ Alertas de Stock:      8            │
│ Sin Stock:             2            │
│ Clientes Activos:      25           │
│ Clientes Nuevos:       5            │
│ Ticket Promedio:       $618         │
└─────────────────────────────────────┘
```

**Clientes:**
```
┌─────────────────────────────────────┐
│ Juan Pérez                          │
│ juan@example.com                    │
│ Total Pedidos: 3                    │
│ Total Compras: $1,850               │
│ Última Compra: 13 mar 2026          │
└─────────────────────────────────────┘
```

---

**Última actualización:** Marzo 13, 2026  
**Versión:** 1.0
