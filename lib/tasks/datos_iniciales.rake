require 'faker'

namespace :db do
  desc "Carga datos iniciales."
  task :inicio => :environment do
    grupos
  end
end

def grupos
  Group.create!(:name => "SinGrupo",
                :description => "No tiene asociado ningun Grupo en particular")
end
