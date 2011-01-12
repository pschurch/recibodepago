require 'faker'

namespace :db do
  desc "Carga datos iniciales."
  task :start => :environment do
    grupos
  end
end

def grupos
  Group.create!(:name => "SinGrupo",
                :description => "No tiene asociado ningun Grupo en particular")
end
