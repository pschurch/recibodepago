require 'faker'

namespace :db do
  desc "Carga datos de Prueba."
  task :datosprueba => :environment do
    productos
    mandantes 
    carteras
    grupos
    cargrups
    usuarios
    tipos_cobranza
    formas_pago
    politicas_pago
    acuerdos_pago
 end
end

def productos
  Product.create!(:name => "Presunta", :state => 1)
  Product.create!(:name => "Arreglo de Flujo", :state => 1)
  Product.create!(:name => "Cheque", :state => 1)
  Product.create!(:name => "Pagare", :state => 1)
  Product.create!(:name => "Aviso", :state => 1)
  Product.create!(:name => "Boleta", :state => 1)
  Product.create!(:name => "Factura", :state => 1)
  Product.create!(:name => "Letra", :state => 1)
  Product.create!(:name => "Cuota", :state => 1)
  Product.create!(:name => "Producto No Activo", :state => 0)
end

def mandantes
  Principal.create!(:name => "Banmedica", :social_reason => "Banmedica S.A.", :rut: => "99999999", :digit => "9", :contact => "Rodrigo Rodriguez", :telephone => "7654321", :email => "rr@test.com", :state => "1" )
  Principal.create!(:name => "Vida Tres", :social_reason => "Vida Tres S.A.", :rut: => "88888888", :digit => "8", :contact => "Gonzalo Gutierrez", :telephone => "9867545", :email => "gg@test.com", :state => "1" )
  Principal.create!(:name => "Colmena", :social_reason => "Colmena S.A.", :rut: => "77777777", :digit => "7", :contact => "Ramón Rosas", :telephone => "4563222", :email => "ramonr@test.com", :state => "1" )
  Principal.create!(:name => "Paris", :social_reason => "Cencosud S.A.", :rut: => "55555555", :digit => "5", :contact => "Rico McPato", :telephone => "4545333", :email => "ricomc@test.com", :state => "1" )
  Principal.create!(:name => "Mandante No Activo", :social_reason => "Mandante no activo", :rut: => "", :digit => "", :contact => "", :telephone => "", :email => "", :state => "0" )
end

def carteras
  Cartera.create!(:principal_id => 1, :product_id => 1, :state => 1)
  Cartera.create!(:principal_id => 1, :product_id => 2, :state => 1)
  Cartera.create!(:principal_id => 2, :product_id => 2, :state => 1)
  Cartera.create!(:principal_id => 2, :product_id => 4, :state => 1)
  Cartera.create!(:principal_id => 3, :product_id => 3, :state => 1)
  Cartera.create!(:principal_id => 3, :product_id => 6, :state => 1)
  Cartera.create!(:principal_id => 4, :product_id => 4, :state => 1)
  Cartera.create!(:principal_id => 4, :product_id => 8, :state => 1)
end

def grupos
  Group.create!(:name => "Grupo 1",
                :description => "Banmedica y Vida Tres")
  Group.create!(:name => "Grupo 2",
                :description => "Colmena y Paris")
end

def cargrups
  Cargrup.create!(:group_id => 2, :cartera_id => 1)
end

def usuarios
  User.create!(:user => "ejecobranza1", :profile_id => 1, :group_id => 2, :name => "Ejecutivo de Cobranza Grupo 1", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "ejecobranza2", :profile_id => 1, :group_id => 3, :name => "Ejecutivo de Cobranza Grupo 2", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "supervisor1", :profile_id => 2, :group_id => 2, :name => "Supervisor Grupo 1", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "supervisor2", :profile_id => 2, :group_id => 3, :name => "Supervisor Grupo 2", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "jefeterreno", :profile_id => 3, :group_id => 1, :name => "Jefe de Terreno", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "tesoreria", :profile_id => 4, :group_id => 1, :name => "Tesoreria", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "operador", :profile_id => 5, :group_id => 1, :name => "Operador", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "gerencia", :profile_id => 6, :group_id => 1, :name => "Gerencia", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "designer", :profile_id => 8, :group_id => 1, :name => "Designer", :password => "pass", :password_confirmation => "pass")
  User.create!(:user => "ejecobranza-na1", :profile_id => 1, :group_id => 2, :name => "Ejecutivo de Cobranza Grupo 1 No Activo", :password => "pass", :password_confirmation => "pass", :state => 0)
  User.create!(:user => "ejecobranza-na2", :profile_id => 1, :group_id => 3, :name => "Ejecutivo de Cobranza Grupo 2 No Activo", :password => "pass", :password_confirmation => "pass", :state => 0)
end

def tipos_cobranza
  CollectionType.create!(:name => "Administrativa")
  CollectionType.create!(:name => "Prejudicial")
  CollectionType.create!(:name => "Judicial")
  CollectionType.create!(:name => "Castigo")
end

def formas_pago
  PaymentForm.create!(:name => "Efectivo", :state => 1)
  PaymentForm.create!(:name => "Cheque al dia", :state => 1)
  PaymentForm.create!(:name => "Cheque a fecha", :state => 1)
  PaymentForm.create!(:name => "Bono", :state => 1)
  PaymentForm.create!(:name => "Pagare", :state => 1)
  PaymentForm.create!(:name => "Deposito", :state => 1)
  PaymentForm.create!(:name => "Forma no activa", :state => 0)
end

def politicas_pago
  PaymentPolicy.create!(:principal_id => 1, :product_id => 1, :collection_type => 1, :arrear_interest => 1000, :term_interes => 1000, :fee => 1000, :legal_cost => 1000, :installment => 1, :state => 1)
end


def acuerdos_pago
  PaymentAgreement.create!(:name => "Pago en TechMill", :state => 1)
  PaymentAgreement.create!(:name => "Envio por Correo", :state => 1)
  PaymentAgreement.create!(:name => "Negocia Ejecutivo de Cobranza", :state => 1)
  PaymentAgreement.create!(:name => "Gestion en Terreno", :state => 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte TechMill", :state => 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte Mandante", :state => 1)
  PaymentAgreement.create!(:name => "Express", :state => 1)
  PaymentAgreement.create!(:name => "No Activo", :state => 0)
end

