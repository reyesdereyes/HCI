import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { CartProvider } from './context/CartContext';
import Inicio from './pages/Inicio';
import Productos from './pages/Productos';
import Equipo from './pages/Equipo';
import Contacto from './pages/Contacto';
import './App.css';

function App() {
  return (
    <CartProvider>
      <Router>
        <Routes>
          <Route path="/" element={<Inicio />} />
          <Route path="/productos" element={<Productos />} />
          <Route path="/equipo" element={<Equipo />} />
          <Route path="/contacto" element={<Contacto />} />
        </Routes>
      </Router>
    </CartProvider>
  );
}

export default App;
