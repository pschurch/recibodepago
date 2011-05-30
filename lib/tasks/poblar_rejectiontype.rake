require 'faker'
namespace :db do
  desc "Carga los datos de Rechazos."
  task :rejection => :environment do
    rejectioninit
  end
end

def rejectioninit
  RejectionType.create!(:name => "Datos de Contacto incorrectos", :area => "Terreno", :state => 1)
  RejectionType.create!(:name => "Falta de documentacion adjunta", :area => "Terreno", :state => 1)
  RejectionType.create!(:name => "Monto Total Pagado de conjunto de Recibos de Pago no corresponde", :area => "", :state => 1)
  RejectionType.create!(:name => "Falta/Incorrecto Detalle de Pago", :area => "All", :state => 1)
end

