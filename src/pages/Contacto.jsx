import { useState } from 'react';
import Header from '../components/Header';
import Footer from '../components/Footer';
import { Mail, Phone, MapPin, Clock, Send, MessageCircle, CheckCircle } from 'lucide-react';
import '../css/contacto.css';

const Contacto = () => {
  const [formData, setFormData] = useState({
    nombre: '',
    email: '',
    telefono: '',
    asunto: '',
    mensaje: ''
  });
  const [errors, setErrors] = useState({});
  const [showSuccess, setShowSuccess] = useState(false);

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
    // Clear error when user starts typing
    if (errors[e.target.name]) {
      setErrors({
        ...errors,
        [e.target.name]: ''
      });
    }
  };

  const validateForm = () => {
    const newErrors = {};
    
    if (!formData.nombre.trim()) {
      newErrors.nombre = 'El nombre es requerido';
    }
    
    if (!formData.email.trim()) {
      newErrors.email = 'El correo es requerido';
    } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
      newErrors.email = 'Correo inválido';
    }
    
    if (!formData.telefono.trim()) {
      newErrors.telefono = 'El teléfono es requerido';
    }
    
    if (!formData.asunto.trim()) {
      newErrors.asunto = 'El asunto es requerido';
    }
    
    if (!formData.mensaje.trim()) {
      newErrors.mensaje = 'El mensaje es requerido';
    }
    
    return newErrors;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    
    const newErrors = validateForm();
    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors);
      return;
    }
    
    // Show success message
    setShowSuccess(true);
    
    // Reset form
    setFormData({
      nombre: '',
      email: '',
      telefono: '',
      asunto: '',
      mensaje: ''
    });
    
    // Hide success message after 5 seconds
    setTimeout(() => {
      setShowSuccess(false);
    }, 5000);
  };

  const handleWhatsApp = () => {
    const message = encodeURIComponent('Hola! Me gustaría obtener más información sobre sus productos.');
    window.open(`https://wa.me/584129876543?text=${message}`, '_blank');
  };

  return (
    <>
      <Header />
      <main className="contacto-page">
        {showSuccess && (
          <div className="success-notification">
            <CheckCircle size={24} />
            <div>
              <strong>¡Mensaje enviado exitosamente!</strong>
              <p>Nos pondremos en contacto contigo pronto.</p>
            </div>
          </div>
        )}

        <div className="contacto-hero">
          <h1>¿Necesitas Ayuda?</h1>
          <p>Estamos aquí para asesorarte en tu proyecto de decoración</p>
        </div>

        <div className="contacto-container">
          <div className="contacto-info">
            <h2>Información de Contacto</h2>
            <p>Comunícate con nosotros y nuestro equipo te atenderá con gusto. Somos expertos en decoración y refrigeración.</p>

            <div className="info-items">
              <div className="info-item">
                <div className="info-icon">
                  <Phone size={24} />
                </div>
                <div>
                  <h3>Teléfonos</h3>
                  <p>+58 241-123-4567</p>
                  <p>+58 412-987-6543</p>
                </div>
              </div>

              <div className="info-item whatsapp-item" onClick={handleWhatsApp}>
                <div className="info-icon whatsapp-icon">
                  <MessageCircle size={24} />
                </div>
                <div>
                  <h3>WhatsApp</h3>
                  <p>Chatea con nosotros ahora</p>
                  <p className="whatsapp-cta">Click para abrir chat →</p>
                </div>
              </div>

              <div className="info-item">
                <div className="info-icon">
                  <Mail size={24} />
                </div>
                <div>
                  <h3>Correo Electrónico</h3>
                  <p>ventas@hitachcoolimport.com</p>
                  <p>info@hitachcoolimport.com</p>
                </div>
              </div>

              <div className="info-item">
                <div className="info-icon">
                  <MapPin size={24} />
                </div>
                <div>
                  <h3>Dirección</h3>
                  <p>Av. Bolívar Norte, Centro Comercial</p>
                  <p>Valencia, Estado Carabobo, Venezuela</p>
                </div>
              </div>

              <div className="info-item">
                <div className="info-icon">
                  <Clock size={24} />
                </div>
                <div>
                  <h3>Horario de Atención</h3>
                  <p>Lunes a Viernes: 8:00 AM - 6:00 PM</p>
                  <p>Sábados: 8:00 AM - 2:00 PM</p>
                </div>
              </div>
            </div>
          </div>

          <div className="contacto-form-container">
            <h2>Envíanos un Mensaje</h2>
            <form onSubmit={handleSubmit} className="contacto-form">
              <div className="form-group">
                <label htmlFor="nombre">Nombre Completo *</label>
                <input
                  type="text"
                  id="nombre"
                  name="nombre"
                  value={formData.nombre}
                  onChange={handleChange}
                  placeholder="Ej: Juan Pérez"
                  className={errors.nombre ? 'error' : ''}
                  required
                />
                {errors.nombre && <span className="error-message">{errors.nombre}</span>}
              </div>

              <div className="form-row">
                <div className="form-group">
                  <label htmlFor="email">Correo Electrónico *</label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    value={formData.email}
                    onChange={handleChange}
                    placeholder="tu@email.com"
                    className={errors.email ? 'error' : ''}
                    required
                  />
                  {errors.email && <span className="error-message">{errors.email}</span>}
                </div>

                <div className="form-group">
                  <label htmlFor="telefono">Teléfono *</label>
                  <input
                    type="tel"
                    id="telefono"
                    name="telefono"
                    value={formData.telefono}
                    onChange={handleChange}
                    placeholder="0412-1234567"
                    className={errors.telefono ? 'error' : ''}
                    required
                  />
                  {errors.telefono && <span className="error-message">{errors.telefono}</span>}
                </div>
              </div>

              <div className="form-group">
                <label htmlFor="asunto">Asunto *</label>
                <input
                  type="text"
                  id="asunto"
                  name="asunto"
                  value={formData.asunto}
                  onChange={handleChange}
                  placeholder="¿En qué podemos ayudarte?"
                  className={errors.asunto ? 'error' : ''}
                  required
                />
                {errors.asunto && <span className="error-message">{errors.asunto}</span>}
              </div>

              <div className="form-group">
                <label htmlFor="mensaje">Mensaje *</label>
                <textarea
                  id="mensaje"
                  name="mensaje"
                  rows="6"
                  value={formData.mensaje}
                  onChange={handleChange}
                  placeholder="Cuéntanos sobre tu proyecto o consulta..."
                  className={errors.mensaje ? 'error' : ''}
                  required
                ></textarea>
                {errors.mensaje && <span className="error-message">{errors.mensaje}</span>}
              </div>

              <button type="submit" className="submit-btn">
                <Send size={20} />
                Enviar Mensaje
              </button>
            </form>
          </div>
        </div>

        <div className="contacto-map">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31431.123456789!2d-68.0!3d10.0!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTDCsDAwJzAwLjAiTiA2OMKwMDAnMDAuMCJX!5e0!3m2!1ses!2sve!4v1234567890"
            width="100%"
            height="450"
            style={{ border: 0 }}
            allowFullScreen=""
            loading="lazy"
            title="Ubicación Hitach Cool Import"
          ></iframe>
        </div>
      </main>
      <Footer />
    </>
  );
};

export default Contacto;
