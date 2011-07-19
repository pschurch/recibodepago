class Parameter < ActiveRecord::Base
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
  validates_presence_of :val_int, :message => "(Valor entero) : debe ingresar un valor en este campo. Si no lo tiene, ingrese 0."
  validates_presence_of :val_dec, :message => "(Valor decimal) : debe ingresar un valor en este campo. Si no lo tiene, ingrese 0.0."
end
