class PaymentFlow < ActiveRecord::Base
  has_many :payment_agreements

  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
  validates_presence_of :description, :message => "(Descripcion) : debe ingresar un valor en este campo."
end
