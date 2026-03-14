import { useState } from 'react';
import { ShoppingCart, Plus, Minus, Heart } from 'lucide-react';
import '../css/card.css';

const PLACEHOLDER_IMAGE = 'data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="300" height="300"%3E%3Crect fill="%23f3f4f6" width="300" height="300"/%3E%3Ctext fill="%239ca3af" font-family="Arial" font-size="16" x="50%25" y="50%25" text-anchor="middle" dy=".3em"%3ESin imagen%3C/text%3E%3C/svg%3E';

const CardWithPrice = ({ product, onAddToCart, onToggleFavorite, isFavorite = false }) => {
  const [quantity, setQuantity] = useState(1);
  const [adding, setAdding] = useState(false);

  const adjustQty = (delta) => {
    const newQty = quantity + delta;
    if (newQty >= 1 && newQty <= product.stock) setQuantity(newQty);
  };

  const handleAddToCart = () => {
    setAdding(true);
    onAddToCart(product, quantity);
    
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
        
        {/* Botón de favoritos */}
        {onToggleFavorite && (
          <button
            className={`favorite-btn ${isFavorite ? 'active' : ''}`}
            onClick={() => onToggleFavorite(product.id)}
            title={isFavorite ? 'Quitar de favoritos' : 'Agregar a favoritos'}
          >
            <Heart size={20} fill={isFavorite ? '#e91e63' : 'none'} />
          </button>
        )}
        
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
        {product.codigo && (
          <p className="product-code">Código: {product.codigo}</p>
        )}
        {product.descripcion && (
          <p className="product-description">{product.descripcion}</p>
        )}
        
        {/* Precios visibles para usuarios autenticados */}
        <div className="product-prices">
          <div className="price-row">
            <span className="price-label">Al Mayor:</span>
            <span className="price-value">${product.precio_mayor || 'N/A'}</span>
          </div>
          <div className="price-row">
            <span className="price-label">Al Detal:</span>
            <span className="price-value">${product.precio_detal || 'N/A'}</span>
          </div>
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
        <span>{adding ? '¡Agregado!' : 'Agregar al Carrito'}</span>
      </button>
    </div>
  );
};

export default CardWithPrice;
