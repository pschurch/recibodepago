require 'faker'

namespace :db do
  desc "Ingresa datos de prueba a la tabla de Asignacion."
  task :test1 => :environment do
    asignacion
  end
end

def asignacion
  Assignment.create!(:state => "cargado",
                     :cas_id => "ot-234",
                     :principal_id => 2,
                     :collection_type_id => 2,
                     :product_id => 4,
                     :group_id => 3,
                     :name => "Charles Haramoto",
                     :rut => "9572785",
                     :digit => "9",
                     :alloc_date => "2010-10-30",
                     :capital => 50000,
                     :number => "879887",
                     :emitter => "Banco Boston",
                     :ctacte => "989987-098",
                     :expir_date => "2010-12-11" )  

  15.times do |n|
    nombre  = Faker::Name.name
    ot = "ot-#{n+1}"
    pp = (rand 3) + 1
    dd = (rand 2) + 1
    n = (rand 9) + 1
    g = (pp / 3) + 2
    r = n.to_s
    rut = r+r+r+r+r+r+r+r
    capital = 10000 + (rand 10000)
    number = "00-#{n.to_s}"
    Assignment.create!(:state => "cargado",
                       :cas_id => ot,
                       :principal_id => pp,
                       :product_id => pp * dd,
                       :collection_type_id => pp,
                       :group_id => g, 
                       :name => nombre,
                       :rut => rut,
                       :digit => r,
                       :alloc_date => "2010-10-30",
                       :capital => capital,
                       :number => number,
                       :emitter => "Banco Boston",
                       :ctacte => "989987-098",
                       :expir_date => "2010-12-11" ) 
  end
end

