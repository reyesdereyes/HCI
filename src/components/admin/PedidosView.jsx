import { useState } from 'react';
import { 
  Search, 
  Eye, 
  Check, 
  X, 
  Truck, 
  Package, 
  Clock, 
  Filter,
  CheckCircle,
  XCircle,
  PlayCircle
} from 'lucide-react';
import PedidoDetalleModal from './PedidoDetalleModal';
import '../../css/admin-pedidos.css';

const PedidosView = ({ pedidos, onUpdateEstado, onViewDetails }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [filtroEstado, setFiltroEstado] = useState('todos');
  const [pedidoSeleccionado, setPedidoSeleccionado] = useState(null);
  const [showModal, setShowModal] = useState(false);

  const handleViewDetails = (pedido) => {
    setPedidoSeleccionado(pedido);
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
    setPedidoSeleccionado(null);
  };

  const estados = [
    { value: 'todos', label: 'Todos', color: 'gray' },
    { value: 'pendiente', label: 'Pendiente', color: 'warning' },
    { value: 'aprobado', label: 'Aprobado', color: 'info' },
    { value: 'procesando', label: 'Procesando', color: 'purple' },
    { value: 'enviado', label: 'Enviado', color: 'cyan' },
    { value: 'entregado', label: 'Entregado', color: 'success' },
    { value: 'cancelado', label: 'Cancelado', color: 'danger' }
  ];

  const pedidosFiltrados = pedidos.filter(p => {
    const matchSearch = 
      p.numero_pedido.toLowerCase().includes(searchTerm.toLowerCase()) ||
      p.cliente_nombre?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      p.cliente_email?.toLowerCase().includes(searchTerm.toLowerCase());
    
    const matchEstado = filtroEstado === 'todos' || p.estado === filtroEstado;
    
    return matchSearch && matchEstado;
  });

  const getEstadoColor = (estado) => {
    const estadoObj = estados.find(e => e.value === estado);
    return estadoObj?.color || 'gray';
  };

  const formatFecha = (fecha) => {
    return new Date(fecha).toLocaleDateString('es-VE', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  return (
    <div className="pedidos-view">
      <div className="pedidos-header">
        <div className="search-box">
          <Search size={20} />
          <input
            type="text"
            placeholder="Buscar por número, cliente o email..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>

        <div className="filter-estados">
          <Filter size={18} />
          {estados.map(estado => (
            <button
              key={estado.value}
              className={`filter-btn filter-${estado.color} ${filtroEstado === estado.value ? 'active' : ''}`}
              onClick={() => setFiltroEstado(estado.value)}
            >
              {estado.label}
              {estado.value !== 'todos' && (
                <span className="count">
                  {pedidos.filter(p => p.estado === estado.value).length}
                </span>
              )}
            </button>
          ))}
        </div>
      </div>

      <div className="pedidos-table-container">
        <table className="pedidos-table">
          <thead>
            <tr>
              <th>Número</th>
              <th>Cliente</th>
              <th>Fecha</th>
              <th>Total</th>
              <th>Estado</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {pedidosFiltrados.map(pedido => (
              <tr key={pedido.id}>
                <td>
                  <span className="pedido-numero">{pedido.numero_pedido}</span>
                </td>
                <td>
                  <div className="cliente-info">
                    <span className="cliente-nombre">{pedido.cliente_nombre}</span>
                    <span className="cliente-email">{pedido.cliente_email}</span>
                  </div>
                </td>
                <td>
                  <span className="pedido-fecha">{formatFecha(pedido.fecha_pedido)}</span>
                </td>
                <td>
                  <span className="pedido-total">${pedido.total.toLocaleString()}</span>
                </td>
                <td>
                  <span className={`estado-badge estado-${getEstadoColor(pedido.estado)}`}>
                    {pedido.estado}
                  </span>
                </td>
                <td>
                  <div className="pedido-actions">
                    <button
                      className="action-btn action-view"
                      onClick={() => handleViewDetails(pedido)}
                      title="Ver detalles del pedido"
                      aria-label="Ver detalles"
                    >
                      <Eye size={18} />
                      <span className="btn-text">Ver</span>
                    </button>
                    
                    {pedido.estado === 'pendiente' && (
                      <>
                        <button
                          className="action-btn action-approve"
                          onClick={() => onUpdateEstado(pedido.id, 'aprobado')}
                          title="Aprobar pedido"
                          aria-label="Aprobar pedido"
                        >
                          <CheckCircle size={18} />
                          <span className="btn-text">Aprobar</span>
                        </button>
                        <button
                          className="action-btn action-cancel"
                          onClick={() => onUpdateEstado(pedido.id, 'cancelado')}
                          title="Cancelar pedido"
                          aria-label="Cancelar pedido"
                        >
                          <XCircle size={18} />
                          <span className="btn-text">Cancelar</span>
                        </button>
                      </>
                    )}
                    
                    {pedido.estado === 'aprobado' && (
                      <button
                        className="action-btn action-process"
                        onClick={() => onUpdateEstado(pedido.id, 'procesando')}
                        title="Iniciar procesamiento"
                        aria-label="Procesar pedido"
                      >
                        <PlayCircle size={18} />
                        <span className="btn-text">Procesar</span>
                      </button>
                    )}
                    
                    {pedido.estado === 'procesando' && (
                      <button
                        className="action-btn action-ship"
                        onClick={() => onUpdateEstado(pedido.id, 'enviado')}
                        title="Marcar como enviado"
                        aria-label="Marcar como enviado"
                      >
                        <Truck size={18} />
                        <span className="btn-text">Enviar</span>
                      </button>
                    )}
                    
                    {pedido.estado === 'enviado' && (
                      <button
                        className="action-btn action-deliver"
                        onClick={() => onUpdateEstado(pedido.id, 'entregado')}
                        title="Marcar como entregado"
                        aria-label="Marcar como entregado"
                      >
                        <Package size={18} />
                        <span className="btn-text">Entregar</span>
                      </button>
                    )}
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>

        {pedidosFiltrados.length === 0 && (
          <div className="empty-pedidos">
            <Package size={48} />
            <p>No se encontraron pedidos</p>
          </div>
        )}
      </div>

      <PedidoDetalleModal 
        pedido={pedidoSeleccionado}
        isOpen={showModal}
        onClose={handleCloseModal}
      />
    </div>
  );
};

export default PedidosView;
