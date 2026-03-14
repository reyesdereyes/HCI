-- ============================================
-- DIAGNÓSTICO: Sistema de Pedidos y Clientes
-- ============================================
-- Ejecutar este script para verificar el estado del sistema

-- 1. Verificar que las tablas existen
SELECT 'Verificando tablas...' as paso;

SELECT 
  table_name,
  CASE 
    WHEN table_name IN ('pedidos', 'pedido_items', 'clientes') THEN '✅ Existe'
    ELSE '❌ No existe'
  END as estado
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('pedidos', 'pedido_items', 'clientes');

-- 2. Verificar RLS (Row Level Security)
SELECT 'Verificando RLS...' as paso;

SELECT 
  tablename,
  rowsecurity as rls_habilitado,
  CASE 
    WHEN rowsecurity = false THEN '✅ RLS Deshabilitado (correcto para desarrollo)'
    ELSE '⚠️ RLS Habilitado (puede causar error 401)'
  END as estado
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename IN ('pedidos', 'pedido_items', 'clientes');

-- 3. Contar pedidos existentes
SELECT 'Contando pedidos...' as paso;

SELECT 
  COUNT(*) as total_pedidos,
  COUNT(CASE WHEN cliente_id IS NOT NULL THEN 1 END) as pedidos_con_cliente,
  COUNT(CASE WHEN cliente_id IS NULL THEN 1 END) as pedidos_sin_cliente
FROM pedidos;

-- 4. Ver últimos 5 pedidos
SELECT 'Últimos 5 pedidos...' as paso;

SELECT 
  numero_pedido,
  cliente_nombre,
  cliente_email,
  cliente_telefono,
  estado,
  total,
  fecha_pedido,
  CASE 
    WHEN cliente_id IS NOT NULL THEN 'Usuario autenticado'
    ELSE 'Usuario invitado'
  END as tipo_usuario
FROM pedidos
ORDER BY fecha_pedido DESC
LIMIT 5;

-- 5. Ver items de pedidos
SELECT 'Items de pedidos...' as paso;

SELECT 
  p.numero_pedido,
  pi.producto_nombre,
  pi.cantidad,
  pi.precio_unitario,
  pi.subtotal
FROM pedido_items pi
JOIN pedidos p ON pi.pedido_id = p.id
ORDER BY p.fecha_pedido DESC
LIMIT 10;

-- 6. Contar clientes
SELECT 'Contando clientes...' as paso;

SELECT 
  COUNT(*) as total_clientes,
  COUNT(CASE WHEN activo = true THEN 1 END) as clientes_activos,
  COUNT(CASE WHEN activo = false THEN 1 END) as clientes_inactivos
FROM clientes;

-- 7. Ver últimos 5 clientes
SELECT 'Últimos 5 clientes...' as paso;

SELECT 
  id,
  nombre_completo,
  telefono,
  tipo_cliente,
  activo,
  fecha_registro
FROM clientes
ORDER BY fecha_registro DESC
LIMIT 5;

-- 8. Verificar usuarios en auth.users
SELECT 'Verificando usuarios en auth...' as paso;

SELECT 
  COUNT(*) as total_usuarios_auth
FROM auth.users;

-- 9. Ver usuarios que NO están en tabla clientes
SELECT 'Usuarios sin perfil de cliente...' as paso;

SELECT 
  u.id,
  u.email,
  u.created_at,
  '⚠️ No tiene perfil en tabla clientes' as estado
FROM auth.users u
LEFT JOIN clientes c ON u.id = c.id
WHERE c.id IS NULL
LIMIT 5;

-- 10. Verificar políticas RLS (si están habilitadas)
SELECT 'Verificando políticas RLS...' as paso;

SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename IN ('pedidos', 'pedido_items', 'clientes');

-- ============================================
-- RESUMEN Y RECOMENDACIONES
-- ============================================

SELECT '
============================================
RESUMEN DEL DIAGNÓSTICO
============================================

Si ves este mensaje, las consultas se ejecutaron correctamente.

VERIFICA LO SIGUIENTE:

1. ¿Las tablas existen?
   - pedidos ✓
   - pedido_items ✓
   - clientes ✓

2. ¿RLS está deshabilitado?
   - Debe decir "RLS Deshabilitado" para las 3 tablas
   - Si dice "RLS Habilitado", ejecuta SOLUCION-TEMPORAL-RLS.sql

3. ¿Hay pedidos en la base de datos?
   - Verifica que aparezcan en "Últimos 5 pedidos"
   - Si no hay pedidos, intenta crear uno desde la web

4. ¿Hay clientes en la base de datos?
   - Verifica que aparezcan en "Últimos 5 clientes"
   - Si no hay clientes, ejecuta SYNC-CLIENTES.sql

5. ¿Hay usuarios sin perfil de cliente?
   - Si hay usuarios en auth.users sin perfil, ejecuta SYNC-CLIENTES.sql

============================================
SOLUCIONES RÁPIDAS
============================================

PROBLEMA: No aparecen pedidos en Admin
SOLUCIÓN: 
  1. Verifica que RLS esté deshabilitado
  2. Ejecuta: SELECT * FROM pedidos;
  3. Si no hay pedidos, crea uno desde la web

PROBLEMA: No aparecen clientes en Admin
SOLUCIÓN:
  1. Ejecuta SYNC-CLIENTES.sql
  2. Verifica: SELECT * FROM clientes;

PROBLEMA: Error 401 al crear pedido
SOLUCIÓN:
  1. Ejecuta SOLUCION-TEMPORAL-RLS.sql
  2. Verifica que RLS esté deshabilitado

============================================
' as resumen;
