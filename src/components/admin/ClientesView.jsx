import { useState } from 'react';
import { Search, Eye, Edit, Mail, Phone, MapPin, TrendingUp, DollarSign } from 'lucide-react';
import ClienteDetalleModal from './ClienteDetalleModal';
import ClienteEditModal from './ClienteEditModal';
import '../../css/admin-clientes.css';

const ClientesView = ({ clientes, onViewDetails, onEdit, onSuccess, onError, onReload }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [filtroTipo, setFiltroTipo] = useState('todos');
  const [clienteSeleccionado, setClienteSeleccionado] = useState(null);
  const [showDetalleModal, setShowDetalleModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);

  const handleViewDetails = (cliente) => {
    setClienteSeleccionado(cliente);
    setShowDetalleModal(true);
  };

  const handleEdit = (cliente) => {
    setClienteSeleccionado(cliente);
    setShowEditModal(true);
  };

  const handleCloseDetalleModal = () => {
    setShowDetalleModal(false);
    setClienteSeleccionado(null);
  };

  const handleCloseEditModal = () => {
    setShowEditModal(false);
    setClienteSeleccionado(null);
  };

  const handleEditSuccess = (message) => {
    onSuccess(message);
    handleCloseEditModal();
    if (onReload) onReload();
  };

  const clientesFiltrados = clientes.filter(c => {
    const matchSearch = 
      c.nombre_completo?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      c.empresa?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      c.rif?.toLowerCase().includes(searchTerm.toLowerCase());
    
    const matchTipo = filtroTipo === 'todos' || c.tipo_cliente === filtroTipo;
    
    return matchSearch && matchTipo;
  });

  const formatFecha = (fecha) => {
    if (!fecha) return 'N/A';
    return new Date(fecha).toLocaleDateString('es-VE', {
      year: 'numeric',
      month: 'short',
      day: 'numeric'
    });
  };

  return (
    <div className="clientes-view">
      <div className="clientes-header">
        <div className="search-box">
          <Search size={20} />
          <input
            type="text"
            placeholder="Buscar por nombre, empresa, email o RIF..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>

        <div className="filter-tipo">
          <button
            className={`filter-btn ${filtroTipo === 'todos' ? 'active' : ''}`}
            onClick={() => setFiltroTipo('todos')}
          >
            Todos
            <span className="count">{clientes.length}</span>
          </button>
          <button
            className={`filter-btn ${filtroTipo === 'detal' ? 'active' : ''}`}
            onClick={() => setFiltroTipo('detal')}
          >
            Detal
            <span className="count">
              {clientes.filter(c => c.tipo_cliente === 'detal').length}
            </span>
          </button>
          <button
            className={`filter-btn ${filtroTipo === 'mayor' ? 'active' : ''}`}
            onClick={() => setFiltroTipo('mayor')}
          >
            Mayor
            <span className="count">
              {clientes.filter(c => c.tipo_cliente === 'mayor').length}
            </span>
          </button>
        </div>
      </div>

      <div className="clientes-grid">
        {clientesFiltrados.map(cliente => (
          <div key={cliente.id} className="cliente-card">
            <div className="cliente-card-header">
              <div className="cliente-avatar">
                {cliente.nombre_completo?.charAt(0) || 'C'}
              </div>
              <div className="cliente-info-header">
                <h3>{cliente.nombre_completo || 'Sin nombre'}</h3>
                {cliente.empresa && (
                  <span className="cliente-empresa">{cliente.empresa}</span>
                )}
                <span className={`tipo-badge tipo-${cliente.tipo_cliente}`}>
                  {cliente.tipo_cliente === 'mayor' ? 'Mayorista' : 'Detal'}
                </span>
              </div>
            </div>

            <div className="cliente-card-body">
              <div className="cliente-contact">
                <div className="contact-item">
                  <Mail size={16} />
                  <span>{cliente.email || 'Sin email'}</span>
                </div>
                {cliente.telefono && (
                  <div className="contact-item">
                    <Phone size={16} />
                    <span>{cliente.telefono}</span>
                  </div>
                )}
                {cliente.ciudad && (
                  <div className="contact-item">
                    <MapPin size={16} />
                    <span>{cliente.ciudad}, {cliente.estado}</span>
                  </div>
                )}
              </div>

              <div className="cliente-stats">
                <div className="stat-item-small">
                  <TrendingUp size={16} />
                  <div>
                    <span className="stat-label">Total Compras</span>
                    <span className="stat-value">
                      ${cliente.total_compras?.toLocaleString() || '0'}
                    </span>
                  </div>
                </div>
                <div className="stat-item-small">
                  <DollarSign size={16} />
                  <div>
                    <span className="stat-label">Pedidos</span>
                    <span className="stat-value">{cliente.total_pedidos || 0}</span>
                  </div>
                </div>
              </div>

              {cliente.descuento_especial > 0 && (
                <div className="descuento-badge">
                  Descuento: {cliente.descuento_especial}%
                </div>
              )}

              <div className="cliente-dates">
                <span>Registro: {formatFecha(cliente.fecha_registro)}</span>
                {cliente.ultima_compra && (
                  <span>Última compra: {formatFecha(cliente.ultima_compra)}</span>
                )}
              </div>
            </div>

            <div className="cliente-card-footer">
              <button
                className="action-btn action-view"
                onClick={() => handleViewDetails(cliente)}
                title="Ver detalles"
              >
                <Eye size={16} />
                Ver Detalles
              </button>
              <button
                className="action-btn action-edit"
                onClick={() => handleEdit(cliente)}
                title="Editar"
              >
                <Edit size={16} />
                Editar
              </button>
            </div>
          </div>
        ))}
      </div>

      {clientesFiltrados.length === 0 && (
        <div className="empty-clientes">
          <Mail size={48} />
          <p>No se encontraron clientes</p>
        </div>
      )}

      <ClienteDetalleModal 
        cliente={clienteSeleccionado}
        isOpen={showDetalleModal}
        onClose={handleCloseDetalleModal}
      />

      <ClienteEditModal 
        cliente={clienteSeleccionado}
        isOpen={showEditModal}
        onClose={handleCloseEditModal}
        onSuccess={handleEditSuccess}
        onError={onError}
      />
    </div>
  );
};

export default ClientesView;
