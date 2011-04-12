class PaymentDetail < ActiveRecord::Base
  belongs_to :receipt

  validates_numericality_of :amount, :only_integer => true, :message => "(Monto): el valor debe ser numerico.", :allow_blank => true
  validate :detalle_correcto

  def detalle_correcto
    if (not amount.nil?) 
      if (payment_form=="")
        errors.add(:payment_form, "(Forma de Pago): debe seleccionar un valor para este campo.")
      end 
    end
  end

end
