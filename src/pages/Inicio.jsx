import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../components/Header.jsx';
import Footer from '../components/Footer.jsx';
import supabase from '../conf/supabase';
import { 
  Truck, 
  ShieldCheck, 
  Headphones, 
  Package, 
  TrendingUp,
  Award,
  Users,
  Clock,
  MapPin,
  Phone,
  Mail,
  ArrowRight
} from 'lucide-react';
import '../css/inicio.css';

const Inicio = () => {
  const navigate = useNavigate();
  const [stats, setStats] = useState({
    totalProducts: 0,
    totalCategories: 0
  });

  // Cargar solo estadísticas básicas
  useEffect(() => {
    const fetchStats = async () => {
      try {
        const { count: totalProds } = await supabase
          .from('productos')
          .select('*', { count: 'exact', head: true })
          .eq('activo', true);

        const { count: totalCats } = await supabase
          .from('categorias')
          .select('*', { count: 'exact', head: true })
          .eq('activo', true);

        setStats({
          totalProducts: totalProds || 0,
          totalCategories: totalCats || 0
        });
      } catch (err) {
        console.error('Error cargando estadísticas:', err);
      }
    };

    fetchStats();
  }, []);

  return (
    <>
      <Header />

      <main className="inicio-container">
        
        {/* ========== HERO SECTION ========== */}
        <section className="hero-section">
          <div className="hero-content">
            <div className="hero-badge">
              <TrendingUp size={16} />
              <span>Tu aliado en construcción y remodelación</span>
            </div>
            <h1>Todo para tu Proyecto en un Solo Lugar</h1>
            <p>Somos distribuidores especializados en materiales de construcción, herramientas profesionales, cerámica y acabados de primera calidad. Atendemos tanto al detal como al mayor con los mejores precios del mercado.</p>
            <div className="hero-buttons">
              <button className="hero-btn-primary" onClick={() => navigate('/productos')}>
                Ver Catálogo Completo
              </button>
              <button className="hero-btn-secondary" onClick={() => navigate('/contacto')}>
                Solicitar Cotización
              </button>
            </div>
            
            <div className="hero-stats">
              <div className="stat-item">
                <span className="stat-number">{stats.totalProducts}+</span>
                <span className="stat-label">Productos</span>
              </div>
              <div className="stat-item">
                <span className="stat-number">15+</span>
                <span className="stat-label">Años</span>
              </div>
              <div className="stat-item">
                <span className="stat-number">24/7</span>
                <span className="stat-label">Atención</span>
              </div>
              <div className="stat-item">
                <span className="stat-number">100%</span>
                <span className="stat-label">Garantía</span>
              </div>
            </div>
          </div>
        </section>

        {/* ========== FEATURES BAR ========== */}
        <section className="features-bar">
          <div className="feature-item">
            <Truck size={28} />
            <div>
              <span className="feature-title">Envío Rápido</span>
              <span className="feature-desc">Entrega en 24-48h</span>
            </div>
          </div>
          <div className="feature-item">
            <ShieldCheck size={28} />
            <div>
              <span className="feature-title">Garantía Total</span>
              <span className="feature-desc">100% protegido</span>
            </div>
          </div>
          <div className="feature-item">
            <Headphones size={28} />
            <div>
              <span className="feature-title">Soporte 24/7</span>
              <span className="feature-desc">Asesoría experta</span>
            </div>
          </div>
          <div className="feature-item">
            <Package size={28} />
            <div>
              <span className="feature-title">Precio Mayorista</span>
              <span className="feature-desc">Desde 5 unidades</span>
            </div>
          </div>
        </section>

        {/* ========== SOBRE NOSOTROS ========== */}
        <section className="about-section">
          <div className="about-container">
            <div className="about-content">
              <h2>Hitach Cool Import</h2>
              <h3>Más de 15 años construyendo confianza</h3>
              <p>
                Somos una empresa venezolana dedicada a la importación y distribución de materiales de construcción, 
                herramientas y acabados de alta calidad. Nos especializamos en ofrecer soluciones integrales para 
                proyectos residenciales, comerciales e industriales.
              </p>
              <p>
                Nuestro compromiso es brindar productos de primera calidad a precios competitivos, con un servicio 
                personalizado que garantiza la satisfacción de nuestros clientes.
              </p>
              <div className="about-features">
                <div className="about-feature">
                  <Award size={24} />
                  <span>Productos Certificados</span>
                </div>
                <div className="about-feature">
                  <Users size={24} />
                  <span>Atención Personalizada</span>
                </div>
                <div className="about-feature">
                  <Clock size={24} />
                  <span>Entrega Puntual</span>
                </div>
              </div>
            </div>
            <div className="about-image">
              <img src="/PHOTO-2026-03-11-14-40-08.jpg" alt="Hitach Cool Import" />
            </div>
          </div>
        </section>

        {/* ========== SERVICIOS ========== */}
        <section className="services-section">
          <div className="section-header">
            <h2 className="section-title">Nuestros Servicios</h2>
            <p className="section-subtitle">Soluciones completas para tu proyecto</p>
          </div>
          
          <div className="services-grid">
            <div className="service-card">
              <div className="service-icon">
                <Package size={32} />
              </div>
              <h3>Venta al Detal</h3>
              <p>Productos de calidad para proyectos pequeños y medianos con precios competitivos.</p>
            </div>
            
            <div className="service-card">
              <div className="service-icon">
                <TrendingUp size={32} />
              </div>
              <h3>Venta al Mayor</h3>
              <p>Precios especiales para constructoras, contratistas y revendedores desde 5 unidades.</p>
            </div>
            
            <div className="service-card">
              <div className="service-icon">
                <Headphones size={32} />
              </div>
              <h3>Asesoría Técnica</h3>
              <p>Nuestro equipo de expertos te ayuda a elegir los mejores materiales para tu proyecto.</p>
            </div>
            
            <div className="service-card">
              <div className="service-icon">
                <Truck size={32} />
              </div>
              <h3>Entrega a Domicilio</h3>
              <p>Servicio de entrega rápida y segura en toda la región de Carabobo y zonas cercanas.</p>
            </div>
          </div>
        </section>

        {/* ========== CATEGORÍAS ========== */}
        <section className="categories-section">
          <div className="section-header">
            <h2 className="section-title">Nuestras Categorías</h2>
            <p className="section-subtitle">Amplio catálogo de productos para construcción y decoración</p>
          </div>
          
          <div className="categories-showcase">
            <div className="category-showcase-card">
              <div className="category-showcase-icon">🏗️</div>
              <h3>Materiales de Construcción</h3>
              <p>Cemento, arena, bloques, cabillas y todo lo necesario para tu obra.</p>
              <button className="category-btn" onClick={() => navigate('/productos')}>
                Ver productos <ArrowRight size={16} />
              </button>
            </div>
            
            <div className="category-showcase-card">
              <div className="category-showcase-icon">🎨</div>
              <h3>Decoración y Acabados</h3>
              <p>Cerámica, porcelanato, pinturas y revestimientos de alta calidad.</p>
              <button className="category-btn" onClick={() => navigate('/productos')}>
                Ver productos <ArrowRight size={16} />
              </button>
            </div>
            
            <div className="category-showcase-card">
              <div className="category-showcase-icon">🔧</div>
              <h3>Herramientas</h3>
              <p>Herramientas manuales y eléctricas para profesionales y aficionados.</p>
              <button className="category-btn" onClick={() => navigate('/productos')}>
                Ver productos <ArrowRight size={16} />
              </button>
            </div>
          </div>
        </section>

        {/* ========== CONTACTO CTA ========== */}
        <section className="cta-section">
          <div className="cta-content">
            <h2>¿Listo para comenzar tu proyecto?</h2>
            <p>Contáctanos y recibe asesoría personalizada para tu proyecto de construcción o remodelación</p>
            <div className="cta-buttons">
              <button className="cta-btn-primary" onClick={() => navigate('/contacto')}>
                <Phone size={20} />
                Contactar Ahora
              </button>
              <button className="cta-btn-secondary" onClick={() => navigate('/productos')}>
                Ver Catálogo
              </button>
            </div>
          </div>
          
          <div className="contact-info-cards">
            <div className="contact-info-card">
              <MapPin size={24} />
              <h4>Ubicación</h4>
              <p>Valencia, Carabobo<br/>Venezuela</p>
            </div>
            <div className="contact-info-card">
              <Phone size={24} />
              <h4>Teléfono</h4>
              <p>0500-HCI-2024<br/>Lun-Vie: 8am-6pm</p>
            </div>
            <div className="contact-info-card">
              <Mail size={24} />
              <h4>Email</h4>
              <p>ventas@hitachcool.com<br/>info@hitachcool.com</p>
            </div>
          </div>
        </section>

      </main>

      <Footer />
    </>
  );
};

export default Inicio;
