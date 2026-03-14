import Header from '../components/Header';
import Footer from '../components/Footer';
import { Users, Award, Target, Heart } from 'lucide-react';
import '../css/equipo.css';

const Equipo = () => {
  const teamMembers = [
    {
      name: 'Carlos Rodríguez',
      role: 'Director General',
      image: "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Crect fill='%231a237e' width='300' height='300'/%3E%3Ctext fill='%23ffffff' font-family='Arial' font-size='80' font-weight='bold' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3ECR%3C/text%3E%3C/svg%3E",
      description: 'Más de 20 años liderando proyectos de decoración y refrigeración'
    },
    {
      name: 'María González',
      role: 'Gerente de Ventas',
      image: "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Crect fill='%2300bcd4' width='300' height='300'/%3E%3Ctext fill='%23ffffff' font-family='Arial' font-size='80' font-weight='bold' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3EMG%3C/text%3E%3C/svg%3E",
      description: 'Experta en atención al cliente mayorista y soluciones personalizadas'
    },
    {
      name: 'Juan Pérez',
      role: 'Jefe de Logística',
      image: "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Crect fill='%23283593' width='300' height='300'/%3E%3Ctext fill='%23ffffff' font-family='Arial' font-size='80' font-weight='bold' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3EJP%3C/text%3E%3C/svg%3E",
      description: 'Especialista en distribución eficiente y entregas a tiempo'
    },
    {
      name: 'Ana Martínez',
      role: 'Asesora Técnica',
      image: "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Crect fill='%230097a7' width='300' height='300'/%3E%3Ctext fill='%23ffffff' font-family='Arial' font-size='80' font-weight='bold' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3EAM%3C/text%3E%3C/svg%3E",
      description: 'Ingeniera con 12 años asesorando en proyectos de decoración'
    }
  ];

  const values = [
    {
      icon: <Award size={40} />,
      title: 'Calidad Premium',
      description: 'Productos certificados de las mejores marcas del mercado'
    },
    {
      icon: <Target size={40} />,
      title: 'Compromiso Total',
      description: 'Tu satisfacción es nuestra prioridad número uno'
    },
    {
      icon: <Heart size={40} />,
      title: 'Pasión por Servir',
      description: 'Amamos ayudarte a hacer realidad tus proyectos'
    },
    {
      icon: <Users size={40} />,
      title: 'Equipo Profesional',
      description: 'Personal capacitado y listo para asesorarte'
    }
  ];

  return (
    <>
      <Header />
      <main className="equipo-page">
        <div className="equipo-hero">
          <h1>Nuestro Equipo</h1>
          <p>Profesionales comprometidos con tu éxito</p>
        </div>

        <section className="equipo-about">
          <div className="about-content">
            <h2>¿Quiénes Somos?</h2>
            <p>
              Hitach Cool Import es una empresa líder en Venezuela con más de 20 años de 
              trayectoria en el sector de decoración y refrigeración. Nos especializamos en 
              ofrecer productos de alta calidad como wallpanel, grama artificial, jardines 
              verticales, pisos decorativos y sistemas de refrigeración.
            </p>
            <p>
              Nuestro equipo está conformado por profesionales altamente capacitados que 
              trabajan día a día para brindarte la mejor asesoría técnica y comercial. 
              Ya sea que necesites decorar tu hogar, oficina o un proyecto comercial, 
              estamos aquí para ayudarte a hacerlo realidad.
            </p>
          </div>
        </section>

        <section className="equipo-values">
          <h2>Nuestros Valores</h2>
          <div className="values-grid">
            {values.map((value, index) => (
              <div key={index} className="value-card">
                <div className="value-icon">{value.icon}</div>
                <h3>{value.title}</h3>
                <p>{value.description}</p>
              </div>
            ))}
          </div>
        </section>

        <section className="equipo-team">
          <h2>Conoce a Nuestro Equipo</h2>
          <div className="team-grid">
            {teamMembers.map((member, index) => (
              <div key={index} className="team-card">
                <div className="team-image">
                  <img src={member.image} alt={member.name} />
                </div>
                <div className="team-info">
                  <h3>{member.name}</h3>
                  <p className="team-role">{member.role}</p>
                  <p className="team-description">{member.description}</p>
                </div>
              </div>
            ))}
          </div>
        </section>
      </main>
      <Footer />
    </>
  );
};

export default Equipo;
