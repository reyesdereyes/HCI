-- ============================================
-- MIGRACIÓN Y CONFIGURACIÓN COMPLETA
-- Base de datos Hitach Cool Import
-- ============================================

-- ============================================
-- PASO 0: ELIMINAR VISTAS EXISTENTES
-- ============================================

DROP VIEW IF EXISTS vista_productos_completa CASCADE;

-- ============================================
-- PASO 1: AJUSTAR TABLAS EXISTENTES
-- ============================================

-- Asegurar que la tabla productos tenga todas las columnas necesarias
ALTER TABLE productos ADD COLUMN IF NOT EXISTS descripcion TEXT;
ALTER TABLE productos ADD COLUMN IF NOT EXISTS activo BOOLEAN DEFAULT true;

-- NOTA: Tu tabla productos usa subcategoria_id directamente
-- La categoría se obtiene a través de subcategorias.categoria_id

-- Asegurar que categorias tenga las columnas necesarias
ALTER TABLE categorias ADD COLUMN IF NOT EXISTS activo BOOLEAN DEFAULT true;
ALTER TABLE categorias ADD COLUMN IF NOT EXISTS orden INTEGER DEFAULT 1;

-- ============================================
-- PASO 2: CREAR TABLA DE PRECIOS PERSONALIZADOS
-- ============================================

-- Tabla para gestionar precios personalizados por cliente
CREATE TABLE IF NOT EXISTS precios_personalizados (
  id SERIAL PRIMARY KEY,
  cliente_id UUID REFERENCES clientes_autorizados(id) ON DELETE CASCADE,
  producto_id INTEGER REFERENCES productos(id) ON DELETE CASCADE,
  precio_personalizado NUMERIC(10,2) NOT NULL,
  descuento_porcentaje NUMERIC(5,2),
  notas TEXT,
  activo BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(cliente_id, producto_id)
);

-- Índices para mejorar rendimiento
CREATE INDEX IF NOT EXISTS idx_precios_cliente ON precios_personalizados(cliente_id);
CREATE INDEX IF NOT EXISTS idx_precios_producto ON precios_personalizados(producto_id);

-- ============================================
-- PASO 3: HABILITAR RLS EN TODAS LAS TABLAS
-- ============================================

ALTER TABLE productos ENABLE ROW LEVEL SECURITY;
ALTER TABLE categorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE subcategorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE clientes_autorizados ENABLE ROW LEVEL SECURITY;
ALTER TABLE precios_personalizados ENABLE ROW LEVEL SECURITY;
ALTER TABLE administradores ENABLE ROW LEVEL SECURITY;

-- ============================================
-- PASO 4: ELIMINAR POLÍTICAS EXISTENTES
-- ============================================

-- Productos
DROP POLICY IF EXISTS "Permitir lectura pública de productos" ON productos;
DROP POLICY IF EXISTS "Todos pueden ver productos activos" ON productos;
DROP POLICY IF EXISTS "Lectura de productos" ON productos;
DROP POLICY IF EXISTS "Admins pueden insertar productos" ON productos;
DROP POLICY IF EXISTS "Admins pueden actualizar productos" ON productos;
DROP POLICY IF EXISTS "Admins pueden eliminar productos" ON productos;
DROP POLICY IF EXISTS "Admins pueden ver todos los productos" ON productos;

-- Categorías
DROP POLICY IF EXISTS "Permitir lectura pública de categorias" ON categorias;
DROP POLICY IF EXISTS "Admins pueden insertar categorias" ON categorias;
DROP POLICY IF EXISTS "Admins pueden actualizar categorias" ON categorias;
DROP POLICY IF EXISTS "Admins pueden eliminar categorias" ON categorias;

-- Subcategorías
DROP POLICY IF EXISTS "Permitir lectura pública de subcategorias" ON subcategorias;
DROP POLICY IF EXISTS "Admins pueden insertar subcategorias" ON subcategorias;
DROP POLICY IF EXISTS "Admins pueden actualizar subcategorias" ON subcategorias;
DROP POLICY IF EXISTS "Admins pueden eliminar subcategorias" ON subcategorias;

-- Clientes autorizados
DROP POLICY IF EXISTS "Admins pueden ver clientes" ON clientes_autorizados;
DROP POLICY IF EXISTS "Admins pueden ver todos los clientes" ON clientes_autorizados;
DROP POLICY IF EXISTS "Admins pueden insertar clientes" ON clientes_autorizados;
DROP POLICY IF EXISTS "Admins pueden actualizar clientes" ON clientes_autorizados;
DROP POLICY IF EXISTS "Admins pueden eliminar clientes" ON clientes_autorizados;
DROP POLICY IF EXISTS "Clientes pueden ver su propio perfil" ON clientes_autorizados;
DROP POLICY IF EXISTS "Clientes pueden ver su perfil" ON clientes_autorizados;

-- Precios personalizados
DROP POLICY IF EXISTS "Admins pueden ver precios" ON precios_personalizados;
DROP POLICY IF EXISTS "Admins pueden ver todos los precios personalizados" ON precios_personalizados;
DROP POLICY IF EXISTS "Admins pueden insertar precios" ON precios_personalizados;
DROP POLICY IF EXISTS "Admins pueden insertar precios personalizados" ON precios_personalizados;
DROP POLICY IF EXISTS "Admins pueden actualizar precios" ON precios_personalizados;
DROP POLICY IF EXISTS "Admins pueden actualizar precios personalizados" ON precios_personalizados;
DROP POLICY IF EXISTS "Admins pueden eliminar precios" ON precios_personalizados;
DROP POLICY IF EXISTS "Admins pueden eliminar precios personalizados" ON precios_personalizados;
DROP POLICY IF EXISTS "Clientes pueden ver sus propios precios" ON precios_personalizados;

-- Administradores
DROP POLICY IF EXISTS "Admins pueden ver administradores" ON administradores;
DROP POLICY IF EXISTS "Solo super_admin puede insertar administradores" ON administradores;
DROP POLICY IF EXISTS "Solo super_admin puede actualizar administradores" ON administradores;
DROP POLICY IF EXISTS "Admins pueden ver otros administradores" ON administradores;


-- ============================================
-- PASO 5: CREAR POLÍTICAS PARA PRODUCTOS
-- ============================================

-- Lectura pública de productos activos O admins pueden ver todos
CREATE POLICY "Lectura de productos"
  ON productos FOR SELECT
  USING (
    activo = true 
    OR 
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Administradores pueden insertar productos
CREATE POLICY "Admins pueden insertar productos"
  ON productos FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Administradores pueden actualizar productos
CREATE POLICY "Admins pueden actualizar productos"
  ON productos FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Administradores pueden eliminar productos
CREATE POLICY "Admins pueden eliminar productos"
  ON productos FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- ============================================
-- PASO 6: CREAR POLÍTICAS PARA CATEGORÍAS
-- ============================================

-- Lectura pública de categorías activas
CREATE POLICY "Todos pueden ver categorias activas"
  ON categorias FOR SELECT
  USING (activo = true);

-- Administradores pueden hacer todo con categorías
CREATE POLICY "Admins pueden insertar categorias"
  ON categorias FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

CREATE POLICY "Admins pueden actualizar categorias"
  ON categorias FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

CREATE POLICY "Admins pueden eliminar categorias"
  ON categorias FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- ============================================
-- PASO 7: CREAR POLÍTICAS PARA SUBCATEGORÍAS
-- ============================================

-- Lectura pública de subcategorías
CREATE POLICY "Todos pueden ver subcategorias"
  ON subcategorias FOR SELECT
  USING (true);

-- Administradores pueden hacer todo con subcategorías
CREATE POLICY "Admins pueden insertar subcategorias"
  ON subcategorias FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

CREATE POLICY "Admins pueden actualizar subcategorias"
  ON subcategorias FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

CREATE POLICY "Admins pueden eliminar subcategorias"
  ON subcategorias FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );


-- ============================================
-- PASO 8: CREAR POLÍTICAS PARA CLIENTES AUTORIZADOS
-- ============================================

-- Administradores pueden ver todos los clientes
CREATE POLICY "Admins pueden ver todos los clientes"
  ON clientes_autorizados FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Clientes pueden ver solo su propio perfil
CREATE POLICY "Clientes pueden ver su propio perfil"
  ON clientes_autorizados FOR SELECT
  USING (email = auth.email());

-- Administradores pueden insertar clientes
CREATE POLICY "Admins pueden insertar clientes"
  ON clientes_autorizados FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Administradores pueden actualizar clientes
CREATE POLICY "Admins pueden actualizar clientes"
  ON clientes_autorizados FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Administradores pueden eliminar clientes
CREATE POLICY "Admins pueden eliminar clientes"
  ON clientes_autorizados FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- ============================================
-- PASO 9: CREAR POLÍTICAS PARA PRECIOS PERSONALIZADOS
-- ============================================

-- Administradores pueden ver todos los precios personalizados
CREATE POLICY "Admins pueden ver todos los precios personalizados"
  ON precios_personalizados FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Clientes pueden ver solo sus propios precios
CREATE POLICY "Clientes pueden ver sus propios precios"
  ON precios_personalizados FOR SELECT
  USING (
    cliente_id IN (
      SELECT id FROM clientes_autorizados 
      WHERE email = auth.email()
    )
  );

-- Administradores pueden insertar precios personalizados
CREATE POLICY "Admins pueden insertar precios personalizados"
  ON precios_personalizados FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Administradores pueden actualizar precios personalizados
CREATE POLICY "Admins pueden actualizar precios personalizados"
  ON precios_personalizados FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- Administradores pueden eliminar precios personalizados
CREATE POLICY "Admins pueden eliminar precios personalizados"
  ON precios_personalizados FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() AND activo = true
    )
  );

-- ============================================
-- PASO 10: CREAR POLÍTICAS PARA ADMINISTRADORES
-- ============================================

-- Administradores pueden ver otros administradores
CREATE POLICY "Admins pueden ver administradores"
  ON administradores FOR SELECT
  USING (
    auth.email() IN (
      SELECT email FROM administradores WHERE activo = true
    )
  );

-- Solo super_admin puede insertar nuevos administradores
CREATE POLICY "Solo super_admin puede insertar administradores"
  ON administradores FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() 
      AND rol = 'super_admin' 
      AND activo = true
    )
  );

-- Solo super_admin puede actualizar administradores
CREATE POLICY "Solo super_admin puede actualizar administradores"
  ON administradores FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM administradores 
      WHERE email = auth.email() 
      AND rol = 'super_admin' 
      AND activo = true
    )
  );


-- ============================================
-- PASO 11: CREAR FUNCIÓN PARA OBTENER PRECIO DE PRODUCTO
-- ============================================

-- Función que devuelve el precio correcto según el usuario
CREATE OR REPLACE FUNCTION obtener_precio_producto(
  p_producto_id INTEGER,
  p_cliente_email TEXT DEFAULT NULL
)
RETURNS TABLE (
  precio_detal NUMERIC,
  precio_mayor NUMERIC,
  precio_personalizado NUMERIC,
  tiene_precio_personalizado BOOLEAN
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    p.precio_detal,
    p.precio_mayor,
    COALESCE(pp.precio_personalizado, p.precio_detal) as precio_personalizado,
    (pp.id IS NOT NULL) as tiene_precio_personalizado
  FROM productos p
  LEFT JOIN precios_personalizados pp ON (
    pp.producto_id = p.id 
    AND pp.activo = true
    AND pp.cliente_id = (
      SELECT id FROM clientes_autorizados 
      WHERE email = p_cliente_email
    )
  )
  WHERE p.id = p_producto_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- PASO 12: CREAR VISTA PARA PRODUCTOS CON PRECIOS
-- ============================================

-- Vista que muestra productos con información completa
-- NOTA: Ajustar según las columnas reales de tu tabla productos
CREATE OR REPLACE VIEW vista_productos_completa AS
SELECT 
  p.id,
  p.codigo,
  p.nombre,
  p.descripcion,
  p.precio_detal,
  p.precio_mayor,
  p.stock,
  p.imagen,
  p.activo,
  p.created_at,
  p.subcategoria_id,
  s.nombre as subcategoria_nombre,
  s.categoria_id,
  c.nombre as categoria_nombre,
  c.icono as categoria_icono
FROM productos p
LEFT JOIN subcategorias s ON p.subcategoria_id = s.id
LEFT JOIN categorias c ON s.categoria_id = c.id;

-- ============================================
-- PASO 13: CREAR TRIGGER PARA UPDATED_AT
-- ============================================

-- Función para actualizar updated_at
CREATE OR REPLACE FUNCTION actualizar_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para precios_personalizados
DROP TRIGGER IF EXISTS trigger_actualizar_precios_updated_at ON precios_personalizados;
CREATE TRIGGER trigger_actualizar_precios_updated_at
  BEFORE UPDATE ON precios_personalizados
  FOR EACH ROW
  EXECUTE FUNCTION actualizar_updated_at();

-- ============================================
-- PASO 14: INSERTAR DATOS DE EJEMPLO (OPCIONAL)
-- ============================================

-- Comentar/descomentar según necesites

-- Ejemplo de precio personalizado
-- INSERT INTO precios_personalizados (cliente_id, producto_id, precio_personalizado, descuento_porcentaje)
-- VALUES (
--   (SELECT id FROM clientes_autorizados WHERE email = 'cliente@ejemplo.com'),
--   (SELECT id FROM productos WHERE codigo = 'PROD001'),
--   45.99,
--   10.00
-- );

-- ============================================
-- PASO 15: VERIFICACIÓN FINAL
-- ============================================

-- Verificar que todas las tablas tengan RLS habilitado
SELECT 
  schemaname, 
  tablename, 
  rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename IN ('productos', 'categorias', 'subcategorias', 'clientes_autorizados', 'precios_personalizados', 'administradores');

-- Verificar políticas creadas
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, policyname;

-- ============================================
-- NOTAS IMPORTANTES
-- ============================================

/*
1. PRECIOS PERSONALIZADOS:
   - Cada cliente autorizado puede tener precios diferentes para cada producto
   - Los administradores gestionan estos precios desde el panel
   - Los clientes solo ven sus propios precios personalizados

2. SEGURIDAD:
   - RLS está habilitado en todas las tablas
   - Los administradores tienen acceso completo
   - Los clientes solo ven sus propios datos
   - El público solo ve productos y categorías activas

3. FUNCIONALIDAD:
   - Use la función obtener_precio_producto() para obtener el precio correcto
   - La vista vista_productos_completa facilita consultas complejas
   - El trigger actualiza automáticamente updated_at

4. PRÓXIMOS PASOS:
   - Crear interfaz en el panel de admin para gestionar precios personalizados
   - Implementar sistema de descuentos por volumen
   - Agregar historial de cambios de precios
*/
