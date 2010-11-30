require 'faker'

namespace :db do
  desc "Ingresa datos de prueba a la tabla de Asignacion."
  task :assign => :environment do
    asignacion
  end
end

def asignacion
  Assignment.create!(:state => "cargado",
                     :cas_id => "ot-234",
                     :principal_id => 1,
                     :collection_type_id => 1,
                     :product_id => 1,
                     :name => "Charles Haramoto",
                     :rut => "9572785",
                     :alloc_date => "2010-11-30",
                     :capital => 50000,
                     :number => "879887",
                     :emitter => "Banco Boston",
                     :ctacte => "989987-098",
                     :expir_date => "2010-12-10" )  
end

