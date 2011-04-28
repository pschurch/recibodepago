class Parameter < ActiveRecord::Base
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
end
