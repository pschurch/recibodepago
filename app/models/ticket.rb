class Ticket < ActiveRecord::Base
  validates_presence_of :rut, :message => "(Rut) : debe ingresar un valor en este campo."
  validates_presence_of :name, :message => "(Nombre Deudor) : debe ingresar un valor en este campo."
  validates_presence_of :cas_id, :message => "(Identificador) : debe ingresar un valor en este campo."


end
