# Índice para Insertar Todos los Productos

## Orden de Ejecución

Ejecuta los scripts en este orden:

### 1. Limpiar Base de Datos
```
EJECUTAR-AHORA-ELIMINAR-TODO.sql
```

### 2. Productos de Wallpanel (Ejecutar en orden)
```
01-INSERTAR-ANGULOS.sql
02-INSERTAR-ACCESORIOS-DETERMINACIONES.sql
03-INSERTAR-GRAMA-JARDIN.sql
04-INSERTAR-LAMINAS.sql
05-INSERTAR-SILICONAS-ADHESIVOS.sql
06-INSERTAR-PISOS-RODAPIES.sql
07-INSERTAR-SEPARADORES.sql
08-INSERTAR-WALLPANEL-EXTERIOR.sql
09-INSERTAR-WALLPANEL-INTERIOR.sql
10-INSERTAR-WALLPANEL-PS.sql
11-INSERTAR-WALLPANEL-LISO.sql
12-INSERTAR-CIELO-PERFILES.sql
13-INSERTAR-PIEZAS-3D.sql
14-INSERTAR-STAIR.sql
```

### 3. Productos de Refrigeración (Opcional)
```
15-INSERTAR-CAPACITADORES.sql
16-INSERTAR-COMPRESORES.sql
17-INSERTAR-OTROS-REFRIGERACION.sql
```

## Total de Productos
- Wallpanel: ~350 productos
- Refrigeración: ~227 productos
- **Total: ~577 productos**

## Notas Importantes
1. Cada script verifica el conteo al final
2. Si un script falla, puedes continuar con el siguiente
3. Los códigos son únicos y no se duplicarán
4. Asegúrate de tener las subcategorías creadas primero
