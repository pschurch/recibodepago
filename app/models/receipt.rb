class Receipt < ActiveRecord::Base
  belongs_to :payment_agreement
  #belongs_to :payment_form
  belongs_to :comuna
  attr_writer :current_step  
    
  validates_numericality_of :monto1, :only_integer => true, :message => ": el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :monto2, :only_integer => true, :message => ": el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :monto3, :only_integer => true, :message => ": el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :monto4, :only_integer => true, :message => ": el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :monto5, :only_integer => true, :message => ": el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :monto6, :only_integer => true, :message => ": el valor debe ser numerico.", :allow_blank => true

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
      if (not monto1.nil?) 
        total=total+monto1
        if (formapago1=="")
          errors.add(:formapago1, ": debe seleccionar un valor para este campo.")
        end 
      end 
      if (not monto2.nil?) 
        total=total+monto2 
        if (formapago2=="")
          errors.add(:formapago2, ": debe seleccionar un valor para este campo.")
        end 
      end 
      if (not monto3.nil?) 
        total=total+monto3 
        if (formapago3=="")
          errors.add(:formapago3, ": debe seleccionar un valor para este campo.")
        end 
      end 
      if (not monto4.nil?) 
        total=total+monto4 
        if (formapago4=="")
          errors.add(:formapago4, ": debe seleccionar un valor para este campo.")
        end 
      end 
      if (not monto5.nil?) 
        total=total+monto5 
        if (formapago5=="")
          errors.add(:formapago5, ": debe seleccionar un valor para este campo.")
        end 
      end 
      if (not monto6.nil?) 
        total=total+monto6 
        if (formapago6=="")
          errors.add(:formapago6, ": debe seleccionar un valor para este campo.")
        end 
      end 
      if total!=total_pay
        errors.add(:total_paid, "(Total Pagado) : el valor pagado, $"+total.to_s+", no corresponde al valor por pagar, $"+total_pay.to_s+".")
      end
    end
  end

end
