# 📱 Configuración de WhatsApp para Cotizaciones

## Paso 1: Configurar el Número de WhatsApp

Abre el archivo `src/config/whatsapp.js` y reemplaza el número de ejemplo con tu número real:

```javascript
export const WHATSAPP_CONFIG = {
  numero: '584121234567', // CAMBIAR ESTE NÚMERO
  // ...
};
```

### Formato del Número

El número debe estar en formato internacional SIN espacios, guiones ni paréntesis:

**Ejemplos:**

| País | Número Original | Formato Correcto |
|------|----------------|------------------|
| Venezuela | +58 412-123-4567 | `584121234567` |
| Venezuela | 0412-123-4567 | `584121234567` |
| Colombia | +57 300-123-4567 | `573001234567` |
| México | +52 55-1234-5678 | `525512345678` |
| USA | +1 (555) 123-4567 | `15551234567` |

**Fórmula:**
```
Código de país (sin +) + Número (sin 0 inicial, sin espacios, sin guiones)
```

## Paso 2: Cómo Funciona

### Flujo del Usuario:

1. Usuario navega en la página de inicio
2. Agrega productos al carrito de cotización
3. Click en "Solicitar Cotización"
4. Se abre un modal pidiendo sus datos:
   - Nombre completo
   - Email
   - Teléfono
   - Mensaje adicional (opcional)
5. Click en "Enviar por WhatsApp"
6. Se abre WhatsApp con un mensaje pre-formateado

### Mensaje que se Envía:

```
*SOLICITUD DE COTIZACIÓN*

👤 *Nombre:* Juan Pérez
📧 *Email:* juan@ejemplo.com
📱 *Teléfono:* 0412-1234567

💬 *Mensaje:*
Necesito los productos para un proyecto

🛒 *PRODUCTOS SOLICITADOS (3):*

1. *Cerámica Premium 60x60*
   Cantidad: 10

2. *Pintura Latex Blanco*
   Cantidad: 5

3. *Adhesivo para Cerámica*
   Cantidad: 2

_Enviado desde Hitach Cool Import_
```

## Paso 3: Verificar que Funciona

### Prueba Local:

1. Agrega productos al carrito
2. Click en "Solicitar Cotización"
3. Llena el formulario
4. Click en "Enviar por WhatsApp"
5. Debe abrir WhatsApp Web o la app con el mensaje

### Solución de Problemas:

**Problema:** No abre WhatsApp
- Verifica que el número esté en formato correcto
- Verifica que WhatsApp esté instalado o WhatsApp Web funcione
- Prueba en otro navegador

**Problema:** El mensaje no se ve bien
- Verifica que los productos tengan nombre
- Verifica que la cantidad sea válida

**Problema:** Abre WhatsApp pero sin mensaje
- Verifica que el número no tenga espacios ni caracteres especiales
- Verifica que la función `formatearMensajeWhatsApp` esté funcionando

## Paso 4: Personalizar el Mensaje

Puedes personalizar el mensaje editando `src/components/ModalCotizacion.jsx`:

```javascript
// Línea donde se construye el mensaje
let mensaje = `*SOLICITUD DE COTIZACIÓN*\n\n`;
mensaje += `👤 *Nombre:* ${formData.nombre}\n`;
// ... personaliza aquí
```

### Formato de WhatsApp:

- `*texto*` = **negrita**
- `_texto_` = _cursiva_
- `~texto~` = ~~tachado~~
- ` ```texto``` ` = `código`
- `\n` = salto de línea

## Paso 5: Múltiples Números (Opcional)

Si quieres tener diferentes números para diferentes departamentos:

```javascript
export const WHATSAPP_CONFIG = {
  ventas: '584121234567',
  soporte: '584129876543',
  mayorista: '584121111111'
};
```

Y en el modal, selecciona según el tipo de consulta.

## Paso 6: Horario de Atención

Puedes mostrar el horario de atención en el modal:

```javascript
export const WHATSAPP_CONFIG = {
  numero: '584121234567',
  horario: {
    dias: 'Lunes a Viernes',
    horas: '8:00 AM - 6:00 PM'
  }
};
```

## Paso 7: Respuestas Automáticas (Opcional)

Configura respuestas automáticas en WhatsApp Business:

1. Mensaje de bienvenida
2. Mensaje fuera de horario
3. Respuestas rápidas para preguntas frecuentes

## Ventajas de Este Sistema:

✅ No requiere backend
✅ No requiere API de WhatsApp
✅ Funciona en cualquier dispositivo
✅ El cliente ve el mensaje antes de enviar
✅ Puedes copiar/pegar el mensaje si prefieres
✅ Funciona con WhatsApp Web y App móvil
✅ Gratis, sin costos adicionales

## Limitaciones:

⚠️ Requiere que el usuario tenga WhatsApp instalado
⚠️ El usuario debe confirmar el envío manualmente
⚠️ No hay confirmación automática de recepción
⚠️ No se guarda historial en tu base de datos

## Mejoras Futuras:

- [ ] Guardar cotizaciones en Supabase
- [ ] Enviar copia por email
- [ ] Integrar WhatsApp Business API
- [ ] Respuestas automáticas
- [ ] Chatbot para preguntas frecuentes

---

**¡Listo!** Ahora los clientes pueden solicitar cotizaciones directamente por WhatsApp.
