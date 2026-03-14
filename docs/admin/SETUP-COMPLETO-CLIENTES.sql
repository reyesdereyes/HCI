-- =====================================================
-- SETUP COMPLETO DE TABLA CLIENTES
-- =====================================================
-- Ejecutar este script en el SQL Editor de Supabase
-- para configurar completamente la tabla clientes

-- PASO 1: Verificar estructura actual
SELECT 'PASO 1: Verificando estructura actual...' as paso;

SELECT 
    column_name, 
    data_type
FROM information_schema.columns
WHERE table_name = 'clientes'
ORDER BY ordinal_position;

-- PASO 2: Asegurar que la tabla existe con la estructura correcta
SELECT 'PASO 2: Verificando/Creando tabla clientes...' as paso;

CREATE TABLE IF NOT EXISTS clientes (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    nombre_completo VARCHAR(255),
    empresa VARCHAR(255),
    rif VARCHAR(50),
    telefono VARCHAR(50),
    direccion TEXT,
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    codigo_postal VARCHAR(20),
    tipo_cliente VARCHAR(20) DEFAULT 'detal',
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

-- PASO 3: Crear índices
SELECT 'PASO 3: Creando índices...' as paso;

CREATE INDEX IF NOT EXISTS idx_clientes_tipo ON clientes(tipo_cliente);
CREATE INDEX IF NOT EXISTS idx_clientes_activo ON clientes(activo);
CREATE INDEX IF NOT EXISTS idx_clientes_fecha_registro ON clientes(fecha_registro);

-- PASO 4: Configurar RLS
SELECT 'PASO 4: Configurando Row Level Security...' as paso;

ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;

-- PASO 5: Eliminar políticas antiguas
SELECT 'PASO 5: Limpiando políticas antiguas...' as paso;

DROP POLICY IF EXISTS "Usuarios pueden ver su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden actualizar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Usuarios pueden insertar su propio perfil" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden ver todos los clientes" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden actualizar todos los clientes" ON clientes;
DROP POLICY IF EXISTS "Administradores pueden insertar clientes" ON clientes;

-- PASO 6: Crear nuevas políticas
SELECT 'PASO 6: Creando políticas de seguridad...' as paso;

-- Usuarios pueden gestionar su propio perfil
CREATE POLICY "Usuarios pueden ver su propio perfil"
ON clientes FOR SELECT
TO authenticated
USING (auth.uid() = id);

CREATE POLICY "Usuarios pueden actualizar su propio perfil"
ON clientes FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

CREATE POLICY "Usuarios pueden insertar su propio perfil"
ON clientes FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = id);

-- Administradores pueden gestionar todos los clientes
CREATE POLICY "Administradores pueden ver todos los clientes"
ON clientes FOR SELECT
TO authenticated
USING (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

CREATE POLICY "Administradores pueden actualizar todos los clientes"
ON clientes FOR UPDATE
TO authenticated
USING (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

CREATE POLICY "Administradores pueden insertar clientes"
ON clientes FOR INSERT
TO authenticated
WITH CHECK (
    EXISTS (
        SELECT 1 FROM administradores
        WHERE administradores.user_id = auth.uid()
        AND administradores.activo = true
    )
);

-- PASO 7: Otorgar permisos
SELECT 'PASO 7: Otorgando permisos...' as paso;

GRANT SELECT, INSERT, UPDATE ON clientes TO authenticated;
GRANT USAGE ON SCHEMA public TO authenticated;

-- PASO 8: Sincronizar usuarios existentes
SELECT 'PASO 8: Sincronizando usuarios con clientes...' as paso;

INSERT INTO clientes (
    id,
    nombre_completo,
    telefono,
    tipo_cliente,
    activo,
    fecha_registro
)
SELECT 
    u.id,
    COALESCE(
        u.raw_user_meta_data->>'full_name',
        u.raw_user_meta_data->>'nombre_completo',
        u.email
    ) as nombre_completo,
    u.raw_user_meta_data->>'phone' as telefono,
    'detal' as tipo_cliente,
    true as activo,
    u.created_at as fecha_registro
FROM auth.users u
LEFT JOIN clientes c ON u.id = c.id
WHERE c.id IS NULL
ON CONFLICT (id) DO NOTHING;

-- PASO 9: Crear función para actualizar updated_at
SELECT 'PASO 9: Creando función de actualización automática...' as paso;

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_clientes_updated_at ON clientes;
CREATE TRIGGER update_clientes_updated_at
    BEFORE UPDATE ON clientes
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- PASO 10: Verificación final
SELECT 'PASO 10: Verificación final...' as paso;

SELECT 
    'Setup completado exitosamente' as mensaje,
    COUNT(*) as total_clientes,
    COUNT(CASE WHEN activo = true THEN 1 END) as clientes_activos,
    COUNT(CASE WHEN tipo_cliente = 'detal' THEN 1 END) as clientes_detal,
    COUNT(CASE WHEN tipo_cliente = 'mayor' THEN 1 END) as clientes_mayor
FROM clientes;

-- Ver algunos registros
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
