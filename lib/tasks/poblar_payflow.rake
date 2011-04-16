require 'faker'
namespace :db do
  desc "Carga los datos de Flujos de Pago."
  task :payflow => :environment do
    payflow
  end
end

def payflow
  PaymentFlow.create!(:name => "RP Completo", :description => "Se debe ingresar la informacion de Detalle de Pago y el RP debe cuadrar.", :state => 1)
  PaymentFlow.create!(:name => "RP por Completar", :description => "Se debe ingresar la informacion de Contacto. El RP queda incompleto hasta ingresarle el Detalle de Pago.", :state => 1)
  PaymentFlow.create!(:name => "RP con Gestion Terreno", :description => "Se debe ingresar la informacion de Contacto, quedando incompleto. El RP es gestionado en Terreno y posteriormente se le ingresa el Detalle de Pago.", :state => 1)
end

