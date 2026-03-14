-- ============================================
-- SCRIPT DE CONFIGURACIÓN PARA SUPABASE
-- ============================================

-- 1. CREAR TABLA CATEGORIAS
CREATE TABLE IF NOT EXISTS categorias (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nombre TEXT NOT NULL,
  icono TEXT,
  orden INTEGER DEFAULT 1,
  activo BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. CREAR TABLA SUBCATEGORIAS
CREATE TABLE IF NOT EXISTS subcategorias (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nombre TEXT NOT NULL,
  categoria_id UUID REFERENCES categorias(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. CREAR TABLA PRODUCTOS
CREATE TABLE IF NOT EXISTS productos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  codigo TEXT,
  nombre TEXT NOT NULL,
  descripcion TEXT,
  precio_detal NUMERIC(10,2),
  precio_mayor NUMERIC(10,2),
  stock INTEGER DEFAULT 0,
  categoria_id UUID REFERENCES categorias(id) ON DELETE SET NULL,
  subcategoria_id UUID REFERENCES subcategorias(id) ON DELETE SET NULL,
  imagen TEXT,
  activo BOOLEAN DEFAULT true,
  cantidad_minima_mayor INTEGER DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. HABILITAR RLS (Row Level Security)
ALTER TABLE categorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE subcategorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE productos ENABLE ROW LEVEL SECURITY;

-- 5. POLICIES PARA LECTURA PÚBLICA
CREATE POLICY "Permitir lectura pública de categorias"
  ON categorias FOR SELECT
  USING (true);

CREATE POLICY "Permitir lectura pública de subcategorias"
  ON subcategorias FOR SELECT
  USING (true);

CREATE POLICY "Permitir lectura pública de productos"
  ON productos FOR SELECT
  USING (true);


-- 6. POLICIES PARA ADMINISTRADORES (INSERT, UPDATE, DELETE)
CREATE POLICY "Admins pueden insertar categorias"
  ON categorias FOR INSERT
  WITH CHECK (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden actualizar categorias"
  ON categorias FOR UPDATE
  USING (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden eliminar categorias"
  ON categorias FOR DELETE
  USING (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden insertar subcategorias"
  ON subcategorias FOR INSERT
  WITH CHECK (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden actualizar subcategorias"
  ON subcategorias FOR UPDATE
  USING (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden eliminar subcategorias"
  ON subcategorias FOR DELETE
  USING (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden insertar productos"
  ON productos FOR INSERT
  WITH CHECK (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden actualizar productos"
  ON productos FOR UPDATE
  USING (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );

CREATE POLICY "Admins pueden eliminar productos"
  ON productos FOR DELETE
  USING (
    auth.email() IN (SELECT email FROM administradores WHERE activo = true)
  );
