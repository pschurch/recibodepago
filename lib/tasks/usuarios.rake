require 'faker'

namespace :db do
  desc "Carga Usuarios."
  task :usuarios => :environment do
    perfiles
  end
end

def usuarios
  User.create!(:user => "EjecutivoCobranza",
                  :description => "Crea Tickets y Recibos de Pago")

end

