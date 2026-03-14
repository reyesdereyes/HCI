-- ============================================
-- CONFIGURACIÓN DE SUPABASE STORAGE
-- Para imágenes de productos
-- ============================================

-- 1. Crear bucket para imágenes de productos
INSERT INTO storage.buckets (id, name, public)
VALUES ('productos', 'productos', true)
ON CONFLICT (id) DO NOTHING;

-- 2. Permitir lectura pública de imágenes
CREATE POLICY "Lectura pública de imágenes de productos"
ON storage.objects FOR SELECT
USING (bucket_id = 'productos');

-- 3. Permitir a administradores subir imágenes
CREATE POLICY "Admins pueden subir imágenes"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'productos' 
  AND auth.email() IN (
    SELECT email FROM administradores WHERE activo = true
  )
);

-- 4. Permitir a administradores actualizar imágenes
CREATE POLICY "Admins pueden actualizar imágenes"
ON storage.objects FOR UPDATE
USING (
  bucket_id = 'productos' 
  AND auth.email() IN (
    SELECT email FROM administradores WHERE activo = true
  )
);

-- 5. Permitir a administradores eliminar imágenes
CREATE POLICY "Admins pueden eliminar imágenes"
ON storage.objects FOR DELETE
USING (
  bucket_id = 'productos' 
  AND auth.email() IN (
    SELECT email FROM administradores WHERE activo = true
  )
);

-- Verificar que el bucket se creó correctamente
SELECT * FROM storage.buckets WHERE id = 'productos';
