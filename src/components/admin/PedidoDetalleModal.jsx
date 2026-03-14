import { X, Package, User, Mail, Phone, Calendar, DollarSign, MapPin, FileText } from 'lucide-react';
import '../../css/admin-pedido-detalle.css';

const PedidoDetalleModal = ({ pedido, isOpen, onClose }) => {
  if (!isOpen || !pedido) return null;

  const formatFecha = (fecha) => {
    return new Date(fecha).toLocaleDateString('es-VE', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  const getEstadoColor = (estado) => {
    const colors = {
      pendiente: '#f59e0b',
      aprobado: '#10b981',
      procesando: '#8b5cf6',
      enviado: '#06b6d4',
      entregado: '#10b981',
      cancelado: '#ef4444'
    };
    return colors[estado] || '#6b7280';
  };

  return (
    <>
      <div className="modal-overlay-pedido" onClick={onClose} />
      <div className="modal-pedido-detalle">
        <div className="modal-header-pedido">
          <div className="header-content">
            <Package size={28} />
            <div>
              <h2>Detalles del Pedido</h2>
              <span className="pedido-numero-modal">{pedido.numero_pedido}</span>
            </div>
          </div>
          <button className="btn-close-modal" onClick={onClose}>
            <X size={24} />
          </button>
        </div>

        <div className="modal-body-pedido">
          {/* Estado del Pedido */}
          <div className="seccion-estado">
            <div 
              className="estado-badge-grande"
              style={{ 
                background: `${getEstadoColor(pedido.estado)}20`,
                color: getEstadoColor(pedido.estado),
                borderColor: getEstadoColor(pedido.estado)
              }}
            >
              {pedido.estado.toUpperCase()}
            </div>
          </div>

          {/* Información del Cliente */}
          <div className="seccion-info">
            <h3><User size={20} /> Información del Cliente</h3>
            <div className="info-grid">
              <div className="info-item">
                <User size={16} />
                <div>
                  <span className="info-label">Nombre</span>
                  <span className="info-value">{pedido.cliente_nombre}</span>
                </div>
              </div>
              <div className="info-item">
                <Mail size={16} />
                <div>
                  <span className="info-label">Email</span>
                  <span className="info-value">{pedido.cliente_email}</span>
                </div>
              </div>
              <div className="info-item">
                <Phone size={16} />
                <div>
                  <span className="info-label">Teléfono</span>
                  <span className="info-value">{pedido.cliente_telefono}</span>
                </div>
              </div>
              <div className="info-item">
                <Calendar size={16} />
                <div>
                  <span className="info-label">Fecha del Pedido</span>
                  <span className="info-value">{formatFecha(pedido.fecha_pedido)}</span>
                </div>
              </div>
            </div>
          </div>

          {/* Productos del Pedido */}
          <div className="seccion-productos">
            <h3><Package size={20} /> Productos del Pedido</h3>
            <div className="productos-table-container">
              <table className="productos-table">
                <thead>
                  <tr>
                    <th>Producto</th>
                    <th>Código</th>
                    <th>Cantidad</th>
                    <th>Precio Unit.</th>
                    <th>Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                  {pedido.pedido_items?.map((item, index) => (
                    <tr key={index}>
                      <td className="producto-nombre">{item.producto_nombre}</td>
                      <td className="producto-codigo">{item.producto_codigo}</td>
                      <td className="producto-cantidad">{item.cantidad}</td>
                      <td className="producto-precio">${item.precio_unitario.toLocaleString()}</td>
                      <td className="producto-subtotal">${item.subtotal.toLocaleString()}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>

          {/* Totales */}
          <div className="seccion-totales">
            <div className="total-row">
              <span className="total-label">Total del Pedido:</span>
              <span className="total-value">${pedido.total.toLocaleString()}</span>
            </div>
          </div>

          {/* Notas adicionales */}
          {pedido.notas && (
            <div className="seccion-notas">
              <h3><FileText size={20} /> Notas del Cliente</h3>
              <p className="notas-texto">{pedido.notas}</p>
            </div>
          )}
        </div>

        <div className="modal-footer-pedido">
          <button className="btn-secondary" onClick={onClose}>
            Cerrar
          </button>
        </div>
      </div>
    </>
  );
};

export default PedidoDetalleModal;
