class Ticket < ActiveRecord::Base
  belongs_to :principal
  belongs_to :product
  belongs_to :user
  belongs_to :collection_type

  validates_presence_of :name, :message => "(Nombre Deudor) : debe ingresar un valor en este campo."
  validates_presence_of :cas_id, :message => "(Identificador) : debe ingresar un valor en este campo."
  #validate :valida_rut
  validates_format_of :rut, :with => /\A[+-]?\d+\Z/, :message => " : debe ingresar solamente digitos y sin puntos ni guiones.", :allow_blank => true
  validates_inclusion_of :digit, :in => %w(0 1 2 3 4 5 6 7 8 9 k K),  :message => "(Digito verificador) no es un valor valido.", :allow_blank => true
  validates_presence_of :capital, :message => " : debe ingresar un valor en este campo."
  validates_numericality_of :capital, :only_integer => true, :message => " : el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :arrear_interest, :only_integer => true, :message => "(Interes Mora) : el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :term_interest, :only_integer => true, :message => "(Interes Plazo) : el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :fee, :only_integer => true, :message => "(Honorarios) : el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :shipping_costs, :only_integer => true, :message => "(Gastos Envio) : el valor debe ser numerico.", :allow_blank => true
  validates_numericality_of :legal_costs, :only_integer => true, :message => "(Gastos Judiciales) : el valor debe ser numerico.", :allow_blank => true
  validate :valida_mod_sup
#  validate :valida_ajuste_sup

  def valida_mod_sup
    if (adjust_sup? and adjust_sup_des.empty?)
      errors.add(:adjust_sup_des, "(Descripcion modificacion) : debe ingresar la descripcion de la modificacion solicitada.")
    end
  end

  def valida_ajuste_sup
   # if current_user.profile_id==2 
      if (adjust>1000)
        errors.add(:adjust, "(Ajuste) : el valor ingresado no debe ser mayor a 1000.")
      end
   # end
  end

  def valida_rut
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
