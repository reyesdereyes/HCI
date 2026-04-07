import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useCart } from '../context/CartContext';
import Carrito from './Carrito';
import { 
  Search, 
  MapPin, 
  DollarSign, 
  ShoppingCart, 
  ChevronRight, 
  Phone, 
  Clock, 
  Truck, 
  Percent,
  Menu,
  X
} from 'lucide-react';
import '../css/header.css';

const Header = () => {
  const navigate = useNavigate();
  const { getCartCount } = useCart();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedZone, setSelectedZone] = useState('Carabobo');
  const [selectedCurrency, setSelectedCurrency] = useState('USD');
  const [showZoneDropdown, setShowZoneDropdown] = useState(false);
  const [showCurrencyDropdown, setShowCurrencyDropdown] = useState(false);
  const [showMobileMenu, setShowMobileMenu] = useState(false);
  const [showCarrito, setShowCarrito] = useState(false);
  const [isScrolled, setIsScrolled] = useState(false);
  const [searchFocused, setSearchFocused] = useState(false);

  // Detectar scroll para efectos
  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 100);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const zones = ['Carabobo', 'Caracas', 'Maracaibo', 'Valencia', 'Maracay', 'Barquisimeto', 'Maturín'];
  const currencies = [
    { code: 'USD', name: 'Dólar', symbol: '$' },
    { code: 'VES', name: 'Bolívar', symbol: 'Bs.' },
    { code: 'EUR', name: 'Euro', symbol: '€' }
  ];

  // Cerrar dropdowns al hacer click fuera
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (!event.target.closest('.dropdown-container')) {
        setShowZoneDropdown(false);
        setShowCurrencyDropdown(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  return (
    <header className={`header ${isScrolled ? 'scrolled' : ''}`}>
      
      {/* TOP BAR */}
      <div className="top-bar">
        <div className="top-bar-container">
          <div className="top-bar-left">
            <span className="top-bar-item">
              <Phone size={14} />
              <span>0500-HCI-2024</span>
            </span>
            <span className="top-bar-item">
              <Clock size={14} />
              <span>Lun-Vie: 8:00am - 6:00pm</span>
            </span>
            <span className="top-bar-item highlight">
              <Truck size={14} />
              <span>Envío gratis en compras +$500</span>
            </span>
          </div>
          <div className="top-bar-right">
            <a href="#" className="top-bar-link">Seguir mi pedido</a>
            <a href="#" className="top-bar-link">Ayuda</a>
            <a href="#" className="top-bar-link">Venta al Mayor</a>
          </div>
        </div>
      </div>

      {/* HEADER PRINCIPAL */}
      <div className="header-main">
        <div className="header-container">
          <div className="header-top">
            
            {/* Logo */}
            <div className="header-logo">
              <div className="logo-image-container" onClick={() => navigate('/')} style={{ cursor: 'pointer' }}>
                <img
                  src="/PHOTO-2026-03-11-14-40-08.jpg"
                  alt="Hitach Cool Import"
                  className="logo-image"
                  style={{ 
                    width: '80px', 
                    height: '80px', 
                    objectFit: 'cover', 
                    borderRadius: '12px',
                    boxShadow: '0 4px 12px rgba(0,0,0,0.1)'
                  }}
                />
              </div>
            </div>

            {/* Search */}
            <div className={`search-container ${searchFocused ? 'focused' : ''}`}>
              <div className="search-wrapper">
                <input
                  type="text"
                  placeholder="¿Qué necesitas para tu proyecto? Busca cerámica, pintura, herramientas..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  onFocus={() => setSearchFocused(true)}
                  onBlur={() => setSearchFocused(false)}
                  className="search-input"
                />
                <button className="search-button">
                  <Search className="search-icon" />
                </button>
              </div>
              
              <div className="search-suggestions">
                <span>Populares:</span>
                <a href="#">Cerámica</a>
                <a href="#">Pintura</a>
                <a href="#">Herramientas</a>
                <a href="#">Grifería</a>
              </div>
            </div>

            {/* Actions */}
            <div className="header-actions">

              {/* Zone Dropdown */}
              <div className="dropdown-container">
                <button 
                  onClick={() => setShowZoneDropdown(!showZoneDropdown)}
                  className="dropdown-trigger"
                >
                  <MapPin className="dropdown-icon" />
                  <div className="dropdown-label">
                    <span className="dropdown-subtitle">Entregar en</span>
                    <span className="dropdown-value">
                      {selectedZone} <ChevronRight size={14} className="chevron-icon rotate-90" />
                    </span>
                  </div>
                </button>
                
                {showZoneDropdown && (
                  <div className="dropdown-menu zone-menu">
                    <div className="dropdown-header">Selecciona tu zona</div>
                    {zones.map((zone) => (
                      <button
                        key={zone}
                        onClick={() => { setSelectedZone(zone); setShowZoneDropdown(false); }}
                        className={`dropdown-item ${selectedZone === zone ? 'active' : ''}`}
                      >
                        <MapPin size={14} />
                        {zone}
                      </button>
                    ))}
                  </div>
                )}
              </div>

              {/* Currency Dropdown */}
              <div className="dropdown-container">
                <button 
                  onClick={() => setShowCurrencyDropdown(!showCurrencyDropdown)}
                  className="dropdown-trigger"
                >
                  <DollarSign className="dropdown-icon" />
                  <div className="dropdown-label">
                    <span className="dropdown-subtitle">Moneda</span>
                    <span className="dropdown-value">
                      {selectedCurrency} <ChevronRight size={14} className="chevron-icon rotate-90" />
                    </span>
                  </div>
                </button>

                {showCurrencyDropdown && (
                  <div className="dropdown-menu currency-menu">
                    <div className="dropdown-header">Selecciona moneda</div>
                    {currencies.map((curr) => (
                      <button
                        key={curr.code}
                        onClick={() => { setSelectedCurrency(curr.code); setShowCurrencyDropdown(false); }}
                        className={`dropdown-item ${selectedCurrency === curr.code ? 'active' : ''}`}
                      >
                        <span className="currency-symbol">{curr.symbol}</span>
                        <div className="currency-info">
                          <span className="currency-code">{curr.code}</span>
                          <span className="currency-name">{curr.name}</span>
                        </div>
                      </button>
                    ))}
                  </div>
                )}
              </div>

              {/* Cart */}
              <button className="cart-button" onClick={() => setShowCarrito(true)}>
                <div className="cart-icon-wrapper">
                  <ShoppingCart className="cart-icon" />
                  {getCartCount() > 0 && (
                    <span className="cart-badge">{getCartCount()}</span>
                  )}
                </div>
                <span className="cart-text">Carrito</span>
              </button>

              {/* Mobile Menu Button */}
              <button 
                className="mobile-menu-btn"
                onClick={() => setShowMobileMenu(!showMobileMenu)}
              >
                {showMobileMenu ? <X size={24} /> : <Menu size={24} />}
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* NAVIGATION SIMPLE */}
      <nav className="header-nav">
        <div className="nav-container">
          <div className="nav-wrapper">
            
            {/* Links rápidos */}
            <div className="nav-links">
              <a href="/" className="nav-link">Inicio</a>
              <a href="/productos" className="nav-link">Productos</a>
              <a href="/equipo" className="nav-link">Equipo</a>
              <a href="/contacto" className="nav-link">Contacto</a>
              <a href="/ofertas" className="nav-link highlight">
                <Percent size={14} />
                Ofertas
              </a>
              <a href="/mas-vendidos" className="nav-link">Más Vendidos</a>
            </div>

            {/* Banner rotativo */}
            <div className="nav-banner">
              <a href="#" className="banner-item">🔥 20% OFF en Cerámica</a>
              <a href="#" className="banner-item">🚚 Envío GRATIS +$500</a>
              <a href="#" className="banner-item">💰 Precio Mayorista desde 5 unid.</a>
            </div>
          </div>
        </div>
      </nav>

      {/* Overlays */}
      {(showZoneDropdown || showCurrencyDropdown) && (
        <div 
          className="dropdown-overlay" 
          onClick={() => { 
            setShowZoneDropdown(false); 
            setShowCurrencyDropdown(false); 
          }} 
        />
      )}

      {/* Carrito Sidebar */}
      <Carrito isOpen={showCarrito} onClose={() => setShowCarrito(false)} />
    </header>
  );
};

export default Header;