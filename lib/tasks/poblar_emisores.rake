require 'faker'
namespace :db do
  desc "Carga los datos de Emisores."
  task :emisores => :environment do
    emisores
  end
end

def emisores
  Emitter.create!(:name => "Banco BICE")
  Emitter.create!(:name => "Banco de Chile - Edwards")
  Emitter.create!(:name => "Banco del Desarrollo")
  Emitter.create!(:name => "Banco del Estado de Chile")
  Emitter.create!(:name => "Banco do Brasil S.A.")
  Emitter.create!(:name => "Banco Falabella")
  Emitter.create!(:name => "Banco Internacional")
  Emitter.create!(:name => "Banco Itau Chile")
  Emitter.create!(:name => "Banco Paris")
  Emitter.create!(:name => "Banco Ripley")
  Emitter.create!(:name => "Banco Santander")
  Emitter.create!(:name => "Banco Security")
  Emitter.create!(:name => "Banco Sudamericano (ex RBS) ")
  Emitter.create!(:name => "BBVA (Bco Bilbao Viscaya ARG) ")
  Emitter.create!(:name => "BCI (Bco de Credito e Inv) ")
  Emitter.create!(:name => "Citibank - Chile")
  Emitter.create!(:name => "Corpbanca")
  Emitter.create!(:name => "HSBC Bank")
  Emitter.create!(:name => "Rabobank")
  Emitter.create!(:name => "Scotiabank") 
  Emitter.create!(:name => "TBanc")
  Emitter.create!(:name => "ING Salud Isapre") 
  Emitter.create!(:name => "Isapre Banmedica") 
  Emitter.create!(:name => "Isapre Cigna Salud")
  Emitter.create!(:name => "Isapre Colmena Golden Cross")
  Emitter.create!(:name => "Isapre Consalud")
  Emitter.create!(:name => "Isapre Cruz Blanca")
  Emitter.create!(:name => "Isapre Cruz del Norte")
  Emitter.create!(:name => "Isapre Ferrosalud")
  Emitter.create!(:name => "Isapre Fusat")
  Emitter.create!(:name => "Isapre Mas Vida")  
  Emitter.create!(:name => "Isapre Normedica")
  Emitter.create!(:name => "Isapre Rio Blanco")
  Emitter.create!(:name => "Isapre San Lorenzo")
  Emitter.create!(:name => "Isapre Sfera")
  Emitter.create!(:name => "Isapre Vida Tres")

end

