require 'faker'

namespace :db do
  desc "Carga datos iniciales."
  task :inicio => :environment do
    singrupo
  end
end

def singrupo
  Group.create!(:name => "SinGrupo",
                :description => "No tiene asociado ningun Grupo en particular")
end
