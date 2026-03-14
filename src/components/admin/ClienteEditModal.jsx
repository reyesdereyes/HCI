import { useState } from 'react';
import { X, Save } from 'lucide-react';
import supabase from '../../conf/supabase';
import '../../css/admin-cliente-edit.css';

const ClienteEditModal = ({ cliente, isOpen, onClose, onSuccess, onError }) => {
  const [formData, setFormData] = useState({
    nombre_completo: cliente?.nombre_completo || '',
    telefono: cliente?.telefono || '',
    empresa: cliente?.empresa || '',
    rif: cliente?.rif || '',
    direccion: cliente?.direccion || '',
    ciudad: cliente?.ciudad || '',
    estado: cliente?.estado || '',
    tipo_cliente: cliente?.tipo_cliente || 'detal',
    descuento_especial: cliente?.descuento_especial || 0,
    notas: cliente?.notas || ''
  });
  const [loading, setLoading] = useState(false);

  if (!isOpen || !cliente) return null;

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);

    try {
      const { error } = await supabase
        .from('clientes')
        .update(formData)
        .eq('id', cliente.id);

      if (error) throw error;

      onSuccess('Cliente actualizado exitosamente');
      onClose();
    } catch (error) {
      console.error('Error actualizando cliente:', error);
      onError('Error al actualizar cliente: ' + error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <div className="modal-overlay-cliente" onClick={onClose} />
      <div className="modal-cliente-edit">
        <div className="modal-header-cliente">
          <h2>Editar Cliente</h2>
          <button className="btn-close-modal" onClick={onClose}>
            <X size={24} />
          </button>
        </div>

        <form onSubmit={handleSubmit} className="modal-body-cliente">
          <div className="form-section">
            <h3>Información Personal</h3>
            <div className="form-grid">
              <div className="form-group full-width">
                <label>Nombre Completo *</label>
                <input
                  type="text"
                  name="nombre_completo"
                  value={formData.nombre_completo}
                  onChange={handleChange}
                  required
                />
              </div>
              <div className="form-group">
                <label>Teléfono</label>
                <input
                  type="tel"
                  name="telefono"
                  value={formData.telefono}
                  onChange={handleChange}
                />
              </div>
              <div className="form-group">
                <label>Tipo de Cliente *</label>
                <select
                  name="tipo_cliente"
                  value={formData.tipo_cliente}
                  onChange={handleChange}
                  required
                >
                  <option value="detal">Detal</option>
                  <option value="mayor">Mayorista</option>
                </select>
              </div>
            </div>
          </div>

          <div className="form-section">
            <h3>Información de Empresa</h3>
            <div className="form-grid">
              <div className="form-group">
                <label>Empresa</label>
                <input
                  type="text"
                  name="empresa"
                  value={formData.empresa}
                  onChange={handleChange}
                />
              </div>
              <div className="form-group">
                <label>RIF</label>
                <input
                  type="text"
                  name="rif"
                  value={formData.rif}
                  onChange={handleChange}
                />
              </div>
            </div>
          </div>

          <div className="form-section">
            <h3>Dirección</h3>
            <div className="form-group full-width">
              <label>Dirección</label>
              <input
                type="text"
                name="direccion"
                value={formData.direccion}
                onChange={handleChange}
              />
            </div>
            <div className="form-grid">
              <div className="form-group">
                <label>Ciudad</label>
                <input
                  type="text"
                  name="ciudad"
                  value={formData.ciudad}
                  onChange={handleChange}
                />
              </div>
              <div className="form-group">
                <label>Estado</label>
                <input
                  type="text"
                  name="estado"
                  value={formData.estado}
                  onChange={handleChange}
                />
              </div>
            </div>
          </div>

          <div className="form-section">
            <h3>Configuración Especial</h3>
            <div className="form-group">
              <label>Descuento Especial (%)</label>
              <input
                type="number"
                name="descuento_especial"
                value={formData.descuento_especial}
                onChange={handleChange}
                min="0"
                max="100"
                step="0.01"
              />
            </div>
            <div className="form-group full-width">
              <label>Notas</label>
              <textarea
                name="notas"
                value={formData.notas}
                onChange={handleChange}
                rows="3"
              />
            </div>
          </div>

          <div className="modal-footer-cliente">
            <button type="button" className="btn-secondary" onClick={onClose}>
              Cancelar
            </button>
            <button type="submit" className="btn-primary" disabled={loading}>
              <Save size={18} />
              {loading ? 'Guardando...' : 'Guardar Cambios'}
            </button>
          </div>
        </form>
      </div>
    </>
  );
};

export default ClienteEditModal;
