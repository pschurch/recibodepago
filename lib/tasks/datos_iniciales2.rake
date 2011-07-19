require 'faker'
namespace :db do
  desc "Carga los datos Iniciales."
  task :datos2 => :environment do

    parameterinit

  end
end

def parameterinit
  Parameter.create!(:name => "Interes Mora maximo", :val_int=> 0, :val_dec=> 3.0, :description => "Valor maximo permitido para el Interes Mora", :state => 1, :help=>'Ingrese el monto, menor que 100, en el campo "Valor decimal", con decimales. Ej: 5.5.')
  Parameter.create!(:name => "Interes Plazo maximo", :val_int=> 0, :val_dec=>3.0, :description => "Valor maximo permitido para el Interes Plazo", :state => 1, :help=>'Ingrese el monto, menor que 100, en el campo "Valor decimal", con decimales. Ej: 4.5.')
  Parameter.create!(:name => "Descuento maximo Terreno", :val_int=> -200, :val_dec=> 0, :description => "Valor maximo de descuento para Terreno", :state => 1, :help=>'Ingrese el monto, negativo, en el campo "Valor entero", sin decimales. Ej: -200.')
end
