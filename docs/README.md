# 📚 Documentación - Hitach Cool Import

Esta carpeta contiene toda la documentación del proyecto organizada por categorías.

## 📁 Estructura de Carpetas

### 🔧 `/admin` - Documentación de Administración
Documentos relacionados con el panel de administración y funcionalidades para administradores.

- **ADMIN-FEATURES.md** - Lista completa de funcionalidades del panel de admin
- **ADMIN-SETUP.md** - Guía de configuración inicial del panel de admin
- **ADMIN-DASHBOARD-GUIDE.md** - Guía completa del dashboard con estadísticas
- **ADMIN-TABLES-SETUP.sql** - Script SQL para crear tablas de admin (pedidos, promociones, alertas, etc.)

### 💾 `/supabase` - Scripts y Configuración de Base de Datos
Scripts SQL para configurar y mantener la base de datos en Supabase.

- **SUPABASE-SETUP.sql** - Configuración inicial de la base de datos
- **SUPABASE-MIGRATION.sql** - Script de migración con políticas RLS
- **SUPABASE-STORAGE-SETUP.sql** - Configuración del storage para imágenes
- **SUPABASE-DIAGNOSTIC.sql** - Queries para diagnosticar problemas
- **CHECK-CATEGORIES.sql** - Verificar categorías y productos

### 👥 `/user` - Documentación para Usuarios
Documentos relacionados con funcionalidades de usuarios finales.

- **PRECIOS-PERSONALIZADOS.md** - Guía sobre el sistema de precios personalizados por cliente

### ⚙️ `/setup` - Guías de Configuración General
Guías de instalación y configuración de diferentes componentes del sistema.

- **INSTRUCCIONES-RAPIDAS.md** - Guía rápida de inicio
- **TROUBLESHOOTING.md** - Solución de problemas comunes
- **WHATSAPP-SETUP.md** - Configuración de integración con WhatsApp
- **SUBIDA-IMAGENES-GUIA.md** - Guía para subir imágenes de productos

---

## 🚀 Inicio Rápido

### Para Desarrolladores
1. Lee primero: `setup/INSTRUCCIONES-RAPIDAS.md`
2. Configura la base de datos: `supabase/SUPABASE-SETUP.sql`
3. Configura el admin: `admin/ADMIN-SETUP.md`

### Para Administradores
1. Lee: `admin/ADMIN-FEATURES.md`
2. Guía del dashboard: `admin/ADMIN-DASHBOARD-GUIDE.md`

### Solución de Problemas
- Consulta: `setup/TROUBLESHOOTING.md`
- Diagnóstico de BD: `supabase/SUPABASE-DIAGNOSTIC.sql`

---

## 📝 Orden de Ejecución de Scripts SQL

Si estás configurando el proyecto desde cero, ejecuta los scripts en este orden:

1. **SUPABASE-SETUP.sql** - Crea las tablas básicas
2. **SUPABASE-MIGRATION.sql** - Configura políticas RLS y funciones
3. **SUPABASE-STORAGE-SETUP.sql** - Configura el storage de imágenes
4. **ADMIN-TABLES-SETUP.sql** - Crea tablas para funcionalidades de admin

### Scripts de Diagnóstico (Ejecutar cuando sea necesario)
- **SUPABASE-DIAGNOSTIC.sql** - Para verificar estructura de tablas
- **CHECK-CATEGORIES.sql** - Para verificar categorías y productos

---

## 🔄 Actualizaciones

Última actualización: 13 de Marzo, 2026

### Cambios Recientes
- ✅ Reorganización de documentación en carpetas
- ✅ Creación de dashboard de admin con estadísticas
- ✅ Sistema de gestión de pedidos
- ✅ Control automático de inventario con alertas
- ✅ Historial de movimientos de stock

---

## 📞 Soporte

Si tienes dudas o encuentras problemas:
1. Revisa `setup/TROUBLESHOOTING.md`
2. Verifica los logs en la consola del navegador
3. Ejecuta scripts de diagnóstico en Supabase

---

## 🎯 Próximas Funcionalidades

- [ ] Sistema de reportes con exportación a Excel
- [ ] Gestión de promociones y descuentos
- [ ] Dashboard con gráficos de ventas
- [ ] Notificaciones en tiempo real
- [ ] Sistema de reseñas de productos
