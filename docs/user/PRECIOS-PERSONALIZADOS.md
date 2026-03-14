# 💰 Sistema de Precios Personalizados

## Descripción

Sistema que permite a los administradores asignar precios personalizados a clientes autorizados específicos. Cada cliente puede tener precios diferentes para cada producto.

## Estructura de Datos

### Tabla: precios_personalizados

```sql
- id (UUID) - Identificador único
- cliente_id (UUID) - Referencia a clientes_autorizados
- producto_id (UUID) - Referencia a productos
- precio_personalizado (NUMERIC) - Precio especial para este cliente
- descuento_porcentaje (NUMERIC) - Porcentaje de descuento aplicado
- notas (TEXT) - Notas internas sobre el precio
- activo (BOOLEAN) - Si el precio está activo
- created_at (TIMESTAMP) - Fecha de creación
- updated_at (TIMESTAMP) - Última actualización
```

## Cómo Funciona

### Para Administradores

1. **Ver todos los clientes autorizados**
   - Lista completa de clientes con sus datos
   - Ver qué productos tienen precios personalizados

2. **Asignar precio personalizado**
   - Seleccionar cliente
   - Seleccionar producto
   - Definir precio personalizado
   - Opcionalmente agregar descuento porcentual
   - Agregar notas internas

3. **Editar precios existentes**
   - Modificar precio personalizado
   - Activar/desactivar precios
   - Ver historial de cambios

4. **Eliminar precios personalizados**
   - El cliente volverá a ver el precio estándar

### Para Clientes Autorizados

1. **Ver productos con sus precios**
   - Si tienen precio personalizado, ven ese precio
   - Si no, ven el precio estándar (detal o mayor)
   - No pueden ver precios de otros clientes

## Ejemplos de Uso SQL

### Crear precio personalizado

```sql
INSERT INTO precios_personalizados (
  cliente_id, 
  producto_id, 
  precio_personalizado, 
  descuento_porcentaje,
  notas
)
VALUES (
  'uuid-del-cliente',
  'uuid-del-producto',
  45.99,
  15.00,
  'Descuento por volumen - Cliente VIP'
);
```

### Obtener precio para un cliente específico

```sql
SELECT * FROM obtener_precio_producto(
  'uuid-del-producto',
  'email@cliente.com'
);
```

### Ver todos los precios de un cliente

```sql
SELECT 
  p.nombre as producto,
  p.precio_detal as precio_normal,
  pp.precio_personalizado,
  pp.descuento_porcentaje,
  pp.notas
FROM precios_personalizados pp
JOIN productos p ON pp.producto_id = p.id
JOIN clientes_autorizados c ON pp.cliente_id = c.id
WHERE c.email = 'email@cliente.com'
AND pp.activo = true;
```

### Ver clientes con precios personalizados

```sql
SELECT 
  c.nombre as cliente,
  c.email,
  COUNT(pp.id) as total_precios_personalizados,
  SUM(CASE WHEN pp.activo THEN 1 ELSE 0 END) as precios_activos
FROM clientes_autorizados c
LEFT JOIN precios_personalizados pp ON c.id = pp.cliente_id
GROUP BY c.id, c.nombre, c.email
HAVING COUNT(pp.id) > 0;
```

## Interfaz de Administración

### Nueva sección en el panel: "Precios de Clientes"

**Características:**

1. **Lista de Clientes**
   - Tabla con todos los clientes autorizados
   - Columna mostrando cantidad de precios personalizados
   - Botón para gestionar precios de cada cliente

2. **Modal de Gestión de Precios**
   - Seleccionar productos
   - Asignar precio personalizado
   - Calcular descuento automático
   - Guardar notas

3. **Vista de Productos por Cliente**
   - Tabla de productos con precios
   - Comparación: Precio Normal vs Precio Personalizado
   - Porcentaje de ahorro
   - Acciones: Editar, Eliminar

## Reglas de Negocio

1. **Prioridad de Precios:**
   - Precio Personalizado (si existe y está activo)
   - Precio al Mayor (si cumple cantidad mínima)
   - Precio al Detal (precio base)

2. **Restricciones:**
   - Un cliente solo puede tener un precio personalizado por producto
   - Los precios personalizados deben ser mayores a 0
   - Solo administradores pueden crear/modificar precios

3. **Seguridad:**
   - Clientes solo ven sus propios precios
   - Administradores ven todos los precios
   - Público no ve precios personalizados

## Casos de Uso

### Caso 1: Cliente VIP con descuento general

```sql
-- Aplicar 20% de descuento en todos los productos para un cliente VIP
INSERT INTO precios_personalizados (cliente_id, producto_id, precio_personalizado, descuento_porcentaje, notas)
SELECT 
  'uuid-cliente-vip',
  id,
  precio_detal * 0.80,
  20.00,
  'Cliente VIP - Descuento general 20%'
FROM productos
WHERE activo = true;
```

### Caso 2: Precio especial por volumen

```sql
-- Cliente que compra en grandes cantidades
INSERT INTO precios_personalizados (cliente_id, producto_id, precio_personalizado, notas)
VALUES (
  'uuid-cliente',
  'uuid-producto',
  35.00,
  'Precio especial por compra de 100+ unidades mensuales'
);
```

### Caso 3: Promoción temporal

```sql
-- Activar/desactivar precios promocionales
UPDATE precios_personalizados
SET activo = false
WHERE cliente_id = 'uuid-cliente'
AND notas LIKE '%Promoción%';
```

## Reportes Útiles

### Reporte de descuentos otorgados

```sql
SELECT 
  c.nombre as cliente,
  COUNT(pp.id) as productos_con_descuento,
  AVG(pp.descuento_porcentaje) as descuento_promedio,
  SUM(p.precio_detal - pp.precio_personalizado) as ahorro_total
FROM precios_personalizados pp
JOIN clientes_autorizados c ON pp.cliente_id = c.id
JOIN productos p ON pp.producto_id = p.id
WHERE pp.activo = true
GROUP BY c.id, c.nombre
ORDER BY ahorro_total DESC;
```

### Productos más personalizados

```sql
SELECT 
  p.nombre as producto,
  p.precio_detal as precio_base,
  COUNT(pp.id) as clientes_con_precio_especial,
  AVG(pp.precio_personalizado) as precio_promedio_personalizado,
  MIN(pp.precio_personalizado) as precio_minimo,
  MAX(pp.precio_personalizado) as precio_maximo
FROM productos p
JOIN precios_personalizados pp ON p.id = pp.producto_id
WHERE pp.activo = true
GROUP BY p.id, p.nombre, p.precio_detal
ORDER BY clientes_con_precio_especial DESC;
```

## Próximas Mejoras

- [ ] Historial de cambios de precios
- [ ] Precios por rango de fechas (promociones temporales)
- [ ] Descuentos por categoría completa
- [ ] Importación masiva de precios desde CSV
- [ ] Notificaciones a clientes cuando cambian sus precios
- [ ] Dashboard de análisis de precios y descuentos
- [ ] Precios por cantidad (escala de descuentos)

---

**Nota**: Este sistema está completamente integrado con las políticas de seguridad de Supabase y respeta los permisos de cada tipo de usuario.
