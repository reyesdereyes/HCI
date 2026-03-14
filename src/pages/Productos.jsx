import { useState, useEffect } from 'react';
import Header from '../components/Header';
import Footer from '../components/Footer';
import Card from '../components/Card';
import supabase from '../conf/supabase';
import { Package, Search, Filter, Loader2 } from 'lucide-react';
import '../css/productos.css';

const PLACEHOLDER_IMAGE = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='300' height='300'%3E%3Crect fill='%23f3f4f6' width='300' height='300'/%3E%3Ctext fill='%239ca3af' font-family='Arial' font-size='16' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3ESin imagen%3C/text%3E%3C/svg%3E";

const Productos = () => {
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [subcategories, setSubcategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(null);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      setLoading(true);
      
      // Cargar categorías
      const { data: cats } = await supabase
        .from('categorias')
        .select('*')
        .eq('activo', true)
        .order('orden', { ascending: true });
      console.log('Categorías cargadas:', cats);
      setCategories(cats || []);

      // Cargar subcategorías (sin filtro activo porque la tabla no tiene esa columna)
      const { data: subs, error: subsError } = await supabase
        .from('subcategorias')
        .select('*');
      
      if (subsError) {
        console.error('Error cargando subcategorías:', subsError);
      }
      
      console.log('Subcategorías cargadas:', subs);
      setSubcategories(subs || []);

      // Cargar productos (sin filtrar por stock para ver todos)
      const { data: prods, error: prodsError } = await supabase
        .from('productos')
        .select('*')
        .eq('activo', true);
      
      if (prodsError) {
        console.error('Error cargando productos:', prodsError);
      }
      
      console.log('Productos cargados:', prods);
      console.log('Total productos:', prods?.length);
      setProducts(prods || []);

    } catch (error) {
      console.error('Error:', error);
    } finally {
      setLoading(false);
    }
  };

  const filteredProducts = products.filter(p => {
    const matchesSearch = p.nombre.toLowerCase().includes(searchTerm.toLowerCase());
    
    // Si hay categoría seleccionada, filtrar por subcategorías de esa categoría
    let matchesCategory = true;
    if (selectedCategory) {
      const subcatsOfCategory = subcategories
        .filter(sub => sub.categoria_id === selectedCategory)
        .map(sub => sub.id);
      
      // Debug: ver qué está pasando
      if (products.length > 0 && subcatsOfCategory.length > 0) {
        console.log('=== DEBUG FILTRO ===');
        console.log('Categoría seleccionada ID:', selectedCategory);
        console.log('Subcategorías IDs de esta categoría:', subcatsOfCategory);
        console.log('Ejemplo producto:', {
          nombre: p.nombre,
          subcategoria_id: p.subcategoria_id,
          tipo_subcategoria: typeof p.subcategoria_id
        });
        console.log('Tipos de subcategorías:', subcatsOfCategory.map(id => typeof id));
        console.log('Match?', subcatsOfCategory.includes(p.subcategoria_id));
      }
      
      matchesCategory = subcatsOfCategory.includes(p.subcategoria_id);
    }
    
    return matchesSearch && matchesCategory;
  });
  
  console.log('Productos filtrados:', filteredProducts.length);

  return (
    <>
      <Header />
      <main className="productos-page">
        <div className="productos-hero">
          <h1>Nuestros Productos</h1>
          <p>Encuentra todo lo que necesitas para tu proyecto</p>
        </div>

        <div className="productos-container">
          <aside className="productos-sidebar">
            <div className="sidebar-section">
              <h3>Categorías</h3>
              <button 
                className={`category-filter ${!selectedCategory ? 'active' : ''}`}
                onClick={() => setSelectedCategory(null)}
              >
                Todas las categorías
              </button>
              {categories.map(cat => (
                <button
                  key={cat.id}
                  className={`category-filter ${selectedCategory === cat.id ? 'active' : ''}`}
                  onClick={() => setSelectedCategory(cat.id)}
                >
                  <span>{cat.icono}</span>
                  {cat.nombre}
                </button>
              ))}
            </div>
          </aside>

          <div className="productos-content">
            <div className="productos-toolbar">
              <div className="search-box">
                <Search size={20} />
                <input
                  type="text"
                  placeholder="Buscar productos..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                />
              </div>
              <span className="results-count">
                {filteredProducts.length} productos encontrados
              </span>
            </div>

            {loading ? (
              <div className="loading-state">
                <Loader2 className="spinner" size={48} />
                <p>Cargando productos...</p>
              </div>
            ) : (
              <div className="productos-grid">
                {filteredProducts.map(product => (
                  <Card
                    key={product.id}
                    product={{
                      ...product,
                      name: product.nombre,
                      image: product.imagen || PLACEHOLDER_IMAGE,
                      stock: product.stock
                    }}
                  />
                ))}
              </div>
            )}

            {!loading && filteredProducts.length === 0 && (
              <div className="empty-state">
                <Package size={64} />
                <h3>No se encontraron productos</h3>
                <p>Intenta con otra búsqueda o categoría</p>
              </div>
            )}
          </div>
        </div>
      </main>
      <Footer />
    </>
  );
};

export default Productos;
