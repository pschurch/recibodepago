require 'faker'

namespace :db do
  desc "Carga datos de Prueba."
  task :datosprueba => :environment do
    mandantes 
    carteras
    cargrups
    usuarios
    politicas_pago
    field_user  # ejecutivos de Terreno
 end
end

def mandantes
  Principal.create!(:name => "Banmedica", :social_reason => "Isapre Banmedica S.A.", :rut => "96572800", :digit => "7", :contact => "Jose Miguel Sarazibar", :telephone => "", :email => "", :state => "1" )
  Principal.create!(:name => "VidaTres", :social_reason => "Isapre Vida Tres S.A.", :rut => "96502530", :digit => "8", :contact => "Jose Miguel Sarazibar", :telephone => "", :email => "", :state => "1" )
  Principal.create!(:name => "CD", :social_reason => "Clinica Davila y Servicios Medicos S.A.", :rut => "96530470", :digit => "3", :contact => "Felipe Lopez", :telephone => "", :email => "", :state => "1" )
  Principal.create!(:name => "CLC", :social_reason => "Clinica Las Condes S.A.", :rut => "93930000", :digit => "7", :contact => "Jaime Jana", :telephone => "", :email => "", :state => "1" )
end

def carteras
  Cartera.create!(:principal_id => 1, :product_id => 1, :state => 1)
  Cartera.create!(:principal_id => 1, :product_id => 2, :state => 1)
  Cartera.create!(:principal_id => 1, :product_id => 3, :state => 1)
  Cartera.create!(:principal_id => 1, :product_id => 4, :state => 1)
  Cartera.create!(:principal_id => 2, :product_id => 1, :state => 1)
  Cartera.create!(:principal_id => 2, :product_id => 2, :state => 1)
  Cartera.create!(:principal_id => 2, :product_id => 3, :state => 1)
  Cartera.create!(:principal_id => 2, :product_id => 4, :state => 1)
  Cartera.create!(:principal_id => 3, :product_id => 4, :state => 1)
  Cartera.create!(:principal_id => 3, :product_id => 5, :state => 1)
  Cartera.create!(:principal_id => 3, :product_id => 8, :state => 1)
  Cartera.create!(:principal_id => 4, :product_id => 4, :state => 1)
  Cartera.create!(:principal_id => 4, :product_id => 5, :state => 1)
end

def cargrups
  Cargrup.create!(:group_id => 2, :cartera_id => 1)
  Cargrup.create!(:group_id => 2, :cartera_id => 2)
  Cargrup.create!(:group_id => 2, :cartera_id => 3)
  Cargrup.create!(:group_id => 2, :cartera_id => 5)
  Cargrup.create!(:group_id => 2, :cartera_id => 6)
  Cargrup.create!(:group_id => 2, :cartera_id => 7)
  Cargrup.create!(:group_id => 3, :cartera_id => 4)
  Cargrup.create!(:group_id => 3, :cartera_id => 8)
  Cargrup.create!(:group_id => 3, :cartera_id => 9)
  Cargrup.create!(:group_id => 3, :cartera_id => 10)
  Cargrup.create!(:group_id => 3, :cartera_id => 12)
  Cargrup.create!(:group_id => 3, :cartera_id => 13)
end

def politicas_pago
  PaymentPolicy.create!(:principal_id => 1, :product_id => 1, :collection_type_id => 1, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
  PaymentPolicy.create!(:principal_id => 1, :product_id => 2, :collection_type_id => 1, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
  PaymentPolicy.create!(:principal_id => 1, :product_id => 3, :collection_type_id => 1, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 1, :installment => 1, :state => 1)
  PaymentPolicy.create!(:principal_id => 1, :product_id => 4, :collection_type_id => 2, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 1, :installment => 1, :state => 1)
  PaymentPolicy.create!(:principal_id => 2, :product_id => 1, :collection_type_id => 1, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
  PaymentPolicy.create!(:principal_id => 2, :product_id => 2, :collection_type_id => 1, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
  PaymentPolicy.create!(:principal_id => 2, :product_id => 3, :collection_type_id => 1, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 1, :installment => 1, :state => 1)
  PaymentPolicy.create!(:principal_id => 2, :product_id => 4, :collection_type_id => 2, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 1, :installment => 1, :state => 1)
  PaymentPolicy.create!(:principal_id => 3, :product_id => 5, :collection_type_id => 2, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
  PaymentPolicy.create!(:principal_id => 3, :product_id => 4, :collection_type_id => 2, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
  PaymentPolicy.create!(:principal_id => 4, :product_id => 5, :collection_type_id => 2, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
  PaymentPolicy.create!(:principal_id => 4, :product_id => 4, :collection_type_id => 2, :arrear_interest => 0, :term_interest => 0, :fee => 0, :legal_costs => 0, :installment => 0, :state => 1)
end

def usuarios
  User.create!(:user => "mtorrealba", :profile_id => 1, :group_id => 2, :name => "Mary Torrealba", :password => "mtorrealba", :password_confirmation => "mtorrealba", :telephone => "8408508", :email => "")
  User.create!(:user => "jzepeda", :profile_id => 1, :group_id => 2, :name => "Jeannete Zepeda", :password => "jzepeda", :password_confirmation => "jzepeda", :telephone => "8408521", :email => "")
  User.create!(:user => "ptobar", :profile_id => 1, :group_id => 3, :name => "Paulina Tobar", :password => "ptobar", :password_confirmation => "ptobar", :telephone => "8408504", :email => "")
  User.create!(:user => "pgarcia", :profile_id => 1, :group_id => 3, :name => "Paola Garcia", :password => "pgarcia", :password_confirmation => "pgarcia", :telephone => "8408505", :email => "")
  User.create!(:user => "respinoza", :profile_id => 2, :group_id => 2, :name => "Raquel Espinoza", :password => "respinoza", :password_confirmation => "respinoza", :telephone => "8408507", :email => "")
  User.create!(:user => "rburdiles", :profile_id => 2, :group_id => 3, :name => "Rodrigo Burdiles", :password => "rburdiles", :password_confirmation => "rburdiles", :telephone => "8408503", :email => "")
  User.create!(:user => "fvaldivia", :profile_id => 3, :group_id => 1, :name => "Freddy Valdivia", :password => "fvaldivia", :password_confirmation => "fvaldivia", :telephone => "8408516", :email => "")
  User.create!(:user => "scaramori", :profile_id => 4, :group_id => 1, :name => "Silvia Caramori", :password => "scaramori", :password_confirmation => "scaramori", :telephone => "8408515", :email => "")
  User.create!(:user => "kcontreras", :profile_id => 4, :group_id => 1, :name => "Karinna Contreras", :password => "kcontreras", :password_confirmation => "kcontreras", :telephone => "8408515", :email => "")
  User.create!(:user => "elafuente", :profile_id => 6, :group_id => 1, :name => "Ernesto Lafuente", :password => "elafuente", :password_confirmation => "elafuente", :telephone => "8408514", :email => "")
  User.create!(:user => "vdaroch", :profile_id => 6, :group_id => 1, :name => "Victor Daroch", :password => "vdaroch", :password_confirmation => "vdaroch", :telephone => "8408501", :email => "")
  User.create!(:user => "fsalas", :profile_id => 5, :group_id => 1, :name => "Felipe Salas", :password => "fsalas", :password_confirmation => "fsalas", :telephone => "8408518", :email => "")
end

def field_user
  FieldUser.create!(:state => true, :name => "Guillermo Vargas Carrasco", :rut => "9970895", :digit => "6") 
  FieldUser.create!(:state => true, :name => "Mario Burdiles Manquehuil", :rut => "15335724", :digit => "2") 
  FieldUser.create!(:state => true, :name => "Maria Pilar Martinez", :rut => "11055061", :digit => "8") 
  FieldUser.create!(:state => true, :name => "Rene Hurtado Mendez", :rut => "9913753", :digit => "3") 
  FieldUser.create!(:state => true, :name => "Farid Sarquis H", :rut => "16911378", :digit => "5") 
  FieldUser.create!(:state => true, :name => "Patricia Ester Lopez Valladares", :rut => "11861912", :digit => "9") 
end

