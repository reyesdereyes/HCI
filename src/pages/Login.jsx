import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import supabase from '../conf/supabase';
import { 
  Mail, 
  Lock, 
  Eye, 
  EyeOff, 
  User,
  ArrowRight,
  Loader2,
  AlertCircle,
  CheckCircle,
  Home
} from 'lucide-react';
import '../css/login.css';

const Login = () => {
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState({ type: '', text: '' });

  // Estados del formulario
  const [formData, setFormData] = useState({
    email: '',
    password: ''
  });

  // Manejar cambios en inputs
  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
    setMessage({ type: '', text: '' });
  };

  // Validar email
  const isValidEmail = (email) => {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  };

  // Manejar Login
  const handleLogin = async (e) => {
    e.preventDefault();
    
    if (!formData.email || !formData.password) {
      setMessage({ type: 'error', text: 'Por favor completa todos los campos' });
      return;
    }

    if (!isValidEmail(formData.email)) {
      setMessage({ type: 'error', text: 'Email inválido' });
      return;
    }

    setLoading(true);
    setMessage({ type: '', text: '' });

    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email: formData.email,
        password: formData.password
      });

      if (error) throw error;

      // Verificar si es administrador
      const { data: adminData } = await supabase
        .from('administradores')
        .select('*')
        .eq('email', formData.email)
        .eq('activo', true)
        .single();

      if (adminData) {
        setMessage({ type: 'success', text: '¡Bienvenido Admin! Redirigiendo...' });
        setTimeout(() => {
          navigate('/admin');
        }, 1500);
      } else {
        setMessage({ type: 'success', text: '¡Bienvenido! Redirigiendo...' });
        setTimeout(() => {
          navigate('/dashboard');
        }, 1500);
      }

    } catch (error) {
      console.error('Error en login:', error);
      setMessage({ 
        type: 'error', 
        text: error.message === 'Invalid login credentials' 
          ? 'Email o contraseña incorrectos' 
          : 'Error al iniciar sesión. Intenta de nuevo.' 
      });
    } finally {
      setLoading(false);
    }
  };



  return (
    <div className="login-container">
      
      {/* Fondo decorativo */}
      <div className="login-background">
        <div className="bg-shape shape-1"></div>
        <div className="bg-shape shape-2"></div>
        <div className="bg-shape shape-3"></div>
      </div>

      {/* Botón volver al inicio */}
      <button className="back-home-btn" onClick={() => navigate('/')}>
        <Home size={20} />
        <span>Volver al Inicio</span>
      </button>

      {/* Card de Login/Registro */}
      <div className="login-card">
        
        {/* Logo y título */}
        <div className="login-header">
          <div className="login-logo">
            <img 
              src="/PHOTO-2026-03-11-14-40-08.jpg" 
              alt="Hitach Cool Import" 
              className="logo-img"
            />
          </div>
          <h1 className="login-title">Iniciar Sesión</h1>
          <p className="login-subtitle">Ingresa tus credenciales para continuar</p>
        </div>

        {/* Mensajes de error/éxito */}
        {message.text && (
          <div className={`message-box ${message.type}`}>
            {message.type === 'error' ? (
              <AlertCircle size={20} />
            ) : (
              <CheckCircle size={20} />
            )}
            <span>{message.text}</span>
          </div>
        )}

        {/* Formulario */}
        <form onSubmit={handleLogin} className="login-form">
          
          {/* Email */}
          <div className="form-group">
            <label htmlFor="email" className="form-label">
              <Mail size={18} />
              Email
            </label>
            <input
              type="email"
              id="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              placeholder="tu@email.com"
              className="form-input"
              disabled={loading}
            />
          </div>

          {/* Contraseña */}
          <div className="form-group">
            <label htmlFor="password" className="form-label">
              <Lock size={18} />
              Contraseña
            </label>
            <div className="password-input-wrapper">
              <input
                type={showPassword ? 'text' : 'password'}
                id="password"
                name="password"
                value={formData.password}
                onChange={handleChange}
                placeholder="••••••••"
                className="form-input"
                disabled={loading}
              />
              <button
                type="button"
                className="toggle-password-btn"
                onClick={() => setShowPassword(!showPassword)}
                disabled={loading}
              >
                {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
              </button>
            </div>
          </div>

          {/* Olvidé mi contraseña */}
          <div className="form-footer">
            <a href="#" className="forgot-password-link">
              ¿Olvidaste tu contraseña?
            </a>
          </div>

          {/* Botón submit */}
          <button 
            type="submit" 
            className="submit-btn"
            disabled={loading}
          >
            {loading ? (
              <>
                <Loader2 className="spinner" size={20} />
                <span>Procesando...</span>
              </>
            ) : (
              <>
                <span>Iniciar Sesión</span>
                <ArrowRight size={20} />
              </>
            )}
          </button>
        </form>



      </div>

      {/* Footer */}
      <div className="login-footer">
        <p>© 2026 Hitach Cool Import. Todos los derechos reservados.</p>
      </div>

    </div>
  );
};

export default Login;
