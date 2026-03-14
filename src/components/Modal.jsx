import { useState, useEffect } from 'react';
import { X } from 'lucide-react';
import supabase from '../conf/supabase';
import '../css/modal.css';

const Modal = ({ type, item, categories, onClose, onSave, onSuccess, onError }) => {
  const [formData, setFormData] = useState({
    nombre: item?.nombre || '',
    descripcion: item?.descripcion || '',
    codigo: item?.codigo || '',
    subcategoria_id: item?.subcategoria_id || '',
    precio_detal: item?.precio_detal || '',
    precio_mayor: item?.precio_mayor || '',
    stock: item?.stock || 0,
    imagen: item?.imagen || '',
    activo: item?.activo !== undefined ? item.activo : true,
    icono: item?.icono || '',
    orden: item?.orden || 1
  });

  const [saving, setSaving] = useState(false);
  const [subcategories, setSubcategories] = useState([]);
  const [loadingSubcategories, setLoadingSubcategories] = useState(false);
  const [selectedCategoryId, setSelectedCategoryId] = useState('');
  const [imageFile, setImageFile] = useState(null);
  const [uploadingImage, setUploadingImage] = useState(false);
  const [imagePreview, setImagePreview] = useState(item?.imagen || null);

  // Cargar subcategorías cuando cambia la categoría seleccionada
  useEffect(() => {
    if (type === 'product' && selectedCategoryId) {
      loadSubcategories(selectedCategoryId);
    } else {
      setSubcategories([]);
    }
  }, [selectedCategoryId, type]);

  // Cargar categoría inicial si el producto tiene subcategoría
  useEffect(() => {
    if (type === 'product' && item?.subcategoria_id) {
      loadCategoryFromSubcategory(item.subcategoria_id);
    }
  }, [item, type]);

  const loadCategoryFromSubcategory = async (subcategoriaId) => {
    try {
      const { data, error } = await supabase
        .from('subcategorias')
        .select('categoria_id')
        .eq('id', subcategoriaId)
        .single();

      if (error) throw error;
      if (data) {
        setSelectedCategoryId(data.categoria_id);
      }
    } catch (error) {
      console.error('Error cargando categoría:', error);
    }
  };

  const loadSubcategories = async (categoriaId) => {
    setLoadingSubcategories(true);
    try {
      const { data, error } = await supabase
        .from('subcategorias')
        .select('*')
        .eq('categoria_id', categoriaId)
        .order('nombre', { ascending: true });

      if (error) throw error;
      setSubcategories(data || []);
    } catch (error) {
      console.error('Error cargando subcategorías:', error);
      setSubcategories([]);
    } finally {
      setLoadingSubcategories(false);
    }
  };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      // Validar tipo de archivo
      if (!file.type.startsWith('image/')) {
        onError?.('Por favor selecciona un archivo de imagen válido');
        return;
      }

      // Validar tamaño (máximo 5MB)
      if (file.size > 5 * 1024 * 1024) {
        onError?.('La imagen no debe superar los 5MB');
        return;
      }

      setImageFile(file);
      
      // Crear preview
      const reader = new FileReader();
      reader.onloadend = () => {
        setImagePreview(reader.result);
      };
      reader.readAsDataURL(file);
    }
  };

  const uploadImage = async () => {
    if (!imageFile) return formData.imagen;

    setUploadingImage(true);
    try {
      // Generar nombre único para la imagen
      const fileExt = imageFile.name.split('.').pop();
      const fileName = `${Date.now()}-${Math.random().toString(36).substring(7)}.${fileExt}`;
      const filePath = `${fileName}`;

      // Subir imagen a Supabase Storage
      const { data, error } = await supabase.storage
        .from('productos')
        .upload(filePath, imageFile, {
          cacheControl: '3600',
          upsert: false
        });

      if (error) throw error;

      // Obtener URL pública
      const { data: { publicUrl } } = supabase.storage
        .from('productos')
        .getPublicUrl(filePath);

      return publicUrl;
    } catch (error) {
      console.error('Error subiendo imagen:', error);
      throw new Error('Error al subir la imagen: ' + error.message);
    } finally {
      setUploadingImage(false);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSaving(true);

    try {
      if (type === 'product') {
        // Subir imagen si hay una nueva
        let imageUrl = formData.imagen;
        if (imageFile) {
          imageUrl = await uploadImage();
        }

        const productData = {
          nombre: formData.nombre,
          codigo: formData.codigo || `PROD-${Date.now()}`,
          descripcion: formData.descripcion || null,
          precio_detal: parseFloat(formData.precio_detal) || null,
          precio_mayor: parseFloat(formData.precio_mayor) || null,
          stock: parseInt(formData.stock) || 0,
          imagen: imageUrl || null,
          activo: formData.activo
        };

        // Solo agregar subcategoria_id si tiene valor
        if (formData.subcategoria_id) {
          productData.subcategoria_id = formData.subcategoria_id;
        }

        if (item) {
          const { error } = await supabase
            .from('productos')
            .update(productData)
            .eq('id', item.id);
          
          if (error) throw error;
          onSuccess?.('Producto actualizado exitosamente');
        } else {
          const { error } = await supabase
            .from('productos')
            .insert([productData]);
          
          if (error) throw error;
          onSuccess?.('Producto creado exitosamente');
        }
      } else if (type === 'category') {
        const categoryData = {
          nombre: formData.nombre,
          icono: formData.icono || null,
          orden: parseInt(formData.orden) || 1,
          activo: formData.activo
        };

        if (item) {
          const { error } = await supabase
            .from('categorias')
            .update(categoryData)
            .eq('id', item.id);
          
          if (error) throw error;
          onSuccess?.('Categoría actualizada exitosamente');
        } else {
          const { error } = await supabase
            .from('categorias')
            .insert([categoryData]);
          
          if (error) throw error;
          onSuccess?.('Categoría creada exitosamente');
        }
      } else if (type === 'subcategory') {
        const subcategoryData = {
          nombre: formData.nombre,
          categoria_id: formData.categoria_id
        };

        if (item) {
          const { error } = await supabase
            .from('subcategorias')
            .update(subcategoryData)
            .eq('id', item.id);
          
          if (error) throw error;
          onSuccess?.('Subcategoría actualizada exitosamente');
        } else {
          const { error } = await supabase
            .from('subcategorias')
            .insert([subcategoryData]);
          
          if (error) throw error;
          onSuccess?.('Subcategoría creada exitosamente');
        }
      }

      onSave();
    } catch (error) {
      console.error('Error completo:', error);
      onError?.('Error al guardar: ' + (error.message || 'Error desconocido'));
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h2>
            {item ? 'Editar' : 'Agregar'} {' '}
            {type === 'product' && 'Producto'}
            {type === 'category' && 'Categoría'}
            {type === 'subcategory' && 'Subcategoría'}
          </h2>
          <button className="btn-icon" onClick={onClose}>
            <X size={20} />
          </button>
        </div>

        <form onSubmit={handleSubmit}>
          <div className="modal-body">
            {type === 'product' && (
              <>
                <div className="form-group">
                  <label>Nombre del Producto *</label>
                  <input
                    type="text"
                    value={formData.nombre}
                    onChange={(e) => setFormData({...formData, nombre: e.target.value})}
                    required
                    placeholder="Ej: Wallpanel Premium"
                  />
                </div>

                <div className="form-group">
                  <label>Código del Producto *</label>
                  <input
                    type="text"
                    value={formData.codigo}
                    onChange={(e) => setFormData({...formData, codigo: e.target.value})}
                    required
                    placeholder="Ej: WP-001"
                  />
                  <small className="form-hint">
                    Código único para identificar el producto
                  </small>
                </div>

                <div className="form-group">
                  <label>Descripción</label>
                  <textarea
                    value={formData.descripcion}
                    onChange={(e) => setFormData({...formData, descripcion: e.target.value})}
                    rows="3"
                    placeholder="Descripción del producto..."
                  />
                </div>

                <div className="form-row">
                  <div className="form-group">
                    <label>Categoría</label>
                    <select
                      value={selectedCategoryId}
                      onChange={(e) => {
                        setSelectedCategoryId(e.target.value);
                        setFormData({...formData, subcategoria_id: ''});
                      }}
                    >
                      <option value="">Seleccionar categoría</option>
                      {categories.map(cat => (
                        <option key={cat.id} value={cat.id}>{cat.nombre}</option>
                      ))}
                    </select>
                  </div>

                  <div className="form-group">
                    <label>Subcategoría</label>
                    <select
                      value={formData.subcategoria_id}
                      onChange={(e) => setFormData({...formData, subcategoria_id: e.target.value})}
                      disabled={!selectedCategoryId || loadingSubcategories}
                    >
                      <option value="">
                        {loadingSubcategories ? 'Cargando...' : 'Seleccionar subcategoría'}
                      </option>
                      {subcategories.map(sub => (
                        <option key={sub.id} value={sub.id}>{sub.nombre}</option>
                      ))}
                    </select>
                  </div>
                </div>

                <div className="form-row">
                  <div className="form-group">
                    <label>Stock *</label>
                    <input
                      type="number"
                      value={formData.stock}
                      onChange={(e) => setFormData({...formData, stock: e.target.value})}
                      required
                      min="0"
                    />
                  </div>

                  <div className="form-group">
                    <label>URL de Imagen</label>
                    <input
                      type="url"
                      value={formData.imagen}
                      onChange={(e) => setFormData({...formData, imagen: e.target.value})}
                      placeholder="https://ejemplo.com/imagen.jpg"
                    />
                  </div>
                </div>

                <div className="form-row">
                  <div className="form-group">
                    <label>Precio al Detal</label>
                    <input
                      type="number"
                      step="0.01"
                      value={formData.precio_detal}
                      onChange={(e) => setFormData({...formData, precio_detal: e.target.value})}
                      placeholder="0.00"
                    />
                  </div>

                  <div className="form-group">
                    <label>Precio al Mayor</label>
                    <input
                      type="number"
                      step="0.01"
                      value={formData.precio_mayor}
                      onChange={(e) => setFormData({...formData, precio_mayor: e.target.value})}
                      placeholder="0.00"
                    />
                  </div>
                </div>

                <div className="form-group">
                  <label>Imagen del Producto</label>
                  <input
                    type="file"
                    accept="image/*"
                    onChange={handleImageChange}
                    className="file-input"
                  />
                  {imagePreview && (
                    <div className="image-preview">
                      <img src={imagePreview} alt="Preview" />
                      <button
                        type="button"
                        className="btn-remove-image"
                        onClick={() => {
                          setImageFile(null);
                          setImagePreview(null);
                          setFormData({...formData, imagen: ''});
                        }}
                      >
                        <X size={16} />
                      </button>
                    </div>
                  )}
                  <small className="form-hint">
                    Formatos: JPG, PNG, WebP. Máximo 5MB
                  </small>
                </div>

                <div className="form-group checkbox-group">
                  <label>
                    <input
                      type="checkbox"
                      checked={formData.activo}
                      onChange={(e) => setFormData({...formData, activo: e.target.checked})}
                    />
                    <span>Producto activo</span>
                  </label>
                </div>
              </>
            )}

            {type === 'category' && (
              <>
                <div className="form-group">
                  <label>Nombre de la Categoría *</label>
                  <input
                    type="text"
                    value={formData.nombre}
                    onChange={(e) => setFormData({...formData, nombre: e.target.value})}
                    required
                    placeholder="Ej: Decoración"
                  />
                </div>

                <div className="form-row">
                  <div className="form-group">
                    <label>Icono (Emoji)</label>
                    <input
                      type="text"
                      value={formData.icono}
                      onChange={(e) => setFormData({...formData, icono: e.target.value})}
                      placeholder="🎨"
                      maxLength="2"
                    />
                  </div>

                  <div className="form-group">
                    <label>Orden</label>
                    <input
                      type="number"
                      value={formData.orden}
                      onChange={(e) => setFormData({...formData, orden: e.target.value})}
                      min="1"
                    />
                  </div>
                </div>

                <div className="form-group checkbox-group">
                  <label>
                    <input
                      type="checkbox"
                      checked={formData.activo}
                      onChange={(e) => setFormData({...formData, activo: e.target.checked})}
                    />
                    <span>Categoría activa</span>
                  </label>
                </div>
              </>
            )}

            {type === 'subcategory' && (
              <>
                <div className="form-group">
                  <label>Nombre de la Subcategoría *</label>
                  <input
                    type="text"
                    value={formData.nombre}
                    onChange={(e) => setFormData({...formData, nombre: e.target.value})}
                    required
                    placeholder="Ej: Wallpanel"
                  />
                </div>

                <div className="form-group">
                  <label>Categoría Padre *</label>
                  <select
                    value={formData.categoria_id}
                    onChange={(e) => setFormData({...formData, categoria_id: e.target.value})}
                    required
                  >
                    <option value="">Seleccionar categoría</option>
                    {categories.map(cat => (
                      <option key={cat.id} value={cat.id}>{cat.nombre}</option>
                    ))}
                  </select>
                </div>
              </>
            )}
          </div>

          <div className="modal-footer">
            <button type="button" className="btn-secondary" onClick={onClose}>
              Cancelar
            </button>
            <button type="submit" className="btn-primary" disabled={saving || uploadingImage}>
              {uploadingImage ? 'Subiendo imagen...' : saving ? 'Guardando...' : 'Guardar'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Modal;
