-- ============================================
-- ARREGLAR PERMISOS PARA ACTUALIZAR PRECIOS
-- Ejecutar en Supabase SQL Editor
-- ============================================

-- 1. Verificar políticas actuales en productos
SELECT policyname, cmd, qual 
FROM pg_policies 
WHERE tablename = 'productos';

-- 2. Eliminar política de update existente y recrearla
DROP POLICY IF EXISTS "Admins pueden actualizar productos" ON productos;

CREATE POLICY "Admins pueden actualizar productos"
  ON productos FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- 3. Verificar que tu usuario está en administradores
SELECT email, rol, activo FROM administradores WHERE activo = true;

-- ============================================
-- RESULTADO ESPERADO: tu email debe aparecer
-- ============================================
