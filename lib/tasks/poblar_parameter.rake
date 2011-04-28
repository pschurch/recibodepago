require 'faker'
namespace :db do
  desc "Carga los datos de Parametros."
  task :parameter => :environment do
    parameter
  end
end

def parameter
  Parameter.create!(:name => "Descuento maximo Cobranza", :val_int=> -200, :description => "Valor maximo de descuento para Cobranza", :state => 1)
  Parameter.create!(:name => "Descuento maximo Supervisor", :val_int=> -1000, :description => "Valor maximo de descuento para Supervisor", :state => 1)
end

