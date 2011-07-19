class Ticket < ActiveRecord::Base
  belongs_to :principal
  belongs_to :product
  belongs_to :user
  belongs_to :collection_type
  attr_writer :current_step  

  validate :no_nulos
  validate :valida_rut
  validates_format_of :rut, :with => /\A[+-]?\d+\Z/, :message => " : debe ingresar solamente digitos y sin puntos ni guiones.", :allow_blank => true
  validates_inclusion_of :digit, :in => %w(0 1 2 3 4 5 6 7 8 9 k K),  :message => "(Digito verificador) no es un valor valido.", :allow_blank => true
  validates_numericality_of :capital, :only_integer => true, :message => " : el valor debe ser numerico. Ingrese 0 si no tiene valor.", :allow_blank => true
  validates_numericality_of :arrear_interest, :only_integer => true, :message => "(Interes Mora) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :term_interest, :only_integer => true, :message => "(Interes Plazo) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :fee, :only_integer => true, :message => "(Honorarios) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :shipping_costs, :only_integer => true, :message => "(Gastos Envio) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :legal_costs, :only_integer => true, :message => "(Gastos Judiciales) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :ad_capital, :only_integer => true, :message => "(Ajuste de Capital) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :ad_arrear_interest, :only_integer => true, :message => "(Ajuste de Interes Mora) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :ad_term_interest, :only_integer => true, :message => "(Ajuste de Interes Plazo) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :ad_fee, :only_integer => true, :message => "(Ajuste de Honorarios) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :ad_shipping_costs, :only_integer => true, :message => "(Ajuste de Gastos Envio) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_numericality_of :ad_legal_costs, :only_integer => true, :message => "(Ajuste de Gastos Judiciales) : el valor debe ser numerico. Ingrese 0 si no tiene valor."
  validates_length_of :payment_description, :maximum => 200, :message => "(descripcion del Pago) : la descripcion supera la cantidad de 200 caracteres permitidos."
  validate :valida_mod_sup
  validate :valida_intereses
  validate :valida_mod_mgt
  validate :valida_ajustes

 #------------------------------------------
 # validate :test
  def test
    if (adjust_val!=0 )
      errors.add(:adjust_sup_des, "ajuste no 0")
    end
    if (not adjust_val!=nil?)
      errors.add(:adjust_sup_des, "ajuste no nulo")
   end
      errors.add(:adjust_sup_des, "otro")
  end
 #------------------------------------------

  def current_step  
    @current_step || "ticket_1"  
  end  
  def next_step  
    self.current_step = "ticket_2"
  end 
  def first_step?  
    current_step == "ticket_1"  
  end 
  def last_step?  
    current_step == "ticket_2"  
  end 

  def no_nulos
   if not cas_id.nil?
     validates_presence_of :name, :message => "(Nombre Deudor) : debe ingresar un valor en este campo."  
     validates_presence_of :cas_id, :message => "(Identificador) : debe ingresar un valor en este campo."
     validates_presence_of :capital, :message => " : debe ingresar un valor en este campo."
   end 
  end

  def valida_intereses
    if (capital==0)
      if (arrear_interest!=0)
        errors.add(:arrear_interest, "(Interes Mora) : si el Capital es $0, el Interes Mora debe ser $0.")
      end
      if (term_interest!=0)
        errors.add(:term_interest, "(Interes Plazo) : si el Capital es $0, el Interes Plazo debe ser $0.")
      end
    else
      if (profile==1 or profile==3)
        int_m = int_mora * capital / 100
        int_p = int_plazo * capital / 100
        if (not arrear_interest.nil? and arrear_interest > int_m)
          errors.add(:arrear_interest, "(Interes Mora) : el Interes Mora ingresado es mayor que el permitido, de $" + int_m.to_i.to_s + ". Si requiere un valor mayor, ingrese 0 en el campo y solicite modificacion a Supervisor.")
        end
        if (not term_interest.nil? and term_interest > int_m)
          errors.add(:term_interest, "(Interes Plazo) : el Interes Plazo ingresado es mayor que el permitido, de $" + int_p.to_i.to_s + ". Si requiere un valor mayor, ingrese 0 en el campo y solicite modificacion a Supervisor.")
        end
      end
    end
  end


  def valida_mod_sup
    if (adjust_sup? and adjust_sup_des.empty?)
      errors.add(:adjust_sup_des, "(Descripcion modificacion) : debe ingresar la descripcion de la modificacion solicitada a Supervisor.")
    end
  end
  def valida_mod_mgt
    if (adjust_mgt? and adjust_mgt_des.empty?)
      errors.add(:adjust_mgt_des, "(Descripcion modificacion) : debe ingresar la descripcion de la modificacion solicitada a Gerencia.")
    end
  end

  def valida_ajustes
    if (ad_capital!=0)
      if (capital==0)
        errors.add(:ad_capital, "(Ajuste de Capital) : no puede ingresar un ajuste si el Capital es 0.")
      elsif (-ad_capital > capital)
        errors.add(:ad_capital, "(Ajuste de Capital) : no puede ingresar un ajuste superior al Capital.")
      end
    end
    if (ad_arrear_interest!=0)
      if (arrear_interest==0)
        errors.add(:ad_arrear_interest, "(Ajuste de Int. Mora) : no puede ingresar un ajuste si el Interes Mora es 0.")
      elsif (-ad_arrear_interest > arrear_interest)
        errors.add(:ad_arrear_interest, "(Ajuste de Int. Mora) : no puede ingresar un ajuste superior al Interes Mora.")
      end
    end    
    if (ad_term_interest!=0)
      if (term_interest==0)
        errors.add(:ad_term_interest, "(Ajuste de Int. Plazo) : no puede ingresar un ajuste si el Interes Plazo es 0.")
      elsif (-ad_term_interest > term_interest)
        errors.add(:ad_term_interest, "(Ajuste de Int. Plazo) : no puede ingresar un ajuste superior al Interes Plazo.")
      end
    end
    if (ad_fee!=0)
      if (fee==0)
        errors.add(:ad_fee, "(Ajuste de Honorarios) : no puede ingresar un ajuste si los Honorarios son 0.")
      elsif (-ad_fee > fee)
        errors.add(:ad_fee, "(Ajuste de Honorarios) : no puede ingresar un ajuste superior a los Honorarios.")
      end
    end
    if (ad_shipping_costs!=0)
      if (shipping_costs==0)
        errors.add(:ad_shipping_costs, "(Ajuste de Gtos. Envio) : no puede ingresar un ajuste si los Gastos de Envio son 0.")
      elsif (-ad_shipping_costs > shipping_costs)
        errors.add(:ad_shipping_costs, "(Ajuste de Gtos. Envio) : no puede ingresar un ajuste superior a los Gastos de Envio.")
      end   
    end
    if (ad_legal_costs!=0) 
      if (legal_costs==0)
        errors.add(:ad_legal_costs, "(Ajuste de Gtos. Judiciales) : no puede ingresar un ajuste si los Gastos Judiciales son 0.")
      elsif (-ad_legal_costs > legal_costs)
        errors.add(:ad_legal_costs, "(Ajuste de Gtos. Judiciales) : no puede ingresar un ajuste superior a los Gastos Judiciales.")
      end
    end
    ajustes=ad_capital + ad_fee + ad_arrear_interest + ad_term_interest + ad_shipping_costs + ad_legal_costs
    if (ajustes!=0 and not ajustes.nil? and state!="modificado")
       if (profile==1) and (ajustes< adjust_mx)
         errors.add(:adjust_val, "(Ajustes) : El descuento, suma de todos los ajustes, no puede ser mayor que $"+adjust_mx.to_s+". Si requiere un valor distinto, ingrese valor 0 en los ajustes y solicite modificacion a Supervisor." )
       elsif (profile==3) and (ajustes< adjust_mx)
         errors.add(:adjust_val, "(Ajustes) : El descuento, suma de todos los ajustes, no puede ser mayor que $"+adjust_mx.to_s+". Si requiere un valor distinto, ingrese valor 0 en los ajustes y solicite modificacion a Supervisor." )
       elsif (profile==2) and (ajustes< adjust_mx)
         errors.add(:adjust_val, "(Ajustes) : El descuento, suma de todos los ajustes, no puede ser mayor que $"+adjust_mx.to_s+". Si requiere un valor distinto, ingrese valor 0 en los ajustes y solicite modificacion a Gerencia.")
       elsif (ajustes!=0) and (adjust_obs.nil? or adjust_obs.empty?)
         errors.add(:adjust_obs, "(Observacion ajuste) : debe ingresar un valor en este campo.")
       end
    end
  end

  def valida_rut
   if not cas_id.nil?
    if rut.blank?
      errors.add(:rut, " : debe ingresar un valor en este campo.")
    else !rut.blank? 
      largo = rut.length
      if (largo<7 or largo>9)
        errors.add(:rut, " : el valor ingresado no es valido.")
      elsif digit.blank?
        errors.add(:digit, "(Rut) : debe ingresar el digito verificador.")
      else
        sum = 0
        for i in 1..largo	
          if i<7
            val = rut[largo-i].to_i * (i+1)
          else
            val = rut[largo-i].to_i * (i-5)
          end
          sum = sum + val
        end
        res = 11 - (sum%11)
        if res==11
          digito = "0"
        elsif res==10
          digito = "K"
        else
          digito = res.to_s
        end
        if digit.upcase!=digito
          errors.add(:rut, " : el valor ingresado no es valido.")
        end
      end
    end
   end
  end

end
