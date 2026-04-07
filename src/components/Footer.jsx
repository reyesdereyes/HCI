import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Mail, Phone, MapPin, Facebook, Instagram, Twitter, Linkedin, CreditCard, Truck, ShieldCheck, RotateCcw, ChevronRight } from 'lucide-react';
import '../css/footer.css';

const Footer = () => {
  const navigate = useNavigate();
  const [email, setEmail] = useState('');

  const handleSubscribe = (e) => {
    e.preventDefault();
    alert(`Gracias por suscribirte: ${email}`);
    setEmail('');
  };

  const footerLinks = {
    'Sobre Nosotros': ['Quiénes somos', 'Nuestra historia', 'Trabaja con nosotros', 'Responsabilidad social'],
    'Atención al Cliente': ['Centro de ayuda', 'Preguntas frecuentes', 'Términos y condiciones', 'Política de privacidad', 'Garantías'],
    'Servicios': ['Cotizaciones', 'Asesoría técnica', 'Envíos a nivel nacional', 'Instalación'],
    'Categorías': ['Construcción', 'Refrigeración', 'Decoración', 'Herramientas', 'Acabados']
  };

  const paymentMethods = ['Visa', 'Mastercard', 'Amex', 'PayPal', 'Pago Móvil', 'Zelle'];

  return (
    <footer className="footer">
      {/* Features */}
      <div className="footer-features">
        <div className="features-container">
          <div className="features-grid">
            <div className="feature-item">
              <Truck className="feature-icon" />
              <div>
                <h4 className="feature-title">Envío Gratis</h4>
                <p className="feature-desc">En compras mayores a $50</p>
              </div>
            </div>
            <div className="feature-item">
              <ShieldCheck className="feature-icon" />
              <div>
                <h4 className="feature-title">Pago Seguro</h4>
                <p className="feature-desc">100% protegido</p>
              </div>
            </div>
            <div className="feature-item">
              <RotateCcw className="feature-icon" />
              <div>
                <h4 className="feature-title">Devoluciones</h4>
                <p className="feature-desc">30 días de garantía</p>
              </div>
            </div>
            <div className="feature-item">
              <CreditCard className="feature-icon" />
              <div>
                <h4 className="feature-title">Varios Métodos</h4>
                <p className="feature-desc">De pago disponibles</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="footer-main">
        <div className="footer-grid">
          {/* Brand */}
          <div className="footer-brand">
            <div className="brand-logo">
              <img 
                src="/PHOTO-2026-03-11-14-40-08.jpg" 
                alt="Hitach Cool Import" 
                className="footer-logo-img"
                style={{ width: '60px', height: '60px', objectFit: 'cover', borderRadius: '8px' }}
              />
              <h3 className="brand-title">Hitach Cool Import</h3>
            </div>
            <p className="brand-description">
              Tu tienda de construcción y decoración de confianza. Encuentra todo lo que necesitas al mejor precio.
            </p>
            
            <h4 className="newsletter-title">Suscríbete a nuestro newsletter</h4>
            <form onSubmit={handleSubscribe} className="newsletter-form">
              <div className="input-wrapper">
                <Mail className="input-icon" />
                <input
                  type="email"
                  placeholder="Tu correo electrónico"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="newsletter-input"
                  required
                />
              </div>
              <button type="submit" className="newsletter-btn">Suscribir</button>
            </form>

            <div className="social-links">
              <a href="#" className="social-link"><Facebook className="social-icon" /></a>
              <a href="#" className="social-link"><Instagram className="social-icon" /></a>
              <a href="#" className="social-link"><Twitter className="social-icon" /></a>
              <a href="#" className="social-link"><Linkedin className="social-icon" /></a>
            </div>
          </div>

          {/* Links Columns */}
          {Object.entries(footerLinks).map(([title, links]) => (
            <div key={title} className="footer-column">
              <h4>{title}</h4>
              <ul className="footer-links">
                {links.map((link) => (
                  <li key={link}>
                    <a href="#" className="footer-link">
                      <ChevronRight className="link-arrow" />
                      {link}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Contact */}
        <div className="footer-contact">
          <div className="contact-grid">
            <div className="contact-item">
              <div className="contact-icon-wrapper">
                <Phone className="contact-icon" />
              </div>
              <div>
                <p className="contact-label">Teléfono</p>
                <p className="contact-value">+58 241-123-4567</p>
              </div>
            </div>
            <div className="contact-item">
              <div className="contact-icon-wrapper">
                <Mail className="contact-icon" />
              </div>
              <div>
                <p className="contact-label">Email</p>
                <p className="contact-value">info@hitachcoolimport.com</p>
              </div>
            </div>
            <div className="contact-item">
              <div className="contact-icon-wrapper">
                <MapPin className="contact-icon" />
              </div>
              <div>
                <p className="contact-label">Ubicación</p>
                <p className="contact-value">Valencia, Carabobo, Venezuela</p>
              </div>
            </div>
          </div>
        </div>

        {/* Payments */}
        <div className="footer-payments">
          <div className="payments-wrapper">
            <span className="payments-label">Métodos de pago:</span>
            <div className="payments-list">
              {paymentMethods.map((method) => (
                <span key={method} className="payment-method">{method}</span>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Copyright */}
      <div className="footer-copyright">
        <div className="copyright-container">
          <div className="copyright-wrapper">
            <p>© 2026 Hitach Cool Import. Todos los derechos reservados.</p>
            <div className="copyright-links">
              <a href="#" className="copyright-link">Términos</a>
              <a href="#" className="copyright-link">Privacidad</a>
              <a href="#" className="copyright-link">Cookies</a>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;