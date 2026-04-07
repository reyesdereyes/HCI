-- ============================================
-- MIGRACIÓN: precios_personalizados → clientes
-- Cambia el FK de clientes_autorizados a clientes
-- Ejecutar en Supabase SQL Editor
-- ============================================

-- 1. Eliminar la tabla y recrearla con el FK correcto
--    (si no hay datos aún, esto es lo más limpio)

DROP TABLE IF EXISTS precios_personalizados CASCADE;

CREATE TABLE precios_personalizados (
  id SERIAL PRIMARY KEY,
  cliente_id UUID REFERENCES clientes(id) ON DELETE CASCADE,
  producto_id INTEGER REFERENCES productos(id) ON DELETE CASCADE,
  precio_personalizado NUMERIC(10,2) NOT NULL,
  notas TEXT,
  activo BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(cliente_id, producto_id)
);

CREATE INDEX IF NOT EXISTS idx_precios_cliente ON precios_personalizados(cliente_id);
CREATE INDEX IF NOT EXISTS idx_precios_producto ON precios_personalizados(producto_id);

-- 2. Habilitar RLS
ALTER TABLE precios_personalizados ENABLE ROW LEVEL SECURITY;

-- 3. Políticas RLS
CREATE POLICY "Admins pueden ver todos los precios personalizados"
  ON precios_personalizados FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM administradores
      WHERE email = auth.email() AND activo = true
    )
  );

CREATE POLICY "Clientes pueden ver sus propios precios"
  ON precios_personalizados FOR SELECT
  USING (cliente_id = auth.uid());

CREATE POLICY "Admins pueden insertar precios personalizados"
  ON precios_personalizados FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores
      WHERE email = auth.email() AND activo = true
    )
  );

CREATE POLICY "Admins pueden actualizar precios personalizados"
  ON precios_personalizados FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores
      WHERE email = auth.email() AND activo = true
    )
  );

CREATE POLICY "Admins pueden eliminar precios personalizados"
  ON precios_personalizados FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM administradores
      WHERE email = auth.email() AND activo = true
    )
  );

-- 4. Trigger para updated_at
DROP TRIGGER IF EXISTS trigger_actualizar_precios_updated_at ON precios_personalizados;
CREATE TRIGGER trigger_actualizar_precios_updated_at
  BEFORE UPDATE ON precios_personalizados
  FOR EACH ROW
  EXECUTE FUNCTION actualizar_updated_at();

-- ============================================
-- VERIFICACIÓN
-- ============================================
SELECT 'precios_personalizados recreada con FK a clientes' AS resultado;
