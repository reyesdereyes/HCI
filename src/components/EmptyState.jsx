import { Package, Grid3X3, Layers } from 'lucide-react';

const EmptyState = ({ type, onAction }) => {
  const states = {
    products: {
      icon: <Package size={64} />,
      title: 'No hay productos',
      message: 'Comienza agregando tu primer producto al inventario',
      actionText: 'Agregar Producto'
    },
    categories: {
      icon: <Grid3X3 size={64} />,
      title: 'No hay categorías',
      message: 'Crea categorías para organizar tus productos',
      actionText: 'Agregar Categoría'
    },
    subcategories: {
      icon: <Layers size={64} />,
      title: 'No hay subcategorías',
      message: 'Agrega subcategorías para clasificar mejor tus productos',
      actionText: 'Agregar Subcategoría'
    }
  };

  const state = states[type] || states.products;

  return (
    <div className="empty-state">
      <div className="empty-state-icon">
        {state.icon}
      </div>
      <h3>{state.title}</h3>
      <p>{state.message}</p>
      {onAction && (
        <button className="btn-primary" onClick={onAction}>
          {state.actionText}
        </button>
      )}
    </div>
  );
};

export default EmptyState;
