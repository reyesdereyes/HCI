# 🔐 Configuración del Panel de Administración

## Descripción

El panel de administración de Hitach Cool Import permite gestionar productos, categorías y subcategorías directamente desde Supabase. Todos los datos se consumen y actualizan en tiempo real desde la base de datos.

## Características

- ✅ Dashboard con estadísticas en tiempo real
- ✅ Gestión completa de productos (CRUD)
- ✅ Gestión de categorías y subcategorías
- ✅ Búsqueda y filtrado de productos
- ✅ Autenticación con Supabase Auth
- ✅ Control de acceso mediante tabla `administradores`
- ✅ Interfaz moderna y responsive

## Configuración Inicial

### 1. Crear tabla de administradores en Supabase

Ejecuta este SQL en Supabase SQL Editor:

```sql
-- Crear tabla de administradores
CREATE TABLE IF NOT EXISTS administradores (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  nombre TEXT NOT NULL,
  rol TEXT DEFAULT 'admin',
  activo BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Habilitar RLS
ALTER TABLE administradores ENABLE ROW LEVEL SECURITY;

-- Policy para que los admins puedan ver todos los registros
CREATE POLICY "Admins pueden ver todos los administradores"
  ON administradores FOR SELECT
  USING (auth.email() IN (SELECT email FROM administradores WHERE activo = true));

-- Policy para insertar (solo super_admin)
CREATE POLICY "Solo super_admin puede insertar administradores"
  ON administradores FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() 
      AND rol = 'super_admin' 
      AND activo = true
    )
  );
```

### 2. Registrar tu cuenta de administrador

Primero regístrate en la aplicación (`/login`) y luego ejecuta:

```sql
INSERT INTO administradores (email, nombre, rol, activo)
VALUES ('tu@email.com', 'Tu Nombre', 'super_admin', true);
```

## Acceso al Panel

### Método 1: Botón secreto (Recomendado)

1. Ve a cualquier página de la aplicación
2. Baja hasta el Footer
3. Haz clic **5 veces rápidamente** en el logo "HCI"
4. Serás redirigido a `/login` si no has iniciado sesión
5. Inicia sesión con tu cuenta de administrador
6. Accederás automáticamente al panel

### Método 2: URL directa

1. Navega a: `http://localhost:5173/admin`
2. Si no has iniciado sesión, serás redirigido a `/login`
3. Inicia sesión con tu cuenta de administrador

## Estructura de Datos en Supabase

### Tabla: productos

```sql
- id (UUID)
- codigo (TEXT)
- nombre (TEXT)
- precio_detal (NUMERIC)
- precio_mayor (NUMERIC)
- stock (INTEGER)
- categoria_id (UUID)
- subcategoria_id (UUID)
- imagen (TEXT)
- activo (BOOLEAN)
- cantidad_minima_mayor (INTEGER)
- created_at (TIMESTAMP)
```

### Tabla: categorias

```sql
- id (UUID)
- nombre (TEXT)
- icono (TEXT)
- orden (INTEGER)
- activo (BOOLEAN)
- created_at (TIMESTAMP)
```

### Tabla: subcategorias

```sql
- id (UUID)
- nombre (TEXT)
- categoria_id (UUID)
- created_at (TIMESTAMP)
```

## Funcionalidades del Panel

### Dashboard
- Estadísticas en tiempo real
- Total de productos, categorías y subcategorías
- Productos con stock bajo (< 10 unidades)
- Últimos 5 productos agregados

### Gestión de Productos
- Ver todos los productos en tabla
- Buscar productos por nombre
- Ver imagen, precios, stock y estado
- Editar y eliminar productos (próximamente)

### Gestión de Categorías
- Ver todas las categorías en grid
- Iconos personalizados
- Orden de visualización
- Estado activo/inactivo

### Gestión de Subcategorías
- Ver todas las subcategorías
- Relación con categoría padre
- Editar y eliminar

## Seguridad

El sistema verifica:

1. **Autenticación**: Usuario debe estar logueado en Supabase Auth
2. **Autorización**: Email debe estar en tabla `administradores`
3. **Estado activo**: Campo `activo` debe ser `true`

Si alguna verificación falla, el usuario es redirigido.

## Agregar más administradores

```sql
INSERT INTO administradores (email, nombre, rol, activo)
VALUES ('nuevo@email.com', 'Nombre del Admin', 'admin', true);
```

## Roles disponibles

- `super_admin`: Acceso total
- `admin`: Acceso estándar
- `editor`: Solo editar (futuro)
- `viewer`: Solo ver (futuro)

## Solución de Problemas

### "No tienes permisos de administrador"

Verifica que tu email esté en la tabla:

```sql
SELECT * FROM administradores WHERE email = 'tu@email.com';
```

### No puedo acceder después de login

1. Cierra sesión y vuelve a iniciar
2. Limpia cookies del navegador
3. Verifica credenciales de Supabase en `src/conf/supabase.js`

### Verificar configuración

```sql
-- Ver todos los administradores
SELECT * FROM administradores;

-- Ver usuarios registrados
SELECT email, created_at FROM auth.users;
```

## Próximas Funcionalidades

- [ ] Formularios completos para CRUD
- [ ] Subir imágenes de productos
- [ ] Importación masiva CSV
- [ ] Exportar datos
- [ ] Gestión de usuarios
- [ ] Reportes y gráficas
- [ ] Historial de cambios

---

**Nota**: Todos los datos se gestionan directamente en Supabase. El panel es solo una interfaz para visualizar y modificar la información.
