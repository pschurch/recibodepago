class Receipt < ActiveRecord::Base
  belongs_to :payment_agreement
  belongs_to :comuna
  has_many :payment_details, :dependent => :destroy
  accepts_nested_attributes_for :payment_details, :reject_if => lambda { |a| a[:payment_form].nil? }  
  attr_writer :current_step  
    
  validate :cierre_correcto

  def current_step  
    @current_step || "acpago"  
  end     
  def next_step  
    self.current_step = "detalle"
  end 
  def first_step?  
    current_step == "acpago"  
  end 
  def last_step?  
    current_step == "detalle"  
  end 

  def cierre_correcto
    if(payment_agreement_id==3 or payment_agreement_id==4)
      if (cont_name=="")
        errors.add(:cont_name, "(Nombre de Contacto): debe ingresar un valor para este campo.")
      end 
      if (cont_rut=="")
        errors.add(:cont_rut, "(Rut de Contacto): debe ingresar un valor para este campo.")
      end 
      if (cont_digit=="")
        errors.add(:cont_digit, "(Digito Verificador de Contacto): debe ingresar un valor para este campo.")
      end 
      if (cont_calle=="")
        errors.add(:cont_calle, "(Calle de Contacto): debe ingresar un valor para este campo.")
      end 
      if (cont_num=="")
        errors.add(:cont_num, "(Nro. Calle de Contacto): debe ingresar un valor para este campo.")
      end 
      if (comuna_id.nil?)
        errors.add(:comuna_id, "(Comuna de Contacto): debe seleccionar un valor para este campo.")
      end 
      if (cont_telf1=="")
        errors.add(:cont_telf1, "(Telefono de Contacto): debe ingresar un valor para este campo.")
      end 
    end
  end

  def cierre_correcto2
    if(payment_agreement_id==1 or payment_agreement_id==2 or payment_agreement_id==5 or payment_agreement_id==6)
      total = 0
      if total!=total_pay
        errors.add(:total_paid, "(Total Pagado) : el valor pagado, $"+total.to_s+", no corresponde al valor por pagar, $"+total_pay.to_s+".")
      end
    end
  end

end
