import { motion } from 'framer-motion';
import { useNavigate, useLocation } from 'react-router-dom';
import { 
  LayoutDashboard,
  ShoppingBag,
  User,
  Settings,
  Heart,
  Clock,
  LogOut,
  Home,
  ChevronLeft,
  ChevronRight
} from 'lucide-react';
import { useState } from 'react';
import '../css/sidebar.css';

const Sidebar = ({ onLogout }) => {
  const navigate = useNavigate();
  const location = useLocation();
  const [collapsed, setCollapsed] = useState(false);

  const menuItems = [
    { icon: LayoutDashboard, label: 'Dashboard', path: '/dashboard' },
    { icon: ShoppingBag, label: 'Productos', path: '/dashboard' },
    { icon: Clock, label: 'Mis Pedidos', path: '/user/orders' },
    { icon: Heart, label: 'Favoritos', path: '/user/favorites' },
    { icon: User, label: 'Mi Perfil', path: '/user/profile' },
    { icon: Settings, label: 'Configuración', path: '/user/settings' },
  ];

  const isActive = (path) => location.pathname === path;

  return (
    <motion.div 
      className={`sidebar ${collapsed ? 'collapsed' : ''}`}
      initial={{ x: -300 }}
      animate={{ x: 0 }}
      transition={{ type: 'spring', stiffness: 100 }}
    >
      <div className="sidebar-header">
        <motion.div 
          className="sidebar-logo"
          whileHover={{ scale: 1.05 }}
        >
          <img src="/PHOTO-2026-03-11-14-40-08.jpg" alt="Logo" />
          {!collapsed && <span>Hitach Cool</span>}
        </motion.div>
        <motion.button
          whileHover={{ scale: 1.1 }}
          whileTap={{ scale: 0.9 }}
          className="collapse-btn"
          onClick={() => setCollapsed(!collapsed)}
        >
          {collapsed ? <ChevronRight size={20} /> : <ChevronLeft size={20} />}
        </motion.button>
      </div>

      <nav className="sidebar-nav">
        {menuItems.map((item, index) => (
          <motion.button
            key={index}
            whileHover={{ x: 5 }}
            whileTap={{ scale: 0.95 }}
            className={`nav-item ${isActive(item.path) ? 'active' : ''}`}
            onClick={() => navigate(item.path)}
            title={collapsed ? item.label : ''}
          >
            <item.icon size={22} />
            {!collapsed && <span>{item.label}</span>}
          </motion.button>
        ))}
      </nav>

      <div className="sidebar-footer">
        <motion.button
          whileHover={{ x: 5 }}
          whileTap={{ scale: 0.95 }}
          className="nav-item"
          onClick={() => navigate('/')}
        >
          <Home size={22} />
          {!collapsed && <span>Ir al Inicio</span>}
        </motion.button>
        <motion.button
          whileHover={{ x: 5 }}
          whileTap={{ scale: 0.95 }}
          className="nav-item logout"
          onClick={onLogout}
        >
          <LogOut size={22} />
          {!collapsed && <span>Cerrar Sesión</span>}
        </motion.button>
      </div>
    </motion.div>
  );
};

export default Sidebar;
