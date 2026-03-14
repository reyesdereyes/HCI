import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Sidebar from '../components/Sidebar';
import supabase from '../conf/supabase';
import { 
  Heart,
  ShoppingCart,
  Trash2,
  Package
} from 'lucide-react';
import '../css/userFavorites.css';

const UserFavorites = () => {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const [favorites, setFavorites] = useState([]);
  const [products, setProducts] = useState([]);
  const [favoriteProducts, setFavoriteProducts] = useState([]);

  useEffect(() => {
    checkUser();
  }, []);

  useEffect(() => {
    if (user) {
      loadFavorites();
      fetchProducts();
    }
  }, [user]);

  useEffect(() => {
    // Actualizar productos favoritos cuando cambien los favoritos o productos
    if (products.length > 0 && favorites.length > 0) {
      const favProds = products.filter(p => favorites.includes(p.id));
      setFavoriteProducts(favProds);
    } else {
      setFavoriteProducts([]);
    }
  }, [favorites, products]);

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

  const loadFavorites = () => {
    if (!user?.id) return;
    const saved = localStorage.getItem(`favorites_${user.id}`);
    console.log('Favoritos cargados:', saved); // Debug
    if (saved) {
      try {
        const parsedFavorites = JSON.parse(saved);
        setFavorites(parsedFavorites);
      } catch (error) {
        console.error('Error loading favorites:', error);
        setFavorites([]);
      }
    }
  };

  const fetchProducts = async () => {
    try {
      const { data } = await supabase
        .from('productos')
        .select('*')
        .eq('activo', true);
      setProducts(data || []);
    } catch (error) {
      console.error('Error:', error);
    }
  };

  const handleLogout = async () => {
    await supabase.auth.signOut();
    navigate('/login');
  };

  const removeFavorite = (productId) => {
    const newFavorites = favorites.filter(id => id !== productId);
    setFavorites(newFavorites);
    
    // Guardar en localStorage
    if (user?.id) {
      localStorage.setItem(`favorites_${user.id}`, JSON.stringify(newFavorites));
    }
    
    // Mostrar notificación
    showNotification('💔 Eliminado de favoritos');
  };

  const addToCart = (product) => {
    // Obtener carrito actual
    const savedCart = localStorage.getItem(`cart_${user?.id}`);
    let cart = [];
    
    if (savedCart) {
      try {
        cart = JSON.parse(savedCart);
      } catch (error) {
        console.error('Error loading cart:', error);
      }
    }
    
    // Agregar producto
    const existingItem = cart.find(item => item.id === product.id);
    let newCart;
    
    if (existingItem) {
      newCart = cart.map(item => 
        item.id === product.id 
          ? { ...item, quantity: item.quantity + 1 }
          : item
      );
    } else {
      newCart = [...cart, { 
        ...product, 
        quantity: 1, 
        selectedPrice: product.precio_mayor,
        priceType: 'mayor'
      }];
    }
    
    // Guardar carrito
    if (user?.id) {
      localStorage.setItem(`cart_${user.id}`, JSON.stringify(newCart));
    }
    
    showNotification('✓ Agregado al carrito');
  };

  const showNotification = (message) => {
    const existingNotification = document.querySelector('.favorite-notification');
    if (existingNotification) {
      existingNotification.remove();
    }
    
    const notification = document.createElement('div');
    notification.className = 'favorite-notification';
    notification.textContent = message;
    document.body.appendChild(notification);
    
    setTimeout(() => notification.classList.add('show'), 10);
    
    setTimeout(() => {
      notification.classList.remove('show');
      setTimeout(() => notification.remove(), 300);
    }, 2000);
  };

  if (loading) {
    return (
      <div className="favorites-loading">
        <div className="loading-spinner">
          <Heart size={48} />
        </div>
      </div>
    );
  }

  return (
    <div className="favorites-layout">
      <Sidebar onLogout={handleLogout} />
      
      <div className="favorites-content">
        <div className="favorites-header">
          <div>
            <h1>Mis Favoritos</h1>
            <p>Productos que te encantan</p>
          </div>
          <div className="favorites-count">
            <Heart size={32} fill="#e91e63" color="#e91e63" />
            <div>
              <span className="count-value">{favoriteProducts.length}</span>
              <span className="count-label">Favoritos</span>
            </div>
          </div>
        </div>

        <div className="favorites-container">
          {favoriteProducts.length > 0 ? (
            <div className="favorites-grid">
              {favoriteProducts.map((product) => (
                <div
                  key={product.id}
                  className="favorite-card"
                >
                  <button
                    className="remove-favorite-btn"
                    onClick={() => removeFavorite(product.id)}
                  >
                    <Trash2 size={18} />
                  </button>

                  <div className="favorite-image">
                    <img 
                      src={product.imagen || `data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Crect fill='%231a237e' width='300' height='300'/%3E%3Ctext fill='%23ffffff' font-family='Arial' font-size='20' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3EProducto%3C/text%3E%3C/svg%3E`} 
                      alt={product.nombre}
                    />
                  </div>

                  <div className="favorite-info">
                    <h3>{product.nombre}</h3>
                    {product.descripcion && (
                      <p className="favorite-description">{product.descripcion}</p>
                    )}
                    
                    <div className="favorite-prices">
                      <div className="price-row">
                        <span className="price-label">Al Mayor:</span>
                        <span className="price-value">${product.precio_mayor || 'N/A'}</span>
                      </div>
                      <div className="price-row">
                        <span className="price-label">Al Detal:</span>
                        <span className="price-value">${product.precio_detal || 'N/A'}</span>
                      </div>
                    </div>

                    <div className="favorite-actions">
                      <button
                        onClick={() => addToCart(product)}
                        className="add-to-cart-btn"
                      >
                        <ShoppingCart size={18} />
                        Agregar al Carrito
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className="empty-favorites">
              <Heart size={64} />
              <h3>No tienes favoritos aún</h3>
              <p>Explora nuestros productos y guarda tus favoritos aquí</p>
              <button
                onClick={() => navigate('/dashboard')}
                className="browse-btn"
              >
                Explorar Productos
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default UserFavorites;
