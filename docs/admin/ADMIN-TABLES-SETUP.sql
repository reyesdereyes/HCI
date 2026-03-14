-- ============================================
-- TABLAS PARA FUNCIONALIDADES DE ADMIN
-- ============================================
-- Ejecuta este script en Supabase SQL Editor

-- 1. TABLA DE PEDIDOS
CREATE TABLE IF NOT EXISTS pedidos (
    id SERIAL PRIMARY KEY,
    numero_pedido VARCHAR(50) UNIQUE NOT NULL,
    cliente_id UUID REFERENCES auth.users(id),
    cliente_nombre VARCHAR(255),
    cliente_email VARCHAR(255),
    cliente_telefono VARCHAR(50),
    cliente_direccion TEXT,
    subtotal DECIMAL(10, 2) NOT NULL DEFAULT 0,
    descuento DECIMAL(10, 2) DEFAULT 0,
    total DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50) DEFAULT 'pendiente', -- pendiente, aprobado, procesando, enviado, entregado, cancelado
    tipo_cliente VARCHAR(20) DEFAULT 'detal', -- detal, mayor
    notas TEXT,
    fecha_pedido TIMESTAMP DEFAULT NOW(),
    fecha_actualizado TIMESTAMP DEFAULT NOW(),
    created_at TIMESTAMP DEFAULT NOW()
);

-- 2. TABLA DE ITEMS DEL PEDIDO
CREATE TABLE IF NOT EXISTS pedido_items (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER REFERENCES pedidos(id) ON DELETE CASCADE,
    producto_id INTEGER REFERENCES productos(id),
    producto_nombre VARCHAR(255) NOT NULL,
    producto_codigo VARCHAR(100),
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- 3. TABLA DE PROMOCIONES
CREATE TABLE IF NOT EXISTS promociones (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(50) NOT NULL, -- porcentaje, monto_fijo, 2x1, envio_gratis
    valor DECIMAL(10, 2), -- porcentaje o monto
    codigo VARCHAR(50) UNIQUE,
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP NOT NULL,
    activo BOOLEAN DEFAULT true,
    uso_maximo INTEGER, -- null = ilimitado
    uso_actual INTEGER DEFAULT 0,
    minimo_compra DECIMAL(10, 2), -- monto mínimo para aplicar
    aplica_productos INTEGER[], -- IDs de productos específicos, null = todos
    aplica_categorias INTEGER[], -- IDs de categorías, null = todas
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- 4. TABLA DE ALERTAS DE INVENTARIO
CREATE TABLE IF NOT EXISTS alertas_inventario (
    id SERIAL PRIMARY KEY,
    producto_id INTEGER REFERENCES productos(id) ON DELETE CASCADE,
    tipo VARCHAR(50) NOT NULL, -- stock_bajo, sin_stock, reabastecimiento
    mensaje TEXT NOT NULL,
    leido BOOLEAN DEFAULT false,
    fecha_alerta TIMESTAMP DEFAULT NOW(),
    created_at TIMESTAMP DEFAULT NOW()
);

-- 5. TABLA DE HISTORIAL DE STOCK
CREATE TABLE IF NOT EXISTS historial_stock (
    id SERIAL PRIMARY KEY,
    producto_id INTEGER REFERENCES productos(id) ON DELETE CASCADE,
    cantidad_anterior INTEGER NOT NULL,
    cantidad_nueva INTEGER NOT NULL,
    diferencia INTEGER NOT NULL,
    tipo_movimiento VARCHAR(50) NOT NULL, -- entrada, salida, ajuste, venta
    motivo TEXT,
    usuario_id UUID REFERENCES auth.users(id),
    created_at TIMESTAMP DEFAULT NOW()
);

-- 6. TABLA DE CLIENTES (perfil extendido)
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

-- 7. ÍNDICES PARA MEJOR RENDIMIENTO
CREATE INDEX IF NOT EXISTS idx_pedidos_estado ON pedidos(estado);
CREATE INDEX IF NOT EXISTS idx_pedidos_cliente ON pedidos(cliente_id);
CREATE INDEX IF NOT EXISTS idx_pedidos_fecha ON pedidos(fecha_pedido);
CREATE INDEX IF NOT EXISTS idx_pedido_items_pedido ON pedido_items(pedido_id);
CREATE INDEX IF NOT EXISTS idx_pedido_items_producto ON pedido_items(producto_id);
CREATE INDEX IF NOT EXISTS idx_promociones_activo ON promociones(activo);
CREATE INDEX IF NOT EXISTS idx_promociones_codigo ON promociones(codigo);
CREATE INDEX IF NOT EXISTS idx_alertas_leido ON alertas_inventario(leido);
CREATE INDEX IF NOT EXISTS idx_historial_producto ON historial_stock(producto_id);

-- 8. FUNCIÓN PARA GENERAR NÚMERO DE PEDIDO
CREATE OR REPLACE FUNCTION generar_numero_pedido()
RETURNS VARCHAR(50) AS $$
DECLARE
    nuevo_numero VARCHAR(50);
    contador INTEGER;
BEGIN
    SELECT COUNT(*) + 1 INTO contador FROM pedidos;
    nuevo_numero := 'PED-' || TO_CHAR(NOW(), 'YYYYMMDD') || '-' || LPAD(contador::TEXT, 4, '0');
    RETURN nuevo_numero;
END;
$$ LANGUAGE plpgsql;

-- 9. FUNCIÓN PARA CREAR ALERTA DE STOCK BAJO
CREATE OR REPLACE FUNCTION verificar_stock_bajo()
RETURNS TRIGGER AS $$
BEGIN
    -- Si el stock es menor o igual a 10, crear alerta
    IF NEW.stock <= 10 AND NEW.stock > 0 THEN
        INSERT INTO alertas_inventario (producto_id, tipo, mensaje)
        VALUES (
            NEW.id,
            'stock_bajo',
            'El producto "' || NEW.nombre || '" tiene stock bajo (' || NEW.stock || ' unidades)'
        )
        ON CONFLICT DO NOTHING;
    END IF;
    
    -- Si el stock es 0, crear alerta de sin stock
    IF NEW.stock = 0 THEN
        INSERT INTO alertas_inventario (producto_id, tipo, mensaje)
        VALUES (
            NEW.id,
            'sin_stock',
            'El producto "' || NEW.nombre || '" está sin stock'
        )
        ON CONFLICT DO NOTHING;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 10. TRIGGER PARA ALERTAS DE STOCK
DROP TRIGGER IF EXISTS trigger_verificar_stock ON productos;
CREATE TRIGGER trigger_verificar_stock
    AFTER UPDATE OF stock ON productos
    FOR EACH ROW
    WHEN (OLD.stock IS DISTINCT FROM NEW.stock)
    EXECUTE FUNCTION verificar_stock_bajo();

-- 11. FUNCIÓN PARA REGISTRAR HISTORIAL DE STOCK
CREATE OR REPLACE FUNCTION registrar_historial_stock()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.stock IS DISTINCT FROM NEW.stock THEN
        INSERT INTO historial_stock (
            producto_id,
            cantidad_anterior,
            cantidad_nueva,
            diferencia,
            tipo_movimiento,
            motivo
        ) VALUES (
            NEW.id,
            OLD.stock,
            NEW.stock,
            NEW.stock - OLD.stock,
            CASE 
                WHEN NEW.stock > OLD.stock THEN 'entrada'
                WHEN NEW.stock < OLD.stock THEN 'salida'
                ELSE 'ajuste'
            END,
            'Actualización manual'
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 12. TRIGGER PARA HISTORIAL DE STOCK
DROP TRIGGER IF EXISTS trigger_historial_stock ON productos;
CREATE TRIGGER trigger_historial_stock
    AFTER UPDATE OF stock ON productos
    FOR EACH ROW
    WHEN (OLD.stock IS DISTINCT FROM NEW.stock)
    EXECUTE FUNCTION registrar_historial_stock();

-- 13. RLS POLICIES (Row Level Security)

-- Pedidos: Admin puede ver todos, usuarios solo los suyos
ALTER TABLE pedidos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admin puede ver todos los pedidos"
    ON pedidos FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

CREATE POLICY "Usuarios pueden ver sus propios pedidos"
    ON pedidos FOR SELECT
    TO authenticated
    USING (cliente_id = auth.uid());

CREATE POLICY "Admin puede insertar pedidos"
    ON pedidos FOR INSERT
    TO authenticated
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

CREATE POLICY "Admin puede actualizar pedidos"
    ON pedidos FOR UPDATE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Pedido Items: Mismo que pedidos
ALTER TABLE pedido_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admin puede ver todos los items"
    ON pedido_items FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Promociones: Admin puede todo, público puede ver activas
ALTER TABLE promociones ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Todos pueden ver promociones activas"
    ON promociones FOR SELECT
    TO authenticated
    USING (activo = true);

CREATE POLICY "Admin puede gestionar promociones"
    ON promociones FOR ALL
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Alertas: Solo admin
ALTER TABLE alertas_inventario ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admin puede ver alertas"
    ON alertas_inventario FOR ALL
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Historial Stock: Solo admin
ALTER TABLE historial_stock ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admin puede ver historial"
    ON historial_stock FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

-- Clientes: Admin puede ver todos, usuarios solo su perfil
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admin puede ver todos los clientes"
    ON clientes FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM administradores
            WHERE administradores.email = auth.email()
            AND administradores.activo = true
        )
    );

CREATE POLICY "Usuarios pueden ver su propio perfil"
    ON clientes FOR SELECT
    TO authenticated
    USING (id = auth.uid());

CREATE POLICY "Usuarios pueden actualizar su propio perfil"
    ON clientes FOR UPDATE
    TO authenticated
    USING (id = auth.uid());

-- 14. DATOS DE EJEMPLO (OPCIONAL)
-- Insertar algunos pedidos de ejemplo
INSERT INTO pedidos (numero_pedido, cliente_nombre, cliente_email, cliente_telefono, total, estado)
VALUES 
    ('PED-20260313-0001', 'Juan Pérez', 'juan@example.com', '0414-1234567', 1500.00, 'pendiente'),
    ('PED-20260313-0002', 'María González', 'maria@example.com', '0424-7654321', 2300.00, 'aprobado'),
    ('PED-20260312-0003', 'Carlos Rodríguez', 'carlos@example.com', '0412-9876543', 890.00, 'entregado');

COMMENT ON TABLE pedidos IS 'Tabla de pedidos de clientes';
COMMENT ON TABLE pedido_items IS 'Items individuales de cada pedido';
COMMENT ON TABLE promociones IS 'Promociones y descuentos';
COMMENT ON TABLE alertas_inventario IS 'Alertas automáticas de inventario';
COMMENT ON TABLE historial_stock IS 'Historial de movimientos de stock';
COMMENT ON TABLE clientes IS 'Perfil extendido de clientes';
