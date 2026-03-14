-- ============================================
-- CONFIGURAR TABLA ADMINISTRADORES
-- Para excluir admins de la lista de clientes
-- ============================================

-- PASO 1: Crear tabla administradores si no existe
CREATE TABLE IF NOT EXISTS administradores (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT UNIQUE NOT NULL,
  nombre TEXT,
  activo BOOLEAN DEFAULT true,
  fecha_creacion TIMESTAMP DEFAULT NOW()
);

-- PASO 2: Agregar administradores existentes
-- IMPORTANTE: Reemplaza estos emails con los emails reales de tus administradores

INSERT INTO administradores (email, nombre)
VALUES 
  -- Agrega aquí los emails de tus administradores
  ('admin@hitachcool.com', 'Administrador Principal'),
  ('admin@example.com', 'Admin Ejemplo')
  -- Agrega más líneas según necesites
ON CONFLICT (email) DO NOTHING;

-- PASO 3: Verificar administradores creados
SELECT 
  email,
  nombre,
  activo,
  fecha_creacion
FROM administradores
ORDER BY fecha_creacion DESC;

-- PASO 4: Verificar que los admins NO aparezcan en clientes
SELECT 
  c.email,
  c.nombre_completo,
  CASE 
    WHEN a.email IS NOT NULL THEN '❌ Es Admin (no debe aparecer)'
    ELSE '✅ Es Cliente (debe aparecer)'
  END as tipo
FROM clientes c
LEFT JOIN administradores a ON c.email = a.email
ORDER BY c.fecha_registro DESC
LIMIT 10;

-- PASO 5: Contar clientes excluyendo administradores
SELECT 
  COUNT(*) as total_clientes,
  COUNT(CASE WHEN a.email IS NULL THEN 1 END) as clientes_reales,
  COUNT(CASE WHEN a.email IS NOT NULL THEN 1 END) as admins_en_clientes
FROM clientes c
LEFT JOIN administradores a ON c.email = a.email;

-- ============================================
-- FUNCIONES ÚTILES
-- ============================================

-- Agregar un nuevo administrador
-- INSERT INTO administradores (email, nombre)
-- VALUES ('nuevo_admin@example.com', 'Nombre del Admin')
-- ON CONFLICT (email) DO NOTHING;

-- Eliminar un administrador
-- DELETE FROM administradores WHERE email = 'admin@example.com';

-- Ver todos los administradores
-- SELECT * FROM administradores ORDER BY fecha_creacion DESC;

-- Desactivar un administrador (sin eliminarlo)
-- UPDATE administradores SET activo = false WHERE email = 'admin@example.com';

-- Reactivar un administrador
-- UPDATE administradores SET activo = true WHERE email = 'admin@example.com';

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT '
============================================
CONFIGURACIÓN COMPLETADA
============================================

✅ Tabla administradores creada
✅ Administradores agregados

PRÓXIMOS PASOS:

1. Verifica que los emails de administradores sean correctos
2. Agrega más administradores si es necesario
3. Recarga la página de Admin
4. Ve a pestaña "Clientes"
5. Verifica que los administradores NO aparezcan

IMPORTANTE:
- Los administradores NO aparecerán en la lista de clientes
- Los administradores NO se contarán en las estadísticas de clientes
- Los administradores SÍ pueden hacer pedidos (si tienen cuenta)

============================================
' as resultado;
