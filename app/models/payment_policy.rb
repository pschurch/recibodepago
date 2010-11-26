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
