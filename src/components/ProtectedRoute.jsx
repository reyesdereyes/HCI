import { useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import supabase from '../conf/supabase';

const ProtectedRoute = ({ children, requireAdmin = false }) => {
  const [loading, setLoading] = useState(true);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isAdmin, setIsAdmin] = useState(false);

  useEffect(() => {
    checkAuth();
  }, []);

  const checkAuth = async () => {
    try {
      // Verificar si hay sesión activa
      const { data: { session } } = await supabase.auth.getSession();
      
      if (!session) {
        setIsAuthenticated(false);
        setLoading(false);
        return;
      }

      setIsAuthenticated(true);

      // Si requiere admin, verificar en la tabla administradores
      if (requireAdmin) {
        const { data: adminData, error } = await supabase
          .from('administradores')
          .select('*')
          .eq('email', session.user.email)
          .eq('activo', true)
          .single();

        if (error || !adminData) {
          setIsAdmin(false);
        } else {
          setIsAdmin(true);
        }
      }
    } catch (error) {
      console.error('Error verificando autenticación:', error);
      setIsAuthenticated(false);
      setIsAdmin(false);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div style={{ 
        display: 'flex', 
        justifyContent: 'center', 
        alignItems: 'center', 
        height: '100vh',
        fontSize: '1.2rem',
        color: '#666'
      }}>
        Verificando acceso...
      </div>
    );
  }

  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  if (requireAdmin && !isAdmin) {
    return (
      <div style={{ 
        display: 'flex', 
        flexDirection: 'column',
        justifyContent: 'center', 
        alignItems: 'center', 
        height: '100vh',
        padding: '2rem',
        textAlign: 'center'
      }}>
        <h1 style={{ fontSize: '3rem', marginBottom: '1rem' }}>🚫</h1>
        <h2 style={{ color: '#333', marginBottom: '0.5rem' }}>Acceso Denegado</h2>
        <p style={{ color: '#666', marginBottom: '2rem' }}>
          No tienes permisos de administrador para acceder a esta página.
        </p>
        <a 
          href="/" 
          style={{ 
            padding: '0.75rem 2rem',
            background: 'linear-gradient(135deg, #1a237e 0%, #00bcd4 100%)',
            color: 'white',
            textDecoration: 'none',
            borderRadius: '8px',
            fontWeight: '600'
          }}
        >
          Volver al Inicio
        </a>
      </div>
    );
  }

  return children;
};

export default ProtectedRoute;
