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
                     :collection_type_id => 1,
                     :product_id => 9,
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
    num = rand 10000
    digit = rand 9
    capital = 10000 + num
    number = "00-#{num}"
    num = rand 70
    ot = "ot-#{n+1}"
    tr1 = 400 + num
    tr2 = 200 + n
    rut = tr1.to_s + "3" + tr2.to_s 
    Assignment.create!(:state => "cargado",
                       :cas_id => ot,
                       :principal_id => 1,
                       :collection_type_id => 1,
                       :product_id => 1,
                       :group_id => 2,
                       :name => nombre,
                       :rut => rut,
                       :digit => digit.to_s,
                       :alloc_date => "2010-10-30",
                       :capital => capital,
                       :number => number,
                       :emitter => "Banco Boston",
                       :ctacte => "989987-098",
                       :expir_date => "2010-12-11" ) 
  end
end

