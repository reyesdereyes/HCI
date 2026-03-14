import { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import Sidebar from '../components/Sidebar';
import supabase from '../conf/supabase';
import { 
  Settings,
  Lock,
  Bell,
  Globe,
  Moon,
  Sun,
  Save,
  Shield,
  Eye,
  EyeOff
} from 'lucide-react';
import "../css/userSettings.css"

const UserSettings = () => {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [darkMode, setDarkMode] = useState(false);
  const [notifications, setNotifications] = useState(true);
  const [language, setLanguage] = useState('es');
  const [showPassword, setShowPassword] = useState(false);
  const [passwordData, setPasswordData] = useState({
    current: '',
    new: '',
    confirm: ''
  });

  useEffect(() => {
    checkUser();
  }, []);

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
    } finally {
      setLoading(false);
    }
  };

  const handleLogout = async () => {
    await supabase.auth.signOut();
    navigate('/login');
  };

  const handlePasswordChange = async () => {
    if (passwordData.new !== passwordData.confirm) {
      alert('Las contraseñas no coinciden');
      return;
    }

    try {
      const { error } = await supabase.auth.updateUser({
        password: passwordData.new
      });

      if (error) throw error;
      alert('Contraseña actualizada exitosamente');
      setPasswordData({ current: '', new: '', confirm: '' });
    } catch (error) {
      console.error('Error:', error);
      alert('Error al actualizar contraseña');
    }
  };

  if (loading) {
    return (
      <div className="settings-loading">
        <motion.div
          animate={{ rotate: 360 }}
          transition={{ duration: 1, repeat: Infinity, ease: "linear" }}
        >
          <Settings size={48} />
        </motion.div>
      </div>
    );
  }

  return (
    <div className="settings-layout">
      <Sidebar onLogout={handleLogout} />
      
      <div className="settings-page">
        <motion.div 
          className="settings-header"
          initial={{ opacity: 0, y: -50 }}
          animate={{ opacity: 1, y: 0 }}
        >
          <h1>Configuración</h1>
          <p>Administra tu cuenta y preferencias</p>
        </motion.div>

      <div className="settings-container">
        <motion.div 
          className="settings-card"
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.2 }}
        >
          <div className="settings-section">
            <div className="section-title">
              <Lock className="section-icon" />
              <h2>Seguridad</h2>
            </div>
            <div className="settings-group">
              <label>Contraseña Actual</label>
              <div className="password-input">
                <input
                  type={showPassword ? 'text' : 'password'}
                  value={passwordData.current}
                  onChange={(e) => setPasswordData({...passwordData, current: e.target.value})}
                  placeholder="Ingresa tu contraseña actual"
                />
                <button onClick={() => setShowPassword(!showPassword)}>
                  {showPassword ? <EyeOff size={20} /> : <Eye size={20} />}
                </button>
              </div>
            </div>
            <div className="settings-group">
              <label>Nueva Contraseña</label>
              <input
                type={showPassword ? 'text' : 'password'}
                value={passwordData.new}
                onChange={(e) => setPasswordData({...passwordData, new: e.target.value})}
                placeholder="Ingresa tu nueva contraseña"
              />
            </div>
            <div className="settings-group">
              <label>Confirmar Nueva Contraseña</label>
              <input
                type={showPassword ? 'text' : 'password'}
                value={passwordData.confirm}
                onChange={(e) => setPasswordData({...passwordData, confirm: e.target.value})}
                placeholder="Confirma tu nueva contraseña"
              />
            </div>
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              onClick={handlePasswordChange}
              className="save-btn"
            >
              <Save size={18} />
              Cambiar Contraseña
            </motion.button>
          </div>

          <div className="settings-section">
            <div className="section-title">
              <Bell className="section-icon" />
              <h2>Notificaciones</h2>
            </div>
            <div className="settings-toggle">
              <div>
                <h3>Notificaciones por Email</h3>
                <p>Recibe actualizaciones sobre tus pedidos</p>
              </div>
              <label className="toggle-switch">
                <input
                  type="checkbox"
                  checked={notifications}
                  onChange={(e) => setNotifications(e.target.checked)}
                />
                <span className="toggle-slider"></span>
              </label>
            </div>
          </div>

          <div className="settings-section">
            <div className="section-title">
              <Globe className="section-icon" />
              <h2>Preferencias</h2>
            </div>
            <div className="settings-group">
              <label>Idioma</label>
              <select value={language} onChange={(e) => setLanguage(e.target.value)}>
                <option value="es">Español</option>
                <option value="en">English</option>
              </select>
            </div>
            <div className="settings-toggle">
              <div>
                <h3>Modo Oscuro</h3>
                <p>Cambia la apariencia de la interfaz</p>
              </div>
              <label className="toggle-switch">
                <input
                  type="checkbox"
                  checked={darkMode}
                  onChange={(e) => setDarkMode(e.target.checked)}
                />
                <span className="toggle-slider">
                  {darkMode ? <Moon size={16} /> : <Sun size={16} />}
                </span>
              </label>
            </div>
          </div>

          <div className="settings-section danger-zone">
            <div className="section-title">
              <Shield className="section-icon" />
              <h2>Zona de Peligro</h2>
            </div>
            <p className="danger-text">
              Una vez que elimines tu cuenta, no hay vuelta atrás. Por favor, ten cuidado.
            </p>
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              className="danger-btn"
            >
              Eliminar Cuenta
            </motion.button>
          </div>
        </motion.div>
      </div>
    </div>
    </div>
  );
};


export default UserSettings;
