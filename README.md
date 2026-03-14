# 🏗️ Hitach Cool Import - E-Commerce Platform

Sistema de e-commerce para distribución de materiales de construcción, herramientas y acabados.

## 📋 Características Principales

- 🛒 Catálogo de productos con categorías y subcategorías
- 👥 Sistema de usuarios (público, autenticados, administradores)
- 💰 Precios diferenciados (detal/mayor) y precios personalizados
- 🛍️ Carrito de compras y cotizaciones por WhatsApp
- 📦 Panel de administración completo
- 📊 Dashboard con estadísticas en tiempo real
- 🔔 Alertas automáticas de inventario
- 📱 Diseño responsive

## 🚀 Inicio Rápido

### Requisitos Previos
- Node.js 16+
- Cuenta en Supabase
- Git

### Instalación

```bash
# Clonar el repositorio
git clone [tu-repo]
cd hitach-cool-import

# Instalar dependencias
npm install

# Configurar variables de entorno
cp .env.example .env
# Edita .env con tus credenciales de Supabase

# Iniciar servidor de desarrollo
npm run dev
```

### Configuración de Base de Datos

Ejecuta los scripts SQL en Supabase en este orden:

1. `docs/supabase/SUPABASE-SETUP.sql`
2. `docs/supabase/SUPABASE-MIGRATION.sql`
3. `docs/supabase/SUPABASE-STORAGE-SETUP.sql`
4. `docs/admin/ADMIN-TABLES-SETUP.sql`

## 📚 Documentación

Toda la documentación está organizada en la carpeta `/docs`:

- **`/docs/admin`** - Documentación del panel de administración
- **`/docs/supabase`** - Scripts SQL y configuración de base de datos
- **`/docs/user`** - Guías para usuarios finales
- **`/docs/setup`** - Guías de instalación y configuración

👉 **[Ver documentación completa](./docs/README.md)**

## 🛠️ Tecnologías

- **Frontend**: React 18 + Vite
- **Estilos**: CSS personalizado
- **Base de Datos**: Supabase (PostgreSQL)
- **Autenticación**: Supabase Auth
- **Storage**: Supabase Storage
- **Iconos**: Lucide React
- **Routing**: React Router DOM

## 📁 Estructura del Proyecto

```
hitach-cool-import/
├── docs/                    # Documentación organizada
│   ├── admin/              # Docs de administración
│   ├── supabase/           # Scripts SQL
│   ├── user/               # Docs de usuarios
│   └── setup/              # Guías de configuración
├── public/                 # Archivos estáticos
├── src/
│   ├── components/         # Componentes React
│   │   ├── admin/         # Componentes de admin
│   │   ├── Card.jsx
│   │   ├── Carrito.jsx
│   │   ├── Header.jsx
│   │   └── ...
│   ├── pages/             # Páginas principales
│   │   ├── Admin.jsx
│   │   ├── Dashboard.jsx
│   │   ├── Inicio.jsx
│   │   ├── Productos.jsx
│   │   └── ...
│   ├── css/               # Estilos CSS
│   ├── conf/              # Configuración
│   ├── context/           # Context API
│   └── hooks/             # Custom hooks
├── .env                   # Variables de entorno
└── package.json
```

## 🎯 Funcionalidades por Rol

### 👤 Usuario Público
- Ver catálogo de productos
- Buscar y filtrar productos
- Agregar productos al carrito
- Solicitar cotización por WhatsApp
- Ver información de la empresa

### 🔐 Usuario Autenticado
- Todo lo del usuario público
- Ver precios (detal/mayor según perfil)
- Guardar favoritos
- Ver historial de pedidos
- Gestionar perfil

### 👨‍💼 Administrador
- Gestión completa de productos
- Gestión de categorías y subcategorías
- Dashboard con estadísticas
- Gestión de pedidos
- Control de inventario con alertas
- Gestión de clientes
- Crear promociones
- Exportar reportes

## 🔧 Scripts Disponibles

```bash
# Desarrollo
npm run dev

# Build para producción
npm run build

# Preview de producción
npm run preview

# Linting
npm run lint
```

## 🐛 Solución de Problemas

Consulta la [guía de troubleshooting](./docs/setup/TROUBLESHOOTING.md) para soluciones a problemas comunes.

## 📝 Licencia

Este proyecto es privado y confidencial.

## 👥 Equipo

Desarrollado para Hitach Cool Import

---

**Última actualización**: Marzo 2026
