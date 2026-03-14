import { useState } from 'react';
import { X, Send, User, Mail, Phone, MessageSquare, CheckCircle } from 'lucide-react';
import { useCart } from '../context/CartContext';
import { WHATSAPP_CONFIG, abrirWhatsApp } from '../config/whatsapp';
import supabase from '../conf/supabase';
import '../css/modal.css';

const ModalCotizacion = ({ isOpen, onClose }) => {
  const { cart, getCartCount, clearCart } = useCart();
  const [formData, setFormData] = useState({
    nombre: '',
    email: '',
    telefono: '',
    mensaje: ''
  });
  const [enviando, setEnviando] = useState(false);
  const [pedidoGuardado, setPedidoGuardado] = useState(false);
  const [error, setError] = useState('');

  if (!isOpen) return null;

  const generarNumeroPedido = () => {
    const fecha = new Date();
    const año = fecha.getFullYear();
    const mes = String(fecha.getMonth() + 1).padStart(2, '0');
    const dia = String(fecha.getDate()).padStart(2, '0');
    const random = Math.floor(Math.random() * 9999).toString().padStart(4, '0');
    return `PED-${año}${mes}${dia}-${random}`;
  };

  const guardarPedidoEnBD = async () => {
    try {
      // Intentar obtener usuario actual (puede ser null si no está autenticado)
      let user = null;
      try {
        const { data: { user: currentUser }, error: userError } = await supabase.auth.getUser();
        if (!userError) {
          user = currentUser;
        }
      } catch (authError) {
        // Usuario no autenticado, continuar sin user
        console.log('Usuario no autenticado, creando pedido como invitado');
      }
      
      // Calcular total (aunque sea cotización, guardamos valores de referencia)
      const subtotal = cart.reduce((sum, item) => {
        const precio = item.precio_mayor || item.precio_detal || 0;
        return sum + (precio * item.quantity);
      }, 0);

      // Crear pedido (funciona con o sin usuario autenticado)
      const numeroPedido = generarNumeroPedido();
      
      const { data: pedido, error: pedidoError } = await supabase
        .from('pedidos')
        .insert({
          numero_pedido: numeroPedido,
          cliente_id: user?.id || null, // NULL si no está autenticado
          cliente_nombre: formData.nombre,
          cliente_email: formData.email,
          cliente_telefono: formData.telefono,
          subtotal: subtotal,
          total: subtotal,
          estado: 'pendiente',
          tipo_cliente: 'detal',
          notas: formData.mensaje || 'Pedido desde web'
        })
        .select()
        .single();

      if (pedidoError) {
        console.error('Error creando pedido:', pedidoError);
        return { 
          success: false, 
          error: `Error al crear pedido: ${pedidoError.message}. Verifica que hayas ejecutado el script ARREGLAR-PERMISOS-PEDIDOS.sql` 
        };
      }

      // Crear items del pedido
      const items = cart.map(item => ({
        pedido_id: pedido.id,
        producto_id: item.id,
        producto_nombre: item.nombre,
        producto_codigo: item.codigo || null,
        cantidad: item.quantity,
        precio_unitario: item.precio_mayor || item.precio_detal || 0,
        subtotal: (item.precio_mayor || item.precio_detal || 0) * item.quantity
      }));

      const { error: itemsError } = await supabase
        .from('pedido_items')
        .insert(items);

      if (itemsError) {
        console.error('Error creando items:', itemsError);
        return { success: false, error: `Error al guardar productos: ${itemsError.message}` };
      }

      // Crear/actualizar perfil de cliente solo si está autenticado
      if (user?.id) {
        const { error: clienteError } = await supabase
          .from('clientes')
          .upsert({
            id: user.id,
            nombre_completo: formData.nombre,
            telefono: formData.telefono,
            tipo_cliente: 'detal',
            activo: true,
            fecha_registro: new Date().toISOString()
          }, {
            onConflict: 'id',
            ignoreDuplicates: false
          });

        if (clienteError) {
          console.error('Error actualizando perfil cliente:', clienteError);
          // No fallar por esto, es opcional
        }
      }

      return { success: true, numeroPedido, isGuest: !user };
    } catch (error) {
      console.error('Error guardando pedido:', error);
      return { success: false, error: error.message || 'Error desconocido' };
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setEnviando(true);
    setError('');

    // 1. Guardar pedido en base de datos
    const resultado = await guardarPedidoEnBD();
    
    if (!resultado.success) {
      setError('Error al guardar el pedido. Por favor intenta de nuevo.');
      setEnviando(false);
      return;
    }

    setPedidoGuardado(true);

    // 2. Construir mensaje para WhatsApp
    let mensaje = `*SOLICITUD DE COTIZACIÓN*\n`;
    mensaje += `📋 *Pedido:* ${resultado.numeroPedido}\n\n`;
    mensaje += `👤 *Nombre:* ${formData.nombre}\n`;
    mensaje += `📧 *Email:* ${formData.email}\n`;
    mensaje += `📱 *Teléfono:* ${formData.telefono}\n\n`;
    
    if (formData.mensaje) {
      mensaje += `💬 *Mensaje:*\n${formData.mensaje}\n\n`;
    }
    
    mensaje += `🛒 *PRODUCTOS SOLICITADOS (${getCartCount()}):*\n\n`;
    
    cart.forEach((item, index) => {
      mensaje += `${index + 1}. *${item.nombre}*\n`;
      mensaje += `   Cantidad: ${item.quantity}\n`;
      if (item.codigo) {
        mensaje += `   Código: ${item.codigo}\n`;
      }
      mensaje += `\n`;
    });

    mensaje += `\n✅ _Pedido registrado en el sistema_`;
    mensaje += `\n_Enviado desde Hitach Cool Import_`;

    // 3. Abrir WhatsApp
    abrirWhatsApp(WHATSAPP_CONFIG.numero, mensaje);

    // 4. Limpiar carrito y cerrar modal
    setTimeout(() => {
      clearCart();
      setEnviando(false);
      onClose();
      // Resetear formulario
      setFormData({
        nombre: '',
        email: '',
        telefono: '',
        mensaje: ''
      });
      setPedidoGuardado(false);
    }, 2000);
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content modal-cotizacion" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h2>Solicitar Cotización</h2>
          <button className="btn-icon" onClick={onClose}>
            <X size={20} />
          </button>
        </div>

        <form onSubmit={handleSubmit}>
          <div className="modal-body">
            {error && (
              <div className="alert alert-error">
                {error}
              </div>
            )}

            {pedidoGuardado && (
              <div className="alert alert-success">
                <CheckCircle size={20} />
                ¡Pedido guardado exitosamente! Redirigiendo a WhatsApp...
              </div>
            )}

            <div className="cotizacion-info">
              <p>
                Completa tus datos y te enviaremos la cotización de <strong>{getCartCount()} productos</strong> directamente por WhatsApp.
              </p>
              <p className="info-note">
                📋 Tu pedido se guardará en el sistema para seguimiento.
              </p>
            </div>

            <div className="form-group">
              <label>
                <User size={16} />
                Nombre Completo *
              </label>
              <input
                type="text"
                value={formData.nombre}
                onChange={(e) => setFormData({...formData, nombre: e.target.value})}
                required
                placeholder="Ej: Juan Pérez"
                disabled={enviando}
              />
            </div>

            <div className="form-group">
              <label>
                <Mail size={16} />
                Correo Electrónico *
              </label>
              <input
                type="email"
                value={formData.email}
                onChange={(e) => setFormData({...formData, email: e.target.value})}
                required
                placeholder="ejemplo@correo.com"
                disabled={enviando}
              />
            </div>

            <div className="form-group">
              <label>
                <Phone size={16} />
                Teléfono *
              </label>
              <input
                type="tel"
                value={formData.telefono}
                onChange={(e) => setFormData({...formData, telefono: e.target.value})}
                required
                placeholder="0412-1234567"
                disabled={enviando}
              />
            </div>

            <div className="form-group">
              <label>
                <MessageSquare size={16} />
                Mensaje Adicional (Opcional)
              </label>
              <textarea
                value={formData.mensaje}
                onChange={(e) => setFormData({...formData, mensaje: e.target.value})}
                rows="3"
                placeholder="¿Alguna pregunta o comentario adicional?"
                disabled={enviando}
              />
            </div>

            <div className="productos-resumen">
              <h4>Productos a cotizar:</h4>
              <ul>
                {cart.slice(0, 3).map((item) => (
                  <li key={item.id}>
                    {item.nombre} <span>(x{item.quantity})</span>
                  </li>
                ))}
                {cart.length > 3 && (
                  <li className="mas-productos">
                    + {cart.length - 3} productos más
                  </li>
                )}
              </ul>
            </div>
          </div>

          <div className="modal-footer">
            <button type="button" className="btn-secondary" onClick={onClose} disabled={enviando}>
              Cancelar
            </button>
            <button type="submit" className="btn-whatsapp" disabled={enviando}>
              <Send size={18} />
              {enviando ? 'Guardando y enviando...' : 'Confirmar Pedido'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default ModalCotizacion;
