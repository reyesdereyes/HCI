# 🚨 Solución Inmediata: Pedidos y Clientes No Aparecen en Admin

## Problema
Acabas de realizar un pedido pero NO aparece en Admin, y tampoco aparece el usuario en la sección de Clientes.

## ✅ Solución Rápida (3 pasos)

### Paso 1: Ejecutar Script SQL
Ve a Supabase → SQL Editor y ejecuta este script:

**Archivo:** `docs/admin/EJECUTAR-AHORA.sql`

O copia y pega esto:
```sql
ALTER TABLE pedidos DISABLE ROW LEVEL SECURITY;
ALTER TABLE pedido_items DISABLE ROW LEVEL SECURITY;
ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;
```

### Paso 2: Recargar Admin
1. Ve a la página de Admin
2. Presiona F5 o Ctrl+R para recargar
3. Click en pestaña "Pedidos"
4. Click en pestaña "Clientes"

### Paso 3: Verificar
- ¿Aparecen los pedidos? ✅
- ¿Aparecen los clientes? ✅

## 🔍 Si Aún No Aparecen

### Diagnóstico Completo
Ejecuta en Supabase SQL Editor:

**Archivo:** `docs/admin/DIAGNOSTICO-PEDIDOS.sql`

Este script te mostrará:
- Si las tablas existen
- Si RLS está deshabilitado
- Cuántos pedidos hay
- Cuántos clientes hay
- Qué usuarios no tienen perfil

## 📝 Cambios Realizados

He agregado un `useEffect` en Admin.jsx que carga automáticamente los datos cuando cambias de pestaña.

**Antes:** Los datos solo se cargaban al abrir Admin
**Ahora:** Los datos se cargan cada vez que cambias a Pedidos o Clientes

## 🆘 Soporte Adicional

**Scripts disponibles:**
- `EJECUTAR-AHORA.sql` - Solución completa automática
- `DIAGNOSTICO-PEDIDOS.sql` - Diagnóstico detallado
- `SOLUCION-TEMPORAL-RLS.sql` - Solo deshabilitar RLS
- `SYNC-CLIENTES.sql` - Solo sincronizar clientes
