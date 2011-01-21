# == Schema Information
# Schema version: 20101110211158
#
# Table name: principals
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  social_reason :string(255)
#  rut           :string(255)
#  digit         :string(255)
#  contact       :string(255)
#  telephone     :string(255)
#  email         :string(255)
#  state         :boolean(1)      default(TRUE)
#  created_at    :datetime
#  updated_at    :datetime
#

class Principal < ActiveRecord::Base
  has_many :payment_policies
  has_many :tickets
  has_many :assignments
  has_many :carteras
  has_many :products, :through => :carteras

  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
  validates_presence_of :social_reason, :message => "(Razon Social) : debe ingresar un valor en este campo."
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => ": la direccion de correo no es valida.", :allow_blank => true 
#  validate :valida_rut
  validates_format_of :rut, :with => /\A[+-]?\d+\Z/, :message => " : debe ingresar solamente digitos y sin puntos ni guiones.", :allow_blank => true
  validates_inclusion_of :digit, :in => %w(0 1 2 3 4 5 6 7 8 9 k K),  :message => "(Digito verificador) no es un valor valido.", :allow_blank => true

  def valida_rut
    if !rut.blank? 
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


