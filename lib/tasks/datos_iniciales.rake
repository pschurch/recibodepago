require 'faker'
namespace :db do
  desc "Carga los datos Iniciales."
  task :datosiniciales => :environment do
    perfilesinit
    payagreementinit
    singrupoinit
    usuarioadmininit
    comunasinit
  end
end

def perfilesinit
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

def payagreementinit
  PaymentAgreement.create!(:name => "Pago en TechMill", :description => "El Deudor realiza el pago en persona en las oficinas de TechMill", :state => 1)
  PaymentAgreement.create!(:name => "Envio por Correo", :description => "El Deudor envia cheque por correo tradicional", :state => 1)
  PaymentAgreement.create!(:name => "Negocia Ejecutivo de Cobranza", :description => "", :state => 1)
  PaymentAgreement.create!(:name => "Gestion en Terreno", :description => "", :state => 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte TechMill", :description => "El Deudor realiza el deposito en la cuenta corriente de TechMill", :state => 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte Mandante", :description => "El Deudor realiza el deposito en la cuenta corriente del Mandante", :state => 1)
  PaymentAgreement.create!(:name => "Express", :description => "", :state => 1)
end

def singrupoinit
  Group.create!(:name => "SinGrupo",
                :description => "No tiene asociado ningun Grupo en particular")
end

def usuarioadmininit
  User.create!(:user => "admin", :profile_id => 7, :group_id => 1, :name => "admin", :password => "admin", :password_confirmation => "admin")
end

def comunasinit
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


