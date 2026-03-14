import { useState } from 'react';
import { ShoppingCart, Plus, Minus } from 'lucide-react';
import { useCart } from '../context/CartContext';
import '../css/card.css';

const PLACEHOLDER_IMAGE = 'data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="300" height="300"%3E%3Crect fill="%23f3f4f6" width="300" height="300"/%3E%3Ctext fill="%239ca3af" font-family="Arial" font-size="16" x="50%25" y="50%25" text-anchor="middle" dy=".3em"%3ESin imagen%3C/text%3E%3C/svg%3E';

const Card = ({ product }) => {
  const { addToCart, isAuthenticated } = useCart();
  const [quantity, setQuantity] = useState(1);
  const [adding, setAdding] = useState(false);

  const adjustQty = (delta) => {
    const newQty = quantity + delta;
    if (newQty >= 1 && newQty <= product.stock) setQuantity(newQty);
  };

  const handleAddToCart = () => {
    setAdding(true);
    addToCart(product, quantity);
    
    // Feedback visual
    setTimeout(() => {
      setAdding(false);
      setQuantity(1);
    }, 500);
  };

  return (
    <div className="product-card">
      {/* Imagen */}
      <div className="product-image-container">
        <img 
          src={product.imagen || PLACEHOLDER_IMAGE} 
          alt={product.nombre} 
          className="product-image"
          onError={(e) => {
            e.target.src = PLACEHOLDER_IMAGE;
          }}
        />
        {product.stock < 10 && product.stock > 0 && (
          <span className="stock-badge low">¡Últimas {product.stock} unidades!</span>
        )}
        {product.stock === 0 && (
          <span className="stock-badge out">Agotado</span>
        )}
      </div>

      {/* Info */}
      <div className="product-info">
        <h3 className="product-name">{product.nombre}</h3>
        {product.descripcion && (
          <p className="product-description">{product.descripcion}</p>
        )}
        
        {/* Sin precios en inicio - solo para cotización */}
        <div className="product-prices">
          <span className="price-quote">Solicitar cotización</span>
          <span className="price-hint">Agrega al carrito para cotizar</span>
        </div>
      </div>

      {/* Cantidad */}
      <div className="quantity-section">
        <div className="qty-selector">
          <button 
            className="qty-btn" 
            onClick={() => adjustQty(-1)} 
            disabled={quantity <= 1}
          >
            <Minus size={16} />
          </button>
          <span className="qty-number">{quantity}</span>
          <button 
            className="qty-btn" 
            onClick={() => adjustQty(1)} 
            disabled={quantity >= product.stock}
          >
            <Plus size={16} />
          </button>
        </div>
      </div>

      {/* Botón Agregar al Carrito */}
      <button 
        className={`add-to-cart-btn-full ${adding ? 'adding' : ''}`}
        onClick={handleAddToCart}
        disabled={product.stock === 0 || adding}
      >
        <ShoppingCart size={18} />
        <span>{adding ? '¡Agregado!' : 'Agregar para Cotizar'}</span>
      </button>
    </div>
  );
};

export default Card;
