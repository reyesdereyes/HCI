import { useState, useEffect, useRef, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import supabase from '../conf/supabase';
import Modal from '../components/Modal';
import ToastContainer from '../components/ToastContainer';
import EmptyState from '../components/EmptyState';
import { useToast } from '../hooks/useToast';
import StatsCards from '../components/admin/StatsCards';
import PedidosView from '../components/admin/PedidosView';
import ClientesView from '../components/admin/ClientesView';
import InventarioView from '../components/admin/InventarioView';
import { 
  Package, 
  Grid3X3, 
  Layers, 
  TrendingUp,
  LogOut,
  Home,
  Plus,
  Edit,
  Trash2,
  Search,
  Loader2,
  ShoppingCart,
  Users,
  AlertTriangle,
  BarChart3
} from 'lucide-react';
import '../css/admin.css';
import '../css/admin-stats.css';
import '../css/admin-pedidos.css';
import '../css/admin-clientes.css';
import '../css/admin-inventario.css';

const PRODUCTS_PER_PAGE = 20;

const Admin = () => {
  const navigate = useNavigate();
  const { toasts, removeToast, success, error: showError } = useToast();
  const [activeTab, setActiveTab] = useState('dashboard');
  const [loading, setLoading] = useState(false);
  const [loadingMore, setLoadingMore] = useState(false);
  const [currentUser, setCurrentUser] = useState(null);
  
  // Estados para datos
  const [categories, setCategories] = useState([]);
  const [subcategories, setSubcategories] = useState([]);
  const [products, setProducts] = useState([]);
  const [pedidos, setPedidos] = useState([]);
  const [clientes, setClientes] = useState([]);
  const [alertas, setAlertas] = useState([]);
  const [hasMore, setHasMore] = useState(true);
  const [page, setPage] = useState(0);
  const [stats, setStats] = useState({
    totalProducts: 0,
    totalCategories: 0,
    totalSubcategories: 0,
    lowStock: 0,
    ventasMes: 0,
    crecimientoVentas: 0,
    pedidosPendientes: 0,
    pedidosHoy: 0,
    productosActivos: 0,
    alertasStock: 0,
    sinStock: 0,
    clientesActivos: 0,
    clientesNuevos: 0,
    ticketPromedio: 0
  });

  // Estados para modales
  const [showModal, setShowModal] = useState(false);
  const [modalType, setModalType] = useState('');
  const [editingItem, setEditingItem] = useState(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [filtroCategoria, setFiltroCategoria] = useState('todas');
  const [filtroSubcategoria, setFiltroSubcategoria] = useState('todas');
  const [mostrarInactivos, setMostrarInactivos] = useState(false);
  
  // Ref para el observer
  const observerTarget = useRef(null);

  useEffect(() => {
    loadCurrentUser();
    loadCategoriesAndSubs();
  }, []);

  // Cargar datos cuando cambia la pestaña activa
  useEffect(() => {
    if (activeTab === 'pedidos') {
      loadPedidos();
    } else if (activeTab === 'clientes') {
      loadClientes();
    } else if (activeTab === 'inventario') {
      loadAlertas();
      // Cargar productos para mostrar en inventario
      if (products.length === 0) {
        loadProducts(0, '');
      }
    }
  }, [activeTab]);

  const loadCurrentUser = async () => {
    const { data: { user } } = await supabase.auth.getUser();
    setCurrentUser(user);
  };

  const handleLogout = async () => {
    const confirmLogout = window.confirm('¿Estás seguro que deseas cerrar sesión?');
    if (confirmLogout) {
      await supabase.auth.signOut();
      navigate('/login');
    }
  };

  const loadCategoriesAndSubs = async () => {
    try {
      const { data: cats } = await supabase
        .from('categorias')
        .select('*')
        .order('orden', { ascending: true });
      setCategories(cats || []);

      const { data: subs } = await supabase
        .from('subcategorias')
        .select('*')
        .order('nombre', { ascending: true });
      setSubcategories(subs || []);

      // Obtener stats de productos
      const { count: totalProds } = await supabase
        .from('productos')
        .select('*', { count: 'exact', head: true });

      const { count: lowStockCount } = await supabase
        .from('productos')
        .select('*', { count: 'exact', head: true })
        .lt('stock', 10)
        .gt('stock', 0);

      const { count: sinStockCount } = await supabase
        .from('productos')
        .select('*', { count: 'exact', head: true })
        .eq('stock', 0);

      const { count: productosActivos } = await supabase
        .from('productos')
        .select('*', { count: 'exact', head: true })
        .eq('activo', true);

      // Obtener stats de pedidos
      const { count: pedidosPendientes } = await supabase
        .from('pedidos')
        .select('*', { count: 'exact', head: true })
        .eq('estado', 'pendiente');

      // Pedidos de hoy
      const hoy = new Date();
      hoy.setHours(0, 0, 0, 0);
      const { count: pedidosHoy } = await supabase
        .from('pedidos')
        .select('*', { count: 'exact', head: true })
        .gte('fecha_pedido', hoy.toISOString());

      // Ventas del mes actual
      const inicioMes = new Date(hoy.getFullYear(), hoy.getMonth(), 1);
      const { data: pedidosMes } = await supabase
        .from('pedidos')
        .select('total')
        .gte('fecha_pedido', inicioMes.toISOString())
        .in('estado', ['aprobado', 'procesando', 'enviado', 'entregado']);

      const ventasMes = pedidosMes?.reduce((sum, p) => sum + (p.total || 0), 0) || 0;

      // Ventas del mes anterior para calcular crecimiento
      const inicioMesAnterior = new Date(hoy.getFullYear(), hoy.getMonth() - 1, 1);
      const finMesAnterior = new Date(hoy.getFullYear(), hoy.getMonth(), 0);
      const { data: pedidosMesAnterior } = await supabase
        .from('pedidos')
        .select('total')
        .gte('fecha_pedido', inicioMesAnterior.toISOString())
        .lte('fecha_pedido', finMesAnterior.toISOString())
        .in('estado', ['aprobado', 'procesando', 'enviado', 'entregado']);

      const ventasMesAnterior = pedidosMesAnterior?.reduce((sum, p) => sum + (p.total || 0), 0) || 0;
      const crecimientoVentas = ventasMesAnterior > 0 
        ? Math.round(((ventasMes - ventasMesAnterior) / ventasMesAnterior) * 100)
        : 0;

      // Ticket promedio
      const { data: pedidosCompletados } = await supabase
        .from('pedidos')
        .select('total')
        .in('estado', ['aprobado', 'procesando', 'enviado', 'entregado']);

      const ticketPromedio = pedidosCompletados && pedidosCompletados.length > 0
        ? pedidosCompletados.reduce((sum, p) => sum + (p.total || 0), 0) / pedidosCompletados.length
        : 0;

      // Obtener stats de clientes
      const { count: clientesActivos } = await supabase
        .from('clientes')
        .select('*', { count: 'exact', head: true })
        .eq('activo', true);

      // Clientes nuevos este mes
      const { count: clientesNuevosMes } = await supabase
        .from('clientes')
        .select('*', { count: 'exact', head: true })
        .gte('fecha_registro', inicioMes.toISOString())
        .eq('activo', true);

      // Cargar alertas no leídas
      const { count: alertasCount } = await supabase
        .from('alertas_inventario')
        .select('*', { count: 'exact', head: true })
        .eq('leido', false);

      setStats({
        totalProducts: totalProds || 0,
        totalCategories: cats?.length || 0,
        totalSubcategories: subs?.length || 0,
        lowStock: lowStockCount || 0,
        sinStock: sinStockCount || 0,
        productosActivos: productosActivos || 0,
        pedidosPendientes: pedidosPendientes || 0,
        pedidosHoy: pedidosHoy || 0,
        alertasStock: alertasCount || 0,
        ventasMes: Math.round(ventasMes),
        crecimientoVentas: crecimientoVentas,
        clientesActivos: clientesActivos || 0,
        clientesNuevos: clientesNuevosMes || 0,
        ticketPromedio: Math.round(ticketPromedio),
        totalProductos: totalProds || 0
      });

    } catch (error) {
      console.error('Error cargando datos:', error);
    }
  };

  const loadProducts = useCallback(async (pageNum, search = '', categoria = 'todas', subcategoria = 'todas', incluirInactivos = false) => {
    try {
      if (pageNum === 0) {
        setLoading(true);
      } else {
        setLoadingMore(true);
      }

      let query = supabase
        .from('productos')
        .select('id, nombre, codigo, imagen, precio_detal, precio_mayor, stock, activo, subcategoria_id', { count: 'exact' })
        .order('created_at', { ascending: false })
        .range(pageNum * PRODUCTS_PER_PAGE, (pageNum + 1) * PRODUCTS_PER_PAGE - 1);

      // Filtrar por estado activo/inactivo
      if (!incluirInactivos) {
        query = query.eq('activo', true);
      }

      if (search) {
        query = query.or(`nombre.ilike.%${search}%,codigo.ilike.%${search}%`);
      }

      // Filtrar por subcategoría
      if (subcategoria !== 'todas') {
        query = query.eq('subcategoria_id', parseInt(subcategoria));
      } else if (categoria !== 'todas') {
        // Si solo hay categoría seleccionada, filtrar por todas las subcategorías de esa categoría
        const subsDeCategoria = subcategories
          .filter(s => s.categoria_id === parseInt(categoria))
          .map(s => s.id);
        
        if (subsDeCategoria.length > 0) {
          query = query.in('subcategoria_id', subsDeCategoria);
        }
      }

      const { data: prods, error, count } = await query;

      if (error) throw error;

      if (pageNum === 0) {
        setProducts(prods || []);
      } else {
        // Evitar duplicados al agregar nuevos productos
        setProducts(prev => {
          const existingIds = new Set(prev.map(p => p.id));
          const newProducts = (prods || []).filter(p => !existingIds.has(p.id));
          return [...prev, ...newProducts];
        });
      }

      setHasMore((prods || []).length === PRODUCTS_PER_PAGE && (pageNum + 1) * PRODUCTS_PER_PAGE < (count || 0));

    } catch (error) {
      console.error('Error cargando productos:', error);
      showError('Error cargando productos');
    } finally {
      setLoading(false);
      setLoadingMore(false);
    }
  }, [showError, subcategories]);

  useEffect(() => {
    if (activeTab === 'products') {
      // Solo recargar cuando cambian los filtros de categoría, NO cuando cambia el searchTerm
      setPage(0);
      setProducts([]);
      setHasMore(true);
      loadProducts(0, '', filtroCategoria, filtroSubcategoria, mostrarInactivos);
    }
  }, [activeTab, filtroCategoria, filtroSubcategoria, mostrarInactivos, loadProducts]);

  // Intersection Observer para carga infinita
  useEffect(() => {
    if (activeTab !== 'products') return;

    const observer = new IntersectionObserver(
      entries => {
        if (entries[0].isIntersecting && hasMore && !loadingMore && !loading) {
          const nextPage = page + 1;
          setPage(nextPage);
          loadProducts(nextPage, '', filtroCategoria, filtroSubcategoria, mostrarInactivos);
        }
      },
      { threshold: 0.1 }
    );

    const currentTarget = observerTarget.current;
    if (currentTarget) {
      observer.observe(currentTarget);
    }

    return () => {
      if (currentTarget) {
        observer.unobserve(currentTarget);
      }
    };
  }, [hasMore, loadingMore, loading, page, filtroCategoria, filtroSubcategoria, mostrarInactivos, activeTab, loadProducts]);

  const loadData = () => {
    loadCategoriesAndSubs();
    if (activeTab === 'products') {
      setPage(0);
      setProducts([]);
      setHasMore(true);
      loadProducts(0, searchTerm);
    } else if (activeTab === 'pedidos') {
      loadPedidos();
    } else if (activeTab === 'clientes') {
      loadClientes();
    } else if (activeTab === 'inventario') {
      loadAlertas();
    }
  };

  const loadPedidos = async () => {
    try {
      const { data, error } = await supabase
        .from('pedidos')
        .select(`
          *,
          pedido_items (
            id,
            producto_nombre,
            producto_codigo,
            cantidad,
            precio_unitario,
            subtotal
          )
        `)
        .order('fecha_pedido', { ascending: false });
      
      if (error) throw error;
      setPedidos(data || []);
    } catch (error) {
      console.error('Error cargando pedidos:', error);
      showError('Error cargando pedidos');
    }
  };

  const loadClientes = async () => {
    try {
      // Cargar clientes
      const { data: clientesData, error: clientesError } = await supabase
        .from('clientes')
        .select('*')
        .order('fecha_registro', { ascending: false });
      
      if (clientesError) {
        console.error('Error cargando clientes:', clientesError);
        setClientes([]);
        return;
      }
      
      if (!clientesData || clientesData.length === 0) {
        console.log('No hay clientes en la tabla clientes');
        setClientes([]);
        return;
      }

      // Enriquecer datos de clientes con email de auth.users y estadísticas de pedidos
      const clientesEnriquecidos = await Promise.all(
        clientesData.map(async (cliente) => {
          // Obtener email del usuario de auth
          let email = 'N/A';
          try {
            const { data: { user } } = await supabase.auth.getUser();
            if (user && user.id === cliente.id) {
              email = user.email;
            }
          } catch (error) {
            console.log('No se pudo obtener email para cliente:', cliente.id);
          }

          // Obtener pedidos del cliente
          const { data: pedidosCliente } = await supabase
            .from('pedidos')
            .select('total, fecha_pedido')
            .eq('cliente_id', cliente.id)
            .in('estado', ['aprobado', 'procesando', 'enviado', 'entregado']);

          const totalPedidos = pedidosCliente?.length || 0;
          const totalCompras = pedidosCliente?.reduce((sum, p) => sum + (p.total || 0), 0) || 0;
          
          // Obtener fecha de última compra
          const ultimaCompra = pedidosCliente && pedidosCliente.length > 0
            ? pedidosCliente.sort((a, b) => new Date(b.fecha_pedido) - new Date(a.fecha_pedido))[0].fecha_pedido
            : null;

          return {
            ...cliente,
            email,
            total_pedidos: totalPedidos,
            total_compras: totalCompras,
            ultima_compra: ultimaCompra
          };
        })
      );

      setClientes(clientesEnriquecidos);
    } catch (error) {
      console.error('Error cargando clientes:', error);
      showError('Error cargando clientes');
      setClientes([]);
    }
  };

  const loadAlertas = async () => {
    try {
      const { data, error } = await supabase
        .from('alertas_inventario')
        .select(`
          *,
          productos (
            nombre,
            codigo,
            stock
          )
        `)
        .order('fecha_alerta', { ascending: false });
      
      if (error) throw error;
      setAlertas(data || []);
    } catch (error) {
      console.error('Error cargando alertas:', error);
      showError('Error cargando alertas');
    }
  };

  const handleUpdateEstadoPedido = async (pedidoId, nuevoEstado) => {
    try {
      const { error } = await supabase
        .from('pedidos')
        .update({ 
          estado: nuevoEstado,
          fecha_actualizado: new Date().toISOString()
        })
        .eq('id', pedidoId);
      
      if (error) throw error;
      
      success('Estado actualizado correctamente');
      loadPedidos();
    } catch (error) {
      console.error('Error actualizando pedido:', error);
      showError('Error actualizando pedido');
    }
  };

  const handleViewPedidoDetails = (pedido) => {
    // TODO: Implementar modal de detalles
    console.log('Ver detalles del pedido:', pedido);
  };

  const handleViewClienteDetails = (cliente) => {
    // TODO: Implementar modal de detalles
    console.log('Ver detalles del cliente:', cliente);
  };

  const handleEditCliente = (cliente) => {
    // TODO: Implementar modal de edición
    console.log('Editar cliente:', cliente);
  };

  const handleMarcarAlertaLeida = async (alertaId) => {
    try {
      const { error } = await supabase
        .from('alertas_inventario')
        .update({ leido: true })
        .eq('id', alertaId);
      
      if (error) throw error;
      
      success('Alerta marcada como leída');
      loadAlertas();
      loadCategoriesAndSubs(); // Actualizar stats
    } catch (error) {
      console.error('Error marcando alerta:', error);
      showError('Error marcando alerta');
    }
  };

  const handleVerHistorialStock = (productoId) => {
    // TODO: Implementar modal de historial
    console.log('Ver historial del producto:', productoId);
  };

  const openModal = (type, item = null) => {
    setModalType(type);
    setEditingItem(item);
    setShowModal(true);
  };

  const closeModal = () => {
    setShowModal(false);
    setModalType('');
    setEditingItem(null);
  };

  const handleDelete = async (type, id, name) => {
    let confirmMessage = '';
    let actionMessage = '';
    
    if (type === 'product') {
      confirmMessage = `¿Deseas desactivar el producto "${name}"?\nEl producto no se eliminará, solo se marcará como inactivo.`;
      actionMessage = 'desactivar';
    } else if (type === 'category') {
      confirmMessage = `¿Estás seguro que deseas eliminar la categoría "${name}"?\nEsto puede afectar productos asociados.`;
      actionMessage = 'eliminar';
    } else if (type === 'subcategory') {
      confirmMessage = `¿Estás seguro que deseas eliminar la subcategoría "${name}"?\nEsto puede afectar productos asociados.`;
      actionMessage = 'eliminar';
    }
    
    const confirmDelete = window.confirm(confirmMessage);
    
    if (!confirmDelete) return;

    try {
      let error;
      
      if (type === 'product') {
        // En lugar de eliminar, desactivar el producto
        ({ error } = await supabase
          .from('productos')
          .update({ activo: false })
          .eq('id', id)
        );
      } else if (type === 'category') {
        ({ error } = await supabase.from('categorias').delete().eq('id', id));
      } else if (type === 'subcategory') {
        ({ error } = await supabase.from('subcategorias').delete().eq('id', id));
      }

      if (error) {
        // Si hay error de restricción de clave foránea
        if (error.code === '23503') {
          if (type === 'category') {
            showError('No se puede eliminar esta categoría porque tiene subcategorías o productos asociados. Primero elimina o reasigna los elementos relacionados.');
          } else if (type === 'subcategory') {
            showError('No se puede eliminar esta subcategoría porque tiene productos asociados. Primero elimina o reasigna los productos.');
          }
          return;
        }
        throw error;
      }

      if (type === 'product') {
        success('Producto desactivado exitosamente');
      } else {
        success('Eliminado exitosamente');
      }
      loadData();
    } catch (err) {
      console.error('Error al ' + actionMessage + ':', err);
      showError('Error al ' + actionMessage + ': ' + (err.message || 'Error desconocido'));
    }
  };

  return (
    <div className="admin-container">
      <aside className="admin-sidebar">
        <div className="sidebar-header">
          <div className="sidebar-logo">
            <Package size={32} />
            <h2>Admin Panel</h2>
          </div>
        </div>

        <nav className="sidebar-nav">
          <button
            className={`nav-item ${activeTab === 'dashboard' ? 'active' : ''}`}
            onClick={() => setActiveTab('dashboard')}
          >
            <TrendingUp size={20} />
            <span>Dashboard</span>
          </button>

          <button
            className={`nav-item ${activeTab === 'pedidos' ? 'active' : ''}`}
            onClick={() => setActiveTab('pedidos')}
          >
            <ShoppingCart size={20} />
            <span>Pedidos</span>
            {stats.pedidosPendientes > 0 && (
              <span className="badge">{stats.pedidosPendientes}</span>
            )}
          </button>

          <button
            className={`nav-item ${activeTab === 'clientes' ? 'active' : ''}`}
            onClick={() => setActiveTab('clientes')}
          >
            <Users size={20} />
            <span>Clientes</span>
          </button>

          <button
            className={`nav-item ${activeTab === 'inventario' ? 'active' : ''}`}
            onClick={() => setActiveTab('inventario')}
          >
            <AlertTriangle size={20} />
            <span>Inventario</span>
            {stats.alertasStock > 0 && (
              <span className="badge badge-warning">{stats.alertasStock}</span>
            )}
          </button>

          <button
            className={`nav-item ${activeTab === 'products' ? 'active' : ''}`}
            onClick={() => setActiveTab('products')}
          >
            <Package size={20} />
            <span>Productos</span>
          </button>

          <button
            className={`nav-item ${activeTab === 'categories' ? 'active' : ''}`}
            onClick={() => setActiveTab('categories')}
          >
            <Grid3X3 size={20} />
            <span>Categorías</span>
          </button>

          <button
            className={`nav-item ${activeTab === 'subcategories' ? 'active' : ''}`}
            onClick={() => setActiveTab('subcategories')}
          >
            <Layers size={20} />
            <span>Subcategorías</span>
          </button>
        </nav>

        <div className="sidebar-footer">
          <button className="nav-item" onClick={() => navigate('/')}>
            <Home size={20} />
            <span>Volver al Inicio</span>
          </button>
          <button className="nav-item logout-btn" onClick={handleLogout}>
            <LogOut size={20} />
            <span>Cerrar Sesión</span>
          </button>
          {currentUser && (
            <div className="user-info">
              <p className="user-email">{currentUser.email}</p>
            </div>
          )}
        </div>
      </aside>

      <main className="admin-main">
        <header className="admin-header">
          <h1 className="admin-title">
            {activeTab === 'dashboard' && 'Dashboard'}
            {activeTab === 'pedidos' && 'Gestión de Pedidos'}
            {activeTab === 'clientes' && 'Gestión de Clientes'}
            {activeTab === 'inventario' && 'Control de Inventario'}
            {activeTab === 'products' && 'Gestión de Productos'}
            {activeTab === 'categories' && 'Gestión de Categorías'}
            {activeTab === 'subcategories' && 'Gestión de Subcategorías'}
          </h1>
          
          <div className="header-actions">
            {(activeTab === 'products' || activeTab === 'categories' || activeTab === 'subcategories') && (
              <button 
                className="btn-primary"
                onClick={() => {
                  let modalType = '';
                  if (activeTab === 'products') modalType = 'product';
                  else if (activeTab === 'categories') modalType = 'category';
                  else if (activeTab === 'subcategories') modalType = 'subcategory';
                  openModal(modalType);
                }}
              >
                <Plus size={18} />
                <span>Agregar Nuevo</span>
              </button>
            )}
          </div>
        </header>

        <div className="admin-content">
          {loading ? (
            <div className="loading-spinner">
              <div className="spinner"></div>
            </div>
          ) : (
            <>
              {activeTab === 'dashboard' && (
                <>
                  <StatsCards stats={stats} />
                  <DashboardView stats={stats} products={products} />
                </>
              )}
              
              {activeTab === 'pedidos' && (
                <PedidosView 
                  pedidos={pedidos}
                  onUpdateEstado={handleUpdateEstadoPedido}
                  onViewDetails={handleViewPedidoDetails}
                />
              )}
              
              {activeTab === 'clientes' && (
                <ClientesView 
                  clientes={clientes}
                  onViewDetails={handleViewClienteDetails}
                  onEdit={handleEditCliente}
                  onSuccess={success}
                  onError={showError}
                  onReload={loadClientes}
                />
              )}
              
              {activeTab === 'inventario' && (
                <InventarioView 
                  alertas={alertas}
                  productos={products}
                  onMarcarLeida={handleMarcarAlertaLeida}
                  onVerHistorial={handleVerHistorialStock}
                />
              )}
              
              {activeTab === 'products' && (
                <ProductsView 
                  products={products} 
                  categories={categories}
                  subcategories={subcategories}
                  onEdit={(item) => openModal('product', item)}
                  onDelete={(id, name) => handleDelete('product', id, name)}
                  searchTerm={searchTerm}
                  setSearchTerm={setSearchTerm}
                  filtroCategoria={filtroCategoria}
                  setFiltroCategoria={setFiltroCategoria}
                  filtroSubcategoria={filtroSubcategoria}
                  setFiltroSubcategoria={setFiltroSubcategoria}
                  mostrarInactivos={mostrarInactivos}
                  setMostrarInactivos={setMostrarInactivos}
                  loadingMore={loadingMore}
                  hasMore={hasMore}
                  observerTarget={observerTarget}
                />
              )}
              
              {activeTab === 'categories' && (
                <CategoriesView 
                  categories={categories}
                  onEdit={(item) => openModal('category', item)}
                  onDelete={(id, name) => handleDelete('category', id, name)}
                />
              )}
              
              {activeTab === 'subcategories' && (
                <SubcategoriesView 
                  subcategories={subcategories}
                  categories={categories}
                  onEdit={(item) => openModal('subcategory', item)}
                  onDelete={(id, name) => handleDelete('subcategory', id, name)}
                />
              )}
            </>
          )}
        </div>
      </main>

      {showModal && (
        <Modal
          type={modalType}
          item={editingItem}
          categories={categories}
          onClose={closeModal}
          onSave={() => {
            loadData();
            closeModal();
          }}
          onSuccess={success}
          onError={showError}
        />
      )}

      <ToastContainer toasts={toasts} removeToast={removeToast} />
    </div>
  );
};

const PLACEHOLDER_IMAGE_SMALL = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100' height='100'%3E%3Crect fill='%23f3f4f6' width='100' height='100'/%3E%3Ctext fill='%239ca3af' font-family='Arial' font-size='12' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3ESin imagen%3C/text%3E%3C/svg%3E";

const DashboardView = ({ stats, products }) => {
  return (
    <div className="dashboard-view">
      <div className="stats-grid">
        <div className="stat-card">
          <div className="stat-icon products">
            <Package size={28} />
          </div>
          <div className="stat-info">
            <h3>{stats.totalProducts}</h3>
            <p>Total Productos</p>
          </div>
        </div>

        <div className="stat-card">
          <div className="stat-icon categories">
            <Grid3X3 size={28} />
          </div>
          <div className="stat-info">
            <h3>{stats.totalCategories}</h3>
            <p>Categorías</p>
          </div>
        </div>

        <div className="stat-card">
          <div className="stat-icon subcategories">
            <Layers size={28} />
          </div>
          <div className="stat-info">
            <h3>{stats.totalSubcategories}</h3>
            <p>Subcategorías</p>
          </div>
        </div>

        <div className="stat-card">
          <div className="stat-icon warning">
            <TrendingUp size={28} />
          </div>
          <div className="stat-info">
            <h3>{stats.lowStock}</h3>
            <p>Stock Bajo</p>
          </div>
        </div>
      </div>

      <div className="recent-section">
        <h2>Productos Recientes</h2>
        <div className="recent-products">
          {products.slice(0, 5).map(product => (
            <div key={product.id} className="recent-product-card">
              <img 
                src={product.imagen || PLACEHOLDER_IMAGE_SMALL} 
                alt={product.nombre}
              />
              <div className="recent-product-info">
                <h4>{product.nombre}</h4>
                <p className="product-price">${product.precio_detal}</p>
                <span className={`stock-badge ${product.stock < 10 ? 'low' : ''}`}>
                  Stock: {product.stock}
                </span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

const PLACEHOLDER_IMAGE = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='120' height='120'%3E%3Crect fill='%23f3f4f6' width='120' height='120'/%3E%3Ctext fill='%239ca3af' font-family='Arial' font-size='14' x='50%25' y='50%25' text-anchor='middle' dy='.3em'%3ESin imagen%3C/text%3E%3C/svg%3E";

const ProductsView = ({ products, categories, subcategories, onEdit, onDelete, searchTerm, setSearchTerm, loadingMore, hasMore, observerTarget, filtroCategoria, setFiltroCategoria, filtroSubcategoria, setFiltroSubcategoria, mostrarInactivos, setMostrarInactivos }) => {
  // Función para obtener la categoría de un producto a través de su subcategoría
  const getCategoryName = (subcategoriaId) => {
    const subcategoria = subcategories.find(s => s.id === subcategoriaId);
    if (!subcategoria) return 'N/A';
    const categoria = categories.find(c => c.id === subcategoria.categoria_id);
    return categoria?.nombre || 'N/A';
  };

  const getSubcategoryName = (subcategoriaId) => {
    return subcategories.find(s => s.id === subcategoriaId)?.nombre || '-';
  };

  // Filtrar subcategorías según la categoría seleccionada
  const subcategoriasFiltradas = filtroCategoria === 'todas' 
    ? subcategories 
    : subcategories.filter(s => s.categoria_id === parseInt(filtroCategoria));

  // Filtrar productos localmente según el término de búsqueda
  const productosFiltrados = products.filter(product => {
    if (!searchTerm) return true;
    const searchLower = searchTerm.toLowerCase();
    return (
      product.nombre?.toLowerCase().includes(searchLower) ||
      product.codigo?.toLowerCase().includes(searchLower)
    );
  });

  if (products.length === 0 && filtroCategoria === 'todas' && filtroSubcategoria === 'todas') {
    return <EmptyState type="products" />;
  }

  return (
    <div className="products-view-optimized">
      {/* Barra de búsqueda y acciones */}
      <div className="products-toolbar">
        <div className="search-box-products">
          <Search size={20} />
          <input
            type="text"
            placeholder="Buscar por nombre o código..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>
        
        <div className="toolbar-actions">
          <label className="checkbox-toggle">
            <input
              type="checkbox"
              checked={mostrarInactivos}
              onChange={(e) => setMostrarInactivos(e.target.checked)}
            />
            <span className="checkbox-label-text">Mostrar inactivos</span>
          </label>
          <span className="results-badge">
            {productosFiltrados.length} {productosFiltrados.length === 1 ? 'producto' : 'productos'}
          </span>
        </div>
      </div>

      {/* Filtros por categoría y subcategoría */}
      <div className="filters-section">
        <div className="filter-chips">
          <button
            className={`chip ${filtroCategoria === 'todas' ? 'active' : ''}`}
            onClick={() => {
              setFiltroCategoria('todas');
              setFiltroSubcategoria('todas');
            }}
          >
            Todas las categorías
          </button>
          {categories.map(cat => (
            <button
              key={cat.id}
              className={`chip ${filtroCategoria === cat.id.toString() ? 'active' : ''}`}
              onClick={() => {
                setFiltroCategoria(cat.id.toString());
                setFiltroSubcategoria('todas');
              }}
            >
              {cat.icono && <span className="chip-icon">{cat.icono}</span>}
              {cat.nombre}
            </button>
          ))}
        </div>

        {filtroCategoria !== 'todas' && subcategoriasFiltradas.length > 0 && (
          <div className="filter-subcategories">
            <span className="filter-label">Subcategorías:</span>
            <div className="subfilter-chips">
              <button
                className={`subchip ${filtroSubcategoria === 'todas' ? 'active' : ''}`}
                onClick={() => setFiltroSubcategoria('todas')}
              >
                Todas
              </button>
              {subcategoriasFiltradas.map(sub => (
                <button
                  key={sub.id}
                  className={`subchip ${filtroSubcategoria === sub.id.toString() ? 'active' : ''}`}
                  onClick={() => setFiltroSubcategoria(sub.id.toString())}
                >
                  {sub.nombre}
                </button>
              ))}
            </div>
          </div>
        )}
      </div>

      {productosFiltrados.length === 0 ? (
        <div className="empty-state">
          <Package size={64} />
          <h3>No se encontraron productos</h3>
          <p>Intenta con otro término de búsqueda o filtro</p>
        </div>
      ) : (
        <>
          <div className="products-grid-compact">
            {productosFiltrados.map(product => (
              <div key={product.id} className="product-card-compact">
                <div className="product-image-compact">
                  <img 
                    src={product.imagen || PLACEHOLDER_IMAGE} 
                    alt={product.nombre}
                    loading="lazy"
                  />
                  <span className={`stock-badge-compact ${product.stock < 10 ? 'low' : product.stock === 0 ? 'out' : ''}`}>
                    {product.stock === 0 ? 'Sin stock' : `Stock: ${product.stock}`}
                  </span>
                </div>
                
                <div className="product-info-compact">
                  <h4 className="product-name-compact">{product.nombre}</h4>
                  
                  {product.codigo && (
                    <div className="product-codigo">
                      <span className="codigo-label">Código:</span>
                      <span className="codigo-value">{product.codigo}</span>
                    </div>
                  )}
                  
                  <div className="product-meta-compact">
                    <span className="meta-item">{getCategoryName(product.subcategoria_id)}</span>
                    <span className="meta-separator">•</span>
                    <span className="meta-item">{getSubcategoryName(product.subcategoria_id)}</span>
                  </div>
                  
                  <div className="product-prices-compact">
                    <div className="price-item">
                      <span className="price-label">Detal</span>
                      <span className="price-value">${product.precio_detal}</span>
                    </div>
                    <div className="price-item">
                      <span className="price-label">Mayor</span>
                      <span className="price-value">${product.precio_mayor}</span>
                    </div>
                  </div>
                  
                  <div className="product-actions-compact">
                    <span className={`status-badge-compact ${product.activo ? 'active' : 'inactive'}`}>
                      {product.activo ? 'Activo' : 'Inactivo'}
                    </span>
                    <div className="action-buttons-compact">
                      <button className="btn-icon-compact edit" onClick={() => onEdit(product)} title="Editar">
                        <Edit size={16} />
                      </button>
                      <button className="btn-icon-compact delete" onClick={() => onDelete(product.id, product.nombre)} title="Eliminar">
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Loading más productos */}
          {loadingMore && (
            <div className="loading-more">
              <Loader2 className="loading-spinner" size={32} />
              <p>Cargando más productos...</p>
            </div>
          )}

          {/* Elemento observador para infinite scroll */}
          {hasMore && !loadingMore && (
            <div ref={observerTarget} className="load-more-trigger" style={{ height: '20px' }} />
          )}

          {/* Mensaje cuando no hay más productos */}
          {!hasMore && products.length > 0 && (
            <div className="no-more-products">
              <p>✓ Todos los productos cargados</p>
            </div>
          )}
        </>
      )}
    </div>
  );
};

const CategoriesView = ({ categories, onEdit, onDelete }) => {
  if (categories.length === 0) {
    return <EmptyState type="categories" />;
  }

  return (
    <div className="grid-view">
      {categories.map(category => (
        <div key={category.id} className="grid-card">
          <div className="card-header">
            <span className="category-icon">{category.icono || '📦'}</span>
            <div className="card-actions">
              <button className="btn-icon edit" onClick={() => onEdit(category)}>
                <Edit size={16} />
              </button>
              <button className="btn-icon delete" onClick={() => onDelete(category.id, category.nombre)}>
                <Trash2 size={16} />
              </button>
            </div>
          </div>
          <h3>{category.nombre}</h3>
          <p className="card-meta">Orden: {category.orden}</p>
          <span className={`status-badge ${category.activo ? 'active' : 'inactive'}`}>
            {category.activo ? 'Activo' : 'Inactivo'}
          </span>
        </div>
      ))}
    </div>
  );
};

const SubcategoriesView = ({ subcategories, categories, onEdit, onDelete }) => {
  if (subcategories.length === 0) {
    return <EmptyState type="subcategories" />;
  }

  return (
    <div className="table-view">
      <div className="table-container">
        <table className="data-table">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Categoría Padre</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {subcategories.map(sub => (
              <tr key={sub.id}>
                <td>{sub.nombre}</td>
                <td>
                  {categories.find(c => c.id === sub.categoria_id)?.nombre || 'N/A'}
                </td>
                <td>
                  <div className="table-actions">
                    <button className="btn-icon edit" onClick={() => onEdit(sub)}>
                      <Edit size={16} />
                    </button>
                    <button className="btn-icon delete" onClick={() => onDelete(sub.id, sub.nombre)}>
                      <Trash2 size={16} />
                    </button>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Admin;
