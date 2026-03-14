import { AlertTriangle, X } from 'lucide-react';
import '../css/modal.css';

const ConfirmDialog = ({ title, message, onConfirm, onCancel, type = 'danger' }) => {
  return (
    <div className="modal-overlay" onClick={onCancel}>
      <div className="modal-content confirm-dialog" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <div className="confirm-header-content">
            <div className={`confirm-icon ${type}`}>
              <AlertTriangle size={24} />
            </div>
            <h2>{title}</h2>
          </div>
          <button className="btn-icon" onClick={onCancel}>
            <X size={20} />
          </button>
        </div>

        <div className="modal-body">
          <p className="confirm-message">{message}</p>
        </div>

        <div className="modal-footer">
          <button type="button" className="btn-secondary" onClick={onCancel}>
            Cancelar
          </button>
          <button type="button" className={`btn-${type}`} onClick={onConfirm}>
            {type === 'danger' ? 'Eliminar' : 'Confirmar'}
          </button>
        </div>
      </div>
    </div>
  );
};

export default ConfirmDialog;
