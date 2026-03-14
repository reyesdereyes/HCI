# 📸 Guía de Subida de Imágenes a Supabase Storage

## Paso 1: Configurar Supabase Storage

1. Abre Supabase Dashboard → SQL Editor
2. Ejecuta el contenido completo de `SUPABASE-STORAGE-SETUP.sql`
3. Esto creará:
   - ✅ Bucket público llamado "productos"
   - ✅ Políticas para que admins suban imágenes
   - ✅ Políticas para lectura pública de imágenes

## Paso 2: Verificar que el Bucket se Creó

En Supabase Dashboard:
1. Ve a **Storage** en el menú lateral
2. Deberías ver un bucket llamado **productos**
3. Debe estar marcado como **Public**

## Paso 3: Usar el Sistema

### Crear/Editar Producto con Imagen

1. En el panel de admin, click en "Agregar Nuevo" producto
2. Llena los datos del producto
3. En el campo "Imagen del Producto":
   - Click en "Choose File"
   - Selecciona una imagen (JPG, PNG, WebP)
   - Máximo 5MB
4. Verás un preview de la imagen
5. Click en "Guardar"
6. La imagen se subirá automáticamente a Supabase Storage
7. La URL se guardará en la base de datos

### Cambiar Imagen de un Producto

1. Edita el producto
2. Selecciona una nueva imagen
3. La imagen anterior NO se elimina automáticamente (por seguridad)
4. La nueva URL reemplazará la anterior en la base de datos

### Eliminar Imagen

1. Edita el producto
2. Click en el botón X sobre la imagen preview
3. Guarda el producto
4. El campo imagen quedará en NULL

## Cómo Funciona

### Subida de Imagen

```javascript
// 1. Usuario selecciona archivo
handleImageChange(file)

// 2. Se valida tipo y tamaño
if (!file.type.startsWith('image/')) return error
if (file.size > 5MB) return error

// 3. Se crea preview local
FileReader.readAsDataURL(file)

// 4. Al guardar, se sube a Supabase
uploadImage() {
  // Genera nombre único
  fileName = timestamp-random.ext
  
  // Sube a bucket 'productos'
  supabase.storage.from('productos').upload(fileName, file)
  
  // Obtiene URL pública
  publicUrl = supabase.storage.from('productos').getPublicUrl(fileName)
  
  // Retorna URL para guardar en BD
  return publicUrl
}

// 5. Se guarda URL en productos.imagen
INSERT INTO productos (nombre, imagen, ...) 
VALUES ('Producto X', 'https://...supabase.co/storage/v1/object/public/productos/123.jpg', ...)
```

### Estructura de URLs

Las URLs generadas tienen este formato:
```
https://[tu-proyecto].supabase.co/storage/v1/object/public/productos/[timestamp]-[random].[ext]
```

Ejemplo:
```
https://tbdtknsjwicanqulepxv.supabase.co/storage/v1/object/public/productos/1710345678-abc123.jpg
```

## Placeholder para Productos sin Imagen

Si un producto no tiene imagen, se muestra un placeholder SVG embebido:

```javascript
const PLACEHOLDER = 'data:image/svg+xml,%3Csvg...%3E';
```

Esto evita errores de carga y no requiere conexión externa.

## Validaciones Implementadas

✅ Solo archivos de imagen (image/*)
✅ Máximo 5MB por imagen
✅ Nombres únicos (timestamp + random)
✅ Preview antes de subir
✅ Indicador de progreso ("Subiendo imagen...")
✅ Manejo de errores

## Permisos y Seguridad

### Quién puede subir imágenes:
- ✅ Administradores autenticados
- ❌ Clientes autorizados
- ❌ Público

### Quién puede ver imágenes:
- ✅ Todos (bucket público)

### Políticas de Storage:
```sql
-- Lectura pública
CREATE POLICY "Lectura pública de imágenes de productos"
ON storage.objects FOR SELECT
USING (bucket_id = 'productos');

-- Solo admins pueden subir
CREATE POLICY "Admins pueden subir imágenes"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'productos' 
  AND auth.email() IN (SELECT email FROM administradores WHERE activo = true)
);
```

## Gestión de Imágenes

### Ver todas las imágenes subidas

En Supabase Dashboard:
1. Storage → productos
2. Verás lista de todas las imágenes
3. Puedes descargar, copiar URL o eliminar

### Eliminar imágenes huérfanas (sin producto asociado)

```sql
-- Ver imágenes que no están en uso
SELECT 
  name,
  created_at,
  metadata->>'size' as size_bytes
FROM storage.objects
WHERE bucket_id = 'productos'
AND name NOT IN (
  SELECT SUBSTRING(imagen FROM '.*/([^/]+)$')
  FROM productos
  WHERE imagen IS NOT NULL
);
```

### Limpiar imágenes antiguas

```sql
-- Eliminar imágenes de más de 30 días sin uso
DELETE FROM storage.objects
WHERE bucket_id = 'productos'
AND created_at < NOW() - INTERVAL '30 days'
AND name NOT IN (
  SELECT SUBSTRING(imagen FROM '.*/([^/]+)$')
  FROM productos
  WHERE imagen IS NOT NULL
);
```

## Optimizaciones Futuras

- [ ] Redimensionar imágenes automáticamente
- [ ] Generar thumbnails
- [ ] Comprimir imágenes antes de subir
- [ ] Múltiples imágenes por producto
- [ ] Galería de imágenes
- [ ] Drag & drop para subir
- [ ] Crop/edición de imagen antes de subir

## Solución de Problemas

### Error: "Failed to upload"
- Verifica que el bucket "productos" existe
- Verifica que tu usuario es administrador
- Verifica las políticas de Storage

### Error: "File too large"
- La imagen supera los 5MB
- Comprime la imagen antes de subir

### Imagen no se muestra
- Verifica que la URL esté correcta en la BD
- Verifica que el bucket sea público
- Verifica que la imagen exista en Storage

---

**¡Listo!** El sistema de subida de imágenes está completamente funcional.
