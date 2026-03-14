import { X, Plus, Minus, Trash2, ShoppingBag } from 'lucide-react';
import { useState } from 'react';
import { useCart } from '../context/CartContext';
import ModalCotizacion from './ModalCotizacion';
import '../css/carrito.css';

const PLACEHOLDER_IMAGE = 'data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="80" height="80"%3E%3Crect fill="%23f3f4f6" width="80" height="80"/%3E%3Ctext fill="%239ca3af" font-family="Arial" font-size="12" x="50%25" y="50%25" text-anchor="middle" dy=".3em"%3ESin imagen%3C/text%3E%3C/svg%3E';

const Carrito = ({ isOpen, onClose }) => {
  const { 
    cart, 
    removeFromCart, 
    updateQuantity, 
    getCartCount 
  } = useCart();
  
  const [showModalCotizacion, setShowModalCotizacion] = useState(false);

  if (!isOpen) return null;

  const handleCheckout = () => {
    // NO cerrar el carrito, solo abrir el modal
    setShowModalCotizacion(true);
  };

  const handleCloseModal = () => {
    setShowModalCotizacion(false);
    // Cerrar el carrito después de cerrar el modal
    onClose();
  };

  return (
    <>
      <div className="carrito-overlay" onClick={onClose} />
      <div className="carrito-sidebar">
        <div className="carrito-header">
          <div className="carrito-title">
            <ShoppingBag size={24} />
            <h2>Mi Carrito</h2>
            <span className="carrito-count">({getCartCount()})</span>
          </div>
          <button className="carrito-close" onClick={onClose}>
            <X size={24} />
          </button>
        </div>

        <div className="carrito-body">
          {cart.length === 0 ? (
            <div className="carrito-empty">
              <ShoppingBag size={64} className="empty-icon" />
              <h3>Tu carrito está vacío</h3>
              <p>Agrega productos para comenzar tu compra</p>
              <button className="btn-primary" onClick={onClose}>
                Ver Productos
              </button>
            </div>
          ) : (
            <>
              <div className="carrito-notice">
                <p>📋 Este es tu carrito de cotización. Los productos seleccionados serán enviados para solicitar precios y disponibilidad.</p>
              </div>

              <div className="carrito-items">
                {cart.map((item) => (
                  <div key={item.id} className="carrito-item">
                    <img 
                      src={item.imagen || PLACEHOLDER_IMAGE} 
                      alt={item.nombre}
                      className="item-image"
                    />
                    <div className="item-details">
                      <h4 className="item-name">{item.nombre}</h4>
                      <div className="item-price">
                        <span className="price-label">Cantidad: {item.quantity}</span>
                        <span className="price-hint">Solicitar cotización</span>
                      </div>
                      
                      <div className="item-actions">
                        <div className="quantity-controls">
                          <button 
                            onClick={() => updateQuantity(item.id, item.quantity - 1)}
                            className="qty-btn"
                          >
                            <Minus size={14} />
                          </button>
                          <span className="qty-value">{item.quantity}</span>
                          <button 
                            onClick={() => updateQuantity(item.id, item.quantity + 1)}
                            className="qty-btn"
                          >
                            <Plus size={14} />
                          </button>
                        </div>
                        
                        <button 
                          onClick={() => removeFromCart(item.id)}
                          className="btn-remove"
                        >
                          <Trash2 size={16} />
                        </button>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </>
          )}
        </div>

        {cart.length > 0 && (
          <div className="carrito-footer">
            <div className="carrito-summary">
              <p className="summary-text">
                <strong>{getCartCount()}</strong> productos seleccionados para cotización
              </p>
            </div>
            <button 
              className="btn-checkout"
              onClick={handleCheckout}
            >
              Solicitar Cotización
            </button>
            <button className="btn-continue" onClick={onClose}>
              Continuar Viendo Productos
            </button>
          </div>
        )}
      </div>

      {/* Modal de Cotización */}
      <ModalCotizacion 
        isOpen={showModalCotizacion} 
        onClose={handleCloseModal} 
      />
    </>
  );
};

export default Carrito;
