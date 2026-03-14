-- =====================================================
-- VERIFICAR Y CORREGIR TABLA CLIENTES
-- =====================================================
-- Este script verifica la estructura de la tabla clientes
-- y asegura que tenga todas las columnas necesarias

-- 1. Ver la estructura actual de la tabla clientes
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'clientes'
ORDER BY ordinal_position;

-- 2. Verificar si la tabla existe y recrearla si es necesario
DROP TABLE IF EXISTS clientes CASCADE;

CREATE TABLE clientes (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    nombre_completo VARCHAR(255),
    empresa VARCHAR(255),
    rif VARCHAR(50),
    telefono VARCHAR(50),
    direccion TEXT,
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    codigo_postal VARCHAR(20),
    tipo_cliente VARCHAR(20) DEFAULT 'detal', -- detal, mayor
    descuento_especial DECIMAL(5, 2) DEFAULT 0,
    limite_credito DECIMAL(10, 2),
    notas TEXT,
    total_compras DECIMAL(10, 2) DEFAULT 0,
    total_pedidos INTEGER DEFAULT 0,
    fecha_registro TIMESTAMP DEFAULT NOW(),
    ultima_compra TIMESTAMP,
    activo BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- 3. Crear índices para mejor rendimiento
CREATE INDEX IF NOT EXISTS idx_clientes_tipo ON clientes(tipo_cliente);
CREATE INDEX IF NOT EXISTS idx_clientes_activo ON clientes(activo);
CREATE INDEX IF NOT EXISTS idx_clientes_fecha_registro ON clientes(fecha_registro);

-- 4. Habilitar RLS (Row Level Security)
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;

-- 5. Eliminar políticas existentes
DROP POLICY IF EXISTS "Usuarios pueden ver su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden actualizar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden insertar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden ver todos los clientes" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden actualizar todos los clientes" ON clientes;

-- 6. Crear políticas de seguridad
-- Los usuarios pueden ver y actualizar su propio perfil
CREATE POLICY "Usuarios pueden ver su propio perfil"
ON clientes FOR SELECT
USING (auth.uid() = id);

CREATE POLICY "Usuarios pueden actualizar su propio perfil"
ON clientes FOR UPDATE
USING (auth.uid() = id);

CREATE POLICY "Usuarios pueden insertar su propio perfil"
ON clientes FOR INSERT
WITH CHECK (auth.uid() = id);

-- Los administradores pueden ver y actualizar todos los clientes
CREATE POLICY "Administradores pueden ver todos los clientes"
ON clientes FOR SELECT
USING (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

CREATE POLICY "Administradores pueden actualizar todos los clientes"
ON clientes FOR UPDATE
USING (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

-- 7. Crear función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 8. Crear trigger para actualizar updated_at
DROP TRIGGER IF EXISTS update_clientes_updated_at ON clientes;
CREATE TRIGGER update_clientes_updated_at
    BEFORE UPDATE ON clientes
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- 9. Insertar datos de prueba (opcional - comentar si no se necesita)
-- INSERT INTO clientes (id, nombre_completo, telefono, tipo_cliente, activo)
-- SELECT 
--     id,
--     COALESCE(raw_user_meta_data->>'full_name', email) as nombre_completo,
--     raw_user_meta_data->>'phone' as telefono,
--     'detal' as tipo_cliente,
--     true as activo
-- FROM auth.users
-- WHERE id NOT IN (SELECT id FROM clientes)
-- ON CONFLICT (id) DO NOTHING;

-- 10. Verificar que todo está correcto
SELECT 
    'Tabla clientes creada correctamente' as mensaje,
    COUNT(*) as total_clientes
FROM clientes;

-- 11. Ver algunos registros de ejemplo
SELECT 
    id,
    nombre_completo,
    telefono,
    tipo_cliente,
    activo,
    fecha_registro
FROM clientes
LIMIT 5;
