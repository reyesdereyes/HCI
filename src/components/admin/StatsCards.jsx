import { TrendingUp, Package, ShoppingCart, Users, AlertTriangle, DollarSign } from 'lucide-react';
import '../../css/admin-stats.css';

const StatsCards = ({ stats }) => {
  return (
    <div className="stats-grid">
      <div className="stat-card stat-primary">
        <div className="stat-icon">
          <DollarSign size={28} />
        </div>
        <div className="stat-content">
          <span className="stat-label">Ventas del Mes</span>
          <span className="stat-value">${stats.ventasMes?.toLocaleString() || '0'}</span>
          <span className="stat-change positive">
            <TrendingUp size={14} />
            +{stats.crecimientoVentas || 0}% vs mes anterior
          </span>
        </div>
      </div>

      <div className="stat-card stat-success">
        <div className="stat-icon">
          <ShoppingCart size={28} />
        </div>
        <div className="stat-content">
          <span className="stat-label">Pedidos Pendientes</span>
          <span className="stat-value">{stats.pedidosPendientes || 0}</span>
          <span className="stat-subtitle">{stats.pedidosHoy || 0} pedidos hoy</span>
        </div>
      </div>

      <div className="stat-card stat-info">
        <div className="stat-icon">
          <Package size={28} />
        </div>
        <div className="stat-content">
          <span className="stat-label">Total Productos</span>
          <span className="stat-value">{stats.totalProductos || 0}</span>
          <span className="stat-subtitle">{stats.productosActivos || 0} activos</span>
        </div>
      </div>

      <div className="stat-card stat-warning">
        <div className="stat-icon">
          <AlertTriangle size={28} />
        </div>
        <div className="stat-content">
          <span className="stat-label">Alertas de Stock</span>
          <span className="stat-value">{stats.alertasStock || 0}</span>
          <span className="stat-subtitle">{stats.sinStock || 0} sin stock</span>
        </div>
      </div>

      <div className="stat-card stat-purple">
        <div className="stat-icon">
          <Users size={28} />
        </div>
        <div className="stat-content">
          <span className="stat-label">Clientes Activos</span>
          <span className="stat-value">{stats.clientesActivos || 0}</span>
          <span className="stat-subtitle">{stats.clientesNuevos || 0} nuevos este mes</span>
        </div>
      </div>

      <div className="stat-card stat-cyan">
        <div className="stat-icon">
          <TrendingUp size={28} />
        </div>
        <div className="stat-content">
          <span className="stat-label">Ticket Promedio</span>
          <span className="stat-value">${stats.ticketPromedio?.toLocaleString() || '0'}</span>
          <span className="stat-subtitle">Por pedido</span>
        </div>
      </div>
    </div>
  );
};

export default StatsCards;
