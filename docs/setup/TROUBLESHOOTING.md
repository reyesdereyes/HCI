# 🔧 Solución de Problemas - Panel de Administración

## Error: "Could not find the 'categoria_id' column"

### Causa
La tabla `productos` en Supabase no tiene las columnas esperadas o el esquema no está actualizado.

### Solución

#### Paso 1: Verificar estructura actual
1. Abre Supabase Dashboard
2. Ve a SQL Editor
3. Ejecuta el contenido de `SUPABASE-DIAGNOSTIC.sql`
4. Revisa qué columnas tiene tu tabla `productos`

#### Paso 2: Actualizar/Crear tablas
1. Si las tablas no existen o les faltan columnas, ejecuta `SUPABASE-SETUP.sql`
2. Esto creará las tablas con la estructura correcta

#### Paso 3: Migrar datos existentes (si aplica)
Si ya tienes datos en tablas con nombres diferentes:

```sql
-- Ejemplo: Si tu tabla se llama "products" en lugar de "productos"
ALTER TABLE products RENAME TO productos;

-- O si faltan columnas específicas
ALTER TABLE productos ADD COLUMN IF NOT EXISTS categoria_id UUID;
ALTER TABLE productos ADD COLUMN IF NOT EXISTS subcategoria_id UUID;
ALTER TABLE productos ADD COLUMN IF NOT EXISTS descripcion TEXT;
```

## Error: "Failed to load resource: net::ERR_NAME_NOT_RESOLVED"

### Causa
Problemas de conexión con Supabase o configuración incorrecta.

### Solución
1. Verifica tu archivo `src/conf/supabase.js`
2. Asegúrate de que las credenciales sean correctas:
   - `SUPABASE_URL` debe ser tu URL de proyecto
   - `SUPABASE_ANON_KEY` debe ser tu clave anónima pública

```javascript
const supabaseUrl = 'https://tu-proyecto.supabase.co'
const supabaseKey = 'tu-clave-anonima'
```

## Error: "400 Bad Request" al crear producto

### Causa
Intentando insertar datos en columnas que no existen o con formato incorrecto.

### Solución
1. Ejecuta `SUPABASE-DIAGNOSTIC.sql` para ver la estructura real
2. Compara con lo que el código está intentando insertar
3. Ajusta el código o la base de datos según sea necesario

## Error: "No tienes permisos de administrador"

### Causa
Tu email no está en la tabla `administradores` o no está activo.

### Solución
```sql
-- Verificar si existes en la tabla
SELECT * FROM administradores WHERE email = 'tu@email.com';

-- Si no existes, agregarte
INSERT INTO administradores (email, nombre, rol, activo)
VALUES ('tu@email.com', 'Tu Nombre', 'super_admin', true);

-- Si existes pero no estás activo
UPDATE administradores 
SET activo = true 
WHERE email = 'tu@email.com';
```

## Error: RLS (Row Level Security) bloqueando operaciones

### Causa
Las políticas de seguridad están bloqueando las operaciones.

### Solución temporal (solo desarrollo)
```sql
-- SOLO PARA DESARROLLO - NO USAR EN PRODUCCIÓN
ALTER TABLE productos DISABLE ROW LEVEL SECURITY;
ALTER TABLE categorias DISABLE ROW LEVEL SECURITY;
ALTER TABLE subcategorias DISABLE ROW LEVEL SECURITY;
```

### Solución correcta
Ejecuta las policies del archivo `SUPABASE-SETUP.sql` (sección 6)

## Subcategorías no se cargan al seleccionar categoría

### Causa
Problema con la relación entre tablas o datos faltantes.

### Solución
```sql
-- Verificar que las subcategorías tengan categoria_id válido
SELECT s.*, c.nombre as categoria_nombre
FROM subcategorias s
LEFT JOIN categorias c ON s.categoria_id = c.id;

-- Si hay subcategorías sin categoría, asignarles una
UPDATE subcategorias 
SET categoria_id = (SELECT id FROM categorias LIMIT 1)
WHERE categoria_id IS NULL;
```

## Imágenes no se muestran (placeholder)

### Causa
URLs de imágenes inválidas o vacías.

### Solución
1. Verifica que las URLs sean válidas y accesibles
2. Considera usar Supabase Storage para las imágenes:

```sql
-- Ver productos sin imagen
SELECT id, nombre, imagen 
FROM productos 
WHERE imagen IS NULL OR imagen = '';
```

## Toast notifications no aparecen

### Causa
El componente ToastContainer no está renderizado o hay error en useToast.

### Solución
1. Verifica que `ToastContainer` esté en Admin.jsx
2. Verifica que el hook `useToast` esté importado correctamente
3. Revisa la consola del navegador para errores

## Modal no se cierra después de guardar

### Causa
Error en la función `onSave` o `onClose`.

### Solución
Verifica que en Admin.jsx el modal tenga:
```javascript
onSave={() => {
  loadData();
  closeModal();
}}
```

## Datos no se actualizan después de crear/editar

### Causa
La función `loadData()` no se está ejecutando.

### Solución
Asegúrate de que `loadData()` se llame en `onSave` del modal.

---

## Comandos útiles de SQL

### Ver todas las tablas
```sql
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';
```

### Ver todas las columnas de una tabla
```sql
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'productos';
```

### Limpiar datos de prueba
```sql
DELETE FROM productos WHERE nombre LIKE '%test%';
DELETE FROM categorias WHERE nombre LIKE '%test%';
DELETE FROM subcategorias WHERE nombre LIKE '%test%';
```

### Resetear IDs (si usas SERIAL en lugar de UUID)
```sql
ALTER SEQUENCE productos_id_seq RESTART WITH 1;
```

---

## Contacto y Soporte

Si ninguna de estas soluciones funciona:
1. Revisa la consola del navegador (F12)
2. Revisa los logs de Supabase
3. Verifica que tu plan de Supabase esté activo
4. Comprueba que no hayas excedido los límites de tu plan
