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
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."

  validates_presence_of :social_reason, :message => "(Razon Social) : debe ingresar un valor en este campo."

   validates_format_of :rut, :with => /\A[+-]?\d+\Z/, :message => "(Rut) : debe ingresar solamente digitos, sin puntos.", :allow_blank => true

  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => ": la direccion de correo no es valida.", :allow_blank => true 
   
  validates_inclusion_of :digit, :in => %w(0 1 2 3 4 5 6 7 8 9 k K),  :message => "(Digito verificador) no es un valor valido.", :allow_blank => true

  has_many :payment_policies
end


