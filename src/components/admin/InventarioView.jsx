import { useState } from 'react';
import { AlertTriangle, Package, TrendingDown, Check, Eye, History } from 'lucide-react';
import '../../css/admin-inventario.css';

const InventarioView = ({ alertas, productos, onMarcarLeida, onVerHistorial }) => {
  const [filtroTipo, setFiltroTipo] = useState('todos');
  const [mostrarLeidas, setMostrarLeidas] = useState(false);

  const alertasFiltradas = alertas.filter(a => {
    const matchTipo = filtroTipo === 'todos' || a.tipo === filtroTipo;
    const matchLeida = mostrarLeidas || !a.leido;
    return matchTipo && matchLeida;
  });

  const productosStockBajo = productos.filter(p => p.stock > 0 && p.stock <= 10);
  const productosSinStock = productos.filter(p => p.stock === 0);

  const getTipoColor = (tipo) => {
    switch (tipo) {
      case 'stock_bajo':
        return 'warning';
      case 'sin_stock':
        return 'danger';
      case 'reabastecimiento':
        return 'info';
      default:
        return 'gray';
    }
  };

  const getTipoIcon = (tipo) => {
    switch (tipo) {
      case 'stock_bajo':
        return <TrendingDown size={20} />;
      case 'sin_stock':
        return <Package size={20} />;
      case 'reabastecimiento':
        return <AlertTriangle size={20} />;
      default:
        return <AlertTriangle size={20} />;
    }
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
    <div className="inventario-view">
      {/* Mensaje si no hay datos */}
      {alertas.length === 0 && productos.length === 0 && (
        <div className="empty-alertas">
          <Package size={64} />
          <h3>No hay datos de inventario</h3>
          <p>Las alertas se generarán automáticamente cuando el stock de productos sea bajo.</p>
          <p style={{ fontSize: '0.875rem', marginTop: '1rem', color: '#6b7280' }}>
            Asegúrate de haber ejecutado el script <code>ADMIN-TABLES-SETUP.sql</code>
          </p>
        </div>
      )}

      {/* Solo mostrar contenido si hay datos */}
      {(alertas.length > 0 || productos.length > 0) && (
        <>
          {/* Resumen de Alertas */}
          <div className="alertas-summary">
            <div className="summary-card summary-warning">
              <TrendingDown size={32} />
              <div>
                <span className="summary-number">{productosStockBajo.length}</span>
                <span className="summary-label">Stock Bajo</span>
              </div>
            </div>
            <div className="summary-card summary-danger">
              <Package size={32} />
              <div>
                <span className="summary-number">{productosSinStock.length}</span>
                <span className="summary-label">Sin Stock</span>
              </div>
            </div>
            <div className="summary-card summary-info">
              <AlertTriangle size={32} />
              <div>
                <span className="summary-number">
                  {alertas.filter(a => !a.leido).length}
                </span>
                <span className="summary-label">Alertas Pendientes</span>
              </div>
            </div>
          </div>

          {/* Filtros - solo mostrar si hay alertas */}
          {alertas.length > 0 && (
            <>
              <div className="inventario-header">
                <div className="filter-alertas">
                  <button
                    className={`filter-btn ${filtroTipo === 'todos' ? 'active' : ''}`}
                    onClick={() => setFiltroTipo('todos')}
                  >
                    Todas
                    <span className="count">{alertas.length}</span>
                  </button>
                  <button
                    className={`filter-btn filter-warning ${filtroTipo === 'stock_bajo' ? 'active' : ''}`}
                    onClick={() => setFiltroTipo('stock_bajo')}
                  >
                    Stock Bajo
                    <span className="count">
                      {alertas.filter(a => a.tipo === 'stock_bajo').length}
                    </span>
                  </button>
                  <button
                    className={`filter-btn filter-danger ${filtroTipo === 'sin_stock' ? 'active' : ''}`}
                    onClick={() => setFiltroTipo('sin_stock')}
                  >
                    Sin Stock
                    <span className="count">
                      {alertas.filter(a => a.tipo === 'sin_stock').length}
                    </span>
                  </button>
                </div>

                <label className="checkbox-label">
                  <input
                    type="checkbox"
                    checked={mostrarLeidas}
                    onChange={(e) => setMostrarLeidas(e.target.checked)}
                  />
                  Mostrar leídas
                </label>
              </div>

              {/* Lista de Alertas */}
              <div className="alertas-list">
                {alertasFiltradas.map(alerta => (
                  <div
                    key={alerta.id}
                    className={`alerta-item alerta-${getTipoColor(alerta.tipo)} ${alerta.leido ? 'leida' : ''}`}
                  >
                    <div className="alerta-icon">
                      {getTipoIcon(alerta.tipo)}
                    </div>
                    <div className="alerta-content">
                      <div className="alerta-header">
                        <span className={`alerta-tipo tipo-${getTipoColor(alerta.tipo)}`}>
                          {alerta.tipo.replace('_', ' ').toUpperCase()}
                        </span>
                        <span className="alerta-fecha">{formatFecha(alerta.fecha_alerta)}</span>
                      </div>
                      <p className="alerta-mensaje">{alerta.mensaje}</p>
                      {alerta.productos && (
                        <div className="alerta-producto-info">
                          <span className="producto-codigo">{alerta.productos.codigo}</span>
                          <span className="producto-stock">Stock actual: {alerta.productos.stock}</span>
                        </div>
                      )}
                    </div>
                    <div className="alerta-actions">
                      {!alerta.leido && (
                        <button
                          className="action-btn action-check"
                          onClick={() => onMarcarLeida(alerta.id)}
                          title="Marcar como leída"
                        >
                          <Check size={16} />
                        </button>
                      )}
                      <button
                        className="action-btn action-view"
                        onClick={() => onVerHistorial(alerta.producto_id)}
                        title="Ver historial"
                      >
                        <History size={16} />
                      </button>
                    </div>
                  </div>
                ))}
              </div>

              {alertasFiltradas.length === 0 && alertas.length > 0 && (
                <div className="empty-alertas">
                  <Package size={48} />
                  <p>No hay alertas {mostrarLeidas ? '' : 'pendientes'} con este filtro</p>
                </div>
              )}
            </>
          )}

          {/* Productos con Stock Bajo */}
          {productosStockBajo.length > 0 && (
            <div className="productos-stock-bajo">
              <h3>Productos con Stock Bajo (≤10 unidades)</h3>
              <div className="productos-grid-small">
                {productosStockBajo.map(producto => (
                  <div key={producto.id} className="producto-item-small">
                    <div className="producto-info-small">
                      <span className="producto-nombre">{producto.nombre}</span>
                      <span className="producto-codigo">{producto.codigo}</span>
                    </div>
                    <div className={`stock-badge stock-${producto.stock <= 5 ? 'critical' : 'warning'}`}>
                      {producto.stock} unidades
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </>
      )}
    </div>
  );
};

export default InventarioView;
