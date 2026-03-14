# 📑 Índice de Documentación - Hitach Cool Import

## 🎯 Acceso Rápido

### Para Empezar
- 📖 [README Principal](./README.md) - Información general del proyecto
- ⚡ [Instrucciones Rápidas](./docs/setup/INSTRUCCIONES-RAPIDAS.md) - Guía de inicio rápido
- 🔧 [Troubleshooting](./docs/setup/TROUBLESHOOTING.md) - Solución de problemas
- 🛒 **[Probar Sistema de Carrito](./docs/INSTRUCCIONES-PROBAR-CARRITO.md)** - Guía completa para probar carrito y pedidos
- 🚨 [Instrucciones Urgentes](./docs/INSTRUCCIONES-URGENTES.md) - Soluciones a problemas críticos
- ⚡ [Solución Rápida Pedidos](./docs/SOLUCION-RAPIDA-PEDIDOS.md) - Fix para error 401 en pedidos

---

## 📂 Documentación por Categoría

### 🔐 Administración
| Documento | Descripción |
|-----------|-------------|
| [ADMIN-FEATURES.md](./docs/admin/ADMIN-FEATURES.md) | Lista completa de funcionalidades del admin |
| [ADMIN-SETUP.md](./docs/admin/ADMIN-SETUP.md) | Configuración inicial del panel de admin |
| [ADMIN-DASHBOARD-GUIDE.md](./docs/admin/ADMIN-DASHBOARD-GUIDE.md) | Guía del dashboard con estadísticas |
| [ADMIN-TABLES-SETUP.sql](./docs/admin/ADMIN-TABLES-SETUP.sql) | Script SQL para tablas de admin |
| [COMPONENTES-CREADOS.md](./docs/admin/COMPONENTES-CREADOS.md) | Lista de componentes React creados |

### 🛒 Sistema de Carrito y Pedidos
| Documento | Descripción |
|-----------|-------------|
| **[INSTRUCCIONES-PROBAR-CARRITO.md](./docs/INSTRUCCIONES-PROBAR-CARRITO.md)** | **Guía completa para probar el sistema** |
| [RESUMEN-CARRITO-IMPLEMENTADO.md](./docs/RESUMEN-CARRITO-IMPLEMENTADO.md) | Resumen técnico de la implementación |
| [DIAGRAMA-FLUJO-CARRITO.md](./docs/DIAGRAMA-FLUJO-CARRITO.md) | Diagramas de flujo del sistema |
| [FAQ-CARRITO-PEDIDOS.md](./docs/FAQ-CARRITO-PEDIDOS.md) | Preguntas frecuentes |
| [SOLUCION-RAPIDA-PEDIDOS.md](./docs/SOLUCION-RAPIDA-PEDIDOS.md) | Fix para error 401 en pedidos |
| [INSTRUCCIONES-URGENTES.md](./docs/INSTRUCCIONES-URGENTES.md) | Soluciones a problemas críticos |
| [DIFERENCIA-USUARIOS.md](./docs/DIFERENCIA-USUARIOS.md) | Diferencias entre usuarios autenticados y NO autenticados |

### 💾 Base de Datos (Supabase)
| Documento | Descripción |
|-----------|-------------|
| [SUPABASE-SETUP.sql](./docs/supabase/SUPABASE-SETUP.sql) | Configuración inicial de BD |
| [SUPABASE-MIGRATION.sql](./docs/supabase/SUPABASE-MIGRATION.sql) | Migración con políticas RLS |
| [SUPABASE-STORAGE-SETUP.sql](./docs/supabase/SUPABASE-STORAGE-SETUP.sql) | Configuración de storage |
| [SUPABASE-DIAGNOSTIC.sql](./docs/supabase/SUPABASE-DIAGNOSTIC.sql) | Diagnóstico de problemas |
| [CHECK-CATEGORIES.sql](./docs/supabase/CHECK-CATEGORIES.sql) | Verificar categorías |

### 👥 Usuarios
| Documento | Descripción |
|-----------|-------------|
| [PRECIOS-PERSONALIZADOS.md](./docs/user/PRECIOS-PERSONALIZADOS.md) | Sistema de precios personalizados |

### ⚙️ Configuración
| Documento | Descripción |
|-----------|-------------|
| [INSTRUCCIONES-RAPIDAS.md](./docs/setup/INSTRUCCIONES-RAPIDAS.md) | Guía de inicio rápido |
| [TROUBLESHOOTING.md](./docs/setup/TROUBLESHOOTING.md) | Solución de problemas |
| [WHATSAPP-SETUP.md](./docs/setup/WHATSAPP-SETUP.md) | Integración con WhatsApp |
| [SUBIDA-IMAGENES-GUIA.md](./docs/setup/SUBIDA-IMAGENES-GUIA.md) | Guía de imágenes |

---

## 🔄 Flujo de Configuración Inicial

### 1️⃣ Instalación del Proyecto
```bash
npm install
cp .env.example .env
# Configurar variables en .env
```

### 2️⃣ Configuración de Base de Datos
Ejecutar en Supabase SQL Editor en este orden:
1. `docs/supabase/SUPABASE-SETUP.sql`
2. `docs/supabase/SUPABASE-MIGRATION.sql`
3. `docs/supabase/SUPABASE-STORAGE-SETUP.sql`
4. `docs/admin/ADMIN-TABLES-SETUP.sql`

### 3️⃣ Configuración de Admin
- Leer: `docs/admin/ADMIN-SETUP.md`
- Crear primer usuario admin en Supabase

### 4️⃣ Configuraciones Adicionales
- WhatsApp: `docs/setup/WHATSAPP-SETUP.md`
- Imágenes: `docs/setup/SUBIDA-IMAGENES-GUIA.md`

### 5️⃣ Iniciar Desarrollo
```bash
npm run dev
```

---

## 🎓 Guías por Rol

### Para Desarrolladores
1. [README.md](./README.md) - Visión general
2. [INSTRUCCIONES-RAPIDAS.md](./docs/setup/INSTRUCCIONES-RAPIDAS.md) - Setup inicial
3. [SUPABASE-SETUP.sql](./docs/supabase/SUPABASE-SETUP.sql) - Base de datos
4. [TROUBLESHOOTING.md](./docs/setup/TROUBLESHOOTING.md) - Problemas comunes

### Para Administradores del Sistema
1. [ADMIN-FEATURES.md](./docs/admin/ADMIN-FEATURES.md) - Qué puedes hacer
2. [ADMIN-DASHBOARD-GUIDE.md](./docs/admin/ADMIN-DASHBOARD-GUIDE.md) - Cómo usar el dashboard
3. [PRECIOS-PERSONALIZADOS.md](./docs/user/PRECIOS-PERSONALIZADOS.md) - Gestionar precios

### Para Soporte Técnico
1. [TROUBLESHOOTING.md](./docs/setup/TROUBLESHOOTING.md) - Soluciones
2. [SUPABASE-DIAGNOSTIC.sql](./docs/supabase/SUPABASE-DIAGNOSTIC.sql) - Diagnóstico
3. [CHECK-CATEGORIES.sql](./docs/supabase/CHECK-CATEGORIES.sql) - Verificación

---

## 🔍 Búsqueda Rápida por Tema

### Productos
- Crear/editar: `docs/admin/ADMIN-FEATURES.md`
- Categorías: `docs/supabase/CHECK-CATEGORIES.sql`
- Imágenes: `docs/setup/SUBIDA-IMAGENES-GUIA.md`

### Usuarios y Clientes
- Precios personalizados: `docs/user/PRECIOS-PERSONALIZADOS.md`
- Gestión de clientes: `docs/admin/ADMIN-DASHBOARD-GUIDE.md`

### Pedidos
- **Probar sistema completo**: `docs/INSTRUCCIONES-PROBAR-CARRITO.md`
- Gestión: `docs/admin/ADMIN-DASHBOARD-GUIDE.md` (Sección Pedidos)
- Base de datos: `docs/admin/ADMIN-TABLES-SETUP.sql`
- Solución error 401: `docs/SOLUCION-RAPIDA-PEDIDOS.md`
- Diagramas de flujo: `docs/DIAGRAMA-FLUJO-CARRITO.md`
- Preguntas frecuentes: `docs/FAQ-CARRITO-PEDIDOS.md`

### Carrito de Compras
- **Guía de pruebas**: `docs/INSTRUCCIONES-PROBAR-CARRITO.md`
- Resumen técnico: `docs/RESUMEN-CARRITO-IMPLEMENTADO.md`
- Flujo del sistema: `docs/DIAGRAMA-FLUJO-CARRITO.md`
- FAQ: `docs/FAQ-CARRITO-PEDIDOS.md`

### Inventario
- Alertas automáticas: `docs/admin/ADMIN-DASHBOARD-GUIDE.md` (Sección Inventario)
- Historial: `docs/admin/ADMIN-TABLES-SETUP.sql`

### Estadísticas
- Dashboard: `docs/admin/ADMIN-DASHBOARD-GUIDE.md`
- Reportes: `docs/admin/ADMIN-FEATURES.md`

### Integraciones
- WhatsApp: `docs/setup/WHATSAPP-SETUP.md`
- Storage: `docs/supabase/SUPABASE-STORAGE-SETUP.sql`

---

## 📞 Ayuda

¿No encuentras lo que buscas?

1. Revisa el [README principal](./README.md)
2. Consulta [TROUBLESHOOTING.md](./docs/setup/TROUBLESHOOTING.md)
3. Busca en la carpeta `docs/` correspondiente

---

**Última actualización**: Marzo 13, 2026
