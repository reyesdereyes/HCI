import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Sidebar from '../components/Sidebar';
import supabase from '../conf/supabase';
import { 
  Package,
  Clock,
  CheckCircle,
  XCircle,
  Truck,
  Calendar,
  DollarSign,
  Eye,
  Loader2
} from 'lucide-react';
import '../css/userOrders.css';

const UserOrders = () => {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    checkUser();
  }, []);

  useEffect(() => {
    if (user) {
      loadOrders();
    }
  }, [user]);

  const checkUser = async () => {
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) {
        navigate('/login');
        return;
      }
      setUser(user);
    } catch (error) {
      console.error('Error:', error);
      navigate('/login');
    } finally {
      setLoading(false);
    }
  };

  const loadOrders = async () => {
    try {
      const { data, error } = await supabase
        .from('pedidos')
        .select(`
          *,
          pedido_items (
            id,
            producto_nombre,
            cantidad,
            precio_unitario,
            subtotal
          )
        `)
        .eq('cliente_id', user.id)
        .order('fecha_pedido', { ascending: false });

      if (error) {
        console.error('Error cargando pedidos:', error);
        return;
      }

      setOrders(data || []);
    } catch (error) {
      console.error('Error:', error);
    }
  };

  const handleLogout = async () => {
    await supabase.auth.signOut();
    navigate('/login');
  };

  const getStatusInfo = (estado) => {
    const statusMap = {
      pendiente: { icon: Clock, label: 'Pendiente', color: '#ff9800' },
      aprobado: { icon: CheckCircle, label: 'Aprobado', color: '#4caf50' },
      procesando: { icon: Clock, label: 'Procesando', color: '#2196f3' },
      enviado: { icon: Truck, label: 'Enviado', color: '#00bcd4' },
      entregado: { icon: CheckCircle, label: 'Entregado', color: '#4caf50' },
      cancelado: { icon: XCircle, label: 'Cancelado', color: '#f44336' }
    };
    return statusMap[estado] || statusMap.pendiente;
  };

  const formatFecha = (fecha) => {
    return new Date(fecha).toLocaleDateString('es-VE', {
      day: 'numeric',
      month: 'long',
      year: 'numeric'
    });
  };

  if (loading) {
    return (
      <div className="orders-loading">
        <Loader2 className="spinner" size={48} />
      </div>
    );
  }

  return (
    <div className="orders-layout">
      <Sidebar onLogout={handleLogout} />
      
      <div className="orders-content">
        <div className="orders-header">
          <div>
            <h1>Mis Pedidos</h1>
            <p>Gestiona y revisa todos tus pedidos</p>
          </div>
          <div className="orders-stats">
            <button 
              className="refresh-btn"
              onClick={loadOrders}
              title="Actualizar pedidos"
            >
              <Package size={20} />
              Actualizar
            </button>
            <div className="stat-mini-order">
              <Package size={24} />
              <div>
                <span className="stat-value">{orders.length}</span>
                <span className="stat-label">Total</span>
              </div>
            </div>
            <div className="stat-mini-order">
              <Truck size={24} />
              <div>
                <span className="stat-value">
                  {orders.filter(o => o.estado === 'enviado' || o.estado === 'procesando').length}
                </span>
                <span className="stat-label">En Proceso</span>
              </div>
            </div>
          </div>
        </div>

        <div className="orders-container">
          {orders.length > 0 ? (
            <div className="orders-grid">
              {orders.map((order) => {
                const statusInfo = getStatusInfo(order.estado);
                const StatusIcon = statusInfo.icon;
                const itemsCount = order.pedido_items?.length || 0;
                
                return (
                  <div key={order.id} className="order-card">
                    <div className="order-card-header">
                      <div className="order-number">
                        <Package size={20} />
                        <span>{order.numero_pedido}</span>
                      </div>
                      <div 
                        className="order-status"
                        style={{ 
                          background: `${statusInfo.color}20`,
                          color: statusInfo.color 
                        }}
                      >
                        <StatusIcon size={16} />
                        {statusInfo.label}
                      </div>
                    </div>

                    <div className="order-card-body">
                      <div className="order-info-row">
                        <Calendar size={18} />
                        <span>{formatFecha(order.fecha_pedido)}</span>
                      </div>
                      <div className="order-info-row">
                        <Package size={18} />
                        <span>{itemsCount} producto{itemsCount !== 1 ? 's' : ''}</span>
                      </div>
                      <div className="order-info-row">
                        <DollarSign size={18} />
                        <span className="order-total">${order.total?.toFixed(2) || '0.00'}</span>
                      </div>
                    </div>

                    {order.pedido_items && order.pedido_items.length > 0 && (
                      <div className="order-products">
                        <p className="products-label">Productos:</p>
                        <div className="products-list">
                          {order.pedido_items.slice(0, 3).map((item, idx) => (
                            <span key={idx} className="product-tag">
                              {item.producto_nombre} (x{item.cantidad})
                            </span>
                          ))}
                          {order.pedido_items.length > 3 && (
                            <span className="product-tag more">
                              +{order.pedido_items.length - 3} más
                            </span>
                          )}
                        </div>
                      </div>
                    )}

                    {order.notas && (
                      <div className="order-notes">
                        <p><strong>Notas:</strong> {order.notas}</p>
                      </div>
                    )}

                    <button className="view-order-btn">
                      <Eye size={18} />
                      Ver Detalles
                    </button>
                  </div>
                );
              })}
            </div>
          ) : (
            <div className="empty-orders">
              <Package size={64} />
              <h3>No tienes pedidos aún</h3>
              <p>Comienza a comprar y tus pedidos aparecerán aquí</p>
              <button
                onClick={() => navigate('/dashboard')}
                className="shop-now-btn"
              >
                Ir a Comprar
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default UserOrders;
