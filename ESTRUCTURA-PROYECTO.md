# 📁 Estructura del Proyecto - Hitach Cool Import

## 🌳 Árbol de Directorios

```
hitach-cool-import/
│
├── 📄 README.md                      # Información principal del proyecto
├── 📄 INDICE-DOCUMENTACION.md        # Índice de toda la documentación
├── 📄 ESTRUCTURA-PROYECTO.md         # Este archivo
├── 📄 .env.example                   # Plantilla de variables de entorno
├── 📄 .env                           # Variables de entorno (NO subir a Git)
├── 📄 .gitignore                     # Archivos ignorados por Git
├── 📄 package.json                   # Dependencias del proyecto
├── 📄 vite.config.js                 # Configuración de Vite
├── 📄 eslint.config.js               # Configuración de ESLint
├── 📄 index.html                     # HTML principal
│
├── 📂 docs/                          # 📚 DOCUMENTACIÓN ORGANIZADA
│   ├── 📄 README.md                  # Índice de documentación
│   │
│   ├── 📂 admin/                     # 🔐 Documentación de Admin
│   │   ├── ADMIN-FEATURES.md         # Funcionalidades del admin
│   │   ├── ADMIN-SETUP.md            # Configuración inicial
│   │   ├── ADMIN-DASHBOARD-GUIDE.md  # Guía del dashboard
│   │   └── ADMIN-TABLES-SETUP.sql    # Script SQL para tablas
│   │
│   ├── 📂 supabase/                  # 💾 Scripts de Base de Datos
│   │   ├── SUPABASE-SETUP.sql        # Setup inicial
│   │   ├── SUPABASE-MIGRATION.sql    # Migración y RLS
│   │   ├── SUPABASE-STORAGE-SETUP.sql # Storage de imágenes
│   │   ├── SUPABASE-DIAGNOSTIC.sql   # Diagnóstico
│   │   └── CHECK-CATEGORIES.sql      # Verificar categorías
│   │
│   ├── 📂 user/                      # 👥 Documentación de Usuarios
│   │   └── PRECIOS-PERSONALIZADOS.md # Sistema de precios
│   │
│   └── 📂 setup/                     # ⚙️ Guías de Configuración
│       ├── INSTRUCCIONES-RAPIDAS.md  # Inicio rápido
│       ├── TROUBLESHOOTING.md        # Solución de problemas
│       ├── WHATSAPP-SETUP.md         # Integración WhatsApp
│       └── SUBIDA-IMAGENES-GUIA.md   # Guía de imágenes
│
├── 📂 public/                        # 🖼️ Archivos Estáticos
│   ├── vite.svg
│   └── PHOTO-2026-03-11-14-40-08.jpg
│
├── 📂 src/                           # 💻 CÓDIGO FUENTE
│   │
│   ├── 📂 components/                # 🧩 Componentes React
│   │   │
│   │   ├── 📂 admin/                 # Componentes de Admin
│   │   │   ├── StatsCards.jsx        # Tarjetas de estadísticas
│   │   │   └── PedidosView.jsx       # Vista de pedidos
│   │   │
│   │   ├── Card.jsx                  # Tarjeta de producto
│   │   ├── Carrito.jsx               # Carrito de compras
│   │   ├── ConfirmDialog.jsx         # Diálogo de confirmación
│   │   ├── EmptyState.jsx            # Estado vacío
│   │   ├── Footer.jsx                # Pie de página
│   │   ├── Header.jsx                # Encabezado
│   │   ├── Modal.jsx                 # Modal genérico
│   │   ├── ModalCotizacion.jsx       # Modal de cotización
│   │   ├── ProtectedRoute.jsx        # Rutas protegidas
│   │   ├── Sidebar.jsx               # Barra lateral
│   │   ├── Toast.jsx                 # Notificación toast
│   │   └── ToastContainer.jsx        # Contenedor de toasts
│   │
│   ├── 📂 pages/                     # 📄 Páginas Principales
│   │   ├── Admin.jsx                 # Panel de administración
│   │   ├── Contacto.jsx              # Página de contacto
│   │   ├── Dashboard.jsx             # Dashboard de usuario
│   │   ├── Equipo.jsx                # Página de equipo
│   │   ├── Inicio.jsx                # Landing page
│   │   ├── Login.jsx                 # Página de login
│   │   ├── Productos.jsx             # Catálogo de productos
│   │   ├── UserFavorites.jsx         # Favoritos del usuario
│   │   ├── UserOrders.jsx            # Pedidos del usuario
│   │   ├── UserProfile.jsx           # Perfil del usuario
│   │   └── UserSettings.jsx          # Configuración del usuario
│   │
│   ├── 📂 css/                       # 🎨 Estilos CSS
│   │   ├── admin.css                 # Estilos del admin
│   │   ├── admin-stats.css           # Estilos de estadísticas
│   │   ├── admin-pedidos.css         # Estilos de pedidos
│   │   ├── card.css                  # Estilos de tarjetas
│   │   ├── carrito.css               # Estilos del carrito
│   │   ├── contacto.css              # Estilos de contacto
│   │   ├── dashboard.css             # Estilos del dashboard
│   │   ├── equipo.css                # Estilos de equipo
│   │   ├── footer.css                # Estilos del footer
│   │   ├── header.css                # Estilos del header
│   │   ├── inicio.css                # Estilos de inicio
│   │   ├── login.css                 # Estilos de login
│   │   ├── modal.css                 # Estilos de modales
│   │   ├── productos.css             # Estilos de productos
│   │   ├── sidebar.css               # Estilos del sidebar
│   │   ├── toast.css                 # Estilos de toasts
│   │   ├── userFavorites.css         # Estilos de favoritos
│   │   ├── userOrders.css            # Estilos de pedidos
│   │   ├── userProfile.css           # Estilos de perfil
│   │   ├── userSettings.css          # Estilos de configuración
│   │   └── index.css                 # Estilos globales
│   │
│   ├── 📂 conf/                      # ⚙️ Configuración
│   │   └── supabase.js               # Cliente de Supabase
│   │
│   ├── 📂 config/                    # 🔧 Configuraciones
│   │   └── whatsapp.js               # Config de WhatsApp
│   │
│   ├── 📂 context/                   # 🔄 Context API
│   │   └── CartContext.jsx           # Contexto del carrito
│   │
│   ├── 📂 hooks/                     # 🪝 Custom Hooks
│   │   └── useToast.js               # Hook de notificaciones
│   │
│   ├── 📂 assets/                    # 🖼️ Assets
│   │   └── react.svg
│   │
│   ├── App.jsx                       # Componente principal
│   ├── App.css                       # Estilos del App
│   └── main.jsx                      # Punto de entrada
│
└── 📂 node_modules/                  # 📦 Dependencias (no subir a Git)
```

---

## 📊 Estadísticas del Proyecto

### Componentes
- **Total**: 23 componentes
- **Páginas**: 11 páginas
- **Componentes de Admin**: 2 (y creciendo)
- **Componentes Reutilizables**: 10

### Estilos
- **Archivos CSS**: 20+
- **Enfoque**: CSS modular por componente

### Documentación
- **Total de docs**: 15+ archivos
- **Categorías**: 4 (admin, supabase, user, setup)
- **Scripts SQL**: 5

---

## 🎯 Convenciones de Nombres

### Archivos
- **Componentes React**: PascalCase (ej: `Header.jsx`)
- **Estilos CSS**: kebab-case (ej: `admin-stats.css`)
- **Documentación**: UPPER-KEBAB-CASE (ej: `ADMIN-SETUP.md`)
- **Scripts SQL**: UPPER-KEBAB-CASE (ej: `SUPABASE-SETUP.sql`)

### Carpetas
- **Minúsculas**: `components/`, `pages/`, `css/`
- **Subcarpetas**: Agrupación lógica (ej: `components/admin/`)

---

## 🔍 Dónde Encontrar Cada Cosa

### ¿Necesitas...?

#### Configurar el proyecto
→ `docs/setup/INSTRUCCIONES-RAPIDAS.md`

#### Crear/editar productos
→ `src/pages/Admin.jsx`
→ `docs/admin/ADMIN-FEATURES.md`

#### Configurar base de datos
→ `docs/supabase/SUPABASE-SETUP.sql`

#### Solucionar un problema
→ `docs/setup/TROUBLESHOOTING.md`

#### Entender el dashboard de admin
→ `docs/admin/ADMIN-DASHBOARD-GUIDE.md`

#### Modificar estilos
→ `src/css/[nombre-componente].css`

#### Agregar una nueva página
→ `src/pages/` + actualizar `App.jsx`

#### Crear un nuevo componente
→ `src/components/` (o `src/components/admin/` si es de admin)

---

## 🚀 Flujo de Trabajo Recomendado

### Para Nuevas Funcionalidades

1. **Planificar**
   - Documentar en `docs/admin/` o `docs/user/`
   
2. **Base de Datos**
   - Crear script SQL en `docs/supabase/`
   - Ejecutar en Supabase
   
3. **Backend (Supabase)**
   - Configurar políticas RLS
   - Crear funciones si es necesario
   
4. **Frontend**
   - Crear componente en `src/components/`
   - Crear página en `src/pages/` si es necesario
   - Agregar estilos en `src/css/`
   
5. **Integración**
   - Conectar con Supabase
   - Probar funcionalidad
   
6. **Documentación**
   - Actualizar guías relevantes
   - Agregar ejemplos de uso

---

## 📝 Notas Importantes

### Archivos que NO se suben a Git
- `.env` - Variables de entorno
- `node_modules/` - Dependencias
- `dist/` - Build de producción

### Archivos Importantes
- `.env.example` - Plantilla para configuración
- `package.json` - Dependencias y scripts
- `vite.config.js` - Configuración del bundler

---

**Última actualización**: Marzo 13, 2026
