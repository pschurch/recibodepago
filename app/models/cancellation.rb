class Cancellation < ActiveRecord::Base
  has_many :receipts

  validates_presence_of :message, :message => "(Mensaje) : debe ingresar un valor en este campo."
end
