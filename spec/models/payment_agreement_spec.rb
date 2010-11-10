require 'spec_helper'

describe PaymentAgreement do
  before(:each) do
    @attr = { :name => "Nombre Acuerdo de Pago"}
  end  
  it "debe crear una nueva instancia dando atributos validos" do
    PaymentAgreement.create!(@attr)
  end 

  it "se requiere ingresar name" do
    sin_name = PaymentAgreement.new(@attr.merge(:name => ""))
    sin_name.should_not be_valid
  end
end
