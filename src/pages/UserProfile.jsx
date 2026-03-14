import { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import Sidebar from '../components/Sidebar';
import supabase from '../conf/supabase';
import { 
  User, 
  Mail, 
  Phone, 
  MapPin, 
  Calendar,
  Edit,
  Save,
  X,
  Camera,
  Shield,
  Award
} from 'lucide-react';
import '../css/userProfile.css';

const UserProfile = () => {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [editing, setEditing] = useState(false);
  const [clientInfo, setClientInfo] = useState(null);
  const [formData, setFormData] = useState({
    nombre_completo: '',
    telefono: '',
    direccion: '',
    ciudad: ''
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
      
      // Verificar si es cliente autorizado
      const { data: clientData } = await supabase
        .from('clientes_autorizados')
        .select('*')
        .eq('email', user.email)
        .single();
      
      if (clientData) {
        setClientInfo(clientData);
        setFormData({
          nombre_completo: clientData.nombre_completo || '',
          telefono: clientData.telefono || '',
          direccion: clientData.direccion || '',
          ciudad: clientData.ciudad || ''
        });
      }
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

  const handleSave = async () => {
    try {
      if (clientInfo) {
        const { error } = await supabase
          .from('clientes_autorizados')
          .update(formData)
          .eq('email', user.email);
        
        if (error) throw error;
        alert('Perfil actualizado exitosamente');
        setEditing(false);
        checkUser();
      }
    } catch (error) {
      console.error('Error:', error);
      alert('Error al actualizar perfil');
    }
  };

  if (loading) {
    return (
      <div className="profile-loading">
        <motion.div
          animate={{ rotate: 360 }}
          transition={{ duration: 1, repeat: Infinity, ease: "linear" }}
        >
          <User size={48} />
        </motion.div>
      </div>
    );
  }

  return (
    <div className="profile-layout">
      <Sidebar onLogout={handleLogout} />
      
      <div className="profile-page">
        <motion.div 
          className="profile-header"
          initial={{ opacity: 0, y: -50 }}
          animate={{ opacity: 1, y: 0 }}
        >
          <h1>Mi Perfil</h1>
        </motion.div>

      <div className="profile-container">
        <motion.div 
          className="profile-card"
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.2 }}
        >
          <div className="profile-avatar-section">
            <div className="profile-avatar">
              <User size={64} />
              <button className="avatar-edit-btn">
                <Camera size={20} />
              </button>
            </div>
            <h2>{formData.nombre_completo || user?.email}</h2>
            <p className="profile-email">{user?.email}</p>
            
            {clientInfo && (
              <div className="profile-badges">
                {clientInfo.tipo_cliente === 'VIP' && (
                  <span className="badge vip">
                    <Award size={16} />
                    Cliente VIP
                  </span>
                )}
                {clientInfo.ver_precios === false && (
                  <span className="badge special">
                    <Shield size={16} />
                    Precios Especiales
                  </span>
                )}
              </div>
            )}
          </div>

          <div className="profile-info-section">
            <div className="section-header">
              <h3>Información Personal</h3>
              {!editing ? (
                <motion.button
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                  onClick={() => setEditing(true)}
                  className="edit-btn"
                >
                  <Edit size={18} />
                  Editar
                </motion.button>
              ) : (
                <div className="edit-actions">
                  <motion.button
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                    onClick={handleSave}
                    className="save-btn"
                  >
                    <Save size={18} />
                    Guardar
                  </motion.button>
                  <motion.button
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                    onClick={() => {
                      setEditing(false);
                      checkUser();
                    }}
                    className="cancel-btn"
                  >
                    <X size={18} />
                    Cancelar
                  </motion.button>
                </div>
              )}
            </div>

            <div className="info-grid">
              <div className="info-item">
                <Mail className="info-icon" />
                <div>
                  <label>Email</label>
                  <p>{user?.email}</p>
                </div>
              </div>

              <div className="info-item">
                <User className="info-icon" />
                <div>
                  <label>Nombre Completo</label>
                  {editing ? (
                    <input
                      type="text"
                      value={formData.nombre_completo}
                      onChange={(e) => setFormData({...formData, nombre_completo: e.target.value})}
                    />
                  ) : (
                    <p>{formData.nombre_completo || 'No especificado'}</p>
                  )}
                </div>
              </div>

              <div className="info-item">
                <Phone className="info-icon" />
                <div>
                  <label>Teléfono</label>
                  {editing ? (
                    <input
                      type="tel"
                      value={formData.telefono}
                      onChange={(e) => setFormData({...formData, telefono: e.target.value})}
                    />
                  ) : (
                    <p>{formData.telefono || 'No especificado'}</p>
                  )}
                </div>
              </div>

              <div className="info-item">
                <MapPin className="info-icon" />
                <div>
                  <label>Dirección</label>
                  {editing ? (
                    <input
                      type="text"
                      value={formData.direccion}
                      onChange={(e) => setFormData({...formData, direccion: e.target.value})}
                    />
                  ) : (
                    <p>{formData.direccion || 'No especificado'}</p>
                  )}
                </div>
              </div>

              <div className="info-item">
                <MapPin className="info-icon" />
                <div>
                  <label>Ciudad</label>
                  {editing ? (
                    <input
                      type="text"
                      value={formData.ciudad}
                      onChange={(e) => setFormData({...formData, ciudad: e.target.value})}
                    />
                  ) : (
                    <p>{formData.ciudad || 'No especificado'}</p>
                  )}
                </div>
              </div>

              <div className="info-item">
                <Calendar className="info-icon" />
                <div>
                  <label>Miembro desde</label>
                  <p>{new Date(user?.created_at).toLocaleDateString('es-ES')}</p>
                </div>
              </div>
            </div>
          </div>

          {clientInfo && (
            <motion.div 
              className="client-benefits"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4 }}
            >
              <h3>Beneficios de Cliente Autorizado</h3>
              <div className="benefits-grid">
                <div className="benefit-item">
                  <Award className="benefit-icon" />
                  <div>
                    <h4>Descuento Especial</h4>
                    <p>{clientInfo.descuento_especial}% en todos los productos</p>
                  </div>
                </div>
                <div className="benefit-item">
                  <Shield className="benefit-icon" />
                  <div>
                    <h4>Empresa</h4>
                    <p>{clientInfo.empresa || 'No especificado'}</p>
                  </div>
                </div>
              </div>
            </motion.div>
          )}
        </motion.div>
      </div>
      </div>
    </div>
  );
};

export default UserProfile;
