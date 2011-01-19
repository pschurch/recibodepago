require 'faker'
namespace :db do
  desc "Carga los datos de Comunas."
  task :comunas => :environment do
    comunas
  end
end

def comunas
  Comuna.create!(:name => "Cerrillos")
  Comuna.create!(:name => "Cerro Navia")
  Comuna.create!(:name => "Conchali")
  Comuna.create!(:name => "El Bosque")
  Comuna.create!(:name => "Estacion Central")
  Comuna.create!(:name => "Huechuraba")
  Comuna.create!(:name => "Independencia")
  Comuna.create!(:name => "La Cisterna")
  Comuna.create!(:name => "La Florida")
  Comuna.create!(:name => "La Granja")
  Comuna.create!(:name => "La Pintana")
  Comuna.create!(:name => "La Reina")
  Comuna.create!(:name => "Las Condes")
  Comuna.create!(:name => "Lo Barnechea")
  Comuna.create!(:name => "Lo Espejo")
  Comuna.create!(:name => "Lo Prado")
  Comuna.create!(:name => "Macul")
  Comuna.create!(:name => "Maipu")
  Comuna.create!(:name => "Nunoa")
  Comuna.create!(:name => "Padre Hurtado")
  Comuna.create!(:name => "Pedro Aguirre Cerda")
  Comuna.create!(:name => "Penalolen")
  Comuna.create!(:name => "Pirque")
  Comuna.create!(:name => "Providencia")
  Comuna.create!(:name => "Pudahuel")
  Comuna.create!(:name => "Puente Alto")
  Comuna.create!(:name => "Quilicura")
  Comuna.create!(:name => "Quinta Normal")
  Comuna.create!(:name => "Recoleta")
  Comuna.create!(:name => "Renca")
  Comuna.create!(:name => "San Bernardo")
  Comuna.create!(:name => "San Joaquin")
  Comuna.create!(:name => "San Jose de Maipo")
  Comuna.create!(:name => "San Miguel")
  Comuna.create!(:name => "San Ramon")
  Comuna.create!(:name => "Santiago Centro")
  Comuna.create!(:name => "Vitacura ")
end

