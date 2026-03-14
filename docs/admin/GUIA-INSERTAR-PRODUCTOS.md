# Guía para Insertar Productos en Supabase

## Problema
El script `INSERTAR-PRODUCTOS-COMPLETOS.sql` es muy grande y causa errores de sintaxis en Supabase.

## Solución: Ejecutar por Secciones

### Paso 1: Eliminar Productos Existentes
1. Abre Supabase SQL Editor
2. Ejecuta el script `EJECUTAR-AHORA-ELIMINAR-TODO.sql`
3. Verifica que se eliminaron todos los productos

### Paso 2: Insertar Productos por Secciones

Abre el archivo `INSERTAR-PRODUCTOS-COMPLETOS.sql` y copia/pega SOLO UNA SECCIÓN a la vez:

#### Sección 1: Ángulos y Accesorios
```sql
-- Copia desde "ÁNGULOS PARA WALLPANEL EXTERIOR" 
-- hasta "ACCESORIOS PARA TECHO"
-- (aproximadamente líneas 30-80)
```

#### Sección 2: Determinaciones y Grama
```sql
-- Copia desde "DETERMINACIONES DE WALLPANEL"
-- hasta "JARDÍN VERTICAL"
-- (aproximadamente líneas 80-150)
```

#### Sección 3: Láminas PVC
```sql
-- Copia desde "LÁMINAS PVC"
-- hasta el final de esa sección
-- (aproximadamente líneas 150-200)
```

#### Sección 4: Láminas WPC, Bamboo y Madera
```sql
-- Copia desde "LÁMINAS WPC"
-- hasta "MADERA ASERRADA"
```

#### Sección 5: Papel Tapiz y Pisos
```sql
-- Copia desde "PAPEL TAPIZ"
-- hasta "PISOS ADHESIVOS"
```

#### Sección 6: Rodapiés y Separadores
```sql
-- Copia desde "RODAPIÉS"
-- hasta "SEPARADORES DE ESPACIO"
```

#### Sección 7: Wall Panel Exterior
```sql
-- Copia desde "WALL PANEL EXTERIOR"
-- hasta el final de esa sección
```

#### Sección 8: Wall Panel Interior
```sql
-- Copia desde "WALL PANEL INTERIOR"
-- hasta "WALL PANEL PS INTERIOR"
```

#### Sección 9: Wall Panel Liso y Cielo Raso
```sql
-- Copia desde "WALL PANEL LISO"
-- hasta "CIELO RASO"
```

#### Sección 10: Productos Finales
```sql
-- Copia desde "PIEZAS 3D"
-- hasta "STAIR BOARD Y STAIR RISER"
```

### Paso 3: Verificar
Después de insertar todas las secciones, ejecuta:

```sql
-- Ver total de productos
SELECT COUNT(*) as total_productos FROM productos;

-- Ver productos por subcategoría
SELECT 
  s.nombre as subcategoria,
  COUNT(p.id) as cantidad_productos
FROM subcategorias s
LEFT JOIN productos p ON p.subcategoria_id = s.id
GROUP BY s.nombre
ORDER BY cantidad_productos DESC;
```

## Alternativa Rápida

Si prefieres un script más pequeño para probar, usa:
- `INSERTAR-TODOS-LOS-PRODUCTOS-SIMPLE.sql` (solo ~30 productos de muestra)

## Notas Importantes

1. **No copies todo el archivo de una vez** - Supabase tiene límites de tamaño
2. **Ejecuta sección por sección** - Espera que cada sección termine antes de la siguiente
3. **Verifica después de cada sección** - Usa `SELECT COUNT(*) FROM productos;`
4. **Si hay error** - Revisa que las subcategorías existan en tu base de datos

## Crear Subcategorías Primero

Si no tienes subcategorías creadas, ejecuta primero:

```sql
-- Ver subcategorías existentes
SELECT * FROM subcategorias;

-- Si no existen, créalas primero
INSERT INTO subcategorias (nombre, categoria_id) VALUES
('Ángulos', 1),
('Láminas PVC', 1),
('Láminas WPC', 1),
('Láminas Bamboo', 1),
('Pisos SPC', 2),
('Pisos Adhesivos', 2),
('Pisos Exteriores', 2),
('Wall Panel Exterior', 3),
('Wall Panel Interior', 3),
('Cielo Raso', 4),
('Grama Artificial', 5),
('Accesorios', 6);
```

Ajusta los `categoria_id` según tus categorías existentes.
