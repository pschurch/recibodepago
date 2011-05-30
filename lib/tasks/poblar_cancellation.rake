require 'faker'
namespace :db do
  desc "Carga los datos de Anulaciones."
  task :cancellation => :environment do
    cancellationinit
  end
end

def cancellationinit
  Cancellation.create!(:message => "Solamente debe anular el Registro de Recibo de Pago.", :description => "", :state => 1)
  Cancellation.create!(:message => "Para anular el registro de Recibo de Pago requiere las dos copias impresas con el timbre.", :description => "", :state => 1)
  Cancellation.create!(:message => "Para anular el registro de Recibo de Pago requiere la copia impresa con el timbre y el dinero recaudado.", :description => "", :state => 1)
end

