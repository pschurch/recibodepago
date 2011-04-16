require 'faker'
namespace :db do
  desc "Carga los datos de Acuerdos de Pago."
  task :payagreement => :environment do
    payagreement
  end
end

def payagreement
  PaymentAgreement.create!(:name => "Gestion en Terreno", :description => "", :state => 1, :payment_flow_id=> 3)
  PaymentAgreement.create!(:name => "Express", :description => "", :state => 1, :payment_flow_id=> 3)
  PaymentAgreement.create!(:name => "Negocia Ejecutivo de Cobranza", :description => "", :state => 1, :payment_flow_id=> 2)
  PaymentAgreement.create!(:name => "Pago en TechMill", :description => "El Deudor realiza el pago en persona en las oficinas de TechMill", :state => 1, :payment_flow_id=> 1)
  PaymentAgreement.create!(:name => "Envio por Correo", :description => "El Deudor envia cheque por correo tradicional", :state => 1, :payment_flow_id=> 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte TechMill", :description => "El Deudor realiza el deposito en la cuenta corriente de TechMill", :state => 1, :payment_flow_id=> 1)
  PaymentAgreement.create!(:name => "Deposito en CtaCte Mandante", :description => "El Deudor realiza el deposito en la cuenta corriente del Mandante", :state => 1, :payment_flow_id=> 1)
end

