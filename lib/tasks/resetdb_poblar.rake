require 'faker'

namespace :db do
  desc "Resetea la BD y carga los datos iniciales."
  task :start => :environment do
    Rake::Task['db:reset'].invoke
    perfiles
    grupos
  end
end

def perfiles
  Profile.create!(:name => "EjecutivoCobranza",
                  :description => "Crea Tickets y Recibos de Pago")
  Profile.create!(:name => "Supervisor",
                  :description => "Puede modificar Tickets y Recibos de Pago")
  Profile.create!(:name => "JefeTerreno",
                  :description => "Gestiona los retiros en terreno")
  Profile.create!(:name => "Tesoreria",
                  :description => "Recepciona los Recibos de Pago y confirma que la informacion sea correcta. Crea las Remesas")
  Profile.create!(:name => "Operador",
                  :description => "Realiza las cargas de datos y analiza tendencias")
  Profile.create!(:name => "Gerencia",
                  :description => "Tiene acceso a toda la informacion contenida en la aplicacion")
  Profile.create!(:name => "Administrador",
                  :description => "Administra las tablas de codigos")
  Profile.create!(:name => "Designer",
                  :description => "Administra los Perfiles")
end

def grupos
  Group.create!(:name => "SinGrupo",
                :description => "No tiene asociado ningun Grupo en particular")
end
