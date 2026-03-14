import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { CartProvider } from './context/CartContext';
import Inicio from './pages/Inicio';
import Login from './pages/Login';
import Admin from './pages/Admin';
import Dashboard from './pages/Dashboard';
import UserProfile from './pages/UserProfile';
import UserSettings from './pages/UserSettings';
import UserOrders from './pages/UserOrders';
import UserFavorites from './pages/UserFavorites';
import Productos from './pages/Productos';
import Equipo from './pages/Equipo';
import Contacto from './pages/Contacto';
import ProtectedRoute from './components/ProtectedRoute';
import './App.css';

function App() {
  return (
    <CartProvider>
      <Router>
        <Routes>
          <Route path="/" element={<Inicio />} />
          <Route path="/login" element={<Login />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/user/profile" element={<UserProfile />} />
          <Route path="/user/settings" element={<UserSettings />} />
          <Route path="/user/orders" element={<UserOrders />} />
          <Route path="/user/favorites" element={<UserFavorites />} />
          <Route path="/productos" element={<Productos />} />
          <Route path="/equipo" element={<Equipo />} />
          <Route path="/contacto" element={<Contacto />} />
          <Route 
            path="/admin" 
            element={
              <ProtectedRoute requireAdmin={true}>
                <Admin />
              </ProtectedRoute>
            } 
          />
        </Routes>
      </Router>
    </CartProvider>
  );
}

export default App;
