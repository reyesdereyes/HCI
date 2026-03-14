// Configuración de WhatsApp
// Formato: código de país + número sin espacios, guiones ni paréntesis
// Ejemplo: +58 412-123-4567 → 584121234567

export const WHATSAPP_CONFIG = {
  // Número principal de ventas
  numero: '584121234567', // REEMPLAZAR CON TU NÚMERO REAL
  
  // Mensaje de bienvenida (opcional)
  mensajeBienvenida: '¡Hola! Me gustaría solicitar una cotización.',
  
  // Horario de atención
  horario: {
    dias: 'Lunes a Viernes',
    horas: '8:00 AM - 6:00 PM'
  }
};

// Función helper para formatear mensajes
export const formatearMensajeWhatsApp = (texto) => {
  return encodeURIComponent(texto);
};

// Función para abrir WhatsApp
export const abrirWhatsApp = (numero, mensaje) => {
  const mensajeCodificado = formatearMensajeWhatsApp(mensaje);
  const url = `https://wa.me/${numero}?text=${mensajeCodificado}`;
  window.open(url, '_blank');
};
