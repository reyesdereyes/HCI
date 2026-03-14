-- ============================================
-- ACTUALIZAR TABLA CLIENTES
-- Agregar campos faltantes y sincronizar datos
-- ============================================

-- PASO 1: Agregar columna email si no existe
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'clientes' AND column_name = 'email'
  ) THEN
    ALTER TABLE clientes ADD COLUMN email TEXT;
  END IF;
END $$;

-- PASO 2: Sincronizar emails desde auth.users
UPDATE clientes c
SET email = u.email
FROM auth.users u
WHERE c.id = u.id AND c.email IS NULL;

-- PASO 3: Agregar otras columnas útiles si no existen
DO $$ 
BEGIN
  -- Empresa
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'clientes' AND column_name = 'empresa'
  ) THEN
    ALTER TABLE clientes ADD COLUMN empresa TEXT;
  END IF;

  -- RIF
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'clientes' AND column_name = 'rif'
  ) THEN
    ALTER TABLE clientes ADD COLUMN rif TEXT;
  END IF;

  -- Ciudad
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'clientes' AND column_name = 'ciudad'
  ) THEN
    ALTER TABLE clientes ADD COLUMN ciudad TEXT;
  END IF;

  -- Estado
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'clientes' AND column_name = 'estado'
  ) THEN
    ALTER TABLE clientes ADD COLUMN estado TEXT;
  END IF;

  -- Descuento especial
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'clientes' AND column_name = 'descuento_especial'
  ) THEN
    ALTER TABLE clientes ADD COLUMN descuento_especial NUMERIC DEFAULT 0;
  END IF;
END $$;

-- PASO 4: Actualizar trigger para incluir email
CREATE OR REPLACE FUNCTION sync_new_user_to_cliente()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO clientes (
    id, 
    nombre_completo, 
    email,
    telefono, 
    tipo_cliente, 
    activo, 
    fecha_registro
  )
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'phone', ''),
    'detal',
    true,
    NEW.created_at
  )
  ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    nombre_completo = COALESCE(clientes.nombre_completo, EXCLUDED.nombre_completo);
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- PASO 5: Verificar estructura
SELECT 
  column_name,
  data_type,
  is_nullable
FROM information_schema.columns
WHERE table_name = 'clientes'
ORDER BY ordinal_position;

-- PASO 6: Mostrar resumen
SELECT 
  COUNT(*) as total_clientes,
  COUNT(email) as con_email,
  COUNT(*) - COUNT(email) as sin_email,
  COUNT(CASE WHEN activo = true THEN 1 END) as activos
FROM clientes;

SELECT '
============================================
ACTUALIZACIÓN COMPLETADA
============================================

✅ Columna email agregada
✅ Emails sincronizados desde auth.users
✅ Columnas adicionales agregadas
✅ Trigger actualizado

PRÓXIMOS PASOS:

1. Recargar página de Admin
2. Ir a pestaña "Clientes"
3. Verificar que aparezcan todos los datos
4. Los nuevos usuarios tendrán email automáticamente

============================================
' as resultado;
