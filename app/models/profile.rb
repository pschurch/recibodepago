class Profile < ActiveRecord::Base
  attr_accessible :description
 
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
end

