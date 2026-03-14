# ⚡ Instrucciones Rápidas - Configuración Completa

## 🎯 Objetivo

Configurar tu base de datos de Supabase para que:
1. ✅ Administradores puedan crear, editar y eliminar productos
2. ✅ Administradores puedan gestionar categorías y subcategorías
3. ✅ Administradores puedan asignar precios personalizados a clientes autorizados
4. ✅ Cada cliente autorizado tenga precios diferentes
5. ✅ Todo esté protegido con políticas de seguridad

## 📋 Pasos a Seguir

### Paso 1: Abrir Supabase Dashboard
1. Ve a https://supabase.com
2. Abre tu proyecto
3. Ve a **SQL Editor**

### Paso 2: Ejecutar el Script de Migración
1. Abre el archivo `SUPABASE-MIGRATION.sql`
2. Copia TODO el contenido
3. Pégalo en el SQL Editor de Supabase
4. Click en **RUN** o presiona `Ctrl + Enter`

**Esto hará:**
- ✅ Ajustar tus tablas existentes (sin perder datos)
- ✅ Crear tabla de precios personalizados
- ✅ Configurar todas las políticas de seguridad
- ✅ Crear funciones útiles
- ✅ Habilitar RLS en todas las tablas

### Paso 3: Verificar que Funcionó
Ejecuta este query para verificar:

```sql
-- Debe mostrar todas las tablas con rowsecurity = true
SELECT tablename, rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename IN ('productos', 'categorias', 'subcategorias', 'clientes_autorizados', 'precios_personalizados', 'administradores');
```

### Paso 4: Agregar tu Usuario como Administrador
Si aún no estás en la tabla de administradores:

```sql
INSERT INTO administradores (email, nombre, rol, activo)
VALUES ('tu@email.com', 'Tu Nombre', 'super_admin', true);
```

## ✅ ¿Qué Puedes Hacer Ahora?

### Como Administrador:

1. **Gestionar Productos**
   - Crear nuevos productos
   - Editar productos existentes
   - Eliminar productos
   - Ver todos los productos (activos e inactivos)

2. **Gestionar Categorías y Subcategorías**
   - Crear, editar y eliminar categorías
   - Crear, editar y eliminar subcategorías
   - Organizar productos por categorías

3. **Gestionar Precios de Clientes**
   - Ver todos los clientes autorizados
   - Asignar precios personalizados a cada cliente
   - Modificar precios existentes
   - Desactivar precios personalizados

### Como Cliente Autorizado:

1. **Ver Productos**
   - Ver productos con sus precios personalizados
   - Si no tiene precio personalizado, ve el precio estándar
   - No puede ver precios de otros clientes

## 📊 Ejemplo de Uso

### Asignar precio personalizado a un cliente:

```sql
-- 1. Ver clientes disponibles
SELECT id, nombre, email FROM clientes_autorizados;

-- 2. Ver productos disponibles
SELECT id, codigo, nombre, precio_detal FROM productos;

-- 3. Asignar precio personalizado
INSERT INTO precios_personalizados (
  cliente_id, 
  producto_id, 
  precio_personalizado, 
  descuento_porcentaje,
  notas
)
VALUES (
  'uuid-del-cliente',  -- Reemplazar con ID real
  'uuid-del-producto', -- Reemplazar con ID real
  45.99,               -- Precio personalizado
  15.00,               -- 15% de descuento
  'Cliente VIP - Descuento especial'
);
```

### Ver precios de un cliente:

```sql
SELECT 
  p.nombre as producto,
  p.precio_detal as precio_normal,
  pp.precio_personalizado,
  pp.descuento_porcentaje,
  (p.precio_detal - pp.precio_personalizado) as ahorro
FROM precios_personalizados pp
JOIN productos p ON pp.producto_id = p.id
JOIN clientes_autorizados c ON pp.cliente_id = c.id
WHERE c.email = 'cliente@ejemplo.com'
AND pp.activo = true;
```

## 🔐 Seguridad Configurada

### Administradores pueden:
- ✅ Ver, crear, editar y eliminar productos
- ✅ Ver, crear, editar y eliminar categorías
- ✅ Ver, crear, editar y eliminar subcategorías
- ✅ Ver todos los clientes autorizados
- ✅ Gestionar precios personalizados de todos los clientes
- ✅ Ver otros administradores

### Clientes Autorizados pueden:
- ✅ Ver productos activos
- ✅ Ver sus propios precios personalizados
- ✅ Ver su propio perfil
- ❌ NO pueden ver precios de otros clientes
- ❌ NO pueden modificar productos

### Público (no autenticado) puede:
- ✅ Ver productos activos
- ✅ Ver categorías activas
- ❌ NO puede ver precios personalizados
- ❌ NO puede ver clientes

## 📁 Archivos Importantes

1. **SUPABASE-MIGRATION.sql** - Script principal (EJECUTAR ESTE)
2. **PRECIOS-PERSONALIZADOS.md** - Documentación del sistema de precios
3. **TROUBLESHOOTING.md** - Solución de problemas
4. **SUPABASE-DIAGNOSTIC.sql** - Para diagnosticar problemas

## 🆘 Si Algo Sale Mal

1. Revisa el archivo **TROUBLESHOOTING.md**
2. Ejecuta **SUPABASE-DIAGNOSTIC.sql** para ver el estado actual
3. Verifica que tu email esté en la tabla `administradores`
4. Verifica que RLS esté habilitado en todas las tablas

## 🎉 Próximos Pasos

Una vez ejecutado el script, el panel de administración debería funcionar perfectamente. Podrás:

1. Crear productos desde el panel
2. Gestionar categorías y subcategorías
3. (Próximamente) Gestionar precios de clientes desde el panel

---

**¿Listo?** Ejecuta `SUPABASE-MIGRATION.sql` y estarás listo para usar el sistema completo.
