import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Sidebar from '../components/Sidebar';
import supabase from '../conf/supabase';
import { useCart } from '../context/CartContext';
import Carrito from '../components/Carrito';
import { 
  ShoppingBag, 
  Heart, 
  Package, 
  Search,
  DollarSign,
  ShoppingCart,
  Grid,
  List,
  Sparkles
} from 'lucide-react';
import '../css/dashboard.css';

const Dashboard = () => {
  const navigate = useNavigate();
  const { cart, addToCart: addToCartContext, getCartCount } = useCart();
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [subcategories, setSubcategories] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [priceType, setPriceType] = useState('mayor'); // 'mayor' o 'detal'
  const [viewMode, setViewMode] = useState('grid'); // 'grid' o 'list'
  const [sortBy, setSortBy] = useState('nombre'); // 'nombre', 'precio', 'stock'
  const [showCart, setShowCart] = useState(false);
  const [favorites, setFavorites] = useState([]);

  useEffect(() => {
    checkUser();
  }, []);

  useEffect(() => {
    if (user) {
      fetchProducts();
      fetchCategories();
      fetchSubcategories();
      loadFavorites();
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

  const fetchProducts = async () => {
    try {
      const { data } = await supabase
        .from('productos')
        .select('*')
        .eq('activo', true)
        .order('nombre', { ascending: true });
      setProducts(data || []);
    } catch (error) {
      console.error('Error:', error);
    }
  };

  const fetchCategories = async () => {
    try {
      const { data } = await supabase
        .from('categorias')
        .select('*')
        .eq('activo', true)
        .order('orden', { ascending: true });
      setCategories(data || []);
    } catch (error) {
      console.error('Error:', error);
    }
  };

  const fetchSubcategories = async () => {
    try {
      const { data } = await supabase
        .from('subcategorias')
        .select('*');
      setSubcategories(data || []);
    } catch (error) {
      console.error('Error:', error);
    }
  };

  const loadFavorites = () => {
    if (!user?.id) return;
    const saved = localStorage.getItem(`favorites_${user.id}`);
    if (saved) {
      try {
        setFavorites(JSON.parse(saved));
      } catch (error) {
        console.error('Error loading favorites:', error);
        setFavorites([]);
      }
    }
  };

  const saveFavorites = (newFavorites) => {
    if (!user?.id) return;
    localStorage.setItem(`favorites_${user.id}`, JSON.stringify(newFavorites));
  };

  const handleLogout = async () => {
    await supabase.auth.signOut();
    navigate('/login');
  };

  const addToCart = (product) => {
    const price = priceType === 'mayor' ? product.precio_mayor : product.precio_detal;
    const productWithPrice = { 
      ...product, 
      selectedPrice: price, 
      priceType 
    };
    addToCartContext(productWithPrice, 1);
    
    // Mostrar notificación
    showNotification('🛒 Agregado al carrito');
  };

  const toggleFavorite = (productId) => {
    let newFavorites;
    let message;
    
    if (favorites.includes(productId)) {
      newFavorites = favorites.filter(id => id !== productId);
      message = '💔 Eliminado de favoritos';
    } else {
      newFavorites = [...favorites, productId];
      message = '❤️ Agregado a favoritos';
    }
    
    setFavorites(newFavorites);
    saveFavorites(newFavorites);
    
    // Mostrar notificación
    showNotification(message);
  };

  const showNotification = (message) => {
    // Remover notificación anterior si existe
    const existingNotification = document.querySelector('.favorite-notification');
    if (existingNotification) {
      existingNotification.remove();
    }
    
    const notification = document.createElement('div');
    notification.className = 'favorite-notification';
    notification.textContent = message;
    document.body.appendChild(notification);
    
    // Animar entrada
    setTimeout(() => notification.classList.add('show'), 10);
    
    // Remover después de 2 segundos
    setTimeout(() => {
      notification.classList.remove('show');
      setTimeout(() => notification.remove(), 300);
    }, 2000);
  };

  const getCartTotal = () => {
    return cart.reduce((total, item) => {
      const price = item.selectedPrice || item.precio_mayor || item.precio_detal || 0;
      return total + (price * item.quantity);
    }, 0).toFixed(2);
  };

  const filteredProducts = products.filter(p => {
    const matchesSearch = p.nombre.toLowerCase().includes(searchTerm.toLowerCase());
    
    // Filtrar por categoría a través de subcategorías
    let matchesCategory = true;
    if (selectedCategory) {
      const subcatsOfCategory = subcategories
        .filter(sub => sub.categoria_id === selectedCategory)
        .map(sub => sub.id);
      matchesCategory = subcatsOfCategory.includes(p.subcategoria_id);
    }
    
    return matchesSearch && matchesCategory;
  }).sort((a, b) => {
    if (sortBy === 'nombre') return a.nombre.localeCompare(b.nombre);
    if (sortBy === 'precio') {
      const priceA = priceType === 'mayor' ? a.precio_mayor : a.precio_detal;
      const priceB = priceType === 'mayor' ? b.precio_mayor : b.precio_detal;
      return priceA - priceB;
    }
    if (sortBy === 'stock') return b.stock - a.stock;
    return 0;
  });

  if (loading) {
    return (
      <div className="dashboard-loading">
        <div className="loading-spinner">
          <Package size={48} />
        </div>
      </div>
    );
  }

  return (
    <div className="dashboard-layout">
      <Sidebar onLogout={handleLogout} />
      
      <main className="dashboard-page">
        <div className="dashboard-hero-mini">
          <div className="hero-welcome">
            <h1>¡Bienvenido de nuevo!</h1>
            <p>{user?.email}</p>
          </div>
        </div>

      <div className="dashboard-container">
        {/* Stats Cards */}
        <div className="stats-row">
          <div className="stat-mini">
            <ShoppingBag className="stat-mini-icon" style={{ color: '#1a237e' }} />
            <div>
              <span className="stat-mini-value">{products.length}</span>
              <span className="stat-mini-label">Productos</span>
            </div>
          </div>
          <div className="stat-mini">
            <Heart className="stat-mini-icon" style={{ color: '#e91e63' }} />
            <div>
              <span className="stat-mini-value">{favorites.length}</span>
              <span className="stat-mini-label">Favoritos</span>
            </div>
          </div>
          <div className="stat-mini">
            <ShoppingCart className="stat-mini-icon" style={{ color: '#00bcd4' }} />
            <div>
              <span className="stat-mini-value">{getCartCount()}</span>
              <span className="stat-mini-label">En Carrito</span>
            </div>
          </div>
          <div className="stat-mini">
            <DollarSign className="stat-mini-icon" style={{ color: '#4caf50' }} />
            <div>
              <span className="stat-mini-value">${getCartTotal()}</span>
              <span className="stat-mini-label">Total</span>
            </div>
          </div>
        </div>

        <div className="products-section">
          <div className="products-header">
            <div className="search-filter-bar">
              <div className="search-box-dashboard">
                <Search size={20} />
                <input
                  type="text"
                  placeholder="Buscar productos..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                />
              </div>

              <div className="view-controls">
                <button
                  className={`view-btn ${viewMode === 'grid' ? 'active' : ''}`}
                  onClick={() => setViewMode('grid')}
                >
                  <Grid size={18} />
                </button>
                <button
                  className={`view-btn ${viewMode === 'list' ? 'active' : ''}`}
                  onClick={() => setViewMode('list')}
                >
                  <List size={18} />
                </button>
              </div>

              <select 
                className="sort-select"
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value)}
              >
                <option value="nombre">Ordenar por Nombre</option>
                <option value="precio">Ordenar por Precio</option>
                <option value="stock">Ordenar por Stock</option>
              </select>

              <div className="price-toggle">
                <button
                  className={`toggle-btn ${priceType === 'mayor' ? 'active' : ''}`}
                  onClick={() => setPriceType('mayor')}
                >
                  <DollarSign size={18} />
                  Al Mayor
                </button>
                <button
                  className={`toggle-btn ${priceType === 'detal' ? 'active' : ''}`}
                  onClick={() => setPriceType('detal')}
                >
                  <ShoppingCart size={18} />
                  Al Detal
                </button>
              </div>
            </div>

            <div className="categories-filter">
              <button
                className={`category-btn ${!selectedCategory ? 'active' : ''}`}
                onClick={() => setSelectedCategory(null)}
              >
                <Sparkles size={16} />
                Todos
              </button>
              {categories.map(cat => (
                <button
                  key={cat.id}
                  className={`category-btn ${selectedCategory === cat.id ? 'active' : ''}`}
                  onClick={() => setSelectedCategory(cat.id)}
                >
                  <span>{cat.icono}</span>
                  {cat.nombre}
                </button>
              ))}
            </div>

            <div className="results-info">
              <span>{filteredProducts.length} productos encontrados</span>
              {selectedCategory && (
                <button 
                  className="clear-filter"
                  onClick={() => setSelectedCategory(null)}
                >
                  Limpiar filtros
                </button>
              )}
            </div>
          </div>

          <div className={`products-grid-dashboard ${viewMode}`}>
            {filteredProducts.map((product) => (
              <div
                key={product.id}
                className="product-card-dashboard"
              >
                <div className="product-image-dashboard">
                  <img 
                    src={product.imagen || `data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Crect fill='%231a237e' width='300' height='300'/%3E%3Ctext fill='%23ffffff' font-family='Arial' font-size='20' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3EProducto%3C/text%3E%3C/svg%3E`} 
                    alt={product.nombre}
                  />
                  <button
                    className={`favorite-btn ${favorites.includes(product.id) ? 'active' : ''}`}
                    onClick={() => toggleFavorite(product.id)}
                  >
                    <Heart size={20} fill={favorites.includes(product.id) ? '#e91e63' : 'none'} />
                  </button>
                  {product.stock < 10 && product.stock > 0 && (
                    <span className="stock-badge low">¡Últimas {product.stock} unidades!</span>
                  )}
                  {product.stock === 0 && (
                    <span className="stock-badge out">Agotado</span>
                  )}
                </div>
                <div className="product-info-dashboard">
                  <h3>{product.nombre}</h3>
                  {product.descripcion && (
                    <p className="product-description">{product.descripcion}</p>
                  )}
                  <div className="product-prices">
                    <div className="price-item">
                      <span className="price-label">Al Mayor:</span>
                      <span className={`price-value ${priceType === 'mayor' ? 'active' : ''}`}>
                        ${product.precio_mayor || 'N/A'}
                      </span>
                    </div>
                    <div className="price-item">
                      <span className="price-label">Al Detal:</span>
                      <span className={`price-value ${priceType === 'detal' ? 'active' : ''}`}>
                        ${product.precio_detal || 'N/A'}
                      </span>
                    </div>
                  </div>
                  <button
                    onClick={() => addToCart(product)}
                    className="add-cart-btn-dashboard"
                    disabled={product.stock === 0}
                  >
                    <ShoppingCart size={18} />
                    Agregar al Carrito
                  </button>
                </div>
              </div>
            ))}
          </div>

          {filteredProducts.length === 0 && (
            <div className="empty-products">
              <Package size={64} />
              <h3>No se encontraron productos</h3>
              <p>Intenta con otra búsqueda o categoría</p>
            </div>
          )}
        </div>
      </div>
      </main>

      {/* Botón Flotante del Carrito */}
      {cart.length > 0 && (
        <button 
          className="floating-cart-btn"
          onClick={() => setShowCart(true)}
        >
          <ShoppingCart size={24} />
          <span className="cart-badge">{getCartCount()}</span>
        </button>
      )}

      {/* Carrito Lateral */}
      <Carrito 
        isOpen={showCart} 
        onClose={() => setShowCart(false)} 
      />
    </div>
  );
};

export default Dashboard;
