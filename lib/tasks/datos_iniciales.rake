require 'faker'
namespace :db do
  desc "Carga los datos Iniciales."
  task :datosiniciales => :environment do
    perfilesinit
    payagreementinit
    gruposinit
    productosinit
    tipos_cobranzainit
    formas_pagoinit
    usuarioadmininit
    comunasinit
    emisoresinit
    payflowinit
    parameterinit
    rejectioninit
    cancellationinit
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
  PaymentAgreement.create!(:name => "Gestion en Terreno", :description => "", :state => 1, :payment_flow_id=> 3)
  PaymentAgreement.create!(:name => "Express", :description => "", :state => 1, :payment_flow_id=> 3)
  PaymentAgreement.create!(:name => "Negocia Ejecutivo de Cobranza", :description => "", :state => 1, :payment_flow_id=> 2)
  PaymentAgreement.create!(:name => "Pago en TechMill", :description => "El Deudor realiza el pago en persona en las oficinas de TechMill", :state => 1, :payment_flow_id=> 1)
  PaymentAgreement.create!(:name => "Envio por Correo", :description => "El Deudor envia cheque por correo tradicional", :state => 1, :payment_flow_id=> 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte TechMill", :description => "El Deudor realiza el deposito en la cuenta corriente de TechMill", :state => 1, :payment_flow_id=> 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte Mandante", :description => "El Deudor realiza el deposito en la cuenta corriente del Mandante", :state => 1, :payment_flow_id=> 1)
end

def gruposinit
  Group.create!(:name => "Sin Grupo",
                :description => "No tiene asociado ningun Grupo en particular")
  Group.create!(:name => "Grupo 1",
                :description => "Presunta / Arreglo Flujo / DNP")
  Group.create!(:name => "Grupo 4",
                :description => "Cobranza Prejudicial documentos Valorados")
end

def productosinit
  Product.create!(:name => "Presunta", :state => 1)
  Product.create!(:name => "Arreglo de Flujo", :state => 1)
  Product.create!(:name => "DNP", :state => 1)
  Product.create!(:name => "Cheque", :state => 1)
  Product.create!(:name => "Pagare", :state => 1)
  Product.create!(:name => "Aviso", :state => 1)
  Product.create!(:name => "Boleta", :state => 1)
  Product.create!(:name => "Factura Administrativa", :state => 1)
  Product.create!(:name => "Letra", :state => 1)
  Product.create!(:name => "Cuota", :state => 1)
end

def tipos_cobranzainit
  CollectionType.create!(:name => "Administrativa", :state => 1)
  CollectionType.create!(:name => "Prejudicial", :state => 1)
  CollectionType.create!(:name => "Judicial", :state => 0)
  CollectionType.create!(:name => "Castigo", :state => 0)
end

def formas_pagoinit
  PaymentForm.create!(:name => "Efectivo", :emitter=>0, :num_doc=>0, :description=>"", :state => 1)
  PaymentForm.create!(:name => "Cheque al dia", :emitter=>1, :num_doc=>1, :description=>"", :state => 1)
  PaymentForm.create!(:name => "Cheque a fecha", :emitter=>1, :num_doc=>1, :description=>"", :state => 1)
  PaymentForm.create!(:name => "Deposito", :emitter=>1, :num_doc=>1, :description=>"", :state => 1)
  PaymentForm.create!(:name => "Bono", :emitter=>1, :num_doc=>0, :description=>"", :state => 1)
  PaymentForm.create!(:name => "Pagare", :emitter=>1, :num_doc=>1, :description=>"", :state => 1)
  PaymentForm.create!(:name => "Transf. TM / Cliente", :emitter=>1, :num_doc=>1, :description=>"Transferencias TM / Transferencias al cliente", :state => 1)
  PaymentForm.create!(:name => "Vale Vista ", :emitter=>1, :num_doc=>1, :description=>"", :state => 1)
end

def usuarioadmininit
  User.create!(:user => "admin", :profile_id => 7, :group_id => 1, :name => "admin", :password => "admin", :password_confirmation => "admin", :telephone => "NA")
  User.create!(:user => "designer", :profile_id => 7, :group_id => 1, :name => "designer", :password =>"designer", :password_confirmation => "designer", :telephone => "NA")
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

def emisoresinit
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

def payflowinit
  PaymentFlow.create!(:name => "RP Completo", :description => "Se debe ingresar la informacion de Detalle de Pago y el RP debe cuadrar.", :state => 1)
  PaymentFlow.create!(:name => "RP por Completar", :description => "Se debe ingresar la informacion de Contacto. El RP queda incompleto hasta ingresarle el Detalle de Pago.", :state => 1)
  PaymentFlow.create!(:name => "RP con Gestion Terreno", :description => "Se debe ingresar la informacion de Contacto, quedando incompleto. El RP es gestionado en Terreno y posteriormente se le ingresa el Detalle de Pago.", :state => 1)
end

def parameterinit
  Parameter.create!(:name => "Descuento maximo Cobranza", :val_int=> -200, :description => "Valor maximo de descuento para Cobranza", :state => 1)
  Parameter.create!(:name => "Descuento maximo Supervisor", :val_int=> -1000, :description => "Valor maximo de descuento para Supervisor", :state => 1)
end

def rejectioninit
  RejectionType.create!(:name => "Datos de Contacto incorrectos", :area => "Terreno", :description =>"Faltan datos para realizar un contacto", :state => 1)
  RejectionType.create!(:name => "Falta de documentacion adjunta", :area => "Terreno", :description =>"Falta de documentos que deben acompanar al recibo", :state => 1)
  RejectionType.create!(:name => "Monto Total Pagado de conjunto de Recibos de Pago no corresponde", :description =>"",  :area => "", :state => 1)
  RejectionType.create!(:name => "Falta/Incorrecto Detalle de Pago", :area => "All", :description =>"", :state => 1)
end
   
def cancellationinit
  Cancellation.create!(:message => "Solamente debe anular el Registro de Recibo de Pago.", :description => "", :state => 1)
  Cancellation.create!(:message => "Para anular el registro de Recibo de Pago requiere las dos copias impresas con el timbre.", :description => "", :state => 1)
  Cancellation.create!(:message => "Para anular el registro de Recibo de Pago requiere la copia impresa con el timbre y el dinero recaudado.", :description => "", :state => 1)
end
