class Receipt < ActiveRecord::Base
  belongs_to :payment_agreement
  belongs_to :cancellation
  belongs_to :rejection_type
  belongs_to :group
  belongs_to :principal
  belongs_to :product
  # belongs_to :comuna
  # has_many :payment_details, :dependent => :destroy
  # accepts_nested_attributes_for :payment_details, :reject_if => lambda { |a| a[:payment_form].nil? }  
  attr_writer :current_step  
    
  validates_numericality_of :monto1, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto2, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto3, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto4, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto5, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto6, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto7, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto8, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto9, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto10, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto11, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto12, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto13, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto14, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto15, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto16, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto17, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :monto18, :only_integer => true, :message => ": el valor debe ser un numero entero.", :allow_blank => true
  validates_numericality_of :adjust_val, :only_integer => true, :message => "(Ajuste): el valor debe ser un numero entero.", :allow_blank => true
  validate :por_estado
  validate :anular
  validate :rechazar
  validate :ejterreno
  validate :ajuste_terreno
#  validate :test

def test
errors.add(:cont_name, "(Nombre de Contacto): TEST")
end

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

  def anular
    if ((button=="n1" or button=="n2" or button=="n3") and canc_mtvo=="")
       errors.add(:canc_mtvo, ": debe ingresar motivo de la anulacion.")
    end 
  end
  def rechazar
    if (button=="r")
      if (rejection_type_id.nil? )
        errors.add(:rejection_type_id, ": debe seleccionar motivo del rechazo.")
      end
      if (rech_mtvo=="")
        errors.add(:rech_mtvo, ": debe ingresar detalle del rechazo.")
      end
    end 
  end
  def ejterreno
    if (state=="solicita gestion terreno" and button.empty? and
        (et_name.nil? or et_name.empty?))
       errors.add(:et_name, ": debe seleccionar un Ejecutivo de Terreno.")
    end 
  end
  def ajuste_terreno
    if (not adjust_val.nil?)
      if (adjust_obs.nil? or adjust_obs.empty?)
        errors.add(:adjust_obs, "(Observacion ajuste): debe ingresar un valor en este campo.")
      end
    end
  end

  def por_estado
    # Cuadre del detalle de pago -----------------------------------
    # estado "", Flujo 1 Completo / 
    # estado abierto, Flujo 2 por Completar, button != n2
    # Profile=3  area=Terreno  estado abierto, button != n2 
    # Profile=3  area=Terreno  estado recibido rechazo,  
    if(state=="" and payment_flow_id==1) or 
      (state=="abierto" and payment_flow_id==2 and button!="n2") or 
      (profile==3 and area=="Terreno" and (state=="recibido rechazo" or (state=="abierto" and button!="n2"))) 

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
        if (not monto7.nil?) 
          total=total+monto7
          if (formapago7=="")
            errors.add(:formapago7, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto8.nil?) 
          total=total+monto8
          if (formapago8=="")
            errors.add(:formapago8, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto9.nil?) 
          total=total+monto9
          if (formapago9=="")
            errors.add(:formapago9, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto10.nil?) 
          total=total+monto10
          if (formapago10=="")
            errors.add(:formapago10, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto11.nil?) 
          total=total+monto11
          if (formapago11=="")
            errors.add(:formapago11, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto12.nil?) 
          total=total+monto12
          if (formapago12=="")
            errors.add(:formapago12, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto13.nil?) 
          total=total+monto13
          if (formapago13=="")
            errors.add(:formapago13, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto14.nil?) 
          total=total+monto14
          if (formapago14=="")
            errors.add(:formapago14, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto15.nil?) 
          total=total+monto15
          if (formapago15=="")
            errors.add(:formapago15, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto16.nil?) 
          total=total+monto16
          if (formapago16=="")
            errors.add(:formapago16, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto17.nil?) 
          total=total+monto17
          if (formapago17=="")
            errors.add(:formapago17, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if (not monto18.nil?) 
          total=total+monto18
          if (formapago18=="")
            errors.add(:formapago18, ": debe seleccionar un valor para este campo.")
          end 
        end 
        if total!=total_pay
          errors.add(:total_paid, "(Total Pagado) : el valor pagado, $"+total.to_s+", no corresponde al valor por pagar, $"+total_pay.to_s+".")
        end

    # Datos de Contacto ---------------------------------------
    # estado "", F:2 ó 3 / 
    # estado "recibido rechazo", subarea="Terreno"
    elsif(state=="" and (payment_flow_id==2 or payment_flow_id==3))or(state=="recibido rechazo" and subarea=="Terreno")
        if (cont_name=="")
          errors.add(:cont_name, "(Nombre de Contacto): debe ingresar un valor en este campo.")
        end 
        if (cont_rut=="")
          errors.add(:cont_rut, "(Rut de Contacto): debe ingresar un valor para en campo.")
        end 
        if (cont_digit=="")
          errors.add(:cont_digit, "(Digito Verificador de Contacto): debe ingresar un valor en este campo.")
        end 
        if (cont_calle=="")
          errors.add(:cont_calle, "(Calle de Contacto): debe ingresar un valor para en campo.")
        end 
        if (cont_num=="")
          errors.add(:cont_num, "(Nro. Calle de Contacto): debe ingresar un valor para en campo.")
        end 
        if (cont_comuna=="")
          errors.add(:cont_comuna, "(Comuna de Contacto): debe seleccionar un valor para este campo.")
        end 
        if (cont_telf1=="")
          errors.add(:cont_telf1, "(Telefono de Contacto): debe ingresar un valor para en campo.")
        end 
           
    # mtvo_rechazo ---------------------------------------------
    # estado "rendido",      area:"cobranza",   sarea: "Supervisor" /
    # estado "recepcionado", area:"supervisor", sarea: "cobranza" /
    # elsif(state=="rendido" and area=="Cobranza")or(state=="recepcionado" and area=="Supervisor")
      #if rech_mtvo.nil? or rech_mtvo.empty?
      #  errors.add(:rech_mtvo, "(Motivo del Rechazo): debe ingresar un valor en este campo.")
      #end
    end
  end
end
