import { X, User, Mail, Phone, MapPin, Building, FileText, Calendar, TrendingUp, DollarSign, Percent } from 'lucide-react';
import '../../css/admin-cliente-detalle.css';

const ClienteDetalleModal = ({ cliente, isOpen, onClose }) => {
  if (!isOpen || !cliente) return null;

  const formatFecha = (fecha) => {
    if (!fecha) return 'N/A';
    return new Date(fecha).toLocaleDateString('es-VE', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  return (
    <>
      <div className="modal-overlay-cliente" onClick={onClose} />
      <div className="modal-cliente-detalle">
        <div className="modal-header-cliente">
          <div className="header-content">
            <div className="cliente-avatar-grande">
              {cliente.nombre_completo?.charAt(0) || 'C'}
            </div>
            <div>
              <h2>{cliente.nombre_completo || 'Sin nombre'}</h2>
              <span className={`tipo-badge-modal tipo-${cliente.tipo_cliente}`}>
                {cliente.tipo_cliente === 'mayor' ? 'Cliente Mayorista' : 'Cliente Detal'}
              </span>
            </div>
          </div>
          <button className="btn-close-modal" onClick={onClose}>
            <X size={24} />
          </button>
        </div>

        <div className="modal-body-cliente">
          {/* Información Personal */}
          <div className="seccion-info">
            <h3><User size={20} /> Información Personal</h3>
            <div className="info-grid">
              <div className="info-item">
                <User size={16} />
                <div>
                  <span className="info-label">Nombre Completo</span>
                  <span className="info-value">{cliente.nombre_completo || 'N/A'}</span>
                </div>
              </div>
              <div className="info-item">
                <Mail size={16} />
                <div>
                  <span className="info-label">Email</span>
                  <span className="info-value">{cliente.email || 'N/A'}</span>
                </div>
              </div>
              <div className="info-item">
                <Phone size={16} />
                <div>
                  <span className="info-label">Teléfono</span>
                  <span className="info-value">{cliente.telefono || 'N/A'}</span>
                </div>
              </div>
              <div className="info-item">
                <Calendar size={16} />
                <div>
                  <span className="info-label">Fecha de Registro</span>
                  <span className="info-value">{formatFecha(cliente.fecha_registro)}</span>
                </div>
              </div>
            </div>
          </div>

          {/* Información de Empresa */}
          {(cliente.empresa || cliente.rif) && (
            <div className="seccion-info">
              <h3><Building size={20} /> Información de Empresa</h3>
              <div className="info-grid">
                {cliente.empresa && (
                  <div className="info-item">
                    <Building size={16} />
                    <div>
                      <span className="info-label">Empresa</span>
                      <span className="info-value">{cliente.empresa}</span>
                    </div>
                  </div>
                )}
                {cliente.rif && (
                  <div className="info-item">
                    <FileText size={16} />
                    <div>
                      <span className="info-label">RIF</span>
                      <span className="info-value">{cliente.rif}</span>
                    </div>
                  </div>
                )}
              </div>
            </div>
          )}

          {/* Dirección */}
          {(cliente.direccion || cliente.ciudad || cliente.estado) && (
            <div className="seccion-info">
              <h3><MapPin size={20} /> Dirección</h3>
              <div className="info-grid">
                {cliente.direccion && (
                  <div className="info-item full-width">
                    <MapPin size={16} />
                    <div>
                      <span className="info-label">Dirección</span>
                      <span className="info-value">{cliente.direccion}</span>
                    </div>
                  </div>
                )}
                {cliente.ciudad && (
                  <div className="info-item">
                    <MapPin size={16} />
                    <div>
                      <span className="info-label">Ciudad</span>
                      <span className="info-value">{cliente.ciudad}</span>
                    </div>
                  </div>
                )}
                {cliente.estado && (
                  <div className="info-item">
                    <MapPin size={16} />
                    <div>
                      <span className="info-label">Estado</span>
                      <span className="info-value">{cliente.estado}</span>
                    </div>
                  </div>
                )}
              </div>
            </div>
          )}

          {/* Estadísticas de Compras */}
          <div className="seccion-stats">
            <h3><TrendingUp size={20} /> Estadísticas de Compras</h3>
            <div className="stats-grid">
              <div className="stat-card">
                <div className="stat-icon total">
                  <DollarSign size={24} />
                </div>
                <div className="stat-info">
                  <span className="stat-label">Total Compras</span>
                  <span className="stat-value">${cliente.total_compras?.toLocaleString() || '0'}</span>
                </div>
              </div>
              <div className="stat-card">
                <div className="stat-icon pedidos">
                  <TrendingUp size={24} />
                </div>
                <div className="stat-info">
                  <span className="stat-label">Total Pedidos</span>
                  <span className="stat-value">{cliente.total_pedidos || 0}</span>
                </div>
              </div>
              {cliente.descuento_especial > 0 && (
                <div className="stat-card">
                  <div className="stat-icon descuento">
                    <Percent size={24} />
                  </div>
                  <div className="stat-info">
                    <span className="stat-label">Descuento Especial</span>
                    <span className="stat-value">{cliente.descuento_especial}%</span>
                  </div>
                </div>
              )}
              {cliente.ultima_compra && (
                <div className="stat-card">
                  <div className="stat-icon fecha">
                    <Calendar size={24} />
                  </div>
                  <div className="stat-info">
                    <span className="stat-label">Última Compra</span>
                    <span className="stat-value-small">{formatFecha(cliente.ultima_compra)}</span>
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* Notas */}
          {cliente.notas && (
            <div className="seccion-notas">
              <h3><FileText size={20} /> Notas</h3>
              <p className="notas-texto">{cliente.notas}</p>
            </div>
          )}
        </div>

        <div className="modal-footer-cliente">
          <button className="btn-secondary" onClick={onClose}>
            Cerrar
          </button>
        </div>
      </div>
    </>
  );
};

export default ClienteDetalleModal;
