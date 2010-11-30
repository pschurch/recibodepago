# == Schema Information
# Schema version: 20101127012735
#
# Table name: payment_policies
#
#  id                 :integer(4)      not null, primary key
#  principal_id       :integer(4)
#  product_id         :integer(4)
#  collection_type_id :integer(4)
#  arrear_interest    :integer(4)
#  term_interest      :integer(4)
#  fee                :integer(4)
#  description        :text
#  state              :boolean(1)      default(TRUE)
#  legal_costs        :boolean(1)
#  installment        :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#

class PaymentPolicy < ActiveRecord::Base
  belongs_to :principal
  belongs_to :product
  belongs_to :collection_type

  validates_presence_of :principal_id, :message => "(Mandante) : debe seleccionar un valor para este campo."
  validates_presence_of :product_id, :message => "(Producto) : debe seleccionar un valor para este campo."
  validates_presence_of :collection_type_id, :message => "(Tipo de Cobranza) : debe seleccionar un valor para este campo."
  validates_numericality_of :arrear_interest, :message => "(Interes Mora) : debe ingresar solamente valores numericos.", :allow_blank => true
  validates_numericality_of :term_interest, :message => "(Interes Plazo) : debe ingresar solamente valores numericos.", :allow_blank => true
  validates_numericality_of :fee, :message => "(Honorarios) : debe ingresar solamente valores numericos.", :allow_blank => true

end
