class RejectionType < ActiveRecord::Base
  has_many :receipts

  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
end
